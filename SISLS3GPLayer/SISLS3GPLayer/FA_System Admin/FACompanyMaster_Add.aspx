<%@ Page Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="FACompanyMaster_Add.aspx.cs" Inherits="Sysadm_FACompanyMaster_Add"
    Title="Untitled Page" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Company Currency Master" ID="lblHeading" CssClass="styleInfoLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td>
                                    <cc1:TabContainer ID="TCCompanyDtls" runat="server" CssClass="styleTabPanel" Width="100%"
                                        ScrollBars="None">
                                        <cc1:TabPanel runat="server" ID="TPCompanyDtls" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                Company Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanelCompanyDtls" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr width="100%">
                                                                <td class="styleFieldLabel" style="width: 25%">
                                                                    <asp:Label runat="server" Text="Company Code" ID="lblCompanyCode" CssClass="styleReqFieldLabel"
                                                                        ToolTip="Company Code"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left" style="width: 25%">
                                                                    <asp:TextBox ID="txtCompanyCode" runat="server" MaxLength="3" Width="45%"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator Display="None" ID="RFVtxtCompanyCode" CssClass="styleMandatoryLabel"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtCompanyCode"
                                                                        ErrorMessage="Enter Company Code"></asp:RequiredFieldValidator>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtCompanyCode" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtCompanyCode" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                                <td class="styleFieldLabel" style="width: 25%">
                                                                    <asp:Label runat="server" Text="Company Name" ID="lblCompanyName" CssClass="styleReqFieldLabel">
                                                                    </asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left" style="width: 25%">
                                                                    <asp:TextBox ID="txtCompanyName" runat="server" MaxLength="60"  onblur="FunTrimwhitespace(this,'Company Name');"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator Display="None" ID="RFVtxtCompanyName" CssClass="styleMandatoryLabel"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtCompanyName"
                                                                        ErrorMessage="Enter Company Name"></asp:RequiredFieldValidator>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtCompanyName" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtCompanyName" ValidChars=" " runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                            </tr>
                                                            <tr width="100%">
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" Text="Group Company Code" ID="lblGroupCode" CssClass="styleDisplayLabel"
                                                                        ToolTip="Group Company Code"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtGroupCompanyCode" runat="server" MaxLength="3"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtGroupCompanyCode" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtGroupCompanyCode" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" Text="Group Company Name" ID="lblGroupName" CssClass="styleDisplayLabel">
                                                                    </asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtGroupCompanyName" runat="server" MaxLength="60" onblur="FunTrimwhitespace(this,'Group Company Name');"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtGroupCompanyName" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtGroupCompanyName" ValidChars=" " runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                            </tr>
                                                            <tr width="100%">
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" Text="Company PAN/TAX Number" ID="lblPANTAXNumber" CssClass="styleReqFieldLabel"
                                                                        ToolTip="Company PAN/TAX Number"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtPANTAXNumber" runat="server" ToolTip="Company PAN/TAX Number"
                                                                        MaxLength="16"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator Display="None" ID="RFVtxtPANTAXNumber" CssClass="styleMandatoryLabel"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtPANTAXNumber"
                                                                        ErrorMessage="Enter Company PAN/TAX Number"></asp:RequiredFieldValidator>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtPANTAXNumber" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtPANTAXNumber" ValidChars=" /\" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <%-- <asp:RegularExpressionValidator ID="REVtxtPANTAXNumber" runat="server" Display="None"
                                                                        ErrorMessage="Enter a valid Company PAN/TAX Number" ControlToValidate="txtPANTAXNumber"
                                                                        ValidationExpression="^[a-zA-Z_0-9](\w|\W)*"></asp:RegularExpressionValidator>--%>
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" Text="TIN Number" ID="lblTINNumber" CssClass="styleReqFieldLabel">
                                                                    </asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtTINNumber" runat="server" MaxLength="16"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator Display="None" ID="RFVtxtTINNumber" CssClass="styleMandatoryLabel"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtTINNumber"
                                                                        ErrorMessage="Enter TIN Number"></asp:RequiredFieldValidator>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtTINNumber" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtTINNumber" ValidChars=" /\" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                            </tr>
                                                            <tr width="100%">
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" Text="Company Incorporation Date" ID="lblIncorporationDate"
                                                                        CssClass="styleReqFieldLabel" ToolTip="Company Incorporation Date"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtIncorporationDate" runat="server" Width="50%" ToolTip="Company Incorporation Date"></asp:TextBox>
                                                                    <asp:Image ID="imgCalIncorpDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtIncorporationDate"
                                                                        PopupButtonID="imgCalIncorpDate" ID="CalendarExtender1" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator Display="None" ID="RFVtxtIncorporationDate" CssClass="styleMandatoryLabel"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtIncorporationDate"
                                                                        ErrorMessage="Enter Company Incorporation Date"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" Text="Financial Year" ID="lblFinancialYear" CssClass="styleDisplayLabel">
                                                                    </asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtFinancialYear" runat="server" MaxLength="14" ReadOnly="true"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="REVtxtFinancialYear" runat="server" Display="None"
                                                                        ValidationGroup="Save" ErrorMessage="Enter a valid FinancialYear(YYYYMM-YYYYMM)"
                                                                        ControlToValidate="txtFinancialYear" ValidationExpression="^([0-9]){6}([-]){1}([0-9]){6}$"></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr width="100%">
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" Text="Contact Person Name" ID="lblContactPersonName" CssClass="styleDisplayLabel"
                                                                        ToolTip="Contact Person Name"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtContactPersonName" onblur="FunTrimwhitespace(this,'Contact Person Name');"
                                                                        MaxLength="20" runat="server" ToolTip="Contact Person Name"></asp:TextBox>
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" Text="Contact Person Designation" ID="lblContactPersonDesignation"
                                                                        CssClass="styleDisplayLabel">
                                                                    </asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtContactPersonDesignation" onblur="FunTrimwhitespace(this,'Contact Person Designation');"
                                                                        MaxLength="20" runat="server" ToolTip="Contact Person Designation"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr width="100%">
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="System Admin User Name" Text="System Admin User Name"
                                                                        ID="lblSysUserName" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtSysUserName" ToolTip="User Name" CssClass="styleTextUpperCase"
                                                                        runat="server" MaxLength="6"></asp:TextBox>
                                                                    <asp:Panel ID="PopupTool_UserCode" runat="server" BorderWidth="1" CssClass="styleRecordCount"
                                                                        Width="40%">
                                                                        <asp:Label ID="lblTooltip" runat="server" Text="User Name Must begin with an alphabet and length should be minimum of 4 characters and maximum of 6 characters" />
                                                                    </asp:Panel>
                                                                    <cc1:HoverMenuExtender ID="HoverMenuExtender1" TargetControlID="txtSysUserName" runat="server"
                                                                        PopupControlID="PopupTool_UserCode" PopupPosition="Right" PopDelay="50" />
                                                                    <asp:RegularExpressionValidator ValidationGroup="Save" ID="revUserCode" runat="server"
                                                                        Display="None" ErrorMessage="User Name must begin with an alphabet and length should be minimum of 4 characters"
                                                                        ControlToValidate="txtSysUserName" ValidationExpression="^[A-Za-z](\w){3,5}"></asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator Display="None" ID="RFVtxtSysUserName" CssClass="styleMandatoryLabel"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtSysUserName"
                                                                        ErrorMessage="Enter System Admin User Name"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="System Admin Password" Text="System Admin Password"
                                                                        ID="lblSysPassword" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtSysPassword" ToolTip="System Admin Password" runat="server" TextMode="Password"
                                                                        onCopy="return false" onDrag="return false" onDrop="return false" onPaste="return false" autocomplete="off"
                                                                        MaxLength="6"></asp:TextBox>
                                                                    <asp:Panel ID="PopupTool_SysPassword" runat="server" BorderWidth="1" CssClass="styleRecordCount"
                                                                        Width="45%">
                                                                        <asp:Label ID="lblTooltip1" runat="server" Text="Password must be of 6 characters, it should contain atleast 3 of the following one lower case, one upper case, one number,one special character." />
                                                                    </asp:Panel>
                                                                    <cc1:HoverMenuExtender ID="HoverMenuExtender2" TargetControlID="txtSysPassword" runat="server"
                                                                        PopupControlID="PopupTool_SysPassword" PopupPosition="Left" PopDelay="50" />
                                                                    <asp:RequiredFieldValidator Display="None" ID="RFVtxtSysPassword" CssClass="styleMandatoryLabel"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtSysPassword"
                                                                        ErrorMessage="Enter System Admin Password"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr width="100%">
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" ID="TabPanel3" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                Address Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanelAddressDtls" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr style="width: 100%">
                                                                <td align="left" class="styleFieldLabel" valign="middle" style="width: 25%">
                                                                    <asp:Label runat="server" ToolTip="Head Office Address" Text="Head Office Address"
                                                                        ID="lblHeadOfficeAddress" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtHeadOfficeAddress" TextMode="MultiLine" Rows="3" ToolTip="Head Office Address"
                                                                        runat="server" Width="50%" MaxLength="120" onkeyup="maxlengthfortxt(120)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr style="width: 100%">
                                                                <td align="left" class="styleFieldLabel" valign="middle" style="width: 25%">
                                                                    <asp:Label runat="server" ToolTip="Head Office Phone Number" Text="Head Office Phone Number"
                                                                        ID="lblPhoneNumber" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtHeadOfficePhoneNumber" Width="50%" ToolTip="Head Office Phone Number"
                                                                        runat="server" MaxLength="14"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtHeadOfficePhoneNumber" FilterType="Numbers"
                                                                        TargetControlID="txtHeadOfficePhoneNumber" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                            </tr>
                                                            <tr style="width: 100%">
                                                                <td align="left" class="styleFieldLabel" valign="middle" style="width: 25%">
                                                                    <asp:Label runat="server" ToolTip="Head Office Email ID" Text="Head Office Email ID"
                                                                        ID="lblEmailID" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtHeadOfficeEmailID" Width="50%" ToolTip="Head Office Email ID"
                                                                        runat="server" MaxLength="40"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtHeadOfficeEmailID" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtHeadOfficeEmailID" ValidChars="@_." runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtHeadOfficeEmailID"
                                                                        ValidationGroup="Save" Display="None" ErrorMessage="Enter a valid Head Office Email ID"
                                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="Communication Address" Text="Communication Address"
                                                                        ID="lblCommAddress" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtCommAddress" TextMode="MultiLine" Rows="3" ToolTip="Communication Address"
                                                                        runat="server" MaxLength="120" Width="50%" onkeyup="maxlengthfortxt(120)"></asp:TextBox>
                                                                    <asp:CheckBox ID="chkCommAddress" runat="server" CssClass="styleDisplayLabel" AutoPostBack="true"
                                                                        OnCheckedChanged="chkCommAddress_CheckedChanged" Text="Same As Above" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="Communication Phone Number" Text="Communication Phone Number"
                                                                        ID="lblCommPhoneNumber" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtCommPhoneNumber" Width="50%" ToolTip="Head Office Phone Number"
                                                                        runat="server" MaxLength="14"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtCommPhoneNumber" FilterType="Numbers" TargetControlID="txtCommPhoneNumber"
                                                                        runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="Communication Email ID" Text="Communication Email ID"
                                                                        ID="lblCommEmailID" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtCommEmailID" MaxLength="40" Width="50%" ToolTip="Communication Email ID"
                                                                        runat="server"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtCommEmailID" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtCommEmailID" ValidChars="@_." runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCommEmailID"
                                                                        ValidationGroup="Save" Display="None" ErrorMessage="Enter a valid Communication Email ID"
                                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="Contact Address" Text="Contact Address" ID="lblContactAddress"
                                                                        CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtContactAddress" TextMode="MultiLine" Rows="3" ToolTip="Contact Address"
                                                                        runat="server" Width="50%" MaxLength="120" onkeyup="maxlengthfortxt(120)"></asp:TextBox>
                                                                    <asp:CheckBox ID="chkContactAddress" runat="server" AutoPostBack="true" OnCheckedChanged="chkContactAddress_CheckedChanged"
                                                                        Text="Same As Above" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="Contact Phone Number" Text="Contact Phone Number"
                                                                        ID="lblContactPhoneNumber" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtContactPhoneNumber" Width="50%" ToolTip="Contact Phone Number"
                                                                        runat="server" MaxLength="14"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtContactPhoneNumber" FilterType="Numbers" TargetControlID="txtContactPhoneNumber"
                                                                        runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="Contact Mobile Number" Text="Contact Mobile Number"
                                                                        ID="lblMobileNumber" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtMobileNumber" Width="50%" ToolTip="Mobile Number" runat="server"
                                                                        MaxLength="14"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEMobileNumber" FilterType="Numbers" TargetControlID="txtMobileNumber"
                                                                        runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" class="styleFieldLabel" valign="middle">
                                                                    <asp:Label runat="server" ToolTip="Contact Email ID" Text="Contact Email ID" ID="lblContactEmailID"
                                                                        CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:TextBox ID="txtContactEmailID" MaxLength="40" ToolTip="Contact Email ID" Width="50%"
                                                                        runat="server"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtContactEmailID" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtContactEmailID" ValidChars="@_." runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtContactEmailID"
                                                                        ValidationGroup="Save" Display="None" ErrorMessage="Enter a valid Contact Email ID"
                                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                
                                                                    
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" ID="TabPanel1" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                Currency Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanelCurrencyDtls" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" style="width: 100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Panel ID="PnlCurrencyDtls" runat="server" Width="75%" GroupingText="Currency Details"
                                                                        CssClass="stylePanel">
                                                                        <div runat="server" id="divCurrencyDtls" class="container" style="height: 150px;
                                                                            overflow-x: hidden; overflow-y: scroll; text-align: center;">
                                                                            <asp:GridView ID="grvCurrencyDtls" runat="server" AutoGenerateColumns="False" Width="98%"
                                                                                OnRowDataBound="grvCurrencyDtls_RowDataBound">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Currency Name" ItemStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblCurrencyName" Text='<%# Eval("Currency_Name")%>' runat="server"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Currency ID" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblCurrencyID" Text='<%# Eval("Currency_ID")%>' runat="server" Visible="false"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Applicable Currency">
                                                                                        <ItemTemplate>
                                                                                            <%--Modified By Chandrasekar K On 01-09-2012--%>
                                                                                            <%--<asp:CheckBox ID="chkCompanyCurrency" AutoPostBack="true" OnCheckedChanged="chkCompanyCurrency_OnCheckedChanged "
                                                                                                Checked='<%# Bind("Is_CompanyCurrency") %>' runat="server" />--%>
                                                                                            <asp:CheckBox ID="chkCompanyCurrency" AutoPostBack="true" OnCheckedChanged="chkCompanyCurrency_OnCheckedChanged "
                                                                                                Checked='<%#DataBinder.Eval(Container.DataItem, "Is_CompanyCurrency").ToString().ToUpper() == "TRUE"%>'
                                                                                                runat="server" />
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Default Currency">
                                                                                        <ItemTemplate>
                                                                                            <%--Modified By Chandrasekar K On 01-09-2012--%>
                                                                                            <%--<asp:CheckBox ID="chkCompanydefaultCurrency" Checked='<%# Bind("Default_Currency") %>'
                                                                                                AutoPostBack="true" OnCheckedChanged="chkCompanydefaultCurrency_OnCheckedChanged"
                                                                                                runat="server" />--%>
                                                                                            <asp:CheckBox ID="chkCompanydefaultCurrency" Checked='<%#DataBinder.Eval(Container.DataItem, "Default_Currency").ToString().ToUpper() == "TRUE"%>'
                                                                                                AutoPostBack="true" OnCheckedChanged="chkCompanydefaultCurrency_OnCheckedChanged"
                                                                                                runat="server" />
                                                                                            <asp:Label ID="lbldefaultCurrencyID" Text='<%# Eval("Default_Currency_ID")%>' runat="server"
                                                                                                Visible="false"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Panel ID="PnlLocationCurrency" runat="server" Width="75%" GroupingText="Location Currency Details"
                                                                        CssClass="stylePanel">
                                                                        <%--<div runat="server" id="divLocationCurrency" class="container" style="height: 150px; overflow-x: hidden;
                                                                            overflow-y: scroll; text-align: center;">--%>
                                                                        <asp:GridView ID="grvLocationCurrency" runat="server" AutoGenerateColumns="false"
                                                                            Width="98%" ShowFooter="true" OnRowCommand="grvLocationCurrency_OnRowCommand"
                                                                            OnRowDeleting="grvLocationCurrency_OnRowDeleting">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Location ID" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblLocationID" Text='<%# Eval("Location_ID")%>' runat="server" Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Location Name" ItemStyle-HorizontalAlign="Left">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblLocationName" Text='<%# Eval("Location_Name")%>' runat="server"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:DropDownList ID="ddlLocation" runat="server" />
                                                                                        <asp:RequiredFieldValidator Display="None" ID="RFVddlLocation" CssClass="styleMandatoryLabel"
                                                                                            SetFocusOnError="True" ValidationGroup="btnAdd" runat="server" ControlToValidate="ddlLocation"
                                                                                            InitialValue="0" ErrorMessage="Select Location"></asp:RequiredFieldValidator>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Currency ID" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lbldefaultCurrencyID" Text='<%# Eval("Currency_ID")%>' runat="server"
                                                                                            Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Default Currency Name" ItemStyle-HorizontalAlign="Left">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lbldefaultCurrency" Text='<%# Eval("Currency_Name")%>' runat="server"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:DropDownList ID="ddldefaultCurrency" runat="server" />
                                                                                        <asp:RequiredFieldValidator Display="None" ID="RFVddldefaultCurrency" CssClass="styleMandatoryLabel"
                                                                                            SetFocusOnError="True" ValidationGroup="btnAdd" runat="server" ControlToValidate="ddldefaultCurrency"
                                                                                            InitialValue="0" ErrorMessage="Select Currency in Location Currency"></asp:RequiredFieldValidator>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Edit">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                                            OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:LinkButton ID="btnAdd" runat="server" CommandName="Add" CssClass="styleSubmitButton"
                                                                                            Text="Add" ValidationGroup="btnAdd"></asp:LinkButton>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                        <%--</div>--%>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="styleSubmitButton"
                            OnClick="btnSave_Click" OnClientClick="return fnCheckPageValidators('Save',false)"
                            ValidationGroup="Save" AccessKey="S" ToolTip="Alt+S" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear_FA" CssClass="styleSubmitButton"
                            OnClick="btnClear_Click" CausesValidation="False" OnClientClick="return fnConfirmClear();" AccessKey="L" ToolTip="Alt+L" />
                        <asp:Button ID="btnCancel" runat="server" Text="Exit" CssClass="styleSubmitButton"
                            OnClick="btnCancel_Click" AccessKey="X" ToolTip="Alt+X" />
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td colspan="3">
                        <asp:CustomValidator ID="CVCompanyMaster" runat="server" Display="None" ValidationGroup="btnSave"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary runat="server" ID="VSCompanyMaster" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="Save" ShowSummary="true" />
                        <asp:ValidationSummary runat="server" ID="VSCompanyMastergrid" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnAdd"
                            ShowSummary="true" />
                    </td>
                </tr>
            </table>
        
    <script type="text/javascript" language="javascript">
        function FunShowToolTipMsg(input) {
            Tip();
        }
    
    </script>

</asp:Content>
