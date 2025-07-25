<%@ Page Title="" Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true" CodeFile="FA_BRSFileFormat_Add.aspx.cs" Inherits="BRS_FA_BRSFileFormat_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%">
        <tr width="100%">
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="BRS File Format" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="upMaindetails" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlBankReconciliation" GroupingText="BRS File Format" Height="100%" runat="server" CssClass="stylePanel">
                                        <table width="100%">
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblLocation" Text="Branch" />
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <uc:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" WatermarkText="--Select--"
                                                        ValidationGroup="submit" ItemToValidate="Value" OnItem_Selected="ddlLocation_Item_Selected"
                                                        AutoPostBack="true" />
                                                    <%--   <cc1:ComboBox ID="ddlLocation" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                                                    CssClass="WindowsStyle" MaxLength="0" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                                                </cc1:ComboBox>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVddlLocation" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="--Select--"
                                                                    ErrorMessage="Select Location" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                                   

                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblDocumentNo" Text="Document Number"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtDocumentNo" Width="165px" runat="server" ToolTip="Document Number"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblBankName" CssClass="styleReqFieldLabel" Text="Bank Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <cc1:ComboBox ID="ddlBankName" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList" InitialValue="--Select--"
                                                        AutoPostBack="true" ValidationGroup="submit" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                        OnSelectedIndexChanged="ddlBankName_SelectedIndexChanged">
                                                    </cc1:ComboBox>
                                                    <asp:RequiredFieldValidator ID="rfvddlBankName" CssClass="styleReqFieldLabel" runat="server" ControlToValidate="ddlBankName"
                                                        InitialValue="--Select--" ErrorMessage="Select the Bank Name" Display="None" SetFocusOnError="True"
                                                        ValidationGroup="submit" />
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblDocumentDate" CssClass="styleMandatoryLabel" Text="Document Date *"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtDocumentDate" Width="65%" runat="server"></asp:TextBox>
                                                    <asp:Image ID="imgPaymentRequestDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <cc1:CalendarExtender ID="CEDocumentDate" runat="server" PopupButtonID="imgPaymentRequestDate"
                                                        TargetControlID="txtDocumentDate">
                                                    </cc1:CalendarExtender>
                                                    <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                                    <asp:RequiredFieldValidator Display="None" ID="RFVtxtDocumentDate" CssClass="styleMandatoryLabel"
                                                        SetFocusOnError="True" runat="server" ValidationGroup="submit" ControlToValidate="txtDocumentDate"
                                                        ErrorMessage="Enter the Document Date"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="5px"></td>
                                            </tr>

                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="lbltype" runat="server" CssClass="styleReqFieldLabel" Text="Type"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:DropDownList ID="ddltype" runat="server">
                                                        <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Excel" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Text" Value="2"></asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator Display="None" InitialValue="0" ID="rfvType" CssClass="styleMandatoryLabel"
                                                        SetFocusOnError="True" runat="server" ValidationGroup="submit" ControlToValidate="ddltype"
                                                        ErrorMessage="Select the Type"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="4" class="styleFieldLabel" width="25%" align="left">
                                                    <asp:Label runat="server" ID="lblActive" Text="Active"></asp:Label>
                                                    <asp:CheckBox ID="chkActive" runat="server" />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">
                                                    <asp:Button ID="btnGo" Text="Go" runat="server" CausesValidation="true" ValidationGroup="submit" OnClick="btnGo_Click"
                                                        CssClass="styleSubmitShortButton" AccessKey="G" ToolTip="Alt+G" />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center" colspan="4">
                                                    <asp:Panel runat="server" ID="panBRS" GroupingText="BRS File Format Details" CssClass="stylePanel"
                                                        Width="100%" Visible="false">
                                                        <asp:GridView ID="gvBRS" runat="server" CssClass="styleInfoLabel" ShowFooter="true" Width="99%" OnRowUpdating="gvBRS_RowUpdating" OnRowDataBound="gvBRS_RowDataBound" OnRowDeleting="gvBRS_RowDeleting" OnRowCommand="gvBRS_RowCommand" Visible="false" AutoGenerateColumns="False">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="From Position" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFrom" runat="server" Text='<%# Eval("ECS_From_Position")%>' Style="padding-right: 20px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtFrom" runat="server" MaxLength="3" Text='<%# Eval("ECS_From_Position")%>'
                                                                            Width="30px" Style="text-align: right"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvFrom1" runat="server" InitialValue="0" ControlToValidate="txtFrom"
                                                                            Display="None" ErrorMessage="From position can not be zero" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvFrom2" runat="server" ControlToValidate="txtFrom"
                                                                            Display="None" ErrorMessage="Enter the From position" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-right: 20px">
                                                                                    <asp:TextBox ID="txtFFrom" runat="server" MaxLength="3" Width="30px" Style="text-align: right"
                                                                                        ToolTip="From Position"></asp:TextBox>
                                                                                    <%--<asp:RequiredFieldValidator ID="rfvFrom1" runat="server" InitialValue="0" ControlToValidate="txtFFrom"
                                                            Display="None" ErrorMessage="From position can not be zero" ValidationGroup="Add">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator ID="rfvFrom2" runat="server" ControlToValidate="txtFFrom"
                                                            Display="None" ErrorMessage="Enter the From position" ValidationGroup="Add">
                                                        </asp:RequiredFieldValidator>--%>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender142" runat="server" TargetControlID="txtFFrom"
                                                                                        FilterType="Numbers" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="To Position" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTo" runat="server" Text='<%# Eval("ECS_To_position")%>' Style="padding-right: 20px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtTo" runat="server" MaxLength="3" Text='<%# Eval("ECS_To_position")%>'
                                                                            Width="30px" Style="text-align: right"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvTo1" runat="server" InitialValue="0" ControlToValidate="txtTo"
                                                                            Display="None" ErrorMessage="To position can not be zero" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvTo2" runat="server" ControlToValidate="txtTo"
                                                                            Display="None" ErrorMessage="Enter the To position" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-right: 20px">
                                                                                    <asp:TextBox ID="txtFTo" runat="server" MaxLength="3" ToolTip="To Position" Width="30px"
                                                                                        Style="text-align: right"></asp:TextBox>
                                                                                    <%--<asp:RequiredFieldValidator ID="rfvTo1" runat="server" InitialValue="0" ControlToValidate="txtFTo"
                                                            Display="None" ErrorMessage="To position can not be zero" ValidationGroup="Add">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator ID="rfvTo2" runat="server" ControlToValidate="txtFTo"
                                                            Display="None" ErrorMessage="Enter the To position" ValidationGroup="Add">
                                                        </asp:RequiredFieldValidator>--%>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" TargetControlID="txtFTo"
                                                                                        FilterType="Numbers" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Length" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLength" runat="server" MaxLength="3" Text='<%# Eval("ECS_Length")%>'
                                                                            Style="padding-right: 10px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtLength" runat="server" MaxLength="3" Text='<%# Eval("ECS_Length")%>'
                                                                            Width="30px" Style="text-align: right"></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-right: 10px">
                                                                                    <asp:TextBox ID="txtFLength" runat="server" MaxLength="3" TabIndex="-1" ToolTip="Length"
                                                                                        Width="30px" Style="text-align: right">
                                                                                    </asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Lookup Code" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCode1" runat="server" Text='<%# Eval("Lookup_Code") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblFCode1" runat="server" Text='<%# Eval("Lookup_Code") %>' /></ItemTemplate>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Field Description" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("Lookup_Description") %>' Style="padding-left: 15px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:DropDownList ID="ddlType" runat="server" />
                                                                        <asp:RequiredFieldValidator ID="rfvddlType1" runat="server" InitialValue="0" ControlToValidate="ddlType"
                                                                            Display="None" ErrorMessage="Select a Field Description" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvddlType2" runat="server" ControlToValidate="ddlType"
                                                                            Display="None" ErrorMessage="Select a Field Description" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                    </EditItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-left: 15px">
                                                                                    <asp:DropDownList ID="ddlFType" runat="server" ToolTip="Field Type">
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator ID="rfvddlType1" runat="server" InitialValue="0" ControlToValidate="ddlFType"
                                                                                        Display="None" ErrorMessage="Select a Field Description" ValidationGroup="Add">
                                                                                    </asp:RequiredFieldValidator>
                                                                                    <asp:RequiredFieldValidator ID="rfvddlType2" runat="server" ControlToValidate="ddlFType"
                                                                                        Display="None" ErrorMessage="Select a Field Description" ValidationGroup="Add">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <%--   <asp:TemplateField HeaderText="Mandatory">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="cbxgvIsMandatory" runat="server" Checked='<%# Eval("Is_Mandatory").ToString() == "1" ?  true:false %>'
                                                                            OnCheckedChanged="cbxgvIsMandatory_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:CheckBox ID="cbxgvFtrIsMandatory" runat="server" />
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>--%>
                                                                <asp:TemplateField HeaderText="Credit Priority">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtCreditPrty" runat="server" Text='<%# Eval("Credit_Priority") %>' MaxLength="2" Width="50px"
                                                                            OnTextChanged="txtCreditPrty_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftbeCreditPrty" runat="server" Enabled="true" TargetControlID="txtCreditPrty"
                                                                            FilterType="Numbers">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtFtrCreditPrty" runat="server" Text="" MaxLength="2" Width="50px"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftbeFtrCreditPrty" runat="server" Enabled="true" TargetControlID="txtFtrCreditPrty"
                                                                            FilterType="Numbers">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </FooterTemplate>
                                                                    <ItemStyle Width="50px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Debit Priority">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtDebitPrty" runat="server" Text='<%# Eval("Debit_Priority") %>' MaxLength="2" Width="50px"
                                                                            OnTextChanged="txtDebitPrty_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftbeDebitPrty" runat="server" Enabled="true" TargetControlID="txtDebitPrty"
                                                                            FilterType="Numbers">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtFtrDebitPrty" runat="server" Text="" MaxLength="2" Width="50px"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftbeFtrDebitPrty" runat="server" Enabled="true" TargetControlID="txtFtrDebitPrty"
                                                                            FilterType="Numbers">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </FooterTemplate>
                                                                    <ItemStyle Width="50px" />
                                                                </asp:TemplateField>

                                                                <%--Added on 30-Mar-2018 starts here --%>
                                                                <asp:TemplateField HeaderText="Realization" ItemStyle-Width="75px" FooterStyle-Width="75px">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="grvItmchkIsRealization" runat="server" Checked='<%# Eval("Is_Realisation_Date").ToString() == "1" ?  true:false %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:CheckBox ID="grvFtrchkIsRealization" runat="server" />
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <%--Added on 30-Mar-2018 ends here --%>

                                                                <asp:TemplateField HeaderText="Action">
                                                                    <ItemTemplate>
                                                                        <%--<asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                ToolTip="Edit">
                                            </asp:LinkButton>
                                            &nbsp;|--%>
                                                                        <%--<asp:LinkButton ID="btnRemove" Text="Delete" CommandName="Delete" runat="server"
                                                CausesValidation="false" />--%>
                                                                        <asp:Button ID="btnRemove" runat="server" CausesValidation="false" CommandName="Delete"
                                                                            CssClass="styleGridShortButton" Text="Delete" ToolTip="Delete"></asp:Button>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                            ValidationGroup="Add" ToolTip="Update" OnClientClick="return fnCheckPageValidators('Add','false');"></asp:LinkButton>
                                                                        &nbsp;|
                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Button ID="btnAddrow" CausesValidation="false" runat="server" CommandName="AddNew"
                                                                            ToolTip="Add" CssClass="styleGridShortButton" Text="Add"></asp:Button>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>

                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br />

                                </td>

                            </tr>

                            <tr>
                                <td colspan="4" align="center">

                                    <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" CssClass="styleSubmitButton" Text="Save"
                                        ValidationGroup="submit" OnClientClick="return fnCheckPageValidators('submit');"
                                        ToolTip="Save,Alt+S" Visible="false" AccessKey="S" />
                                    <asp:Button runat="server" ID="btnClear" CssClass="styleSubmitButton" OnClick="btnClear_Click" Text="Clear_FA"
                                        CausesValidation="False" ToolTip="Clear_FA,Alt+L" Visible="false" AccessKey="L" />
                                    <cc1:ConfirmButtonExtender ID="btnAssetClear_ConfirmButtonExtender" runat="server"
                                        ConfirmText="Are you sure want to Clear_FA?" Enabled="True" TargetControlID="btnClear">
                                    </cc1:ConfirmButtonExtender>

                                    <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" CssClass="styleSubmitButton" CausesValidation="False"
                                        Text="Exit" ToolTip="Cancel,Alt+X" AccessKey="X"/>
                                </td>


                            </tr>
                            <tr>

                                <td colspan="4" align="left">
                                    <asp:ValidationSummary ValidationGroup="submit" ID="vsSummary" runat="server"
                                        CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" HeaderText="Correct the following validation(s):  " />

                                </td>
                            </tr>


                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        function FunCheckForOverlap(type, txtFrm, txtTo, txtLn, PrevTo, ddlType, ddlBRSType) {

            var From = document.getElementById(txtFrm).value;
            var To = document.getElementById(txtTo).value;
            var Length = document.getElementById(txtLn).value;
            var ddlCtrl = document.getElementById(ddlType);
            var ddlVal = ddlCtrl.options[ddlCtrl.selectedIndex].value
            var ddlBRSCtrl = document.getElementById(ddlBRSType);
            var ddlBRSVal = ddlBRSCtrl.options[ddlBRSCtrl.selectedIndex].value

            if (type == 1) {
                if (From == '' || From == 0) {
                    document.getElementById(txtLn).value = '';
                    alert('Enter From Position.');
                    document.getElementById(txtFrm).focus();
                    return false;
                }
                else if (parseFloat(ddlVal) == 0) {
                    alert('Select Field Description.');
                    ddlCtrl.focus();
                    return false;
                }
                if (parseInt(ddlBRSVal) == 14)//
                {
                    if (To == '' || To == 0) //
                    {
                        document.getElementById(txtLn).value = '';
                        alert('To Position should not be Zero/Empty.');
                        document.getElementById(txtTo).focus();
                        return false;
                    }
                    else if (parseFloat(From) > parseFloat(To)) //
                    {
                        alert('To postion getting overlap');
                        document.getElementById(txtTo).focus();
                        return false;
                    }
                    else //
                    {
                        //document.getElementById(txtTo).value = parseFloat(To);
                        document.getElementById(txtLn).value = (parseInt(To) - parseInt(From)) + 1;
                        //document.getElementById(txtLn).value = From + 1;
                    }
                }
            }
            else if (type == 2) {
                if (From == '' || From == 0) {
                    document.getElementById(txtLn).value = '';
                    alert('Enter From Position.');
                    document.getElementById(txtFrm).focus();
                    return false;
                }

                else if (parseFloat(ddlVal) == 0) {
                    alert('Select Field Type & Description.');
                    ddlCtrl.focus();
                    return false;
                }
                if (parseInt(ddlBRSVal) == 14)//
                {
                    if (To == '' || To == 0) {
                        document.getElementById(txtLn).value = '';
                        alert('To Position should not be Zero/Empty.');
                        document.getElementById(txtTo).focus();
                        return false;
                    }
                    else if (parseInt(PrevTo) >= parseInt(From)) {
                        alert('From postion getting overlap');
                        document.getElementById(txtFrm).focus();
                        return false;
                    }
                    else if (parseFloat(From) > parseFloat(To)) {
                        alert('To postion getting overlap');
                        document.getElementById(txtTo).focus();
                        return false;
                    }
                    else {
                        document.getElementById(txtTo).value = parseFloat(To);
                        document.getElementById(txtLn).value = (parseInt(To) - parseInt(From)) + 1;
                    }
                }
            }
        }

        function fnDoDate1(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation) {


            var s = el.value;
            var d, m, y;
            var erString = 'Enter the valid date format (' + eFormat + ')';
            var len = s.length;
            var DtConvDate;
            if (eFormat == 'MM/dd/yyyy' || eFormat == 'MM-dd-yyyy') {
                //alert('Front mm');
                if (10 == len) {
                    d = s.substring(3, 5);
                    m = s.substring(0, 2);
                    y = s.substring(6, 10);
                }
                else if (8 == len) {
                    d = s.substring(2, 4);
                    m = s.substring(0, 2);
                    y = s.substring(4, 8);
                }
                else if (6 == len) {
                    d = s.substring(2, 4);
                    m = s.substring(0, 2);
                    y = '20' + s.substring(4, 6);
                }
                else if (0 == len) {
                    erString = '';
                }
                else if (11 == len) {
                    d = s.substring(3, 6);
                    m = s.substring(0, 2);
                    y = s.substring(7, 11);

                    if (m.toUpperCase() == 'JAN')
                        m = '01';
                    if (m.toUpperCase() == 'FEB')
                        m = '02';
                    if (m.toUpperCase() == 'MAR')
                        m = '03';
                    if (m.toUpperCase() == 'APR')
                        m = '04';
                    if (m.toUpperCase() == 'MAY')
                        m = '05';
                    if (m.toUpperCase() == 'JUN')
                        m = '06';
                    if (m.toUpperCase() == 'JUL')
                        m = '07';
                    if (m.toUpperCase() == 'AUG')
                        m = '08';
                    if (m.toUpperCase() == 'SEP')
                        m = '09';
                    if (m.toUpperCase() == 'OCT')
                        m = '10';
                    if (m.toUpperCase() == 'NOV')
                        m = '11';
                    if (m.toUpperCase() == 'DEC')
                        m = '12';
                }
            }
            else {
                //alert('Front dd');
                if (10 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(3, 5);
                    y = s.substring(6, 10);
                }
                else if (8 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(2, 4);
                    y = s.substring(4, 8);
                }
                else if (6 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(2, 4);
                    y = '20' + s.substring(4, 6);
                }
                else if (0 == len) {
                    erString = '';
                }
                else if (11 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(3, 6);
                    y = s.substring(7, 11);

                    if (m.toUpperCase() == 'JAN')
                        m = '01';
                    if (m.toUpperCase() == 'FEB')
                        m = '02';
                    if (m.toUpperCase() == 'MAR')
                        m = '03';
                    if (m.toUpperCase() == 'APR')
                        m = '04';
                    if (m.toUpperCase() == 'MAY')
                        m = '05';
                    if (m.toUpperCase() == 'JUN')
                        m = '06';
                    if (m.toUpperCase() == 'JUL')
                        m = '07';
                    if (m.toUpperCase() == 'AUG')
                        m = '08';
                    if (m.toUpperCase() == 'SEP')
                        m = '09';
                    if (m.toUpperCase() == 'OCT')
                        m = '10';
                    if (m.toUpperCase() == 'NOV')
                        m = '11';
                    if (m.toUpperCase() == 'DEC')
                        m = '12';

                    //alert(m);
                }
            }

            // debugger;            
            if (checkDate(y, m, d)) {
                if (eFormat == 'dd/MM/yyyy')
                    el.value = d + '/' + monthNo[m - 1] + '/' + y;
                if (eFormat == 'dd-MM-yyyy')
                    el.value = d + '-' + monthNo[m - 1] + '-' + y;
                if (eFormat == 'MM/dd/yyyy')
                    el.value = monthNo[m - 1] + '/' + d + '/' + y;
                if (eFormat == 'MM-dd-yyyy')
                    el.value = monthNo[m - 1] + '-' + d + '-' + y;
                if (eFormat == 'dd-MMM-yyyy') {
                    el.value = d + '-' + monthNames[m - 1] + '-' + y;
                    DtConvDate = monthNo[m - 1] + '/' + d + '/' + y;
                }

                erString = '';
            }
            if (document.getElementById) {
                //document.getElementById(erID).innerHTML = erString;
                //document.getElementById(erID).value = erString;                
                if (erString != "") {
                    alert(erString);
                    document.getElementById(erID).value = "";
                }
            }
            if (erString) {
                if (el.focus) {
                    el.focus();
                }
            }
            var varEnteredDateValue;
            var varEnteredDate;
            //var varEnteredDateVal = varEnteredDate;                          
            var vartoday = new Date();
            var dd = vartoday.format('MM/dd/yyyy');

            var varCurrentDate = Date.parse(dd);

            if (eFormat == 'dd-MMM-yyyy') {
                varEnteredDateValue = Date.parse(DtConvDate);
            }
            else {
                //varEnteredDate= d + '/' + monthNo[m-1] + '/' + y;     
                varEnteredDate = monthNo[m - 1] + '/' + d + '/' + y;
                varEnteredDateValue = Date.parse(varEnteredDate);
            }
            if (IsFutureDateValidation == true) {
                if (varEnteredDateValue > varCurrentDate) {
                    alert('Entered date cannot be greater than system date');
                    document.getElementById(erID).value = '';
                }
            }
            if (IsBackDateValidation == true) {
                if (varEnteredDateValue < varCurrentDate) {
                    alert('Entered date cannot be less than system date');
                    document.getElementById(erID).value = '';
                }
            }

            if (IsBackDateValidation == 'P') {
                if (varEnteredDateValue >= varCurrentDate) {
                    alert('Entered date cannot be greater than or equal to system date');
                    document.getElementById(erID).value = '';
                }
            }
            //if (IsBackDateValidation == 'F') {
            //    if (varEnteredDateValue <= varCurrentDate) {
            //        alert('Entered date cannot be less than or equal to system date');
            //        document.getElementById(erID).value = '';
            //    }
            //}
        }

        //Added on 30-Mar-2018 Starts here

        function fnEnableDisableRealisation(ddlType, chkIsRealization) {
            //2-Document Date 5-Instrument Date 10-Realisation Date
            if (document.getElementById(ddlType).value == 2 || document.getElementById(ddlType).value == 5 || document.getElementById(ddlType).value == 10) {
                document.getElementById(chkIsRealization).disabled = false;
            }
            else {
                document.getElementById(chkIsRealization).disabled = true;
                document.getElementById(chkIsRealization).checked = false;
            }
        }

        function fnUpdateRealisation(chkIsRealization, DescValue) {
            PageMethods.WMtdUpdateFormat((document.getElementById(chkIsRealization).checked == true) ? "1" : "0"
                , DescValue);
        }

        //Added on 30-Mar-2018 Ends here


    </script>
</asp:Content>

