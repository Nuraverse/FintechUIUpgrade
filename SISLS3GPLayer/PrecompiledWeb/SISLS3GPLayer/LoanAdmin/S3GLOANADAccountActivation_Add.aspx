<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="S3GLOANADAccountActivation_Add, App_Web_kvnfu4pv" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">

        function window.onerror() {
            return true;
        }

        function Trim(strInput) {
            var FieldValue = document.getElementById(strInput).value;
            document.getElementById(strInput).value = FieldValue.trim();
        }
        function fnGetCompensationValue(CompensationValue) {
            var exp = /_/gi;
            return parseFloat(CompensationValue.value.replace(exp, '0'));
        }

        function fnRevokeValidators() {
            if (confirm('Are you sure want to Revoke?')) {
                return true;
            }
            else {
                return false;
            }
        }

        function fnSetDivWidth() {
            if (document.getElementById('divMenu').style.display == 'none') {
                document.getElementById("ctl00_ContentPlaceHolder1_tcAccountActivation_tpSystemJournal_divGrid1").style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            }
            else {
                document.getElementById("ctl00_ContentPlaceHolder1_tcAccountActivation_tpSystemJournal_divGrid1").style.width = screen.width - 260;
            }
        }

        function finDisableTab(tabIndex1, tabIndex2, tabIndex3, tabIndex4) {
            var tab = $find("<%=tcAccountActivation.ClientID%>");
            if (tab != null) {
                tab.get_tabs()[1].set_enabled(tabIndex1);
                tab.get_tabs()[2].set_enabled(tabIndex2);
                tab.get_tabs()[3].set_enabled(tabIndex3);
                tab.get_tabs()[4].set_enabled(tabIndex4);
            }

            document.getElementById("<%=btnXLPorting.ClientID%>").disabled = !tabIndex1;
            document.getElementById("<%=btnExportJV.ClientID%>").disabled = !tabIndex2;
        }

        function fnClearAllTab(fromBtn) {
          
            if (fromBtn) {
                if (confirm('Are you sure you want to clear?')) {
                    var tab = $find("<%=tcAccountActivation.ClientID%>");
                    if (tab != null) {
                        tab.get_tabs()[1].set_enabled(false);
                        tab.get_tabs()[2].set_enabled(false);
                        tab.get_tabs()[3].set_enabled(false);
                        tab.get_tabs()[4].set_enabled(false);
                    }

                    document.getElementById("<%=btnXLPorting.ClientID%>").disabled = true;
                    document.getElementById("<%=btnExportJV.ClientID%>").disabled = true;

                    return true;
                }
                else
                    return false;
            }
            else {
                var tab = $find("<%=tcAccountActivation.ClientID%>");
                if (tab != null) {
                    tab.get_tabs()[1].set_enabled(false);
                    tab.get_tabs()[2].set_enabled(false);
                    tab.get_tabs()[3].set_enabled(false);
                    tab.get_tabs()[4].set_enabled(false);
                }

                document.getElementById("<%=btnXLPorting.ClientID%>").disabled = true;
                document.getElementById("<%=btnExportJV.ClientID%>").disabled = true;
            }
        }
        
    </script>

    <table width="100%" align="center" cellpadding="0" cellspacing="0" runat="server">
        <tr>
            <td class="stylePageHeading">
                <table>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Account Activation" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding-top: 10px" runat="server">
                <asp:UpdatePanel ID="upAddress" runat="server">
                    <ContentTemplate>
                        <cc1:TabContainer ID="tcAccountActivation" runat="server" CssClass="styleTabPanel"
                            AutoPostBack="true" Width="100%" ScrollBars="None" TabStripPlacement="top">
                            <cc1:TabPanel ID="tpMainPage" runat="server" CssClass="tabpan" HeaderText="Main Page"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Main Page
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td colspan="4">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblActivationType" runat="server" Text="Select Activation Type"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign">
                                                                    <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="rbtnType_SelectedIndexChanged" ToolTip="Activation Type">
                                                                        <asp:ListItem Text="Prime Account Number Activation" Value="0" Selected="True"></asp:ListItem>
                                                                        <%--<asp:ListItem Text="Sub Account Number Activation" Value="1"></asp:ListItem>--%>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" valign="top">
                                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                            <tr>
                                                                <td valign="top">
                                                                    <div style="height: 1px;">
                                                                        <asp:RequiredFieldValidator ID="rfvLineOfBusiness" runat="server" Display="None"
                                                                            ControlToValidate="ddlLOB" ValidationGroup="btnSave" InitialValue="0" ErrorMessage="Select a Line of Business"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None"
                                                                            ControlToValidate="ddlLOB" ValidationGroup="btnView" InitialValue="0" ErrorMessage="Select a Line of Business"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <%--    <asp:RequiredFieldValidator ID="rfvBranch" runat="server" Display="None" ControlToValidate="ddlBranch"
                                                                            ValidationGroup="btnSave" InitialValue="0" ErrorMessage="Select a Location" CssClass="styleMandatoryLabel"
                                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                                                                            ControlToValidate="ddlBranch" ValidationGroup="btnView" InitialValue="0" ErrorMessage="Select a Location"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>--%>
                                                                        <br />
                                                                        <asp:RequiredFieldValidator ID="rfvMLA" runat="server" Display="None" ControlToValidate="ddlMLA"
                                                                            ValidationGroup="btnSave" InitialValue="0" ErrorMessage="Select a Prime Account Number"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None"
                                                                            ControlToValidate="ddlMLA" ValidationGroup="btnView" InitialValue="0" ErrorMessage="Select a Prime Account Number"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None"
                                                                            ControlToValidate="ddlMLA" ValidationGroup="btnView" ErrorMessage="Select a Prime Account Number"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None"
                                                                            ControlToValidate="ddlMLA" ValidationGroup="btnSave" ErrorMessage="Select a Prime Account Number"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvSubAc" runat="server" Display="None" ControlToValidate="ddlSLA"
                                                                            Enabled="false" ValidationGroup="btnSave" InitialValue="0" ErrorMessage="Select a Sub Account Number"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvSubAc1" runat="server" Display="None" ControlToValidate="ddlSLA"
                                                                            Enabled="false" ValidationGroup="btnSave" ErrorMessage="Select a Sub Account No"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvActivationDate" runat="server" Display="None"
                                                                            ControlToValidate="txtActivationDate" ValidationGroup="btnSave" ErrorMessage="Enter Activation Date"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvBusineesIRR" runat="server" Display="None"
                                                                            ControlToValidate="txtBusinessIRR" ValidationGroup="btnSave" ErrorMessage="Recalculate IRR"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:CustomValidator ID="custRouterLogic" runat="server" ValidationGroup="btnSave"
                                                                            OnServerValidate="custRouterLogic_ServerValidate" Display="None">
                                                                        </asp:CustomValidator>
                                                                        <br />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="21%" class="styleFieldLabel">
                                                        <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign" width="29%">
                                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" ToolTip="Line of Business"
                                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" onchange="fnClearAllTab(false);">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="19%" class="styleFieldLabel">
                                                        <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                            ErrorMessage="Select a Location" IsMandatory="true" OnItem_Selected="ddlBranch_SelectedIndexChanged" />
                                                        <%-- <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" ToolTip="Location"
                                                            OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" onchange="fnClearAllTab(false);">
                                                        </asp:DropDownList>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblMLA" runat="server" Text="Prime Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:DropDownList ID="ddlMLA" runat="server" AutoPostBack="true" ToolTip="Prime Account Number"
                                                            OnSelectedIndexChanged="ddlMLA_SelectedIndexChanged" onchange="fnClearAllTab(false);">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblSLA" runat="server" Visible="false" Text="Sub Account Number"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:DropDownList ID="ddlSLA" runat="server" Visible="false" AutoPostBack="true" ToolTip="Sub Account Number"
                                                            OnSelectedIndexChanged="ddlSLA_SelectedIndexChanged" Enabled="false" onchange="fnClearAllTab(false);">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblActivationDate" runat="server" Text="Activation Date"  CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtActivationDate" runat="server" ToolTip="Activation Date" AutoPostBack="true"
                                                            Width="50%" OnTextChanged="txtActivationDate_TextChanged"></asp:TextBox>
                                                        <asp:Image ID="imgDateofActivation" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                            ToolTip="Activation Date" />
                                                        <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtActivationDate"
                                                            OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgDateofActivation"
                                                            ID="CalendarExtender2" Enabled="True">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td width="100%" colspan="4">
                                                        <table width="99%">
                                                            <tr>
                                                                <td width="50%" valign="top">
                                                                    <asp:Panel Width="99%" ID="Panel3" runat="server" GroupingText="Account Information"
                                                                        CssClass="stylePanel">
                                                                        <table width="100%" cellspacing="0">
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="lblAccountDate" runat="server" Text="Account Creation Date"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign" width="60%">
                                                                                    <asp:TextBox ID="txtAccountCreationDate" runat="server" ToolTip="Account Creation Date"
                                                                                        Width="50%"></asp:TextBox>
                                                                                    <asp:Image ID="ImgAccountCreationDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                                        ToolTip="Creation Date" Visible="false"/>
                                                                                    <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtAccountCreationDate"
                                                                                        PopupButtonID="ImgAccountCreationDate"
                                                                                        ID="CEAccountCreationDate" Enabled="false">
                                                                                    </cc1:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="lblActngdt" runat="server" Text="Accounting Date"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign" width="60%">
                                                                                    <asp:TextBox ID="txtActngdt" ReadOnly="true" runat="server" ToolTip="Accounting Date" Width="50%"></asp:TextBox>
                                                                                    <asp:Image ID="imgActngdt" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Accounting Date" Visible="false"/>
                                                                                    <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtActngdt"
                                                                                        PopupButtonID="imgActngdt" ID="ceActngdt" Enabled="false">
                                                                                    </cc1:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="Label2" runat="server" Text="Status"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtStatus" runat="server" ReadOnly="true" ToolTip="Status" Width="90%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="Label5" runat="server" Text="View Account"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <a href="#" runat="server" id="anchAcct" onserverclick="anchAcct_serverclick" validationgroup="btnView">
                                                                                        <asp:Button CssClass="styleGridShortButton" ID="lblView" runat="server" Text="View"
                                                                                            ValidationGroup="btnView" ToolTip="Account View" OnClick="anchAcct_serverclick"></asp:Button></a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="lblFinAount" runat="server" Text="Finance Amount"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtFinanceAmount" runat="server" ReadOnly="true" ToolTip="Finance Amount"
                                                                                        Style="text-align: right" Width="40%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="lblAccountingIRR" runat="server" Text="Accounting IRR"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtAccIRR" runat="server" ReadOnly="true" ToolTip="Accounting IRR"
                                                                                        Style="text-align: right" Width="40%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="lblBusinessIRR" runat="server" Text="Business IRR"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtBusinessIRR" runat="server" ReadOnly="true" ToolTip="Business IRR"
                                                                                        Style="text-align: right" Width="40%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel">
                                                                                    <asp:Label ID="lblCompanyIRR" runat="server" Text="Company IRR"></asp:Label>
                                                                                </td>
                                                                                <td class="styleFieldAlign">
                                                                                    <asp:TextBox ID="txtCompanyIRR" runat="server" ReadOnly="true" ToolTip="Company IRR"
                                                                                        Style="text-align: right" Width="40%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="styleFieldLabel" height="22px" align="right">
                                                                                    <asp:Button ID="btnCalIRR" Text="Calculate IRR" Visible="false" CssClass="styleSubmitButton" runat="server" OnClick="btnCalIRR_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                                <td width="50%">
                                                                    <asp:Panel Width="100%" ID="Panel11" runat="server" GroupingText="Customer Information"
                                                                        CssClass="stylePanel">
                                                                        <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" FirstColumnStyle="styleFieldLabel"
                                                                            SecondColumnStyle="styleFieldAlign" />
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tpAmortizationSchedule" runat="server" CssClass="tabpan" Width="100%"
                                HeaderText="Amortization Schedule">
                                <ContentTemplate>
                                    <table width="99%" runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Panel runat="server" ID="Panel2" CssClass="stylePanel" GroupingText="Cash Flow Details">
                                                            <table width="100%">
                                                                <tr visible="false" class="styleRecordCount" runat="server" id="trAmortizationMessage">
                                                                    <td colspan="2" align="center">
                                                                        <asp:Label runat="server" ID="Label4" Text="No Records Found" Font-Size="Medium"
                                                                            class="styleMandatoryLabel"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:GridView ID="grvAmortization" runat="server" AutoGenerateColumns="False" Width="90%"
                                                                            OnRowDataBound="grvAmortization_RowDataBound" ShowFooter="true">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblDate" Text='<%#Eval("Date")%>' runat="server" ToolTip="Date"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Cash Flow">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCashFlow" Text='<%#Eval("Cash Flow")%>' runat="server" ToolTip="Cash Flow"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <span>Total</span>
                                                                                    </FooterTemplate>
                                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Installment">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblInstallment" Text='<%#Eval("Installment")%>' runat="server" ToolTip="Installment"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTotalInstallment" runat="server" Style="text-align: right;"></asp:Label>
                                                                                    </FooterTemplate>
                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Balance Payable">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblBalance" Text='<%#Eval("Balance Payable")%>' runat="server" ToolTip="Balance Payable"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Principal Portion">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblPrincipal" Text='<%#Eval("Principal Portion")%>' ToolTip="Principal Portion"
                                                                                            runat="server"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTotalPrincipal" runat="server" Style="text-align: right;"></asp:Label>
                                                                                    </FooterTemplate>
                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Interest Portion">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblInterest" Text='<%#Eval("Interest Portion")%>' runat="server" ToolTip="Interest Portion"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTotalInterest" runat="server" Style="text-align: right;"></asp:Label>
                                                                                    </FooterTemplate>
                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Insurance">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblInsurance" Text='<%#Eval("Insurance")%>' runat="server" ToolTip="Insurance"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTotalInsurance" runat="server" Style="text-align: right;"></asp:Label>
                                                                                    </FooterTemplate>
                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Others">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblOthers" Text='<%#Eval("Others")%>' runat="server" ToolTip="Others"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTotalOthers" runat="server" Style="text-align: right;"></asp:Label>
                                                                                    </FooterTemplate>
                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Tax">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblTax" MaxLength="20" Text='<%#Eval("Tax")%>' runat="server" ToolTip="Tax"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTotalTax" runat="server" Style="text-align: right;"></asp:Label>
                                                                                    </FooterTemplate>
                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <%--   <asp:TemplateField HeaderText="TAXSetoff">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblTAXSetoff" MaxLength="20" Text='<%#Eval("TAXSetoff")%>' runat="server"
                                                                                                ToolTip="TAXSetoff"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>--%>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="98%">
                                        <tr align="right">
                                            <td>
                                                <%--<asp:Button runat="server" ID="btnXLPorting" Text="Export to Excel" CssClass="styleSubmitButton"
                                            OnClick="btnXLPorting_Click" ToolTip="Export to Excel" />--%>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tpSystemJournal" runat="server" CssClass="tabpan" Width="100%"
                                HeaderText="System Journal">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <table width="100%" cellpadding="0" cellspacing="0" border="0" onresize="fnSetDivWidth()">
                                                <tr>
                                                    <td colspan="5" valign="top">
                                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                            <tr>
                                                                <td valign="top">
                                                                    <div style="height: 1px;">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100%">
                                                        <asp:Panel runat="server" ID="Panel4" CssClass="stylePanel" GroupingText="System Journal Details">
                                                            <div id="divGrid1" runat="server" style="overflow: scroll; width: 750px">
                                                                <asp:GridView ID="gvSystemJournal" runat="server" AutoGenerateColumns="False" Width="1850px"
                                                                    OnRowDataBound="gvSystemJournal_RowDataBound" Style="overflow: scroll">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Company Code">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCompanyCode" runat="server" Text='<%# Bind("CompanyCode")%>' ToolTip="Company Code"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Line of Business">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOB")%>' ToolTip="Line of Business"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Location">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Location")%>' ToolTip="Location"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Dimension 1">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDim1" runat="server" Text='<%# Bind("Dimension1")%>' ToolTip="Dimension 1"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Dimension 2" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDim2" runat="server" Text='<%# Bind("Dimension2")%>' ToolTip="Dimension 2"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Prime Account Number">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PrimeAccountNumber")%>' ToolTip="Prime Account Number"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField Visible="false" HeaderText="Sub Account Number">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SubAccountNumber")%>' ToolTip="Sub Account Number"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="System JV No.">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSysJV" runat="server" Text='<%# Bind("SystemJVNumber")%>' ToolTip="System JV No."></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Document Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDocDate" runat="server" Text='<%# Bind("DocumentDate")%>' ToolTip="Document Date"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Value Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblValueDate" runat="server" Text='<%# Bind("ValueDate")%>' ToolTip="Value Date"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--Changed By Thangam M on 22/Nov/2011 Based on UAT--%>
                                                                        <asp:TemplateField HeaderText="GL A/C">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblGLAC" runat="server" Text='<%# Bind("GLAccount")%>' ToolTip="GL A/C"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="SL A/C">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSLAC" runat="server" Text='<%# Bind("SLAccount")%>' ToolTip="SL A/C"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Debit A/C">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDebitAcc" runat="server" Text='<%# Bind("DebitAC")%>' ToolTip="Debit A/C"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Credit A/C">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCreditAcc" runat="server" Text='<%# Bind("CreditAC")%>' ToolTip="Credit A/C"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount")%>' ToolTip="Amount"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Remarks">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks")%>' ToolTip="Remarks"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Status">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status")%>' ToolTip="Status"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <table width="100%">
                                        <tr align="right">
                                            <td>
                                                <%--<asp:Button runat="server" ID="btnExportJV" Text="Export to Excel" CssClass="styleSubmitButton"
                                            ToolTip="Export to Excel" OnClick="btnExportJV_Click" />--%>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tpPreDisbursementDocument" runat="server" CssClass="tabpan" Width="100%"
                                HeaderText="Pre Disbursement Document">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                                        <ContentTemplate>
                                            <table width="100%">
                                                <tr visible="false" class="styleRecordCount" runat="server" id="trPreMessage">
                                                    <td colspan="2" align="center">
                                                        <asp:Label runat="server" ID="lblMessage" Text="No Records Found" Font-Size="Medium"
                                                            class="styleMandatoryLabel"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="pnlProforma" runat="server" GroupingText="Proforma" CssClass="stylePanel">
                                                            <asp:GridView ID="grvFile" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                                Width="100%" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" OnRowDataBound="grvFile_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblID" Visible="false" runat="server" Text='<%#Eval("Proforma_ID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="View">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="BtnView" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                                runat="server" ToolTip="View" />
                                                                            <%-- <asp:LinkButton ID="BtnView" runat="server" Text="View" 
                                                                    ToolTip="View"></asp:LinkButton>--%>
                                                                            <%--<asp:Button ID="BtnView" runat="server" Text="View" CssClass="styleGridShortButton"
                                                                            ToolTip="View"></asp:Button>--%>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Sl.No.">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblslNo" runat="server" ToolTip="Sl.No."></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Proforma Number" ItemStyle-Width="30%" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblProformaNo" runat="server" Text='<%#Eval("Proforma_No") %>' ToolTip="Proforma Number"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Vendor Name" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblVendorName" runat="server" Text='<%#Eval("Vendor_Name") %>' ToolTip="Vendor Name"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="pnlPreDisb" runat="server" GroupingText="Pre Disbursement Document"
                                                            CssClass="stylePanel">
                                                            <asp:GridView ID="gvPRDDT" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                DataKeyNames="PRDDC_Doc_Cat_ID" CssClass="styleInfoLabel" OnRowDataBound="gvPRDDT_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="PRDDC TypeId" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPRTID" runat="server" Text='<%# Bind("PRDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                            <asp:Label ID="lblCanView" runat="server" Visible="false" Text='<%# Eval("CanView")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PRDDC Type" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblType" runat="server" Text='<%# Bind("PRDDC_Doc_Type") %>' ToolTip="PRDDC Type"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="left" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PRDDC Description" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("PRDDC_Doc_Description") %>'
                                                                                ToolTip="PRDDC Description"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Collected By" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="txtColletedBy" runat="server" Text='<%# Bind("CollectedBy") %>' ToolTip="Collected By"></asp:Label>
                                                                            <asp:Label ID="lblColUser" Visible="false" runat="server" Text='<%# Bind("Collected_By") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Collected Date" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="txtColletedDate" ToolTip="Collected Date" runat="server" Width="70px"
                                                                                Text='<%# Bind("Collected_Date") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Scanned By" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="txtScannedBy" runat="server" ToolTip="Scanned By" Text='<%# Bind("Scandedby") %>'></asp:Label>
                                                                            <asp:Label ID="lblScanUser" runat="server" Visible="false" Text='<%# Bind("Scanned_By") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Scanned Date" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="txtScannedDate" ToolTip="Scanned Date" runat="server" Width="70px"
                                                                                Text='<%# Bind("Scanned_Date") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="View Document">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="hyplnkViewPre" CommandArgument='<%# Bind("Scanned_Ref_No") %>'
                                                                                ToolTip="View Document" OnClick="hyplnkViewPre_Click" ImageUrl="~/Images/spacer.gif"
                                                                                CssClass="styleGridQuery" runat="server" />
                                                                            <asp:Label runat="server" ID="lblPath" Text='<%# Eval("Scanned_Ref_No")%>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtRemarks" runat="server" Width="120px" TextMode="MultiLine" onkeyup="maxlengthfortxt(100)"
                                                                                MaxLength="100" Text='<%# Eval("Remarks")%>' ToolTip="Remarks"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tpPostDisbursementDocument" runat="server" CssClass="tabpan" Width="100%"
                                HeaderText="Post Disbursement Document">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <table width="100%">
                                                <tr visible="false" class="styleRecordCount" runat="server" id="trPostMessage">
                                                    <td colspan="2" align="center">
                                                        <asp:Label runat="server" ID="Label1" Text="No Records Found" Font-Size="Medium"
                                                            class="styleMandatoryLabel"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Panel ID="pnlInvoice" runat="server" GroupingText="Invoice" CssClass="stylePanel">
                                                                <asp:GridView ID="grvInvoice" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                                    Width="100%" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" OnRowDataBound="grvInvoice_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblID" runat="server" Text='<%#Eval("Invoice_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="BtnView" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                                    runat="server" ToolTip="View" />
                                                                                <%-- <asp:LinkButton ID="BtnView" runat="server" Text="View" 
                                                                    ToolTip="View"></asp:LinkButton>--%>
                                                                                <%--<asp:Button ID="BtnView" runat="server" Text="View" CssClass="styleGridShortButton"
                                                                            ToolTip="View"></asp:Button>--%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl.No.">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblslNo" runat="server" ToolTip="Sl.No."></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Invoice Number" ItemStyle-Width="30%" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInvoiceNo" runat="server" Text='<%#Eval("Invoice_No") %>' ToolTip="Invoice Number"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Vendor Name" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblVendorName" runat="server" Text='<%#Eval("Vendor_Name") %>' ToolTip="Vendor Name"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Panel ID="pnlPostDisb" runat="server" GroupingText="Post Disbursement Document"
                                                                CssClass="stylePanel">
                                                                <asp:GridView ID="gvPDDT" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                    DataKeyNames="PDDC_Doc_Cat_ID" CssClass="styleInfoLabel" OnRowDataBound="gvPDDT_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="PDDC TypeId" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPDTID" runat="server" Text='<%# Bind("PDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCanView" runat="server" Visible="false" Text='<%# Eval("CanView")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PDDC Type" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("PDDC_Doc_Type") %>' ToolTip="PDDC Type"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PDDC Description" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("PDDC_Doc_Description") %>'
                                                                                    ToolTip="PDDC Description"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collected By" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="txtColletedBy" runat="server" Text='<%# Bind("CollectedBy") %>' ToolTip="Collected By"></asp:Label>
                                                                                <asp:Label ID="lblColUser" Visible="false" runat="server" Text='<%# Bind("Collected_By") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collected Date" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="txtColletedDate" ToolTip="Collected Date" runat="server" Width="70px"
                                                                                    Text='<%# Bind("Collected_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scanned By" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="txtScannedBy" ToolTip="Scanned By" runat="server" Text='<%# Bind("Scandedby") %>'></asp:Label>
                                                                                <asp:Label ID="lblScanUser" runat="server" Visible="false" Text='<%# Bind("Scanned_By") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scanned Date" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="txtScannedDate" ToolTip="Scanned Date" runat="server" Width="70px"
                                                                                    Text='<%# Bind("Getdates")%> '></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View Document">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="hyplnkView" CommandArgument='<%# Bind("Scanned_Ref_No") %>'
                                                                                    OnClick="hyplnkViewPost_Click" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                                    runat="server" ToolTip="View Documen" />
                                                                                <asp:Label runat="server" ID="lblPath" Text='<%# Eval("Scanned_Ref_No")%>' Visible="false"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Remarks">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" onkeyup="maxlengthfortxt(100)"
                                                                                    MaxLength="100" Width="120px" Text='<%# Eval("Remarks")%>' ToolTip="Remarks"></asp:TextBox>
                                                                                <asp:Label ID="lblProgramName" runat="server" Visible="false" Text='<%# Eval("ProgramName")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tr>
                        <td valign="top" align="left" colspan="2">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                    <td valign="top">
                                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" colspan="2">
                                        <table cellpadding="2" cellspacing="0" border="0" width="100%">
                                            <tr>
                                                <td colspan="5" align="center">
                                                    <br />
                                                    <asp:Button runat="server" ID="btnXLPorting" Text="Export Amortization" CssClass="styleSubmitLongButton"
                                                        OnClick="btnXLPorting_Click" ToolTip="Export Amortization" />
                                                    <asp:Button runat="server" ID="btnExportJV" Text="Export JV" CssClass="styleSubmitButton"
                                                        ToolTip="Export JV" OnClick="btnExportJV_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" align="center">
                                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators('btnSave');"
                                                                ValidationGroup="btnSave" CssClass="styleSubmitButton" OnClick="btnSave_Click"
                                                                ToolTip="Activate" Text="Activate" />
                                                            <asp:Button runat="server" ID="btnRevoke" Text="Revoke" Visible="false" ToolTip="Revoke"
                                                                CssClass="styleSubmitButton" OnClick="btnRevoke_Click" Style="height: 26px" OnClientClick="return fnRevokeValidators();" />
                                                            <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                                                ToolTip="Clear" Text="Clear" OnClientClick="confirm('Are you sure want to Clear?');"
                                                                meta:resourcekey="btnClearResource1" OnClick="btnClear_Click" />
                                                            <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="False"
                                                                ToolTip="Cancel" CssClass="styleSubmitButton" OnClick="btnCancel_Click" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" align="center">
                                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <asp:HiddenField ID="hdnActivationType" runat="server" />
                                    <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                                        HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" />
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel"
                                        HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnView" />
                                    <asp:HiddenField ID="hdnDate" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
