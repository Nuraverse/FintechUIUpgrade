<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgCashflowMaster_Add, App_Web_54a2gfky" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Asset Master" ID="lblHeading" CssClass="styleDisplayLabel" ToolTip="Asset Master"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div id="tbCFM" runat="server">
                            <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="row" style="padding: 5px !important;">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCashflowNo" runat="server" ReadOnly="true" ToolTip="Cash Flow Serial Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Cash Flow Serial No." ID="lblCashflowNo" CssClass="styleDisplayLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" ToolTip="Line of Business" CssClass="md-form-control form-control"
                                                    OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Line of Business" CssClass="styleReqFieldLabel" ID="lblLOB"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ErrorMessage="Select the Line of Business" SetFocusOnError="true" ValidationGroup="Save"
                                                        ControlToValidate="ddlLOB" InitialValue="0" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlCashflow" runat="server" ToolTip="Inflow/Outflow" AutoPostBack="True" CssClass="md-form-control form-control"
                                                    OnSelectedIndexChanged="ddlCashflow_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Inflow/Outflow" ID="lblCashflow" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCashflow" runat="server" ErrorMessage="Select the Inflow/Outflow" ValidationGroup="Save"
                                                        ControlToValidate="ddlCashflow" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCashflowDesc" runat="server" MaxLength="50" ToolTip="CashFlow Description" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtCashflowDesc"
                                                    FilterType="Custom , UppercaseLetters, LowercaseLetters, Numbers" ValidChars=" "
                                                    Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Cash Flow Description" ID="lblCashflowDesc" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCashflowDesc" runat="server" ValidationGroup="Save" ErrorMessage="Enter the Cash Flow Description"
                                                        ControlToValidate="txtCashflowDesc" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlCashflowFlag" runat="server" ToolTip="Cash Flow Flag" AutoPostBack="True" CssClass="md-form-control form-control"
                                                    OnSelectedIndexChanged="ddlCashflowFlag_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Cash Flow Flag" ID="lblCashflowFlag" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCashflowflag" runat="server" ErrorMessage="Select the Cash Flow Flag" ValidationGroup="Save"
                                                        ControlToValidate="ddlCashflowFlag" InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlProduct" runat="server" ToolTip="Scheme" AutoPostBack="True" CssClass="md-form-control form-control" OnSelectedIndexChanged="ddlProductSelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Scheme" ID="lblProduct" CssClass="styleDisplayLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlRecoveryType" runat="server" ToolTip="Recovery Type" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Recovery Type" ID="lblRecoveryType" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:Label runat="server" Text="Active" ID="Label7"></asp:Label>
                                                <asp:CheckBox ID="CbxActive" runat="server" ToolTip="Is Active" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- </table>
                    </td>--%>
                </div>

                <div class="row" id="trDebit" runat="server">
                    <asp:Label runat="server" Text="Debit" ID="lblDebit" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                    <asp:Panel runat="server" ID="pnlDebit" Width="100%" GroupingText="Debit" CssClass="stylePanel">
                        <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col">
                                <div id="tblDebit" runat="server">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlDType" runat="server" AutoPostBack="True" CssClass="md-form-control form-control"
                                                    OnSelectedIndexChanged="ddlDType_SelectedIndexChanged" ToolTip="Debit Type">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Type" ID="Label2"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvDType" runat="server" ErrorMessage="Select the Type(Debit)"
                                                        ControlToValidate="ddlDType" InitialValue="0" Display="Dynamic" ValidationGroup="Save"
                                                        Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlDGLCode" runat="server" ToolTip="Debit GL Code" CssClass="md-form-control form-control"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlDGLCode_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="GL Account Code" ID="Label8"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvDGlcode" runat="server" ErrorMessage="Select the GL Account Code(Debit)"
                                                        ControlToValidate="ddlDGLCode" InitialValue="0" Display="Dynamic" Enabled="false" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlDSLCode" runat="server" ToolTip="Debit SL Code" CssClass="md-form-control form-control"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlDSLCode_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="SL Account Code" ID="Label3"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvDSlcode" runat="server" ErrorMessage="Select the SL Account Code(Debit)" ValidationGroup="Save"
                                                        ControlToValidate="ddlDSLCode" InitialValue="0" Display="Dynamic" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div style="display: none;">
                                                <asp:Label runat="server" Text="GL Account Code" ID="Label1"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <div class="row" id="trCredit" runat="server">
                    <asp:Label runat="server" Text="Credit" ID="lblCredit" CssClass="styleDisplayLabel" Visible="false"></asp:Label>
                    <asp:Panel runat="server" ID="pnlCredit" Width="100%" GroupingText="Credit" CssClass="stylePanel">
                        <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col">
                                <div id="tblCredit" runat="server">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlCType" runat="server" AutoPostBack="True" CssClass="md-form-control form-control"
                                                    OnSelectedIndexChanged="ddlCType_SelectedIndexChanged" ToolTip="Credit Type">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Type" ID="Label6"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCType" runat="server" ErrorMessage="Select the Type(Credit)"
                                                        ControlToValidate="ddlCType" InitialValue="0" Display="Dynamic" Enabled="false" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlCGLCode" runat="server" ToolTip="Credit GL Code" CssClass="md-form-control form-control"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlCGLCode_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="GL Account Code" ID="Label4"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCGlcode" runat="server" ErrorMessage="Select the GL Account Code(Credit)" ValidationGroup="Save"
                                                        ControlToValidate="ddlCGLCode" InitialValue="0" Display="Dynamic" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlCSLCode" runat="server" ToolTip="Credit SL Code" CssClass="md-form-control form-control"
                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlCSLCode_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="SL Account Code" ID="Label9"></asp:Label>
                                                </label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCSlcode" runat="server" ErrorMessage="Select the SL Account Code(Credit)"
                                                        ControlToValidate="ddlCSLCode" InitialValue="0" Display="Dynamic" ValidationGroup="Save"
                                                        Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div style="display: none;">
                                                <asp:Label runat="server" Text="GL Account Code" ID="Label5"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="col">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Label runat="server" Text="Business IRR." ID="lblBusIRR"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="CbxBusIRR" runat="server" AutoPostBack="True" ToolTip="Bussiness IRR"
                                                    OnCheckedChanged="CbxBusIRR_CheckedChanged" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Label runat="server" Text="Accounting IRR." ID="lblAccIRR"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="CbxAccIRR" runat="server" AutoPostBack="True" ToolTip="Accounting IRR"
                                                    OnCheckedChanged="CbxAccIRR_CheckedChanged" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Label runat="server" Text="Company IRR." ID="lblBoth"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="CbxBoth" runat="server" AutoPostBack="True" ToolTip="Company IRR"
                                                    OnCheckedChanged="CbxBoth_CheckedChanged" />
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Label runat="server" Text="All" ID="lblAll"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:CheckBox ID="CbxAll" runat="server" AutoPostBack="True" ToolTip="All" OnCheckedChanged="CbxAll_CheckedChanged" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel runat="server" ID="panGeneralParameters" GroupingText="Program Reference Grid" Width="100%" ScrollBars="Auto"
                            CssClass="stylePanel" Style="overflow: hidden">
                            <div style="height: 235px; overflow-x: auto; overflow-y: auto;">
                                <asp:GridView ID="gvCashflowProgram" runat="server" Width="100%" AutoGenerateColumns="False" ScrollBars="Auto"
                                    DataKeyNames="Program_ID" OnRowDataBound="gvCashflowProgram_RowDataBound" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProgramid" runat="server" Text='<%# Eval("Program_ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Program Ref. No." HeaderStyle-CssClass="styleGridHeader">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProgramRefNo" runat="server" Text='<%# Eval("Program_Ref_No") %>' />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            <ItemStyle Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Program Description" HeaderStyle-CssClass="styleGridHeader">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProgramName" runat="server" Text='<%# Eval("Program_Name") %>' />
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
                                        <asp:TemplateField HeaderText="Post" HeaderStyle-CssClass="styleGridHeader" >
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="CbxPost" OnCheckedChanged="CbxPost_CheckedChanged" AutoPostBack="true" ToolTip="Post" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <%-- </table>
            </td>
                </tr>--%>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <%-- <asp:Button runat="server" ID="btnSave" CssClass="save_btn fa fa-floppy-o" Text="Save" AccessKey="S"
                        ToolTip="Save,Alt+S" OnClientClick="return fnCheckPageValidators();" OnClick="btnSave_Click" />--%>
                    <%--<asp:Button runat="server" ID="btnClear" CssClass="save_btn fa fa-floppy-o" Text="Clear" AccessKey="L"
                        ToolTip="Clear,Alt+L" CausesValidation="False" OnClick="btnClear_Click" />
                    <cc1:ConfirmButtonExtender ID="btnClear_ConfirmButtonExtender" runat="server" ConfirmText="Do you want to Clear?"
                        Enabled="True" TargetControlID="btnClear">
                    </cc1:ConfirmButtonExtender>--%>
                    <%--<asp:Button runat="server" ID="btnCancel" CssClass="save_btn fa fa-floppy-o" CausesValidation="False" OnClientClick="return fnConfirmExit();"
                        ToolTip="Exit,Alt+X" AccessKey="X" Text="Exit" OnClick="btnCancel_Click" />--%>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display:none;">
                        <asp:ValidationSummary ID="vsCashfolw" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):  " />
                        <%-- <asp:CustomValidator ID="cvCashflow" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>--%>
                    </div>
                </div>
                <div class="row">
                    <asp:CustomValidator ID="cvCashflow" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
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
