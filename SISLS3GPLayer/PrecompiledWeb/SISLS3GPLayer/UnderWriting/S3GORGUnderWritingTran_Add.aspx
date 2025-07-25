<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="UnderWriting_S3GORGUnderWritingTran_Add, App_Web_sq2fmotj" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function fnOk(hdnalert) {
            document.getElementById(hdnalert).value = "1";
        }
        function fnCancel(hdnalert) {
            document.getElementById(hdnalert).value = "0";
        }

        function fnChkFreeze(ctrl) {
            document.getElementById(ctrl).checked = !document.getElementById(ctrl).checked;
        }
        function calendarShown(sender, args) {
            sender._popupBehavior._element.style.zIndex = 10005;
        }
        function fnAllowRatioOnly(isdecimalAllowed, isNegativeAllowed, txtbox) {

            var sKeyCode = window.event.keyCode;
            if ((sKeyCode < 48 || sKeyCode > 57) && (sKeyCode != 32 && sKeyCode != 95) || (sKeyCode == 58)) {

                if (isdecimalAllowed) {
                    //alert(sKeyCode);
                    if (sKeyCode == 58) {

                        if (txtbox.value.indexOf(':') > -1) {
                            window.event.keyCode = 0;
                            return false;
                        }
                        else {
                            if (txtbox.value.length == 0 && sKeyCode == 58) {
                                window.event.keyCode = 0;
                                return false;
                            }
                            else
                                return true;
                        }
                    }
                }
                if (isNegativeAllowed) {
                    if (sKeyCode == 45) {

                        if (txtbox.value.indexOf('-') > -1) {
                            window.event.keyCode = 0;
                            return false;
                        }
                        else {
                            return true;
                        }
                    }
                }
                window.event.keyCode = 0;
                return false;
            }
            if (txtbox.value.length > txtbox.maxlength) {
                window.event.keyCode = 0;
                return false;
            }
        }

        function funpastyearstart() {
            var da = new Date();
            //alert(da.getFullYear()+'-'+da.getMonth());
            var currentmonth = da.getMonth();
            var currentyear = da.getFullYear();
            //  alert(currentmonth+'-'+currentyear);
            if (currentmonth < 4) {
                currentyear = currentyear - 1;
            }
            if (document.getElementById('<%=txtPastYears.ClientID %>').value > 0) {
                if (document.getElementById('<%=txtPastYearStartFrom.ClientID %>').value > 0) {
                    var temp = currentyear - document.getElementById('<%=txtPastYears.ClientID %>').value;
                    document.getElementById('<%=txtPastYearStartFrom.ClientID %>').value = temp;
                }
                else {
                    document.getElementById('<%=txtPastYearStartFrom.ClientID %>').value = currentyear;
                }
            }
            else {
                document.getElementById('<%=txtPastYearStartFrom.ClientID %>').value = currentyear;
            }
            // alert(document.getElementById('<%=txtPastYears.ClientID %>').value+'--'+ document.getElementById('<%=txtPastYearStartFrom.ClientID %>').value);
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="stylePageHeading" cellpadding="0" cellspacing="0" border="0">
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
                        <cc1:TabContainer ID="TabContainerCGT" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                            Width="99%" ScrollBars="Auto">
                            <cc1:TabPanel runat="server" ID="TabCreditGuideQuery" CssClass="tabpan" Width="98%"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Transaction Type
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div id="dvSearch" runat="server">
                                                <asp:Panel ID="pnlSearchInfo" runat="server" GroupingText="Search" CssClass="stylePanel">
                                                    <table cellpadding="0" width="98%" cellspacing="0">
                                                        <tr>
                                                            <td>&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <asp:Label ID="lblDocumentType" runat="server" CssClass="styleDisplayLabel" Text="Transaction Type"> </asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;                                                       
                                                        <asp:DropDownList ID="ddlDocumentType" runat="server" ToolTip="Document Type" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlDocumentType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="grvPaging" runat="server" AutoGenerateColumns="False" Width="98%"
                                                                    OnRowDataBound="grvPaging_RowDataBound" Visible="false">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Line Of Business">
                                                                            <HeaderTemplate>
                                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                                    <tr align="center">
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkbtnSort4" runat="server" Text="Line of Business" ToolTip="Sort By LOB_Name"
                                                                                                CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                            <asp:ImageButton ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr align="left">
                                                                                        <td>
                                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" runat="server" AutoPostBack="true"
                                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLobName" runat="server" Text='<%# Bind("LineofBusiness") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Constitution">
                                                                            <HeaderTemplate>
                                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                                    <tr align="center">
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkbtnSort6" runat="server" Text="Constitution" ToolTip="Sort By LOB_Name"
                                                                                                CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                            <asp:ImageButton ID="imgbtnSort6" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr align="left">
                                                                                        <td>
                                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch6" runat="server" AutoPostBack="true"
                                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblConstitutionName" runat="server" Text='<%# Bind("Constitution") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Product">
                                                                            <HeaderTemplate>
                                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                                    <tr align="center">
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkbtnSort5" runat="server" Text="Product" ToolTip="Sort By LOB_Name"
                                                                                                CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                            <asp:ImageButton ID="imgbtnSort5" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr align="left">
                                                                                        <td>
                                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch5" runat="server" AutoPostBack="true"
                                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblProdName" runat="server" Text='<%# Bind("Product") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Document No">
                                                                            <HeaderTemplate>
                                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                                    <tr align="center">
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Document No" ToolTip="Sort By Document_No"
                                                                                                CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                            <asp:ImageButton ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr align="left">
                                                                                        <td>
                                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true"
                                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEnquiryno" runat="server" Text='<%# Bind("Doc_Number") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Customer">
                                                                            <HeaderTemplate>
                                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                                    <tr align="center">
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Customer" ToolTip="Sort By Customer"
                                                                                                CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                            <asp:ImageButton ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr align="left">
                                                                                        <td>
                                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCustomerCode" runat="server" Text='<%# Bind("Customer_Code") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Customer Name">
                                                                            <HeaderTemplate>
                                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                                    <tr align="center">
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Customer Name" ToolTip="Sort By Customer_Name"
                                                                                                CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                            <asp:ImageButton ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr align="left">
                                                                                        <td>
                                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true"
                                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCustomerName" runat="server" Text='<%# Bind("Customer_Name") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                         <asp:TemplateField HeaderText="Enquiry No">
                                                                            <HeaderTemplate>
                                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                                    <tr align="center">
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkbtnEnqiry" runat="server" Text="Enqiry No" ToolTip="Sort By Document_No"
                                                                                                CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                            <asp:ImageButton ID="imgbtnEnqiry" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr align="left">
                                                                                        <td>
                                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearchEnquiry" runat="server" AutoPostBack="true"
                                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEnquirynumber" runat="server" Text='<%# Bind("Enquiry_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkselect" runat="server" AutoPostBack="true" OnCheckedChanged="chkselect_OnCheckedChanged" />
                                                                                <asp:Label ID="lblEnqCusAppID" Text='<%# Bind("Enq_Cus_App_ID")%>' Visible="false"
                                                                                    runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                <uc1:PageNavigator ID="ucCustomPaging" runat="server" Visible="false" />

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-top: 5px;" align="center">
                                                                <asp:Button ID="btnCancelView" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                                                                    OnClick="btnCancel_Click" Text="Cancel" />
                                                                <asp:Button ID="btnBranchShowAll" runat="server" Text="Show All" CssClass="styleSubmitButton"
                                                                    OnClick="btnBranchShowAll_Click" Visible="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center">
                                                                <span id="lblErrorMessage" runat="server" style="color: Red; font-size: medium"></span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </div>
                                            <div id="dvTranInfo" visible="false" runat="server">
                                                <table width="100%" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="50%" valign="top">
                                                            <asp:Panel ID="pnlCustomerInformation" GroupingText="Customer Information" runat="server"
                                                                CssClass="stylePanel">
                                                                <table width="100%" align="center">
                                                                    <tr>
                                                                        <td width="100%">
                                                                            <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" FirstColumnStyle="styleFieldLabel" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                        <td width="50%" valign="top">
                                                            <asp:Panel ID="pnlEnquiryDetails" GroupingText="Enquiry Details" runat="server" CssClass="stylePanel">
                                                                <table width="98%" align="center">
                                                                    <tr>
                                                                        <td class="styleFieldLabel" width="35%">
                                                                            <asp:Label runat="server" Text="Line of Business" ID="Label2" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign" width="65%">
                                                                            <asp:TextBox ID="txtlob" runat="server" ReadOnly="True" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label runat="server" Text="Product" ID="Lblproduct" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtproduct" runat="server" ReadOnly="True" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="Label3" runat="server" CssClass="styleDisplayLabel" Text="Constitution"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtConstitution" runat="server" ReadOnly="True" Style="margin-left: 2px" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblTransType" runat="server" CssClass="styleDisplayLabel" Text="Transaction Type"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtTransType" runat="server" ReadOnly="True" Style="margin-left: 2px" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label runat="server" Text="Transaction Ref No." ID="lblEnqNo" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtEnquiryNo" runat="server" ReadOnly="True"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label runat="server" Text="Under Writing Ref No." ID="lblUWTrans" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtUWTransRefNo" runat="server" Visible="false" ReadOnly="True"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label runat="server" Text="Under Writing Ref Date." ID="lblUWDate" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtUWTransRefDate" runat="server" Visible="false" ReadOnly="True"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" class="styleFieldLabel">
                                                                            <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitShortButton" CausesValidation="true"
                                                                                Text="Go" OnClick="btnGo_Click" />
                                                                            <asp:Button ID="btnClearValue" runat="server" CssClass="styleSubmitShortButton" CausesValidation="true"
                                                                                Text="Clear" OnClick="btnClearValue_Click" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabCreditGuideTransaction" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Under Writing Transaction
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="Updatepanel5" runat="server">
                                        <ContentTemplate>

                                            <table width="100%">
                                                <tr>
                                                    <td width="50%"></td>
                                                    <td width="50%">
                                                        <asp:Panel ID="pnlCreditGuideDetails" GroupingText="Credit Guide Details" runat="server"
                                                            CssClass="stylePanel" Visible="false">
                                                            <table width="100%" align="center">
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <asp:Label ID="lblPastYears" runat="server" CssClass="styleDisplayLabel" Text="Past Years"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtPastYears" runat="server" MaxLength="1" onfocusOut="funpastyearstart();"
                                                                            AutoPostBack="false" Style="margin-left: 0px; text-align: right;" Width="30PX"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderN" runat="server" TargetControlID="txtPastYears"
                                                                            FilterType="Numbers,Custom" InvalidChars="0" Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <asp:RangeValidator ID="RangeValidator2" CssClass="styleMandatoryLabel" ControlToValidate="txtPastYears"
                                                                            MinimumValue="0" MaximumValue="3" Type="Double" runat="server" Display="None"
                                                                            ErrorMessage="Past Year(s) should not be greater than 3 years"></asp:RangeValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <asp:Label ID="lblPastYearStartFrom0" runat="server" CssClass="styleDisplayLabel"
                                                                            Text="Past Year Starting From"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtPastYearStartFrom" runat="server" Enabled="false" Style="text-align: right;"
                                                                            Width="50PX"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtPastYearStartFrom"
                                                                            FilterType="Numbers" Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <asp:Label ID="lblFutureYears" runat="server" CssClass="styleDisplayLabel" Text="Future Years"></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtFutureYears" runat="server" MaxLength="1" Style="text-align: right;"
                                                                            Width="30PX">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtFutureYears"
                                                                            FilterType="Numbers" Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <asp:RangeValidator ID="RangeValidator1" CssClass="styleMandatoryLabel" ControlToValidate="txtFutureYears"
                                                                            MinimumValue="0" MaximumValue="3" Type="Double" runat="server" Display="None"
                                                                            ErrorMessage="Future Year(s) should not be greater than 3 years"></asp:RangeValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <asp:Label ID="lblYear" runat="server" Text="Year Value" Visible="false">
                                                                        </asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Year_SelectedIndexChanged"
                                                                            Visible="false">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 82px;"></td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="100%" align="center">
                                                <tr>
                                                    <td width="100%" class="styleContentTable">
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr class="stylePagingControl">
                                                                <td>
                                                                    <asp:RadioButtonList runat="server" ID="rbtYears" RepeatDirection="Horizontal" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="rbtYears_SelectedIndexChanged">
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                                <td align="right">
                                                                    <asp:Label ID="lblTotalScoreReq" runat="server" CssClass="styleDisplayLabel" Visible="false" Text="Total Score Req."> </asp:Label>
                                                                    <asp:TextBox ID="txtTotalScoreReq" runat="server" ReadOnly="true" Visible="false" Style="text-align: right;"
                                                                        Width="80px"></asp:TextBox>
                                                                    &nbsp;&nbsp;
                                                                    <asp:Label ID="lbltotalscore" runat="server" CssClass="styleDisplayLabel" Text="Total Score Actual"> </asp:Label>
                                                                    <asp:TextBox ID="txtTotalScore" runat="server" ReadOnly="true" Style="text-align: right;"
                                                                        Width="80px"></asp:TextBox>&nbsp;
                                                                    <asp:DropDownList runat="server" Width="100px" AutoPostBack="true" ID="ddlFinanceYear"
                                                                        ToolTip="Year" Visible="false">
                                                                    </asp:DropDownList>
                                                                    <asp:Button ID="btnAddYear" CssClass="styleSubmitButton" runat="server" Text="Add Year"
                                                                        ToolTip="Add" Enabled="false" Style="border-width: 0px; width: 78px; height: 22px;"
                                                                        Visible="false" OnClick="btnAddYear_Click"></asp:Button>
                                                                </td>
                                                                <td align="right" valign="top">
                                                                    <asp:Button ID="btnUpdateYear" CssClass="styleSubmitButton" runat="server" Text="Update Groups"
                                                                        ToolTip="Update Groups" Enabled="true" Visible="false" OnClick="btnUpdateYear_Click"></asp:Button>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="100%">
                                                        <cc1:TabContainer ID="tcCreditScore" runat="server" CssClass="styleTabPanel" Width="100%"
                                                            ScrollBars="None" TabStripPlacement="top" ActiveTabIndex="0">
                                                            <cc1:TabPanel ID="tpMainPage" runat="server" CssClass="tabpan" HeaderText="Main Page"
                                                                BackColor="Red" Style="padding: 0px">
                                                                <HeaderTemplate>
                                                                    Under Writing
                                                                </HeaderTemplate>
                                                                <ContentTemplate>
                                                                    <asp:UpdatePanel ID="upMainPage" runat="server">
                                                                        <ContentTemplate>
                                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr class="stylePagingControl">
                                                                                    <td style="width: 4%; font-weight: bold">
                                                                                        <asp:Label ID="lblhdr1" runat="server" Text=""></asp:Label>
                                                                                    </td>
                                                                                    <td style="width: 5%; font-weight: bold">
                                                                                        <asp:Label ID="lblhdr2" runat="server" Text=""></asp:Label></td>
                                                                                    <td style="width: 10%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr3" runat="server" Text="Description"></asp:Label></td>
                                                                                    <td style="width: 10%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr4" runat="server" Text="Items"></asp:Label></td>
                                                                                    <td style="width: 8%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr5" runat="server" Text="Sub Items"></asp:Label></td>
                                                                                    <td style="width: 8%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr6" runat="server" Text="Req Score"></asp:Label></td>
                                                                                    <td style="width: 8%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr7" runat="server" Text="Actual Score"></asp:Label></td>
                                                                                    <td style="width: 10%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr8" runat="server" Text="Hygiene Allow"></asp:Label></td>
                                                                                    <td style="width: 5%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr9" runat="server" Text="Hygiene Actual"></asp:Label></td>
                                                                                    <td style="width: 8%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr10" runat="server" Text="Status"></asp:Label></td>
                                                                                    <td style="width: 15%; font-weight: bold" align="center">
                                                                                        <asp:Label ID="lblhdr11" runat="server" Text="Remarks"></asp:Label></td>
                                                                                </tr>
                                                                            </table>
                                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td width="100%">
                                                                                        <asp:GridView ID="grdGrpName" runat="server" ShowHeader="false" AutoGenerateColumns="False"
                                                                                            OnRowDataBound="grdGrpName_RowDataBound" Width="100%"
                                                                                            DataKeyNames="GroupID">
                                                                                            <Columns>
                                                                                                <asp:TemplateField>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:ImageButton ID="imgShow" runat="server" OnClick="Show_Hide_ChildGrid" ImageUrl="~/images/plus.png"
                                                                                                            CommandArgument="Show" />
                                                                                                        <asp:Label ID="lbl_grpID" Visible="false" runat="server" Text='<%# Bind("GroupID") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="3%" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpcode" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Description">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpname" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Items">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpItems" runat="server" Text='<%# Bind("Item_Count") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Sub Items">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpSubItems" runat="server" Text='<%# Bind("Sub_Item_Count") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="8%" HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Req Score">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpReqScore" runat="server" Text='<%# Bind("Required_Score") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="8%" HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Actual Score">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpActualScore" runat="server" Text='<%# Bind("Grp_Actual_Score") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="8%" HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Hygiene Allow">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpHygeneAllow" runat="server" Text='<%# Bind("Hygene_Allow") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="10%" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Hygiene Actual">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpHygeneActual" runat="server" Text='<%# Bind("Hygene_Actual") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="9%" HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Status">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="9%" HorizontalAlign="Left" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Remarks">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:TextBox ID="txtgrpRemarks" TextMode="MultiLine" Width="180px" runat="server"
                                                                                                            Text='<%# Bind("Remarks") %>' MaxLength="500"></asp:TextBox>
                                                                                                        <asp:RegularExpressionValidator ID="REFVtxtgrpRemarks"
                                                                                                            runat="server" ControlToValidate="txtgrpRemarks"
                                                                                                            ErrorMessage="Please enter maximum 500 charachters."
                                                                                                            SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                                                        </asp:RegularExpressionValidator>
                                                                                                    </ItemTemplate>
                                                                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderStyle-Width="0.001%">
                                                                                                    <ItemTemplate>
                                                                                                        <tr>
                                                                                                            
                                                                                                            <td style="width: 3%"></td>
                                                                                                            <td colspan='100%'>
                                                                                                                <asp:Panel ID="pnlCrScore" runat="server" Visible="false" Width="100%">
                                                                                                                   
                                                                                                                    <asp:GridView runat="server" ShowHeader="false" ShowFooter="false" ID="grvCreditScore"
                                                                                                                        RowStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center" Width="100%"
                                                                                                                        AutoGenerateColumns="False" DataKeyNames="CrScoreParam_ID" OnRowDataBound="grvCreditScore_RowDataBound">
                                                                                                                        <Columns>
                                                                                                                            <asp:TemplateField HeaderText="Line No" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblLineNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                                                                    <asp:Label ID="lblScoreAssigned" runat="server" Text="0" Visible="false"></asp:Label>
                                                                                                                                    <asp:Label ID="lblParam_Year" runat="server" Text='<%# Eval("Year")%>' Visible="false"></asp:Label>
                                                                                                                                    <asp:Label ID="lblCGroupCode" runat="server" Text='<%# Eval("GroupCode")%>' Visible="false"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField Visible="false" HeaderText="S.No">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lbl_Subgrpcode" runat="server" Text='<%# Bind("SubGroupCode") %>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" Width="5%"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Description">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("Desc")%>'></asp:Label>
                                                                                                                                    <asp:Label ID="lblParamID" runat="server" Visible="false" Text='<%#Eval("CrScoreParam_ID")%>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" Width="15%"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Attrib">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblFieldAttName" Text='<%# Bind("FieldAttName")%>' runat="server"></asp:Label>
                                                                                                                                    <asp:Label ID="lblFieldAtt" Text='<%# Bind("FieldAtt")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" Width="8%"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Operator" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblNumericName" Text='<%# Bind("NumericName")%>' runat="server"></asp:Label>
                                                                                                                                    <asp:Label ID="lblNumericAtt" Text='<%# Bind("NumericAtt")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Scan" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:CheckBox ID="chkScan" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsScan")) %>' Enabled="false" ToolTip="Scan Document" />
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Center"   VerticalAlign="Top" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Fe" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:CheckBox ID="chkFormula" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsFormula")) %>' Enabled="false" ToolTip="Formula" />
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Center"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Value From" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblReqValue" runat="server" Text='<%# Bind("ReqValue")%>' ToolTip="Req Param"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Value To" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblReqValueTo" runat="server" Text='<%# Bind("ReqValueTo")%>' ToolTip="Req Param To"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Value">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:TextBox ID="txtActualValue" Width="100px" runat="server"
                                                                                                                                        Text='<%# Bind("Actual_Value")%>' Style="text-align: right"></asp:TextBox>
                                                                                                                                     <asp:Label ID="lblCTR" Width="100px" runat="server" ></asp:Label>
                                                                                                                                    <asp:DropDownList ID="ddlYes" runat="server" Width="80px" ToolTip="Req Param" Visible="false">
                                                                                                                                        <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
                                                                                                                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                                                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                                                                                        <asp:ListItem Text="None" Value="2"></asp:ListItem>
                                                                                                                                    </asp:DropDownList>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top"  Width="8%" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Score">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:TextBox ID="txtActualScore" Width="100px" runat="server"
                                                                                                                                        Text='<%# Bind("Actual_Score")%>' Style="text-align: right" ReadOnly="true" AutoPostBack="true" OnTextChanged="txtActualScore_OnTextChanged"></asp:TextBox>

                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top"  Width="8%" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Score" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblScore" runat="server" Text='<%# Bind("Score")%>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right"   VerticalAlign="Top" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Diff %" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblDiffPer" runat="server" Text='<%# Bind("DiffPer")%>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right"  VerticalAlign="Top" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Diff Mark" Visible="false">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblDiffMark" runat="server" Text='<%# Bind("DiffMark")%>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Source">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblConduitName" Text='<%# Bind("ConduitName")%>' runat="server"></asp:Label>
                                                                                                                                    <asp:Label ID="lblConduit" Text='<%# Bind("Conduit")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" Width="10%"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Scan">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Button ID="btnCrUpload" runat="server" Text="Files" CssClass="styleSubmitShortButton" OnClick="btnCrUpload_Click" />
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Center" Width="9%"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Link">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:ImageButton ID="imgCrShow" runat="server" Width="25px" Height="25px" OnClick="imgCrShow_Onclick" ImageUrl="~/images/plus.png"
                                                                                                                                        CommandArgument="ImgShow" />
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Center" Width="9%"   VerticalAlign="Top" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Remarks">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:TextBox ID="txtRemarks" TextMode="MultiLine" Width="220px"
                                                                                                                                        runat="server" Text='<%# Bind("Remarks")%>' MaxLength="500"></asp:TextBox>
                                                                                                                                    <asp:RegularExpressionValidator ID="REFVtxtRemarks"
                                                                                                                                        runat="server" ControlToValidate="txtRemarks"
                                                                                                                                        ErrorMessage="Please enter maximum 500 charachters."
                                                                                                                                        SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                                                                                    </asp:RegularExpressionValidator>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right" Width="15%"  VerticalAlign="Top"  />
                                                                                                                            </asp:TemplateField>
                                                                                                                        </Columns>
                                                                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                                                                        <RowStyle HorizontalAlign="Center" />
                                                                                                                    </asp:GridView>
                                                                                                                </asp:Panel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td colspan='100%'>
                                                                                                                <table border="0" width="100%" class="stylePagingControl">
                                                                                                                    <tr>
                                                                                                                        <td style="width: 5%;"></td>
                                                                                                                        <td class="styleFieldLabelBold" style="font-weight: bold; width: 37%;" align="right">
                                                                                                                            <asp:Label ID="lblGrpActual" runat="server" Text="Group Score Actual"></asp:Label>
                                                                                                                        </td>
                                                                                                                        <td class="styleFieldAlign" align="right" style="width: 8%;">
                                                                                                                            <asp:TextBox ID="txtGrpActual" runat="server" Style="text-align: right" Width="100px" Text="0" ReadOnly="true"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                        <td class="styleFieldLabelBold">
                                                                                                                            <asp:Label ID="lblGrpScore" runat="server" Visible="false" Text="Group Score Req."></asp:Label>

                                                                                                                        </td>
                                                                                                                        <td class="styleFieldAlign">
                                                                                                                            <asp:TextBox ID="txtGrpScore" runat="server" Style="text-align: right" Visible="false" Width="100px" Text="0" ReadOnly="true"></asp:TextBox>
                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                            </Columns>
                                                                                        </asp:GridView>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td width="100%">
                                                                                        <table width="100%" class="stylePageHeading">
                                                                                            <tr>
                                                                                                <td style="width: 5%;"></td>
                                                                                                <td class="styleFieldLabel" style="font-weight: bold; width: 37%;" align="right">
                                                                                                    <asp:Label runat="server" Text="Actual Total Score" BackColor="White" ID="lblActualtotalscore"
                                                                                                        Font-Bold="true" CssClass="styleGridHeader">
                                                                                                    </asp:Label>

                                                                                                </td>
                                                                                                <td class="styleFieldAlign" align="right" style="width: 8%;">
                                                                                                    <asp:TextBox ID="txtActualTotal" Width="100px" ReadOnly="true" runat="server" ToolTip="Total Score Actual"
                                                                                                        Style="text-align: right"></asp:TextBox>

                                                                                                </td>
                                                                                                <td class="styleFieldLabel">
                                                                                                    <asp:Label runat="server" Text="Required Total Score" BackColor="White" ID="lblReqTotalScore"
                                                                                                        Font-Bold="true" CssClass="styleGridHeader" Visible="false">
                                                                                                    </asp:Label>
                                                                                                </td>
                                                                                                <td class="styleFieldAlign">
                                                                                                    <asp:TextBox ID="txtReqTotalScore" Width="100px" ReadOnly="true" runat="server" ToolTip="Total Score Required"
                                                                                                        Style="text-align: right" Visible="false"></asp:TextBox>
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
                                                            <cc1:TabPanel ID="tpNumber" runat="server" CssClass="tabpan" HeaderText="Main Page"
                                                                BackColor="Red" Style="padding: 0px">
                                                                <HeaderTemplate>
                                                                    ANSI
                                                                </HeaderTemplate>
                                                                <ContentTemplate>
                                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                                        <ContentTemplate>
                                                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td width="100%">
                                                                                        <asp:HiddenField ID="hdnfrActualValue" runat="server" />
                                                                                        <asp:HiddenField ID="hdnfrReqValue" runat="server" />
                                                                                        <asp:GridView ID="GrpFormula" runat="server" AutoGenerateColumns="False"
                                                                                            DataKeyNames="GroupID" Width="25%" ShowFooter="false" BorderStyle="None" GridLines="None" BorderWidth="0px">
                                                                                            <Columns>
                                                                                                <asp:TemplateField HeaderStyle-Width="3%">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:ImageButton ID="imgShowFe" runat="server" OnClick="Show_Hide_GrpFormula" ImageUrl="~/images/plus.png"
                                                                                                            CommandArgument="Show" />
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpfecode" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Group" HeaderStyle-Width="15%">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lbl_grpFename" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderStyle-Width="0.001%">
                                                                                                    <ItemTemplate>
                                                                                                        <tr>
                                                                                                            <td style="width: 3%"></td>
                                                                                                            <td style="width: 5%"></td>
                                                                                                            <td colspan='100%'>
                                                                                                                <asp:Panel ID="pnlCrScoreFe" Width="100%" runat="server" Visible="false">
                                                                                                                    <asp:GridView runat="server" ShowFooter="false" ID="grvNumbers" Width="100%"
                                                                                                                        RowStyle-HorizontalAlign="Center" BorderStyle="None" GridLines="None" BorderWidth="0px"
                                                                                                                        FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False"
                                                                                                                        OnRowDataBound="grvNumbers_RowDataBound">
                                                                                                                        <Columns>
                                                                                                                            <asp:TemplateField HeaderText="Line No">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:Label ID="lblRecordIdE" runat="server" Text='<%#Eval("FeSiNo")%>'></asp:Label>
                                                                                                                                    <asp:Label ID="lblFeGroupCodeE" runat="server" Text='<%# Bind("GroupCode") %>' Visible="false"></asp:Label>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblLineNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                                                                    <asp:Label ID="lblFeGroupCode" runat="server" Text='<%# Eval("GroupCode")%>' Visible="false"></asp:Label>
                                                                                                                                    <asp:Label ID="lblRecordId" runat="server" Text='<%# Eval("FeSiNo")%>' Visible="false"></asp:Label>
                                                                                                                                    <asp:Label ID="LblANSIID" runat="server" Text='<%# Eval("RecordId")%>' Visible="false"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Line Type">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlLineTypeE" ToolTip="Line Type" runat="server" AutoPostBack="true"
                                                                                                                                        OnSelectedIndexChanged="ddlLineTypeE_SelectedIndexChanged">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvLTE" InitialValue="0" ValidationGroup="EditNum"
                                                                                                                                        runat="server" ControlToValidate="ddlLineTypeE" Display="None" SetFocusOnError="true"
                                                                                                                                        ErrorMessage="Select the Line Type"></asp:RequiredFieldValidator>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblLineType" runat="server" Text='<%#Eval("LineType")%>'></asp:Label>
                                                                                                                                    <asp:Label ID="lblLineTypeID" runat="server" Text='<%#Eval("LineTypeID")%>' Visible="false"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlFLineType" ToolTip="Line Type" runat="server" AutoPostBack="true"
                                                                                                                                        OnSelectedIndexChanged="ddlFLineType_SelectedIndexChanged">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFddlFLineType" InitialValue="0" ValidationGroup="AddNumber"
                                                                                                                                        runat="server" ControlToValidate="ddlFLineType" Display="None" SetFocusOnError="true"
                                                                                                                                        ErrorMessage="Select the Line Type"></asp:RequiredFieldValidator>
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Flag">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlFlagE" ToolTip="Line Type" runat="server" AutoPostBack="true"
                                                                                                                                        OnSelectedIndexChanged="ddlFlagE_SelectedIndexChanged">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFlagE" InitialValue="0" ValidationGroup="EditNum"
                                                                                                                                        runat="server" ControlToValidate="ddlFlagE" Display="None" SetFocusOnError="true"
                                                                                                                                        ErrorMessage="Select the Flag"></asp:RequiredFieldValidator>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblFlag" runat="server" Text='<%#Eval("Flag")%>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlFFlag" ToolTip="Line Type" runat="server" AutoPostBack="true"
                                                                                                                                        OnSelectedIndexChanged="ddlFFlag_SelectedIndexChanged">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFddlFFlag" InitialValue="0" ValidationGroup="AddNumber"
                                                                                                                                        runat="server" ControlToValidate="ddlFFlag" Display="None" SetFocusOnError="true"
                                                                                                                                        ErrorMessage="Select the Flag"></asp:RequiredFieldValidator>
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Description">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:Label ID="lblDescE" runat="server" Text='<%#Eval("Desc")%>' Visible="true"></asp:Label>
                                                                                                                                    <cc1:ComboBox ID="txtDescE" runat="server" ToolTip="Description" Visible="false"
                                                                                                                                        AutoCompleteMode="Suggest">
                                                                                                                                    </cc1:ComboBox>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvtxtDescE" ValidationGroup="EditNum" runat="server"
                                                                                                                                        ControlToValidate="txtDescE" Display="None" SetFocusOnError="true"
                                                                                                                                        ErrorMessage="Enter the Description"></asp:RequiredFieldValidator>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblDescription" Width="150px" runat="server" Text='<%#Eval("Desc")%>'></asp:Label>
                                                                                                                                    <asp:Label ID="lblDescID" runat="server" Text='<%#Eval("Flag_ID")%>' Visible="false"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:Label ID="lblFDesc" runat="server" Visible="true"></asp:Label>
                                                                                                                                    <cc1:ComboBox ID="txtFDesc" runat="server" ToolTip="Description" Visible="false"
                                                                                                                                        AutoCompleteMode="Suggest">
                                                                                                                                    </cc1:ComboBox>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFtxtFDesc" ValidationGroup="AddNumber" runat="server"
                                                                                                                                        ControlToValidate="txtFDesc" Display="None" SetFocusOnError="true"
                                                                                                                                        ErrorMessage="Enter the Description"></asp:RequiredFieldValidator>
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Attrib">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlFieldAttFeE" ToolTip="Attributes"
                                                                                                                                        runat="server" Width="100px">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblFieldAttFeName" Text='<%# Bind("FieldAttFeName")%>' runat="server"></asp:Label>
                                                                                                                                    <asp:Label ID="lblFieldAttFe" Text='<%# Bind("FieldAttFe")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlFieldAttFeF" ToolTip="Attributes"
                                                                                                                                        runat="server" Width="100px">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                </FooterTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Actual Value">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="txtACValueE" MaxLength="12" Width="100px" runat="server" ToolTip="Actual Value"
                                                                                                                                        Style="text-align: right" Text='<%#Eval("Value")%>'></asp:TextBox>
                                                                                                                                    <cc1:FilteredTextBoxExtender ID="ftetxtACValueE" runat="server" TargetControlID="txtACValueE"
                                                                                                                                        FilterType="Numbers,Custom" ValidChars=".:" Enabled="True">
                                                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvtxtACValueE" ValidationGroup="EditNum" runat="server"
                                                                                                                                        ControlToValidate="txtACValueE" Display="None" SetFocusOnError="true" ErrorMessage="Enter the Value">
                                                                                                                                    </asp:RequiredFieldValidator>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:TextBox ID="txtACValue" MaxLength="19"
                                                                                                                                        runat="server" ReadOnly="true"
                                                                                                                                        Width="80px" Style="text-align: right" Text='<%#Eval("Actual_Value")%>'></asp:TextBox>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:TextBox ID="txtFACValue" MaxLength="12" Width="100px" runat="server" ToolTip="Value"
                                                                                                                                        Style="text-align: right"></asp:TextBox>
                                                                                                                                    <cc1:FilteredTextBoxExtender ID="fetxtFACValue" runat="server" TargetControlID="txtFACValue"
                                                                                                                                        FilterType="Numbers,Custom" ValidChars=".:" Enabled="True">
                                                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFtxtFValue" ValidationGroup="AddNumber" runat="server"
                                                                                                                                        ControlToValidate="txtFACValue" Display="None" SetFocusOnError="true" ErrorMessage="Enter the Value">
                                                                                                                                    </asp:RequiredFieldValidator>
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Value" Visible="false">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="txtValueE" MaxLength="12" Width="100px" runat="server" ToolTip="Value"
                                                                                                                                        Style="text-align: right" Text='<%#Eval("Value")%>'></asp:TextBox>
                                                                                                                                    <cc1:FilteredTextBoxExtender ID="ftetxtValueE" runat="server" TargetControlID="txtValueE"
                                                                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvtxtValueE" ValidationGroup="EditNum" runat="server"
                                                                                                                                        ControlToValidate="txtValueE" Display="None" SetFocusOnError="true" ErrorMessage="Enter the Value">
                                                                                                                                    </asp:RequiredFieldValidator>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblValue" runat="server" Text='<%#Eval("Value")%>' Visible="false"
                                                                                                                                        Style="text-align: right" Width="100%"></asp:Label>
                                                                                                                                    <asp:TextBox ID="txtValue"
                                                                                                                                        runat="server" ReadOnly="true"
                                                                                                                                        Width="80px" Style="text-align: right" Text='<%#Eval("Value")%>'></asp:TextBox>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:TextBox ID="txtFValue" MaxLength="12" Width="100px" runat="server" ToolTip="Value"
                                                                                                                                        Style="text-align: right"></asp:TextBox>
                                                                                                                                    <cc1:FilteredTextBoxExtender ID="fetxtFValue" runat="server" TargetControlID="txtFValue"
                                                                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFtxtFValue" ValidationGroup="AddNumber" runat="server"
                                                                                                                                        ControlToValidate="txtFValue" Display="None" SetFocusOnError="true" ErrorMessage="Enter the Value">
                                                                                                                                    </asp:RequiredFieldValidator>
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Pick Fill">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlPickFillE" ToolTip="Pick Fill"
                                                                                                                                        runat="server" Width="100px">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblPickFillName" Width="150px" Text='<%# Bind("PickFillName")%>' runat="server"></asp:Label>
                                                                                                                                    <asp:Label ID="lblPickFill" Text='<%# Bind("PickFill")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlPickFillF" ToolTip="Pick Fill"
                                                                                                                                        runat="server" Width="100px">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                </FooterTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Fe">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:Panel runat="server" ID="pnlFmlE" Enabled="false">
                                                                                                                                        <table>
                                                                                                                                            <tr>
                                                                                                                                                <td rowspan="2">
                                                                                                                                                    <asp:TextBox ID="txtFormulaE" TextMode="MultiLine" Width="100px" runat="server" ToolTip="Value"
                                                                                                                                                        Style="text-align: left; height: 40px; width: 140px;" Text='<%#Eval("Formula")%>'></asp:TextBox>
                                                                                                                                                    <cc1:FilteredTextBoxExtender ID="feFormulaE" runat="server" TargetControlID="txtFormulaE"
                                                                                                                                                        FilterType="Numbers,Custom,UppercaseLetters" ValidChars=".,+,-,*,/,%,(,),<,>,?,=,[A-Z]"
                                                                                                                                                        Enabled="True">
                                                                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFormulaE" ValidationGroup="EditNum" runat="server"
                                                                                                                                                        Enabled="false" ControlToValidate="txtFormulaE" Display="None" SetFocusOnError="true"
                                                                                                                                                        ErrorMessage="Enter the Formula"></asp:RequiredFieldValidator>
                                                                                                                                                    <asp:RegularExpressionValidator ID="REFVtxtFormulaE"
                                                                                                                                                        runat="server" ControlToValidate="txtFormulaE"
                                                                                                                                                        ErrorMessage="Please enter maximum 500 charachters."
                                                                                                                                                        SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                                                                                                    </asp:RegularExpressionValidator>
                                                                                                                                                </td>
                                                                                                                                                <td>
                                                                                                                                                    <asp:DropDownList ID="ddlFmlLinesE" runat="server">
                                                                                                                                                    </asp:DropDownList>
                                                                                                                                                </td>
                                                                                                                                            </tr>
                                                                                                                                            <tr>
                                                                                                                                                <td>
                                                                                                                                                    <button id="btnAddfmlE" type="button" runat="server" class="styleGridShortButton"
                                                                                                                                                        value="Add" title="Add">
                                                                                                                                                        <img src="../Images/Prev_Desabled.gif" style="position: absolute" runat="server"
                                                                                                                                                            id="imgPrev1E" />
                                                                                                                                                        &nbsp;
                                                                                                                                    <img src="../Images/Prev_Desabled.gif" runat="server" id="imgPrev2E" />
                                                                                                                                                    </button>
                                                                                                                                                    <asp:CheckBox ID="chkCarryFmlE" runat="server" Checked="true" ToolTip="Carry formula result" />
                                                                                                                                                </td>
                                                                                                                                            </tr>
                                                                                                                                        </table>
                                                                                                                                    </asp:Panel>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:CheckBox ID="chkCarryFml" runat="server" Checked="true" Width="150px" ToolTip="Carry formula result" Text='<%#Eval("Formula")%>' Enabled="false" />
                                                                                                                                    <%--<asp:Label ID="lblFormula" runat="server" Width="150px" Text='<%#Eval("Formula")%>'></asp:Label>--%>
                                                                                                                                    <asp:Label ID="lblCarryFml" Visible="false" runat="server" Text='<%#Eval("CarryFml")%>'></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:Panel runat="server" ID="pnlFFml" Enabled="false">
                                                                                                                                        <table>
                                                                                                                                            <tr>
                                                                                                                                                <td rowspan="2">
                                                                                                                                                    <asp:TextBox ID="txtFFormula" TextMode="MultiLine" Width="100px" runat="server" ToolTip="Value"
                                                                                                                                                        Style="text-align: left; height: 40px; width: 140px;"></asp:TextBox>
                                                                                                                                                    <cc1:FilteredTextBoxExtender ID="fetxtFFormula" runat="server" TargetControlID="txtFFormula"
                                                                                                                                                        FilterType="Numbers,Custom,UppercaseLetters" ValidChars=".,+,-,*,/,%,(,),<,>,?,=,[A-Z]"
                                                                                                                                                        Enabled="True">
                                                                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFtxtFFormula" ValidationGroup="AddNumber" runat="server"
                                                                                                                                                        Enabled="false" ControlToValidate="txtFFormula" Display="None" SetFocusOnError="true"
                                                                                                                                                        ErrorMessage="Enter the Formula"></asp:RequiredFieldValidator>
                                                                                                                                                    <asp:RegularExpressionValidator ID="REFVtxtFFormula"
                                                                                                                                                        runat="server" ControlToValidate="txtFFormula"
                                                                                                                                                        ErrorMessage="Please enter maximum 500 charachters."
                                                                                                                                                        SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                                                                                                    </asp:RegularExpressionValidator>
                                                                                                                                                </td>
                                                                                                                                                <td>
                                                                                                                                                    <asp:DropDownList ID="ddlFFmlLines" runat="server">
                                                                                                                                                    </asp:DropDownList>
                                                                                                                                                </td>
                                                                                                                                            </tr>
                                                                                                                                            <tr>
                                                                                                                                                <td>
                                                                                                                                                    <button id="btnAddfml" type="button" runat="server" class="styleGridShortButton"
                                                                                                                                                        value="Add" title="Add">
                                                                                                                                                        <img src="../Images/Prev_Desabled.gif" style="position: absolute" runat="server"
                                                                                                                                                            id="imgPrev1" />
                                                                                                                                                        &nbsp;
                                                                                                                                    <img src="../Images/Prev_Desabled.gif" runat="server" id="imgPrev2" />
                                                                                                                                                    </button>
                                                                                                                                                    <asp:CheckBox ID="chkFCarryFml" runat="server" Checked="true" ToolTip="Carry formula result" />
                                                                                                                                                </td>
                                                                                                                                            </tr>
                                                                                                                                        </table>
                                                                                                                                    </asp:Panel>
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField ItemStyle-Wrap="true">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:CheckBox ID="chkLinkE" runat="server" OnCheckedChanged="chkLinkE_CheckedChanged"
                                                                                                                                        AutoPostBack="true" />
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:CheckBox ID="chkLink" Checked='<%# Convert.ToBoolean(Eval("IsLink")) %>' runat="server" Enabled="false" />
                                                                                                                                    <asp:Label ID="lblLink" runat="server" Text='<%#Eval("IsLink")%>' Visible="false"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:CheckBox ID="chkFLink" runat="server" OnCheckedChanged="chkFLink_CheckedChanged"
                                                                                                                                        AutoPostBack="true" />
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Map Main">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlParamNumE" ToolTip="Param Num" runat="server" Width="150px">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvddlParamNumE" InitialValue="0" ValidationGroup="EditNum"
                                                                                                                                        runat="server" ControlToValidate="ddlParamNumE" Display="None" SetFocusOnError="true"
                                                                                                                                        ErrorMessage="Select the Param Num"></asp:RequiredFieldValidator>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Label ID="lblParamText" runat="server" Width="150px" Text='<%#Eval("ParamText")%>'></asp:Label>
                                                                                                                                    <asp:Label ID="lblParamNum" runat="server" Text='<%#Eval("ParamNum")%>' Visible="false"></asp:Label>
                                                                                                                                    <asp:Label ID="lblParaSubGRoupCode" runat="server" Text='<%#Eval("SubGroupCode")%>' Visible="false"></asp:Label>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:DropDownList ID="ddlFParamNum" ToolTip="Param Num" runat="server" Width="150px">
                                                                                                                                    </asp:DropDownList>
                                                                                                                                    <asp:RequiredFieldValidator ID="rfvFddlFParamNum" InitialValue="0" ValidationGroup="AddNumber"
                                                                                                                                        runat="server" ControlToValidate="ddlFParamNum" Display="None" SetFocusOnError="true"
                                                                                                                                        ErrorMessage="Select the Param Num"></asp:RequiredFieldValidator>
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Scan">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:Button ID="btnNumUpload" runat="server" Text="Files" CssClass="styleSubmitShortButton" OnClick="btnNumUpload_Click" />
                                                                                                                                </ItemTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Remarks">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:TextBox ID="txtFeERemarks" TextMode="MultiLine" Width="180px"
                                                                                                                                        runat="server" Text='<%# Bind("Remarks")%>' MaxLength="500"></asp:TextBox>
                                                                                                                                    <asp:RegularExpressionValidator ID="REFVtxtFeERemarks"
                                                                                                                                        runat="server" ControlToValidate="txtFeERemarks"
                                                                                                                                        ErrorMessage="Please enter maximum 500 charachters."
                                                                                                                                        SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                                                                                    </asp:RegularExpressionValidator>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:TextBox ID="txtFeRemarks" TextMode="MultiLine" Width="180px"
                                                                                                                                        runat="server" Text='<%# Bind("Remarks")%>' MaxLength="500"></asp:TextBox>
                                                                                                                                    <asp:RegularExpressionValidator ID="REFVtxtFeRemarks"
                                                                                                                                        runat="server" ControlToValidate="txtFeRemarks"
                                                                                                                                        ErrorMessage="Please enter maximum 500 charachters."
                                                                                                                                        SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                                                                                    </asp:RegularExpressionValidator>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Link">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:ImageButton ID="imgNumShow" runat="server" Width="25px" Height="25px" ImageUrl="~/images/plus.png"
                                                                                                                                        CommandArgument="NumShow" />
                                                                                                                                </ItemTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                            <asp:TemplateField HeaderText="Action">
                                                                                                                                <EditItemTemplate>
                                                                                                                                    <asp:ImageButton ID="imgFeUpdate" runat="server" Text="Update" CommandName="Update" ToolTip="Update Formula"
                                                                                                                                        CausesValidation="false" CssClass="styleGridImgShortButton" ImageUrl="~/Images/Update_Green.jpg"></asp:ImageButton>
                                                                                                                                    <asp:ImageButton ID="lnkCancelChild" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Cancel Formula"
                                                                                                                                        CausesValidation="false" CssClass="styleGridImgShortButton" ImageUrl="~/Images/Cancel_Green.jpg"></asp:ImageButton>
                                                                                                                                </EditItemTemplate>
                                                                                                                                <ItemTemplate>
                                                                                                                                    <asp:ImageButton ID="imgFeEdit" runat="server" Text="Edit" CommandName="Edit"
                                                                                                                                        ToolTip="Edit Formula" CausesValidation="false" CssClass="styleGridImgShortButton"
                                                                                                                                        ImageUrl="~/Images/Edit_Green.png"></asp:ImageButton>&nbsp;
                                                                                                                                <asp:ImageButton Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                                                                                    runat="server" ID="imgFeDelete"
                                                                                                                                    CommandName="Delete" ToolTip="Delete Formula"
                                                                                                                                    CssClass="styleGridImgShortButton" ImageUrl="~/Images/Delete_Green.jpg"></asp:ImageButton>
                                                                                                                                </ItemTemplate>
                                                                                                                                <FooterTemplate>
                                                                                                                                    <asp:ImageButton ID="imgAddFe" runat="server" ImageUrl="~/Images/add_Green.jpg"
                                                                                                                                        CommandName="AddNew" CssClass="styleGridImgShortButton"
                                                                                                                                        Text="Add" ToolTip="Add Formula" ValidationGroup="AddNumber" CausesValidation="false"></asp:ImageButton>
                                                                                                                                </FooterTemplate>
                                                                                                                            </asp:TemplateField>
                                                                                                                        </Columns>
                                                                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                                                                    </asp:GridView>
                                                                                                                </asp:Panel>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                            </Columns>
                                                                                        </asp:GridView>
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
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Button ID="btnAdd" runat="server" CssClass="styleSubmitShortButton" Text="Add"
                                                            OnClick="btnAdd_Click" Visible="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="hdnalert" runat="server" type="hidden" value="0" />
                                                        <input id="hdnCreditScoreTran_ID" runat="server" type="hidden" value="0" />
                                                        <input type="hidden" id="hdnSortDirection" runat="server" />
                                                        <input type="hidden" id="hdnSortExpression" runat="server" />
                                                        <input type="hidden" id="hdnSearch" runat="server" />
                                                        <input type="hidden" id="hdnEdit_Status" runat="server" value="0" />
                                                        <input type="hidden" id="hdnOrderBy" runat="server" />
                                                        <asp:HiddenField ID="hdnLobid" runat="server" />
                                                        <asp:HiddenField ID="hdnproductid" runat="server" />
                                                        <input id="hdnCreditScoreID" runat="server" type="hidden" value="0" />
                                                        <div id="btndiv" style="overflow: auto; text-align: center">
                                                            <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Text="Save"
                                                                OnClick="btnSave_Click" />
                                                            <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                                                                Text="Clear" OnClick="btnClear_Click" OnClientClick="return fnConfirmClear();" />
                                                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                                                                Text="Cancel" OnClick="btnCancel_Click" />
                                                        </div>
                                                        <br />
                                                        <asp:ValidationSummary ID="lblsErrorMessage" runat="server" CssClass="styleMandatoryLabel"
                                                            HeaderText="Please correct the following validation(s):" ValidationGroup="btnSave" ShowSummary="true" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <asp:GridView ID="grvCreditScoreYearValues" runat="server" ShowFooter="true" AutoGenerateColumns="true"
                                                            OnRowDataBound="grvCreditScoreYearValues_RowDataBound" >
                                                        </asp:GridView>
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
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblfile" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="MPUploadFiles" runat="server" PopupControlID="plUploadfiles" TargetControlID="lblfile"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <asp:Panel ID="plUploadfiles" GroupingText="" Height="200px" Width="300px" runat="server" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
        <asp:UpdatePanel ID="updUpload" runat="server">
            <ContentTemplate>
                <table style="width: 300px;">
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
                            <asp:Label ID="lblCSType" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="LblUploadParamId" runat="server" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" CssClass="styleSubmitShortButton" Text="Upload" />
                            <asp:Button ID="btnUploadCancel" runat="server" Text="Close" CssClass="styleSubmitShortButton" OnClick="btnUploadCancel_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="divfc" runat="server" style="overflow-x: scroll; height: 120px; width: 290px; overflow-y: scroll">
                                <asp:GridView ID="grvUploadedFiles" Width="290px" runat="server" AutoGenerateColumns="false" ShowFooter="false" OnRowDataBound="grvUploadedFiles_RowDataBound" OnRowDeleting="grvUploadedFiles_RowDeleting">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNoDisplay" runat="server" Text='<%# Container.DataItemIndex+1  %>'></asp:Label>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%# Bind("Serial_No")  %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("SNo") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("Docs_ID") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFileName" runat="server" Text='<%# Bind("FileName") %>' Width="200px"></asp:Label>
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
                                                <asp:ImageButton ID="hyplnkView" CommandArgument='<%# Bind("Scanned_Ref_No") %>' OnClick="hyplnkView_Click1"
                                                    ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                    runat="server" />
                                                <asp:Label runat="server" ID="lblPath" Text='<%# Eval("Scanned_Ref_No")%>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CustomValidator ID="cvCustomerMaster" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUpload" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Button ID="btnModalViewDoc" Style="display: none" runat="server" />
    <cc1:ModalPopupExtender ID="ModalViewDoc" runat="server" TargetControlID="btnModalViewDoc"
        PopupControlID="pnlViewDoc" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlViewDoc" Style="display: none;" runat="server"
        BorderStyle="Solid" BackColor="White" Width="450px">
        <asp:UpdatePanel ID="updViewDoc" runat="server">
            <ContentTemplate>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Button ID="btnPrevious" runat="server" Text="<<" Font-Size="20" />
                        </td>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="300" Width="300" />
                            <cc1:SlideShowExtender ID="SlideShowExtender" runat="server" TargetControlID="Image1"
                                SlideShowServiceMethod="GetImages" ImageTitleLabelID="lblImageTitle" ImageDescriptionLabelID="lblImageDescription"
                                AutoPlay="true" PlayInterval="1000" Loop="true" PlayButtonID="btnPlay" StopButtonText="Stop"
                                PlayButtonText="Play" NextButtonID="btnNext" PreviousButtonID="btnPrevious">
                            </cc1:SlideShowExtender>
                        </td>
                        <td>
                            <asp:Button ID="btnNext" runat="server" Text=">>" Font-Size="20" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="btnPlay" runat="server" Text="Play" Font-Size="20" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <br />
                            <b>Name:</b>
                            <asp:Label ID="lblImageTitle" runat="server" Text="Label" /><br />
                            <b>Description:</b>
                            <asp:Label ID="lblImageDescription" runat="server" Text="Label" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Label ID="lblrptView" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeRptShow" runat="server" PopupControlID="dvRptView" TargetControlID="lblrptView"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvRptView" style="display: none; width: 75%;">
        <div id="divrrptimg" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -35px;">
            <asp:ImageButton ID="rptimg" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="divrrptimg_Click" />
        </div>
        <div>
            <asp:Panel ID="pnlRptView" GroupingText="" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updrptView" runat="server">
                    <ContentTemplate>
                        <div id="dvrptShow" runat="server">
                        </div>
                        <asp:GridView ID="grvrptShow" runat="server" Visible="false">
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
    <asp:Label ID="lblOthersView" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mdpOthersfrm" runat="server" PopupControlID="divOthersfrm" TargetControlID="lblOthersView"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="divOthersfrm" style="display: none; width: 100%;">
        <div id="cee_closeBtn" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -35px;">
            <asp:ImageButton ID="imgCloseImage" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="imgCloseImage_Click" />
        </div>
        <div>
            <asp:Panel ID="pnlOthersfrm" CssClass="stylePanel" GroupingText="Other Details" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updOthDet" runat="server">
                    <ContentTemplate>
                        <table width="100%" cellpadding="0" cellspacing="0" border="1">
                            <tr>
                                <td>
                                    <asp:Label ID="lblOthParamId" runat="server" Visible="false" Text=""></asp:Label>
                                    <asp:GridView ID="grvOthers" runat="server" AutoGenerateColumns="False"
                                        ShowFooter="True"
                                        OnRowDataBound="grvOthers_RowDataBound"
                                        OnRowCommand="grvOthers_RowCommand"
                                        OnRowEditing="grvOthers_RowEditing"
                                        OnRowDeleting="grvOthers_RowDeleting"
                                        OnRowCancelingEdit="grvOthers_RowCancelingEdit"
                                        OnRowUpdating="grvOthers_RowUpdating"
                                        DataKeyNames="SINO" Width="100%">
                                        <Columns>
                                            <asp:TemplateField Visible="false" HeaderText="S.NO">
                                                <EditItemTemplate>
                                                    <asp:Label ID="lbl_OthLineNo" runat="server" Text='<%# Bind("SINO") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOthLineNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                    <asp:Label ID="lblParamId" runat="server" Text='<%# Bind("ParamID") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblOthYear" runat="server" Text='<%# Bind("Year") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DESCRIPTION" HeaderStyle-Width="10%">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtOthernameE" runat="server" MaxLength="150" Width="200px" Text='<%# Bind("OtherName") %>'></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvOthNameE" CssClass="styleMandatoryLabel"
                                                        runat="server" InitialValue="" ControlToValidate="txtOthernameE" ErrorMessage="Enter Description"
                                                        Display="None" ValidationGroup="btnEditOth">
                                                    </asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Othername" runat="server" Text='<%# Bind("OtherName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtOthername" Width="180px" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvOthNameF" CssClass="styleMandatoryLabel"
                                                        runat="server" InitialValue="" ControlToValidate="txtOthername" ErrorMessage="Enter Description"
                                                        Display="None" ValidationGroup="btnAddOth">
                                                    </asp:RequiredFieldValidator>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="VALUE" HeaderStyle-Width="10%">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtOtherValueE" runat="server" Width="100px" Text='<%# Bind("OtherValue") %>' Style="text-align: right;"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvOthValueE" CssClass="styleMandatoryLabel"
                                                        runat="server" InitialValue="" ControlToValidate="txtOtherValueE" ErrorMessage="Enter Value"
                                                        Display="None" ValidationGroup="btnEditOth">
                                                    </asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_OtherValue" runat="server" Text='<%# Bind("OtherValue") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtOtherValue" runat="server" Width="110px" Style="text-align: right;" MaxLength="19"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvOthValueF" CssClass="styleMandatoryLabel"
                                                        runat="server" InitialValue="" ControlToValidate="txtOtherValue" ErrorMessage="Enter Value"
                                                        Display="None" ValidationGroup="btnAddOth">
                                                    </asp:RequiredFieldValidator>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="10%" />
                                                <FooterStyle HorizontalAlign="Right" VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RECD DATE" HeaderStyle-Width="5%">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtOtherRectDateE" Width="90px" runat="server" Text='<%# Bind("RectDate") %>'></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calRectDateE" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                        PopupButtonID="imgDate" TargetControlID="txtOtherRectDateE" OnClientShown="calendarShown">
                                                    </cc1:CalendarExtender>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_OtherRectDate" runat="server" Text='<%# Bind("RectDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtOtherRectDate" Width="90px" runat="server"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calRectDateF" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                        PopupButtonID="imgDate" TargetControlID="txtOtherRectDate" OnClientShown="calendarShown">
                                                    </cc1:CalendarExtender>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RECD BY" HeaderStyle-Width="5%">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtOtherRectByE" Width="90px" runat="server" Text='<%# Bind("RectBy") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_OtherRectBy" runat="server" Text='<%# Bind("RectBy") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtOtherRectBy" Width="90px" MaxLength="25" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="VERIFD DATE" HeaderStyle-Width="5%">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtOtherVerifyDateE" Width="90px" runat="server" Text='<%# Bind("VerifyDate") %>'></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calVerifyDateE" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                        PopupButtonID="imgDate" TargetControlID="txtOtherVerifyDateE" OnClientShown="calendarShown">
                                                    </cc1:CalendarExtender>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_OtherVerifyDate" runat="server" Text='<%# Bind("VerifyDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtOtherVerifyDate" Width="90px" runat="server"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calVerifyDateF" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                        PopupButtonID="imgDate" TargetControlID="txtOtherVerifyDate" OnClientShown="calendarShown">
                                                    </cc1:CalendarExtender>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="VERIFD BY" HeaderStyle-Width="5%">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtOtherVerifyByE" runat="server" MaxLength="25" Width="100px" Text='<%# Bind("VerifyBy") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_OtherVerifyBy" runat="server" Text='<%# Bind("VerifyBy") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtOtherVerifyBy" Width="100px" MaxLength="25" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="REMARKS" HeaderStyle-Width="10%">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtOtherRemarksE" runat="server" TextMode="MultiLine" Width="200px" Text='<%# Bind("Remarks") %>' MaxLength="500"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvOthRemarksE" CssClass="styleMandatoryLabel"
                                                        runat="server" InitialValue="" ControlToValidate="txtOtherRemarksE" ErrorMessage="Enter Remarks"
                                                        Display="None" ValidationGroup="btnEditOth">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REFVtxtOtherRemarksE"
                                                        runat="server" ControlToValidate="txtOtherRemarksE"
                                                        ErrorMessage="Please enter maximum 500 charachters."
                                                        SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                    </asp:RegularExpressionValidator>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_OtherRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtOtherRemarks" runat="server" Width="200px" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvOthRemarksF" CssClass="styleMandatoryLabel"
                                                        runat="server" InitialValue="" ControlToValidate="txtOtherRemarks" ErrorMessage="Enter Remarks"
                                                        Display="None" ValidationGroup="btnAddOth">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REFVtxtOtherRemarks"
                                                        runat="server" ControlToValidate="txtOtherRemarks"
                                                        ErrorMessage="Please enter maximum 500 charachters."
                                                        SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                    </asp:RegularExpressionValidator>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ACTION">
                                                <EditItemTemplate>
                                                    <asp:ImageButton ID="lnkUpdOth" CausesValidation="true" runat="server" Text="Update" Width="20px" Height="20px" CommandName="Update"
                                                        ValidationGroup="btnEditOth" ImageUrl="~/Images/Update_New.png" CssClass="styleGridImgShortButton" ToolTip="Update Others"></asp:ImageButton>
                                                    <asp:ImageButton ID="lnkCancelOth" runat="server" Text="Cancel" Width="20px" Height="20px" CommandName="Cancel"
                                                        CausesValidation="false" ImageUrl="~/Images/Cancel_New.png" CssClass="styleGridImgShortButton" ToolTip="Cancel Others"></asp:ImageButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="lnkEditOth" runat="server" Text="Edit" Width="20px" Height="20px" CommandName="Edit"
                                                        CausesValidation="false" ImageUrl="~/Images/Edit.jpg" CssClass="styleGridImgShortButton" ToolTip="Edit Others"></asp:ImageButton>
                                                    &nbsp;
                                                <asp:ImageButton ID="btnOthRemove" Text="Remove" CommandName="Delete" Width="20px" Height="20px" runat="server"
                                                    CausesValidation="false" ImageUrl="~/Images/delete1.png"
                                                    CssClass="styleGridImgShortButton" ToolTip="Delete Others" />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:ImageButton ID="btnOthDet" ImageUrl="~/Images/2Blue_Plus.png" Width="20px" Height="20px"
                                                        CommandName="AddOth" CausesValidation="true" runat="server" CssClass="styleGridImgShortButton"
                                                        ValidationGroup="btnAddOth" ToolTip="Add Group" />
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ValidationSummary runat="server" ID="VSCSM" HeaderText="Correct the following validation(s):"
                                        CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnAddOth"
                                        ShowSummary="true" />
                                    <asp:ValidationSummary runat="server" ID="VSEDTOTH" HeaderText="Correct the following validation(s):"
                                        CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnEditOth"
                                        ShowSummary="true" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
    <asp:Label ID="lblInvestView" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeInvestView" runat="server" PopupControlID="dvInvestView" TargetControlID="lblInvestView"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvInvestView" style="display: none; width: 75%;">
        <div id="dvInvImgs" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -35px;">
            <asp:ImageButton ID="imgInvestView" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="imgInvestView_Click" />
        </div>
        <div>
            <asp:Panel ID="pnlInvestView" GroupingText="Field Investigation" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updFI" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 450px; width: 545px;">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td colspan="4" align="center">
                                        <div id="dvinner" runat="server" style="overflow: auto; height: 445px; width: 540px; display: block">
                                            <asp:Label ID="lblFIParamId" runat="server" Visible="false" Text=""></asp:Label>
                                            <asp:GridView ID="grvFI" runat="server" AutoGenerateColumns="False"
                                                ShowFooter="false" OnRowDataBound="grvFI_RowDataBound" ShowHeader="false"
                                                DataKeyNames="SINO" Width="545px">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <table cellpadding="0" cellspacing="0" width="540px">
                                                                <tr>
                                                                    <td class="styleFieldLabel">Date
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtFIDate" runat="server" Width="120px" Text='<%# Bind("FIDate") %>' ReadOnly="true"></asp:TextBox>
                                                                        <asp:Label ID="lblFISINO" Visible="false" Text='<%# Bind("SINO") %>' runat="server"></asp:Label>
                                                                        <cc1:TextBoxWatermarkExtender ID="tbwatfidate" runat="server" TargetControlID="txtFIDate"
                                                                            WatermarkText="dd/MM/yyyy">
                                                                        </cc1:TextBoxWatermarkExtender>
                                                                        <cc1:CalendarExtender ID="calFIDate" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                                            PopupButtonID="imgDate" TargetControlID="txtFIDate" OnClientShown="calendarShown">
                                                                        </cc1:CalendarExtender>
                                                                    </td>
                                                                    <td class="styleFieldLabel">By
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtFIby" runat="server" Width="180px" Text='<%# Bind("FIBy") %>'></asp:TextBox>
                                                                        <asp:DropDownList ID="ddlFIIntern" runat="server" Width="100px">
                                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                            <asp:ListItem Value="1" Text="Internal"></asp:ListItem>
                                                                            <asp:ListItem Value="2" Text="External"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:Label ID="lblFIIntern" runat="server" Visible="false" Text='<%# Bind("FIInterId") %>'></asp:Label>
                                                                    </td>
                                                                    <td align="right" valign="top">
                                                                        <asp:ImageButton ID="btnFiUpdate" runat="server" CssClass="styleGridImgShortButton" Width="20px" Height="20px" ImageUrl="~/Images/Update_New.png" Text="Update" ToolTip="Update" OnClick="btnFiUpdate_Click" />
                                                                        <asp:ImageButton ID="btnFiAdd" runat="server" CssClass="styleGridImgShortButton" Width="20px" Height="20px" ImageUrl="~/Images/2Blue_Plus.png" Visible="false" Text="Add" ToolTip="Add" OnClick="btnFiAdd_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">Result
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlFIResult" runat="server" Width="120px">
                                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                            <asp:ListItem Value="1" Text="Cleared"></asp:ListItem>
                                                                            <asp:ListItem Value="2" Text="Rejected"></asp:ListItem>
                                                                            <asp:ListItem Value="3" Text="Hold"></asp:ListItem>
                                                                            <asp:ListItem Value="4" Text="Pending"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:Label ID="lblFIResultId" runat="server" Visible="false" Text='<%# Bind("FIResultId") %>'></asp:Label>
                                                                    </td>
                                                                    <td class="styleFieldLabel">Remarks
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtFIMainRemarks" runat="server" Width="280px"
                                                                            TextMode="MultiLine" Text='<%# Bind("FIRemarks") %>' MaxLength="500"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="REFVtxtFIMainRemarks"
                                                                            runat="server" ControlToValidate="txtFIMainRemarks"
                                                                            ErrorMessage="Please enter maximum 500 charachters."
                                                                            SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                        </asp:RegularExpressionValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4">
                                                                        <div id="dvinnerSub" runat="server" style="overflow: auto; left: 100px; height: 200px; width: 540px; display: block">
                                                                            <asp:GridView ID="grvFIInner" runat="server" AutoGenerateColumns="False"
                                                                                ShowFooter="true" OnRowDataBound="grvFIInner_RowDataBound"
                                                                                OnRowCommand="grvFIInner_RowCommand" OnRowDeleting="grvFIInner_RowDeleting"
                                                                                OnRowEditing="grvFIInner_RowEditing">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Objectives">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txt_FIObj" runat="server" Text='<%# Bind("Objectives") %>'></asp:TextBox>
                                                                                            <asp:Label ID="lblInFIDate" Visible="false" runat="server" Text='<%# Bind("InFIDate") %>'></asp:Label>
                                                                                            <asp:Label ID="lblInFIParamID" Visible="false" runat="server" Text='<%# Bind("ParamID") %>'></asp:Label>
                                                                                            <asp:Label ID="lblFIIn_SINO" Visible="false" runat="server" Text='<%# Bind("SINO") %>'></asp:Label>
                                                                                            <asp:Label ID="lblFISUBSNO" Visible="false" runat="server" Text='<%# Bind("InFISINO") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txt_FIObjF" runat="server"></asp:TextBox>
                                                                                        </FooterTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="10%" />
                                                                                        <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" Width="10%" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Opinion">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txt_FIOpi" runat="server" Style="text-align: right;" Text='<%# Bind("Opinion") %>'></asp:TextBox>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txt_FIOpiF" runat="server"></asp:TextBox>
                                                                                        </FooterTemplate>
                                                                                        <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                                                                        <FooterStyle VerticalAlign="Top" HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Status">
                                                                                        <ItemTemplate>
                                                                                            <asp:DropDownList ID="ddl_FIStatus" runat="server">
                                                                                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                                                <asp:ListItem Value="1" Text="Cleared"></asp:ListItem>
                                                                                                <asp:ListItem Value="2" Text="Rejected"></asp:ListItem>
                                                                                                <asp:ListItem Value="3" Text="Hold"></asp:ListItem>
                                                                                                <asp:ListItem Value="4" Text="Pending"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                            <asp:Label ID="lbl_FIStatusId" runat="server" Visible="false" Text='<%# Bind("FIStatusId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:DropDownList ID="ddl_FIStatusF" runat="server">
                                                                                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                                                <asp:ListItem Value="1" Text="Cleared"></asp:ListItem>
                                                                                                <asp:ListItem Value="2" Text="Rejected"></asp:ListItem>
                                                                                                <asp:ListItem Value="3" Text="Hold"></asp:ListItem>
                                                                                                <asp:ListItem Value="4" Text="Pending"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </FooterTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                                                        <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txt_FIRemarks" runat="server" Width="300px" Height="15px" TextMode="MultiLine" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                                                                            <asp:RegularExpressionValidator ID="REFVtxt_FIRemarks"
                                                                                                runat="server" ControlToValidate="txt_FIRemarks"
                                                                                                ErrorMessage="Please enter maximum 500 charachters."
                                                                                                SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                                            </asp:RegularExpressionValidator>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txt_FIRemarksF" runat="server" Width="300px" Height="15px" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                                                                                            <asp:RegularExpressionValidator ID="REFVtxt_FIRemarksF"
                                                                                            runat="server" ControlToValidate="txt_FIRemarksF"
                                                                                            ErrorMessage="Please enter maximum 500 charachters."
                                                                                            SetFocusOnError="true" ValidationExpression="^[a-zA-Z.]{0,500}$">
                                                                                            </asp:RegularExpressionValidator>
                                                                                        </FooterTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                                                        <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:ImageButton ID="lnkEditFI" runat="server" Text="Edit" Width="20px" Height="20px" CommandName="Edit"
                                                                                                CausesValidation="false" ImageUrl="~/Images/Edit.jpg" CssClass="styleGridImgShortButton" ToolTip="Edit Investigation"></asp:ImageButton>
                                                                                            &nbsp;
                                                                                         <asp:ImageButton ID="btnFIRemove" Text="Remove" CommandName="Delete" Width="20px" Height="20px" runat="server"
                                                                                             CausesValidation="false" ImageUrl="~/Images/delete1.png"
                                                                                             CssClass="styleGridImgShortButton" ToolTip="Delete Investigation" />
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:ImageButton ID="btnFIDet" ImageUrl="~/Images/2Blue_Plus.png"
                                                                                                CommandName="AddInner" Width="20px" Height="20px" runat="server" CssClass="styleGridImgShortButton"
                                                                                                ToolTip="Add Field Investigation" />
                                                                                        </FooterTemplate>
                                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4">
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="lblFIParamId" runat="server" Text='<%# Bind("ParamID") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblFIYear" runat="server" Text='<%# Bind("Year") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="100%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" style="padding-right: 5px;">
                                        <asp:ImageButton ID="imgPastHis" Visible="false" runat="server" ToolTip="Past History" Height="35px" Width="35px"
                                            ImageUrl="~/Images/His_1.png" OnClick="imgPastHis_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
