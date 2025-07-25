<%@ page language="C#" autoeventwireup="true" title="S3G - PreMature Closure Approval" inherits="S3GLoanAdPreMatureClosureApproval_Add, App_Web_razugfam" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" class="stylePageHeading">
                        <asp:Label runat="server" Text="PreMature Closure Approval" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center">
                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td valign="top" align="left">
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td valign="top" colspan="2">
                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" colspan="2">
                                                <table cellpadding="2" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td colspan="5">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr runat="server" id="trCkbox">
                                                        <td align="center">
                                                            <table>
                                                                <tr>
                                                                    <br />
                                                                    <td class="styleFieldLabel">
                                                                        <asp:Label ID="Label1" runat="server" Text="Approval Status"></asp:Label>
                                                                    </td>
                                                                    <td colspan="2">
                                                                        <asp:CheckBox ID="chkUnapproval" AutoPostBack="true" Text="Unapproved" runat="server"
                                                                            OnCheckedChanged="chkUnapproval_CheckedChanged" ToolTip="Unapproved" />
                                                                        <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender2" TargetControlID="chkUnapproval"
                                                                            Key="1" runat="server">
                                                                        </cc1:MutuallyExclusiveCheckBoxExtender>
                                                                        &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkApproved" Text="All" runat="server" OnCheckedChanged="chkApproved_CheckedChanged"
                                                                            AutoPostBack="true" ToolTip="All" />
                                                                        <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender1" TargetControlID="chkApproved"
                                                                            Key="1" runat="server">
                                                                        </cc1:MutuallyExclusiveCheckBoxExtender>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="50%">
                                                            <asp:Panel GroupingText="Premature Closure Details" ID="pnltopupDetails" runat="server"
                                                                CssClass="stylePanel">
                                                                <table width="100%" border="0">
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddllLineOfBusiness" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddllLineOfBusiness_SelectedIndexChanged"
                                                                                Width="200px" ToolTip="Line of Business">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddllLineOfBusiness"
                                                                                CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Line of Business"
                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <%-- <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                                                Width="200px" ToolTip="Location">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ControlToValidate="ddlBranch"
                                                                                CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Location"
                                                                                InitialValue="0"></asp:RequiredFieldValidator>--%>
                                                                            <uc2:Suggest ID="ddlBranch" ValidationGroup="btnSave" runat="server" ToolTip="Location"
                                                                                ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                                                                ErrorMessage="Select a Location" IsMandatory="true" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblPMCNo" runat="server" Text="PMC Number" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <uc2:Suggest ID="ddlPMCNO" runat="server" ServiceMethod="GetPMCNumber" AutoPostBack="true"
                                                                                OnItem_Selected="ddlPMCNO_SelectedIndexChanged" ErrorMessage="Select premature Closure Number"
                                                                                IsMandatory="true" />
                                                                            <%-- <asp:DropDownList ID="ddlPMCNO" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPMCNO_SelectedIndexChanged"
                                                                                Width="200px" ToolTip="PMC Number">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rvfBusinessofferNo" runat="server" ControlToValidate="ddlPMCNO"
                                                                                CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select premature Closure Number"
                                                                                InitialValue="0"></asp:RequiredFieldValidator>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblDate" runat="server" Text="PMC Date"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtPMCDate" runat="server" ReadOnly="true" Width="90px" ToolTip="PMC Date"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblmla" runat="server" Text="Prime Account Number "></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtMLA" runat="server" ReadOnly="true" Width="130px" ToolTip="Prime Account Number"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblsla" runat="server" Text="Sub Account Number" Visible="false"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlSubAccountNo" runat="server" Width="200px" AutoPostBack="True" Visible="false"
                                                                                OnSelectedIndexChanged="ddlSubAccountNo_SelectedIndexChanged" ToolTip="Sub Account Number">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rvsubacco" runat="server" ControlToValidate="ddlSubAccountNo"
                                                                                CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select Sub Account Number"
                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblStatus" runat="server" Text="PMC Status"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtStatus" ReadOnly="true" runat="server" Width="90px" ToolTip="PMC Status">
                                                                            </asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel"></td>
                                                                        <td>
                                                                            <asp:Button ID="btnGo" CssClass="styleSubmitShortButton" runat="server" Text="Go"
                                                                                OnClick="btnGo_Click" ToolTip="Go" />
                                                                            <input type="hidden" value="0" runat="server" id="hdnID" />
                                                                            <asp:LinkButton Text="View Details" CausesValidation="false" runat="server" ID="ReqID"
                                                                                OnClick="ReqID_serverclick" ToolTip="View Details"></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                        <td width="50%">
                                                            <asp:Panel GroupingText="Customer Information" ID="pnlCustomerinformation" runat="server"
                                                                CssClass="stylePanel">
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td width="100%">
                                                                            <uc1:S3GCustomerAddress ID="S3GCustomerPermAddress" runat="server" FirstColumnStyle="styleFieldLabel"
                                                                                SecondColumnStyle="styleFieldAlign" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <%--<td>
                                                    <asp:Panel GroupingText="Custoemr Information" ID="Panel1" runat="server" CssClass="stylePanel">
                                                        <table width="100%"  >
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtCustomerCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtCustomerName" runat="server" ReadOnly="true"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel" rowspan="3">
                                                                            <asp:Label ID="lblCustomerAddress1" runat="server" Text="Address"></asp:Label>
                                                                        </td>
                                                                        <td rowspan="3">
                                                                            <asp:TextBox ID="txtCustomerAddress1" runat="server" TextMode="MultiLine" Rows=4
                                                                                ReadOnly="true"></asp:TextBox>
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblMobileNo" runat="server" CssClass="styleDisplayLabel">Mobile No</asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtMobileNo" runat="server" ReadOnly="True"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblEmailID" runat="server" CssClass="styleDisplayLabel">EmailID</asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtEmailID" runat="server" ReadOnly="True"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblWebsite" runat="server" CssClass="styleDisplayLabel">Web Site</asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtWebSite" runat="server" ReadOnly="True"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                    </asp:Panel>
                                                </td>--%>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" colspan="5" style="width: 100%">
                                                            <br />
                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="grvApprovalDetails" runat="server" AutoGenerateColumns="false"
                                                                            OnRowDataBound="grvApprovalDetails_RowDataBound" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Approval No." ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblApprovalSNO" Text='<%# Bind("Task_Approval_Serialvalue")%>' runat="server"
                                                                                            ToolTip="Approval No."></asp:Label>
                                                                                        <asp:Label ID="lblApproval_ID" Text='<%# Bind("Approval_ID")%>' Visible="false" runat="server"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Approver Name" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblApprovarName" Text='<%# Bind("User_Name") %>' runat="server" ToolTip="Approver Name"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:DropDownList ID="ddlstatus" runat="server" ToolTip="Status">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rvfNo" runat="server" ControlToValidate="ddlstatus"
                                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Status"
                                                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Password" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" TextMode="Password" ToolTip="Password"></asp:TextBox>
                                                                                        <asp:RequiredFieldValidator ID="rvfNo2" runat="server" ControlToValidate="txtPassword"
                                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Password"></asp:RequiredFieldValidator>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Approval Date" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <%--<asp:Label ID="lblApprovalDate" Text='<%# Bind("Task_StatusDate") %>' runat="server"
                                                                                            MaxLength="6" ToolTip="Approval Date"></asp:Label>--%>
                                                                                        <asp:TextBox ID="txtApprovalDate" runat="server" Text='<%# Bind("Task_StatusDate") %>' MaxLength="15" ToolTip="Approval Date"></asp:TextBox>
                                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtApprovalDate" PopupButtonID="imgAccountdate"
                                                                                            ID="CalendarApprovalDate" Enabled="True" OnClientDateSelectionChanged="checkDate_ApprovalDate">
                                                                                        </cc1:CalendarExtender>
                                                                                        <asp:RequiredFieldValidator ID="rfvApprovalDate" runat="server" ControlToValidate="txtApprovalDate"
                                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter Approval Date"></asp:RequiredFieldValidator>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="45%">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Bind("Remarks") %>' Height="60px"
                                                                                            ToolTip="Remarks" Width="100%" onkeyup="maxlengthfortxt(100)" TextMode="MultiLine"
                                                                                            onkeypress="wraptext(this,'20')"></asp:TextBox>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="hdnNoDates" runat="server" Text="" Visible="false"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="hdnTodate" runat="server" Text="" Visible="false"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5" align="center">
                                                            <input id="hdnClsDtlsID" runat="server" visible="false" value="0" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" align="center">
                                    <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Text="Save"
                                        ToolTip="Save" OnClientClick="return fnCheckPageValidators();" OnClick="btnSave_Click"
                                        ValidationGroup="btnSave" />
                                    <asp:Button ID="btnRevoke" runat="server" CssClass="styleSubmitButton" Text="Revoke"
                                        ToolTip="Revoke" CausesValidation="False" OnClick="btnRevoke_Click" OnClientClick="return confirm('Are you sure want to revoke this record?');" />
                                    <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear"
                                        ToolTip="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                                        CausesValidation="False" />
                                    <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" Text="Cancel"
                                        OnClick="btnCancel_Click" CausesValidation="False" ToolTip="Cancel" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                                        HeaderText="Correct the following validation(s):" ShowSummary="true" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function checkDate_ApprovalDate(sender, args) {

            var varApplicationDate = document.getElementById("<%=txtPMCDate.ClientID %>").value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Approval Date should be greater than or equal to Account Closure Date');
                //alert(GetClientId("txtApprovalDate"));
                // document.getElementById(GetClientId("txtApprovalDate")).value = vartodayformat;
                // document.getElementById(GetClientId("txtApprovalDate")).value = vartoday.format(sender._format);
                document.getElementById('ctl00_ContentPlaceHolder1_grvApprovalDetails_ctl02_txtApprovalDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_grvApprovalDetails_ctl02_txtApprovalDate').value = vartoday.format(sender._format);
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_grvApprovalDetails_ctl02_txtApprovalDate').value = selectedDate.format(sender._format);
                intValid = 1;
            }
            if (vartoday < selectedDate) {
                alert('Approval Date should be less than or equal to Current Date');
                document.getElementById('ctl00_ContentPlaceHolder1_grvApprovalDetails_ctl02_txtApprovalDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_grvApprovalDetails_ctl02_txtApprovalDate').value = vartoday.format(sender._format);
            }
            else {
                if (intValid == 1) {
                    document.getElementById('ctl00_ContentPlaceHolder1_grvApprovalDetails_ctl02_txtApprovalDate').value = selectedDate.format(sender._format);
                }
            }
        }

    </script>
</asp:Content>
