<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnUTPAReceiptProcessing, App_Web_4kkykzxm" title="Untitled Page" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Receipt Processing" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:TabContainer ID="tcReceipt" runat="server" CssClass="styleTabPanel" ScrollBars="None"
                            Width="98%" ActiveTabIndex="0" AutoPostBack="True">
                            <cc1:TabPanel ID="TabMainPage" runat="server" BackColor="Red" CssClass="tabpan" HeaderText="General"
                                Width="98%">
                                <HeaderTemplate>
                                    General</HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <table width="100%">
                                                <tr>
                                                    <td width="50%" valign="top">
                                                        <asp:Panel ID="PnlReceiptInfo" runat="server" GroupingText="Receipt Information"
                                                            CssClass="stylePanel" Width="99%">
                                                            <table width="100%" border="0">
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlLOB" runat="server" Width="165px" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                            AutoPostBack="True">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                            Display="None" InitialValue="0" ErrorMessage="Select a Line of Business" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvShowLOB" runat="server" ControlToValidate="ddlLOB"
                                                                            Display="None" InitialValue="0" ErrorMessage="Select a Line of Business" ValidationGroup="Show"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvAppLOB" runat="server" ControlToValidate="ddlLOB"
                                                                            Display="None" InitialValue="0" ErrorMessage="Select a Line of Business" ValidationGroup="Appropriation"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlBranch" runat="server" Width="165px" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                                            AutoPostBack="True" Style="height: 22px">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ControlToValidate="ddlBranch"
                                                                            Display="None" ErrorMessage="Select a Location" InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvShowBranch" runat="server" ControlToValidate="ddlBranch"
                                                                            Display="None" ErrorMessage="Select a Location" InitialValue="0" ValidationGroup="Show"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranch"
                                                                            Display="None" ErrorMessage="Select a Location" InitialValue="0" ValidationGroup="Appropriation"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:Label ID="lblPaymentMode" runat="server" CssClass="styleReqFieldLabel" Text="Mode"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlPaymentMode" AutoPostBack="True" runat="server" Width="165px"
                                                                            OnSelectedIndexChanged="ddlPaymentMode_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvMode" runat="server" ControlToValidate="ddlPaymentMode"
                                                                            Display="None" ErrorMessage="Select a Mode" InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:Label ID="lblDocNo" runat="server" CssClass="styleReqFieldLabel" Text="Doc No"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtDocNo" runat="server" ReadOnly="True"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:Label ID="lblDocDate" runat="server" CssClass="styleReqFieldLabel" Text="Doc Date"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtDocDate" runat="server"></asp:TextBox><cc1:FilteredTextBoxExtender
                                                                            ID="ftxtDocDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtDocDate" ValidChars="/-">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <cc1:CalendarExtender ID="calDocDate" runat="server" Format="DD/MM/YYYY" PopupButtonID="imgDocdate"
                                                                            TargetControlID="txtDocDate">
                                                                        </cc1:CalendarExtender>
                                                                        <asp:Image ID="imgDocdate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:Label ID="lblDocAmount" runat="server" CssClass="styleReqFieldLabel" Text="Doc Amount"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtDocAmount" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="rfvDocAmount" runat="server" ControlToValidate="txtDocAmount"
                                                                            Display="None" ErrorMessage="Enter a Doc Amount" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvAppDocAmount" runat="server" ControlToValidate="txtDocAmount"
                                                                            Display="None" ErrorMessage="Enter a Doc Amount" ValidationGroup="Appropriation"></asp:RequiredFieldValidator>
                                                                        <cc1:FilteredTextBoxExtender ID="docAmntFileterExtndr" runat="server" TargetControlID="txtDocAmount"
                                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:Label ID="lblValueDate" runat="server" CssClass="styleReqFieldLabel" Text="Value Date"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtValueDate" runat="server"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calValueDate" runat="server" Format="DD/MM/YYYY" PopupButtonID="imgValueDate"
                                                                            TargetControlID="txtValueDate" OnClientDateSelectionChanged="checkDate_DocDate">
                                                                        </cc1:CalendarExtender>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtValueDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtValueDate" ValidChars="/-">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <asp:Image ID="imgValueDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtValueDate"
                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter Value Date"
                                                                            SetFocusOnError="True" ValidationGroup="Submit"></asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:Label ID="lblUPTA" runat="server" CssClass="styleDisplayLabel" Text="UTPA"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlUTPA" runat="server" Width="165px">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                    <td width="50%" valign="top">
                                                        <asp:Panel ID="pnlCustomerInformation" runat="server" GroupingText="Customer Informations"
                                                            CssClass="stylePanel" Width="99%">
                                                            <table width="100%" border="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="styleFieldLabel" width="35%">
                                                                        <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <uc2:LOV ID="ucCustomerCodeLov" runat="server" strLOV_Code="CMD" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" width="100%">
                                                                        <asp:Button ID="btnLoadCustomer" runat="server" OnClick="btnLoadCustomer_OnClick"
                                                                            Style="display: none;" Text="Load Customer" CausesValidation="false" />
                                                                        <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" FirstColumnStyle="styleFieldLabel"
                                                                            SecondColumnStyle="styleFieldAlign" ShowCustomerName="false" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" width="100%">
                                                                        &nbsp;&nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="100%">
                                                <tr>
                                                    <td width="100%">
                                                        <asp:Panel ID="pnlAccount" runat="server" CssClass="stylePanel" GroupingText="Account Details"
                                                            Visible="False" Width="99%">
                                                            <div id="div1" style="width: 98%; padding-left: 1%;" runat="server">
                                                                <asp:GridView ID="gvMLASLA" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                                                    OnRowCancelingEdit="gvMLASLA_RowCancelingEdit" OnRowCommand="gvMLASLA_RowCommand"
                                                                    OnRowDataBound="gvMLASLA_RowDataBound" OnRowDeleting="gvMLASLA_RowDeleting" ShowFooter="True"
                                                                    Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Prime Account No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPANUM" runat="server" Text='<%#Bind("PrimeAccountNo") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlPANum" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                                                                    OnSelectedIndexChanged="ddlPANum_SelectedIndexChanged" Width="150px">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvPANum" runat="server" ControlToValidate="ddlPANum"
                                                                                    Display="None" InitialValue="0" ErrorMessage="Select a Prime Account Number"
                                                                                    ValidationGroup="AccountDetails"></asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sub Account No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSANUM" runat="server" Text='<%#Bind("SubAccountNo") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlSANum" runat="server" Width="120px">
                                                                                </asp:DropDownList>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account Description Id" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccDesc" runat="server" Text='<%#Bind("AccountDescriptionId") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccDescription" runat="server" Text='<%#Bind("AccountDescription") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlAccDesc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAccDesc_SelectedIndexChanged"
                                                                                    Width="130px">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvAccDes" runat="server" ControlToValidate="ddlAccDesc"
                                                                                    Display="None" InitialValue="0" ErrorMessage="Select the Account Description"
                                                                                    ValidationGroup="AccountDetails"></asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="GLAccount Id" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblGLAccDesc" runat="server" Text='<%#Bind("GLAccountId") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="ddlGLAccDesc" runat="server" Text='<%#Bind("GLAccountId") %>'></asp:Label>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="GL Account">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblGLAccount" runat="server" Text='<%#Bind("GLAccount") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="ddlGLAccount" runat="server" Width="100px">
                                                                                </asp:Label>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="SLAccount Id" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSLAccDesc" runat="server" Text='<%#Bind("SLAccountId") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="ddlSLAccDesc" runat="server" Text='<%#Bind("SLAccountId") %>'></asp:Label>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="SL Account">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSLAccount" runat="server" Text='<%#Bind("SLAccount") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="ddlSLAccount" runat="server" Width="100px">
                                                                                </asp:Label>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Amount">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtAmount" runat="server" Text='<%#Bind("Amount") %>' Width="100px"
                                                                                    AutoPostBack="true" OnTextChanged="txtAmount_TextChanged"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtAmount" runat="server" TargetControlID="txtAmount"
                                                                                    FilterType="Custom,Numbers" ValidChars="." Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtAccountAmount" runat="server" Width="100px"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtAccountAmount" runat="server" TargetControlID="txtAccountAmount"
                                                                                    FilterType="Custom,Numbers" ValidChars="." Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvAcAmount" runat="server" ControlToValidate="txtAccountAmount"
                                                                                    Display="None" ErrorMessage="Enter the Amount" ValidationGroup="AccountDetails"></asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="Delete"
                                                                                    Text="Remove"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CssClass="styleGridShortButton"
                                                                                    ValidationGroup="AccountDetails" CommandName="Add" Text="Add"></asp:Button>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="CashflowId" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCFMID" runat="server" Text='<%#Bind("CFMID") %>'></asp:Label></ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblCFM" runat="server" Width="100px" Text='<%#Bind("CFMID") %>'> </asp:Label></FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="100%" align="right">
                                                                        <asp:Label ID="lblTotal" runat="server" Text="" CssClass="styleInfoLabel" Style="padding-right: 74px"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="100%" align="center">
                                                        <asp:Panel ID="pnlShowMethod" runat="server" CssClass="stylePanel" GroupingText="Installment Details"
                                                            Width="98%">
                                                            <asp:GridView ID="gvShowInstallment" runat="server" AutoGenerateColumns="false" Width="99%"
                                                                OnRowDataBound="gvShowInstallment_RowDataBound">
                                                                <Columns>
                                                                    <asp:BoundField DataField="PrimeAccountNo" HeaderText="Prime Account No" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField DataField="SubAccountNo" HeaderText="Sub Account No" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField DataField="InstallmentDate" HeaderText="Installment Date" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField DataField="AccountDescription" HeaderText="Account Description" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField DataField="Amount" HeaderText="Amount" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-HorizontalAlign="Right" />
                                                                    <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFlagId" runat="server" Text='<%#Bind("AccountDescriptionId") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCFMId" runat="server" Text='<%#Bind("CFMID") %>' /></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGL_Account" runat="server" Text='<%#Bind("GL_Account") %>' /></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSL_Account" runat="server" Text='<%#Bind("SL_Account") %>' /></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                        <HeaderTemplate>
                                                                            <asp:CheckBox ID="chkSelectAll" runat="server" onclick="javascript:fnSelectAll(this,'chkSelect');" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <table width="100%" align="center">
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Button ID="btnShowApply" runat="server" CausesValidation="true" Visible="false"
                                                                            CssClass="styleSubmitButton" Text="Apply" OnClick="btnShowApply_OnClick" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="100%" align="center">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Button ID="btnAppropriationLogic" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                                                            Text="Suggest" OnClick="btnAppropriationLogic_OnClick" ValidationGroup="Appropriation" />
                                                        <asp:Button ID="btnShow" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                                                            Text="Show" OnClick="btnShow_OnClick" ValidationGroup="Show" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabControlDataSheet" runat="server" BackColor="Red" CssClass="tabpan"
                                HeaderText="Drawee Bank" Width="98%">
                                <HeaderTemplate>
                                    Drawee Bank</HeaderTemplate>
                                <ContentTemplate>
                                    <table align="center" width="98%">
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="lblInstrumentNo" runat="server" CssClass="styleDisplayLabel" Text="Instrument No"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtInstrumentNo" runat="server" onkeypress="return NumericCheck(event)"
                                                    MaxLength="6"></asp:TextBox>
                                            </td>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="lblpaymentGateway" runat="server" CssClass="styleReqdFieldLabel" Text="Payment Gateway Ref No"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtPaymentGateway" runat="server" MaxLength="20"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftxtPayment" runat="server" Enabled="True" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                    TargetControlID="txtPaymentGateway" ValidChars="">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="lblInstrumentDate" runat="server" CssClass="styleDisplayLabel" Text="Instrument Date"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtInstrumentDate" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox><cc1:FilteredTextBoxExtender
                                                    ID="ftxtInstrumentDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                    TargetControlID="txtInstrumentDate" ValidChars="/-">
                                                </cc1:FilteredTextBoxExtender>
                                                <cc1:CalendarExtender ID="calInstrumentDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                    PopupButtonID="imgInstrumentDate" TargetControlID="txtInstrumentDate">
                                                </cc1:CalendarExtender>
                                                <asp:Image ID="imgInstrumentDate" runat="server" ImageUrl="~/Images/calendaer.gif" /><asp:RequiredFieldValidator
                                                    ID="rfvInstrumentDate" runat="server" ControlToValidate="txtInstrumentDate" CssClass="styleMandatoryLabel"
                                                    Display="None" Enabled="False" ErrorMessage="Enter Instrument Date" SetFocusOnError="True"
                                                    ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="lblACKNo" runat="server" CssClass="styleDisplayLabel" Text="ACK No"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtACKNo" runat="server" MaxLength="12"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftxtACKNo" runat="server" Enabled="True" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                    TargetControlID="txtACKNo" ValidChars="">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="lblLocation" runat="server" CssClass="styleDisplayLabel" Text="Location"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtLocation" runat="server" MaxLength="40"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftxtLocation" runat="server" Enabled="True" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                    TargetControlID="txtLocation" ValidChars="">
                                                </cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="lblDraweeBank" runat="server" CssClass="styleDisplayLabel" Text="Drawee Bank"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:DropDownList ID="ddlDraweeBank" runat="server" Width="165px" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlDraweeBank_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvDraweeBank" runat="server" ControlToValidate="ddlDraweeBank"
                                                    Display="None" InitialValue="0" Enabled="False" ErrorMessage="Select a Drawee Bank"
                                                    ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldAlign">
                                                &nbsp;
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:Label ID="lblBankName" runat="server" Text="Bank Name" Visible="False"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="TxtBank" runat="server" MaxLength="50" Visible="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </td>
                </tr>
            </table>
            <table width="100%" align="center">
                <tr>
                    <td align="center">
                        &nbsp;&nbsp;<asp:Button ID="btnSave" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                            Text="Save" ValidationGroup="Submit" OnClientClick="return fnCheckPageValidators('Submit');"
                            OnClick="btnSave_OnClick" />
                        &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                            Text="Clear" OnClick="btnClear_OnClick" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                            Text="Cancel" OnClick="btnCancel_OnClick" />
                    </td>
                </tr>
                <tr>
                    <td class="styleFieldAlign">
                    </td>
                </tr>
            </table>
            <asp:CustomValidator ID="cvReceiptProcessing" runat="server" CssClass="styleMandatoryLabel"
                Enabled="true"></asp:CustomValidator>
            <asp:ValidationSummary ID="vsBilling" runat="server" CssClass="styleMandatoryLabel"
                ValidationGroup="Submit" HeaderText="Correct the following validation(s):" />
            <asp:ValidationSummary ID="vsAddless" runat="server" CssClass="styleMandatoryLabel"
                ValidationGroup="AddLess" HeaderText="Correct the following validation(s):" />
            <asp:ValidationSummary ID="vsAccountDetails" runat="server" CssClass="styleMandatoryLabel"
                ValidationGroup="AccountDetails" HeaderText="Correct the following validation(s):" />
            <asp:ValidationSummary ID="vsAppropriation" runat="server" CssClass="styleMandatoryLabel"
                ValidationGroup="Appropriation" HeaderText="Correct the following validation(s):" />
            <asp:ValidationSummary ID="vsShowMethod" runat="server" CssClass="styleMandatoryLabel"
                ValidationGroup="Show" HeaderText="Correct the following validation(s):" />
            <asp:HiddenField ID="hdvAmount" runat="server" />
            <asp:HiddenField ID="hvfGLPostingCode" runat="server" />
            <asp:HiddenField ID="hvfCashFlowID" runat="server" />
            <asp:HiddenField ID="hvfCustomerID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

        function fnSelectBranch(chkSelectBranch, chkSelectAllBranch) {

            var gvBranchWise = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_gvShowInstallment');
            var TargetChildControl = chkSelectAllBranch;
            var selectall = 0;
            var Inputs = gvBranchWise.getElementsByTagName("input");
            if (!chkSelectBranch.checked) {
                chkSelectAllBranch.checked = false;
            }
            else {
                for (var n = 0; n < Inputs.length; ++n) {
                    if (Inputs[n].type == 'checkbox') {
                        if (Inputs[n].checked) {
                            selectall = selectall + 1;
                        }
                    }
                }
                if (selectall == gvBranchWise.rows.length - 1) {
                    chkSelectAllBranch.checked = true;
                }
            }


        }
        function fnSelectAll(chkSelectAllBranch, chkSelectBranch) {
            var gvBranchWise = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_gvShowInstallment');
            var TargetChildControl = chkSelectBranch;
            //Get all the control of the type INPUT in the base control.
            var Inputs = gvBranchWise.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                Inputs[n].checked = chkSelectAllBranch.checked;
        }

        function NumericCheck(evt) {

            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);

            var regex = new RegExp("[0-9\r]", "g");


            if (key.match(regex) == null) {


                window.event.keyCode = 0
                return false;
            }

        }

        function AlphaNumericCheck(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);

            var regex = new RegExp("[0-9a-zA-Z\r]", "g");


            if (key.match(regex) == null) {


                window.event.keyCode = 0
                return false;
            }
        }

        function MaskMoney(evt) {
            alert(evt);
            alert(evt.keyCode);
            if (!(evt.keyCode == 46) || (evt.keyCode >= 48 && evt.keyCode <= 57)) return false;
            alert(evt.keyCode);
            var parts = evt.srcElement.value.split('.');
            if (parts.length > 2) return false;
            if (evt.keyCode == 46) return (parts.length == 1);
            if (parts[0].length >= 14) return false;
            if (parts.length == 2 && parts[1].length >= 2) return false;
        }


        function validate(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /[0-9]|\.{0,3}/;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
            }
        }





        function DisableControls() {
            alert("vijay");
            var ddlPaymentMode = document.getElementById('<%=ddlPaymentMode.ClientID%>');
            var ddlDraweeBank = document.getElementById('<%=ddlDraweeBank.ClientID%>');
            var txtInstrumentDate = document.getElementById('<%=txtInstrumentDate.ClientID%>');
            var txtInstrumentNo = document.getElementById('<%=txtInstrumentNo.ClientID%>');
            var txtLocation = document.getElementById('<%=txtLocation.ClientID%>');
            var imgInstrumentDate = document.getElementById('<%=imgInstrumentDate.ClientID%>');


            if (ddlPaymentMode.options[ddlPaymentMode.selectedIndex].text == "Cash") {
                ddlDraweeBank.disabled = true;
                txtInstrumentDate.disabled = true;
                txtInstrumentNo.disabled = true;
                txtLocation.disabled = true;
                imgInstrumentDate.disable = true;
                document.getElementById('<%=ddlDraweeBank.ClientID%>').options.selectedIndex = 0;
            }
            else {
                ddlDraweeBank.disabled = false;
                txtInstrumentDate.disabled = false;
                txtInstrumentNo.disabled = false;
                imgInstrumentDate.disable = false;
                txtLocation.disabled = false;
                //document.getElementById('<%=ddlDraweeBank.ClientID%>').options.selectedIndex=0;
            }

        }

        function checkDate_DocDate(sender, args) {

            var varDocDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtDocDate').value;
            var selectedDate = sender._selectedDate;
            var millsecondsdiff = Math.abs(Date.parseInvariant(varDocDate, sender._format) - sender._selectedDate);
            var millisecondsPerDay = 1000 * 60 * 60 * 24;
            var days = Math.floor(millsecondsdiff / millisecondsPerDay);
            var varGapDays = "<%=strValueDateGapDays%>";
            if (days > varGapDays) {
                var varAlert = "Gap Days between Doc Date and Value Date should be within " + varGapDays + " days";
                document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtValueDate').value = "";
                alert(varAlert);
                return;
            }

        }


        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_btnLoadCustomer').click();
        }

        //new function to validate gap days on  - ONBLUR and editable textbox date field.
        function checkDate_DocDateOnBlur(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation) {
            fnDoDate(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation);
            //debugger;
            var varDocDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtDocDate').value;
            var varValueDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtValueDate').value;

            if (varValueDate !== "") {
                //var selectedDate = sender._selectedDate;
                var millsecondsdiff = Math.abs(Date.parseInvariant(varDocDate, eFormat) - Date.parseInvariant(varValueDate, eFormat));
                var millisecondsPerDay = 1000 * 60 * 60 * 24;
                var days = Math.floor(millsecondsdiff / millisecondsPerDay);
                var varGapDays = "<%=strValueDateGapDays%>";
                if (days > varGapDays) {
                    var varAlert = "Gap Days between Doc Date and Value Date should be " + varGapDays + " days";
                    document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtValueDate').value = "";
                    alert(varAlert);
                    return;
                }
            }
        }

        function checkDate_InstrumentDate(sender, args) {
            //debugger;
            var varDocDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabControlDataSheet_txtInstrumentDate').value;
            var selectedDate = sender._selectedDate;
            var millsecondsdiff = sender._selectedDate - new Date();
            var millisecondsPerDay = 1000 * 60 * 60 * 24;
            var days = Math.floor(millsecondsdiff / millisecondsPerDay);
            var varGapDays = "<%=strInstrumentDateGapDays%>";
            if (days < -varGapDays) {
                var varAlert = "Instrument Date should be less than or equal to " + varGapDays + " days";
                document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabControlDataSheet_txtInstrumentDate').value = (new Date()).format(sender._format);
                alert(varAlert);
                return;
            }
        }

        function checkDate_InstrumentDate_OnBlur(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation) {

            fnDoDate(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation);

            //debugger;
            var varInstrumentDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabControlDataSheet_txtInstrumentDate').value;
            var millsecondsdiff = Date.parseInvariant(varInstrumentDate, eFormat) - new Date();
            var millisecondsPerDay = 1000 * 60 * 60 * 24;
            var days = Math.floor(millsecondsdiff / millisecondsPerDay);
            var varGapDays = "<%=strInstrumentDateGapDays%>";
            if (varInstrumentDate !== "") {
                if (days < -varGapDays) {
                    var varAlert = "Instrument Date should be less than or equal to " + varGapDays + " days";
                    document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabControlDataSheet_txtInstrumentDate').value = (new Date()).format(eFormat);
                    alert(varAlert);
                    return;
                }
            }
        }
       

    </script>

</asp:Content>
