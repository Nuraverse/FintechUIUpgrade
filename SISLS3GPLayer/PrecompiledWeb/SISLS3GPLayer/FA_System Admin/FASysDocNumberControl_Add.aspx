<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Sysadm_FASysDocNumberControl_Add, App_Web_tfexpijv" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function Trim(strInput)
        {
            var FieldValue = document.getElementById(strInput).value;
            document.getElementById(strInput).value = FieldValue.trim();
        }
    </script>  

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="tbDNC" runat="server" border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <td>
                                </td>
                            </tr>
                             <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server"  Text="Financial Year" ID="lblFinYear"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddlFinYear" runat="server" Width="205px" >
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%">
                                    <%--<asp:RequiredFieldValidator ID="rfvFinYear" runat="server" Display="None" ErrorMessage="Select the Financial Year"
                                        ControlToValidate="ddlFinYear" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel"  width="20%">
                                    <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Activity " 
                                        ID="lblActivity"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddlActivity" runat="server" Width="205px" >
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width: 20%">
                              <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ValidationGroup="main"  Display="None" ErrorMessage="Select the Activity "
                                  ControlToValidate="ddlActivity" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Location" ID="lblBranch"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddlLocation" runat="server" Width="205px" >
                                    </asp:DropDownList>
                                    <%-- <asp:RequiredFieldValidator ID="rfvBranch" runat="server" Display="None" ErrorMessage="Select the Line of Business or Branch"
                                  ControlToValidate="ddlLocation" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>--%>
                                </td>
                                <td style="width: 20%">
                                </td>
                            </tr>
                           
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Document Type" ID="lblDocType"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddlDocType" runat="server" Width="205px" >
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%">
                                    <asp:RequiredFieldValidator ID="rfvDocType" runat="server" ValidationGroup="main" Display="None" ErrorMessage="Select the Document Type"
                                        ControlToValidate="ddlDocType" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Batch" ID="Batch"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtBatch" runat="server" ToolTip="Batch" Width="100px" MaxLength="5" ></asp:TextBox>
                                    <asp:DropDownList ID="ddlBatch" runat="server" Width="105px" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged"
                                        AutoPostBack="true">
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;
                                </td>
                                <td style="width: 20%">
                                    <asp:RequiredFieldValidator ID="rfvBatch" runat="server"  ValidationGroup="main" Display="None" ErrorMessage="Enter the Batch"
                                        ControlToValidate="txtBatch"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="rfvddlBatch" runat="server" ValidationGroup="main" Display="None" ErrorMessage="Select the Batch"
                                        ControlToValidate="ddlBatch" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtBatch"
                                        FilterType="Custom,LowercaseLetters,Numbers,UppercaseLetters" InvalidChars=""
                                        Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="From Number" ID="lblFromNo"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <cc2:NumericTextBox ID="txtFromNo" ToolTip="From No." runat="server" Width="100px" MaxLength="12" ></cc2:NumericTextBox>
                                </td>
                                <td style="width: 20%">
                                    <asp:RequiredFieldValidator ID="rfvFromNos" runat="server" ValidationGroup="main" Display="None" ErrorMessage="Enter the From Number"
                                        ControlToValidate="txtFromNo" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="To Number" ID="lblToNo"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <cc2:NumericTextBox ID="txtToNo" ToolTip="To No." runat="server" Width="100px" MaxLength="12" ></cc2:NumericTextBox>
                                </td>
                                <td style="width: 20%">
                                    <asp:RequiredFieldValidator ID="rfvToNo" runat="server" ValidationGroup="main" Display="None" ErrorMessage="Enter the To Number"
                                        ControlToValidate="txtToNo" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Last Used Number" ID="lblLastNo"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <cc2:NumericTextBox ID="txtLastNo" ToolTip="Last Used No." runat="server" Width="100px"></cc2:NumericTextBox>
                                </td>
                                <td style="width: 20%">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server" Text="Active" ID="lblActive"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldLabel" style="width: 55%">
                                    &nbsp;&nbsp;<asp:CheckBox ID="CbxActive" ToolTip="Active" runat="server" />
                                </td>
                                <td style="width: 20%">
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 20px">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="center">
                                                <asp:Button runat="server" ID="btnSave" ToolTip="Save,Alt+S" CssClass="styleSubmitButton" Text="Save" ValidationGroup="main"
                                                    OnClientClick="return fnCheckPageValidators('main');" OnClick="btnSave_Click" AccessKey="S"  />
                                              
                                                <asp:Button runat="server" ID="btnClear" ToolTip="Clear_FA,Alt+L" CssClass="styleSubmitButton" Text="Clear_FA"
                                                    CausesValidation="False" OnClick="btnClear_Click" AccessKey="L" />
                                                <cc1:ConfirmButtonExtender ID="btnClear_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure want to Clear_FA?"
                                                    Enabled="True" TargetControlID="btnClear">
                                                </cc1:ConfirmButtonExtender>
                                               
                                                <asp:Button runat="server" ID="btnCancel" ToolTip="Cancel,Alt+X" CssClass="styleSubmitButton" Text="Exit"
                                                    CausesValidation="False" OnClick="btnCancel_Click" AccessKey="X"  />
                                               
                                                <asp:Button runat="server" ID="btnDelete" ToolTip="Delete" CssClass="styleSubmitButton" Text="Delete"
                                                    CausesValidation="False" OnClick="btnDelete_Click" AccessKey="I" />
                                            </td>
                                        </tr>
                                        <tr class="styleButtonArea">
                                            <td>
                                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" Style="color: Red;
                                                    font-size: medium"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="height: 220px" valign="top">
                                            <td colspan="5">
                                                <asp:ValidationSummary ID="vsDocTypeSummary" runat="server" ValidationGroup="main" Height="30px" Width="716px"
                                                    CssClass="styleMandatoryLabel" ShowSummary="true" HeaderText="Please correct the following validation(s):  " />
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td colspan="5">
                                                <asp:CustomValidator ID="cvDNC" runat="server" Display="None" CssClass="styleMandatoryLabel"  ></asp:CustomValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
