<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FACashFlowMaster_Add, App_Web_insjbia3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="tbCFM" runat="server" border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Activity" CssClass="styleReqFieldLabel" ID="lblActivity"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 25%">
                                    <asp:DropDownList ID="ddlActivity" runat="server" AutoPostBack="True" ToolTip="Activity"
                                        >
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Cash Flow Serial No." ID="lblCashflowNo"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 25%">
                                    <asp:TextBox ID="txtCashflowNo" runat="server" Width="180px" ReadOnly="true" ToolTip="Cash Flow Serial Number"></asp:TextBox>
                                </td>
                                
                                <td style="width: 5%">
                                    <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ValidationGroup="main" ErrorMessage="Select the Activity"
                                        ControlToValidate="ddlActivity" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Inflow/Outflow" ID="lblCashflow" CssClass="styleReqFieldLabel"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 25%">
                                    <asp:DropDownList ID="ddlCashflow" runat="server" ToolTip="Inflow/Outflow" 
                                        AutoPostBack="True" onselectedindexchanged="ddlCashflow_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvCashflow" runat="server" ValidationGroup="main" ErrorMessage="Select the Inflow/Outflow"
                                        ControlToValidate="ddlCashflow" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Cash Flow Description" ID="lblCashflowDesc" CssClass="styleReqFieldLabel"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 25%">
                                    <asp:TextBox ID="txtCashflowDesc" runat="server" Width="230px" MaxLength="60" ToolTip="CashFlow Description"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtCashflowDesc"
                                        FilterType="Custom , UppercaseLetters, LowercaseLetters, Numbers" ValidChars=" "
                                        Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                                <td style="width: 5%">
                                    <asp:RequiredFieldValidator ID="rfvCashflowDesc" runat="server" ValidationGroup="main" ErrorMessage="Enter the Cash Flow Description"
                                        ControlToValidate="txtCashflowDesc" Display="None"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Cash Flow Flag" ID="lblCashflowFlag" CssClass="styleReqFieldLabel"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 25%">
                                      <cc1:ComboBox ID="ddlCashflowFlag" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlCashflowFlag_SelectedIndexChanged"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                    <%--<asp:DropDownList ID="ddlCashflowFlag" runat="server" ToolTip="Cash Flow Flag" 
                                        AutoPostBack="True" 
                                        onselectedindexchanged="ddlCashflowFlag_SelectedIndexChanged">
                                    </asp:DropDownList>--%>
                                    <asp:RequiredFieldValidator ID="rfvCashflowflag" runat="server" ValidationGroup="main" ErrorMessage="Select the Cash Flow Flag"
                                        ControlToValidate="ddlCashflowFlag" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Active" ID="Label7"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="padding-left: 7px; width: 25%">
                                    <asp:CheckBox ID="CbxActive" runat="server" ToolTip="Active" />
                                </td>
                                <td style="width: 5%">
                                </td>
                            </tr>
                            <tr style="height: 10px">
                                <td>
                                </td>
                            </tr>
                            <tr id="trDebit" runat="server">
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Debit" ID="lblDebit" CssClass="styleReqFieldLabel"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" colspan="5">
                                    <table id="Table2" runat="server" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center">
                                                <asp:Label runat="server" Text="Type" ID="Label2"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td align="center" visible="false">
                                                <asp:Label runat="server" Text="GL Account Code" ID="Label1"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td align="center">
                                                <asp:Label runat="server" Text="GL Account Code" ID="Label8"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td align="center">
                                                <asp:Label runat="server" Text="SL Account Code" ID="Label3"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlDType" runat="server" Width="150px" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlDType_SelectedIndexChanged" ToolTip="Debit Type">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td visible="false">
                                            <cc1:ComboBox ID="ddlDGLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDGLCode_SelectedIndexChanged"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                                <%--<asp:DropDownList ID="ddlDGLCode" runat="server" Width="150px" ToolTip="Debit GL Code"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlDGLCode_SelectedIndexChanged">
                                                </asp:DropDownList>--%>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td>
                                            <cc1:ComboBox ID="ddlDAccountFlag" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDAccountFlag_SelectedIndexChanged"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                                <%--<asp:DropDownList ID="ddlDAccountFlag" runat="server" Width="250px" ToolTip="Debit GL Code"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlDAccountFlag_SelectedIndexChanged">

                                                </asp:DropDownList>--%>
                                                <asp:RequiredFieldValidator ID="rfDebitAccount" ValidationGroup="main" runat="server" ErrorMessage="Select the GL Account Code (Debit)"
                                                    ControlToValidate="ddlDAccountFlag" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td>
        <cc1:ComboBox ID="ddlDSLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDSLCode_SelectedIndexChanged"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                                <%--<asp:DropDownList ID="ddlDSLCode" runat="server" Width="150px" ToolTip="Debit SL Code"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlDSLCode_SelectedIndexChanged">
                                                    
                                                </asp:DropDownList>--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height: 10px">
                                <td>
                                </td>
                            </tr>
                            <tr id="trCredit" runat="server">
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Credit" ID="lblCredit" CssClass="styleReqFieldLabel"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" colspan="5">
                                    <table id="Table1" runat="server" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center">
                                                <asp:Label runat="server" Text="Type" ID="Label6"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td align="center" visible="false">
                                                <asp:Label runat="server" Text="GL Account Code" ID="Label5"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td align="center">
                                                <asp:Label runat="server" Text="GL Account Code" ID="Label4"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td align="center">
                                                <asp:Label runat="server" Text="SL Account Code" ID="Label9"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlCType" runat="server" Width="150px" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlCType_SelectedIndexChanged" ToolTip="Credit Type">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td visible="false">
                                            <cc1:ComboBox ID="ddlCGLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlCGLCode_SelectedIndexChanged"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                                <%--<asp:DropDownList ID="ddlCGLCode" runat="server" Width="150px" ToolTip="Credit GL Code"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlCGLCode_SelectedIndexChanged">
                                                </asp:DropDownList>--%>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td>
                                            <cc1:ComboBox ID="ddlCAccountFlag" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlCAccountFlag_SelectedIndexChanged"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                                <%--<asp:DropDownList ID="ddlCAccountFlag" runat="server" Width="250px" ToolTip="Credit GL Code"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlCAccountFlag_SelectedIndexChanged">
                                                     
                                                </asp:DropDownList>--%>
                                                <asp:RequiredFieldValidator ID="rfvCreditAccount" runat="server" ErrorMessage="Select the GL Account Code (Credit)"
                                                    ControlToValidate="ddlCAccountFlag" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;
                                            </td>
                                            <td>
                                            <cc1:ComboBox ID="ddlCSLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlCSLCode_SelectedIndexChanged"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                                <%--<asp:DropDownList ID="ddlCSLCode" runat="server" Width="150px" ToolTip="Credit SL Code"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlCSLCode_SelectedIndexChanged">
                                                    
                                             
                                                </asp:DropDownList>--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height: 20px">
                                <td>
                                </td>
                            </tr>
                        <%--    <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" ID="Label10"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" colspan="5">
                                    <table id="Table3" runat="server" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="left">
                                                <asp:Label runat="server" Text="Business IRR." ID="lblBusIRR"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="CbxBusIRR" runat="server" AutoPostBack="True" ToolTip="Bussiness IRR"
                                                    OnCheckedChanged="CbxBusIRR_CheckedChanged" />
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td align="left">
                                                <asp:Label runat="server" Text="Accounting IRR." ID="lblAccIRR"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="CbxAccIRR" runat="server" AutoPostBack="True" ToolTip="Accounting IRR"
                                                    OnCheckedChanged="CbxAccIRR_CheckedChanged" />
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td align="left">
                                                <asp:Label runat="server" Text="Company IRR." ID="lblBoth"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="CbxBoth" runat="server" AutoPostBack="True" ToolTip="Company IRR"
                                                    OnCheckedChanged="CbxBoth_CheckedChanged" />
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td align="left">
                                                <asp:Label runat="server" Text="All" ID="lblAll"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="CbxAll" runat="server" AutoPostBack="True" ToolTip="All" OnCheckedChanged="CbxAll_CheckedChanged" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>--%>
                            <tr style="height: 10px">
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <asp:Panel runat="server" ID="panGeneralParameters" GroupingText="Program Reference Grid"
                                        CssClass="stylePanel" Style="overflow: hidden">
                                        <div style="height: 190px; overflow-y: auto; overflow-x: hidden" width="100%" class="container">
                                            <asp:GridView ID="gvCashflowProgram" runat="server" Width="100%" AutoGenerateColumns="False"
                                                DataKeyNames="Program_ID" OnRowDataBound="gvCashflowProgram_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProgramid" runat="server" Text='<%# Eval("Program_ID") %>' /></ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Program Ref. No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProgramRefNo" runat="server" ToolTip="Program Ref. No." Text='<%# Eval("Program_Ref_No") %>' /></ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle Width="15%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Program Description" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProgramName" runat="server" ToolTip="Program Description" Text='<%# Eval("Program_Name") %>' /></ItemTemplate>
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
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvDGlcode" runat="server" ValidationGroup="main" ErrorMessage="Select the GL Account Code(Debit)"
                            ControlToValidate="ddlDGLCode" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvDSlcode" runat="server" Enabled=false Visible="false"  ValidationGroup="main" ErrorMessage="Select the SL Account Code(Debit)"
                            ControlToValidate="ddlDSLCode" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvCGlcode" runat="server" ValidationGroup="main"  ErrorMessage="Select the GL Account Code(Credit)"
                            ControlToValidate="ddlCAccountFlag" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvCSlcode" runat="server" ValidationGroup="main" ErrorMessage="Select the SL Account Code(Credit)"
                            ControlToValidate="ddlCSLCode" InitialValue="--Select--" Display="None" Visible="false" ></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvDType" runat="server" ValidationGroup="main" ErrorMessage="Select the Type(Debit)"
                            ControlToValidate="ddlDType" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvCType" runat="server" ValidationGroup="main" ErrorMessage="Select the Type(Credit)"
                            ControlToValidate="ddlCType" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr style="height: 10px">
                    <td>
                    </td>
                </tr>
                <tr>
                    <td id="Td1" runat="server" align="center" colspan="5">
                        <asp:Button runat="server" ID="btnSave" CssClass="styleSubmitButton" Text="Save"
                            ToolTip="Save" OnClientClick="return fnCheckPageValidators('main');" ValidationGroup="main" OnClick="btnSave_Click" />
                        <asp:Button runat="server" ID="btnClear" CssClass="styleSubmitButton" Text="Clear_FA"
                            ToolTip="Clear_FA" CausesValidation="False" OnClick="btnClear_Click" />
                        <cc1:ConfirmButtonExtender ID="btnClear_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure  want to Clear_FA?"
                            Enabled="True" TargetControlID="btnClear">
                        </cc1:ConfirmButtonExtender>
                        <asp:Button runat="server" ID="btnCancel" CssClass="styleSubmitButton" CausesValidation="False"
                            ToolTip="Cancel" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="vsCashfolw" runat="server" ValidationGroup="main" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):  " />
                        <asp:CustomValidator ID="cvCashflow" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
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
