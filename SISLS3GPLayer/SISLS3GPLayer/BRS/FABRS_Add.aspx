<%@ Page Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="FABRS_Add.aspx.cs" Inherits="Financial_Accounting_FABRS_Add" Title="Bank Reconciliation" EnableEventValidation="false" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/PageNavigator.ascx" TagPrefix="uc1" TagName="PageNavigator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>

    <script language="javascript" type="text/javascript">

        function fnSelectFile(chkgdSelect)  //
        {
            var varTrancheID = chkgdSelect.id;
            varTrancheID = varTrancheID.replace("chkFileSelect", "lblUpldID");
            var label = document.getElementById(varTrancheID.toString());
            varTrancheID = label.innerText;

            var gvDtl = document.getElementById('<%= gvUploadDtl.ClientID%>');

            for (i = 1; i < gvDtl.rows.length; i++) {
                var varRsTrnID = gvDtl.rows[i].cells[1].children[0].innerText.toString();
                if (parseInt(varRsTrnID) == parseInt(varTrancheID))   //
                {
                    var Inputs = gvDtl.getElementsByTagName("input");
                    Inputs[(i * 2) - 1].checked = chkgdSelect.checked;
                }
                else //
                {
                    var Inputs = gvDtl.getElementsByTagName("input");
                    Inputs[(i * 2) - 1].checked = false;
                }
            }
        }

        //Code Added on 07Apr2016 starts Here
        var monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        var monthNo = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'];

        function fnChkMnlAdjDate(el, erID, eFormat) {
            if (el.value == "") {
                return;
            }
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
                return;
            }

            var selectedDate = s;
            selectedDate = Date.parseInvariant(selectedDate, eFormat);
            var varstartDate = document.getElementById('<%=txtStartDate.ClientID %>').value;
            varstartDate = Date.parseInvariant(varstartDate, eFormat);
            var varEndDate = document.getElementById('<%=txtEndDate.ClientID %>').value;
            varEndDate = Date.parseInvariant(varEndDate, eFormat);

            if (selectedDate < varstartDate || selectedDate > varEndDate) {
                alert('Entered Date should be in range between Start date and End date');
                el.value = "";
            }
        }
        //Code Added on 07Apr2016 Ends Here

        //Added On 19Apr2016 Starts Here

        function fnCalcDiff() {
            var txtUnclearedAdjust = $get('<%=txtUnclearedAdjust.ClientID %>');
            var lblTotBankStamt = $get('<%=lblTotBankStamt.ClientID %>');
            var lblBRSDiffAmount = $get('<%=lblBRSDiffAmount.ClientID %>');
            var lblSuffix = $get('<%=lblSuffix.ClientID %>');

            if (lblTotBankStamt.value != "") {
                lblBRSDiffAmount.innerText = (parseFloat(txtUnclearedAdjust.innerText) - parseFloat(lblTotBankStamt.value)).toString();
                lblBRSDiffAmount.innerText = parseFloat(lblBRSDiffAmount.innerText).toFixed(lblSuffix.innerText);
            }
            else {
                lblBRSDiffAmount.innerText = "";
            }

        }

        //Added On 19Apr2016 Ends Here

        function fnPblMatchChange() {
            var hdbValue = $get('<%=hdnPblMatchChange.ClientID %>');
            hdbValue.value = 1;
        }

    </script>

    <table width="100%">
        <tr width="100%">
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Bank Reconciliation" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <cc1:TabContainer ID="tcBRS" runat="server" CssClass="styleTabPanel" Width="99%"
                    TabStripPlacement="top" ActiveTabIndex="0">
                    <cc1:TabPanel runat="server" HeaderText="Main details" ID="tpMaindetails" CssClass="tabpan"
                        BackColor="Red" TabIndex="0" Width="100%">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upMaindetails" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Panel ID="pnlBankReconciliation" Height="100%" runat="server" CssClass="stylePanel">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblLocation" Text="Location *" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" OnItem_Selected="ddlLocation_SelectedIndexChanged"
                                                                    AutoPostBack="true" ItemToValidate="Value" ValidationGroup="Save" IsMandatory="true" ErrorMessage="Select Location" />
                                                                <%--   <cc1:ComboBox ID="ddlLocation" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                                                    CssClass="WindowsStyle" MaxLength="0" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                                                </cc1:ComboBox>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVddlLocation" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="--Select--"
                                                                    ErrorMessage="Select Location" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblDocumentNo" Text="Document Number"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtDocumentNo" runat="server" ToolTip="Document Number"
                                                                    ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblBankName" Text="Bank Name *"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <cc1:ComboBox ID="ddlBankName" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                    AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                    OnSelectedIndexChanged="ddlBankName_SelectedIndexChanged">
                                                                </cc1:ComboBox>
                                                                <asp:RequiredFieldValidator ID="rfvddlBankName" runat="server" ControlToValidate="ddlBankName"
                                                                    InitialValue="--Select--" ErrorMessage="Select Bank Name" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Save" />
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblDocumentDate" Text="Document Date *"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtDocumentDate" runat="server" OnTextChanged="txtDocDate_TextChanged"
                                                                    AutoPostBack="true" Width="100px"></asp:TextBox>
                                                                <asp:Image ID="imgPaymentRequestDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                <cc1:CalendarExtender ID="CEDocumentDate" runat="server" PopupButtonID="imgDocumentDate"
                                                                    TargetControlID="txtDocumentDate" Enabled="true">
                                                                </cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtDocumentDate" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtDocumentDate"
                                                                    ErrorMessage="Enter Document Date"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblReconStatus" runat="server" Text="Recon Status *" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:DropDownList ID="ddlReconStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlReconStatus_SelectedIndexChanged" />
                                                                <asp:RequiredFieldValidator Display="None" ID="rfvReconStatus" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="true" runat="server" ValidationGroup="Save" ControlToValidate="ddlReconStatus" InitialValue="0"
                                                                    ErrorMessage="Select Recon Status"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblOpenintBalance" runat="server" Text="Bank Book Balance" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtOpeningBalance" runat="server" ReadOnly="true" MaxLength="12"
                                                                    Style="text-align: right;" />
                                                                <asp:Label ID="lblCrDr" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblStartDate" runat="server" Text="Start Date *" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtStartDate" runat="server" Width="100px"></asp:TextBox>
                                                                <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                <cc1:CalendarExtender ID="CEStartDate" runat="server" PopupButtonID="imgStartDate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtStartDate">
                                                                </cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtStartDate" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtStartDate"
                                                                    ErrorMessage="Enter Start Date"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblEnddate" runat="server" Text="End Date *" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtEndDate" runat="server" Width="100px"></asp:TextBox>
                                                                <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                <cc1:CalendarExtender ID="CEEndDate" runat="server" PopupButtonID="ImgEndDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                    TargetControlID="txtEndDate">
                                                                </cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtEndDate" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtEndDate"
                                                                    ErrorMessage="Enter End Date"></asp:RequiredFieldValidator>
                                                                <asp:Button ID="btnFetch" Text="Fetch" ToolTip="Fetch,Alt+F" runat="server" ValidationGroup="Save"
                                                                    CssClass="styleSubmitShortButton" OnClick="btnFetch_Click" AccessKey="F" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <asp:UpdatePanel ID="updtpnl1" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton ID="lnkViewStatement" runat="server" Text="View Bank Statement" ToolTip="View Bank Statement Details"
                                                                            OnClick="lnkViewStatement_Click" Visible="false"></asp:LinkButton>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:PostBackTrigger ControlID="lnkViewStatement" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="gvUploadDtl" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center"
                                                                    EmptyDataText="No Records Found">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl.No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUpldSno" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--<asp:TemplateField HeaderText="Uploaded ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>--%>
                                                                        <%--<asp:TemplateField HeaderText="File Path">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUpldFilePath" runat="server" Text='<%# Bind("Uploaded_File") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>--%>
                                                                        <asp:TemplateField HeaderText="File Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUpldID" runat="server" Text='<%# Bind("Uploaded_ID") %>' Style="display: none"></asp:Label>
                                                                                <asp:Label ID="lblUpldFilePath" runat="server" Text='<%# Bind("Uploaded_File") %>' Style="display: none"></asp:Label>
                                                                                <asp:Label ID="lblUpldFileName" runat="server" Text='<%# Bind("File_Name") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="imgbtnViewStmt" runat="server" ToolTip="View Statement" ImageUrl="~/Images/downarrow_03.png"
                                                                                    ImageAlign="Middle" OnClick="imgbtnViewStmt_Click" Height="15px" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkFileSelect" runat="server" OnClick="javascript:fnSelectFile(this);" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="gvUploadDtl" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Receipt details" ID="tpReceiptdetails" CssClass="tabpan"
                        BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upReceiptdetails" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Panel ID="pnlREceiptDetails" Height="100%" runat="server" GroupingText="Receipt Details"
                                                    CssClass="stylePanel">

                                                    <table>
                                                        <tr>
                                                            <td width="70%">
                                                                <asp:Label ID="lblRcptSearchType" runat="server" Text="Search Filter" CssClass="styleDisplayLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlRcptSearch" runat="server"></asp:DropDownList>
                                                                <asp:TextBox ID="txtRcptSearchText" runat="server" Text="" Width="200px" MaxLength="50"></asp:TextBox>
                                                                <asp:ImageButton ID="imgbtnRcptSrch" runat="server" ToolTip="Search Receipt Details"
                                                                    ImageUrl="~/Images/search_blue.gif" OnClick="imgbtnRcptSrch_Click" />

                                                                <asp:RequiredFieldValidator ID="rfvRcptSearchType" runat="server" ControlToValidate="ddlRcptSearch" ValidationGroup="vgRcptSearch"
                                                                    Enabled="true" InitialValue="-1" Display="None" ErrorMessage="Select the Search Type"></asp:RequiredFieldValidator>
                                                                <asp:RequiredFieldValidator ID="rfvRcptSearchText" runat="server" ControlToValidate="txtRcptSearchText" ValidationGroup="vgRcptSearch"
                                                                    Enabled="true" Display="None" ErrorMessage="Enter the Search Text"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td width="20%" align="right">
                                                                <asp:DropDownList ID="ddlRcptSortType" runat="server" ToolTip="Sort By"  AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlRcptSortType_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <asp:Button ID="btnRcptShowall" runat="server" Text="Show All" CssClass="styleGridShortButton"
                                                                    ToolTip="Show All Receipt Details" OnClick="btnRcptShowall_Click" />
                                                            </td>
                                                            <td width="10%" align="right">
                                                                <asp:ImageButton ID="imgbtnExportRcpt" runat="server" ImageUrl="~/Images/Excel_Over.png" ToolTip="Export Receipt Details"
                                                                    Width="25px" OnClick="imgbtnExportRcpt_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>


                                                    <asp:GridView ID="grvReceiptDtls" runat="server" AutoGenerateColumns="False" Width="98%"
                                                        OnRowDataBound="grvReceiptDtls_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnTran_Header_Id" runat="server" Value='<%#Eval("Tran_Header_Id") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Received From">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReceivedfrom" runat="server" Text='<%# Bind("Received_From") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Receipt Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReceipt_Date" runat="server" Text='<%# Bind("DocDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Receipt Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReceipt_No" runat="server" Text='<%# Bind("DocNo") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Deposit Slip Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblChallan_No" runat="server" Text='<%# Bind("Challanref") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Instrument Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstrument_No" runat="server" Text='<%# Bind("InstrumentNo") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Drawee Bank">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgrvRcptDraweeBank" runat="server" Text='<%# Bind("DraweeBank") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("InstrumentAmout") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Clearing Status">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkClearingStatus" OnCheckedChanged="chkClearingStatusR_CheckedChanged"
                                                                        AutoPostBack="true" runat="server"
                                                                        Checked='<%# Eval("Clearing_Status").ToString() == "1" ?  true:false %>' />
                                                                    <%--Checked='<%#DataBinder.Eval(Container.DataItem, "Clearing_Status").ToString().ToUpper() == "TRUE"%>'--%>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Realization date">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtRealizationDate" runat="server" Text='<%# Bind("Realization_date") %>'
                                                                        OnTextChanged="txtRealizationDateR_TextChanged" AutoPostBack="true" Width="90px"></asp:TextBox>
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRealizationDate"
                                                                        PopupButtonID="txtRealizationDate" ID="CEtxtRealizationDate" Enabled="True" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Bank Charges">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtBank_Charges" runat="server" Style="text-align: right;"
                                                                        Text='<%# Bind("Bank_Charges") %>' Width="90px"></asp:TextBox>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtgvRcptRemarks" runat="server" Rows="2" TextMode="MultiLine" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="InstrumentDate" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstrumentDate" runat="server" Text='<%# Bind("InstrumentDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Aut_Man" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAut_Man" runat="server" Text='<%# Bind("Aut_Man") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <%--<tr align="right">
                                            <td>
                                                <table width="50%">
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            Uncleared Receipts &nbsp;
                                                            <asp:TextBox ID="txtUnclearedReceipts" runat="server" Style="text-align: right;"></asp:TextBox>
                                                            &nbsp; Charges &nbsp;
                                                            <asp:TextBox ID="txtReceiptCharges" runat="server" Style="text-align: right;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>--%>

                                        <tr align="center" width="98%">
                                            <td>
                                                <uc1:PageNavigator ID="ucReceiptPaging" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <span runat="server" id="lblRcptPageErrorMsg" style="color: Red; font-size: medium"></span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <table width="100%" class="stylePagingControl">
                                                    <tr align="right" class="stylePagingControl">
                                                        <td align="left" width="15%">
                                                            <asp:Label ID="lblMatchedRcptDesc" CssClass="styleDisplayLabel" runat="server" Text="Matched Count"></asp:Label>
                                                        </td>
                                                        <td width="10%" align="right" colspan="2">
                                                            <asp:Label ID="lblMatchedRcptCnt" CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                        </td>
                                                        <td align="right" width="60%">
                                                            <asp:Label ID="lblClearedReceiptDesc" CssClass="styleDisplayLabel" runat="server" Text="Cleared Receipts"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="right" colspan="2">
                                                            <asp:Label ID="lblClearedReceiptAmt" ToolTip="Total amount of Cleared Receipts"
                                                                CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr align="right" class="stylePagingControl">
                                                        <td align="left" width="15%">
                                                            <asp:Label ID="lblUnMatchedRcptDesc" CssClass="styleDisplayLabel" runat="server" Text="UnMatched Count"></asp:Label>
                                                        </td>
                                                        <td width="10%" align="right" colspan="2">
                                                            <asp:Label ID="lblUnMatchedRcptCnt" CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                        </td>
                                                        <td align="right" width="60%">
                                                            <asp:Label ID="Label1" CssClass="styleDisplayLabel" runat="server" Text="Uncleared Receipts"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="right" colspan="2">
                                                            <asp:Label ID="txtUnclearedReceipts" ToolTip="Total amount of Uncleared Receipts"
                                                                CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="imgbtnExportRcpt" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Payment details" ID="tpPaymenttdetails"
                        CssClass="tabpan" BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upPaymentdetails" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Panel ID="pnlPaymentDetails" Height="100%" runat="server" GroupingText="Payment Details"
                                                    CssClass="stylePanel">
                                                    <table>
                                                        <tr>
                                                            <td width="70%">
                                                                <asp:Label ID="lblPaymentSearch" runat="server" Text="Search Filter" CssClass="styleDisplayLabel"></asp:Label>
                                                                <asp:DropDownList ID="ddlPaymentSearch" runat="server"></asp:DropDownList>
                                                                <asp:TextBox ID="txtPmtSrchTxt" runat="server" Text="" Width="200px"></asp:TextBox>
                                                                <asp:ImageButton ID="imgbtnPmtSrch" runat="server" ToolTip="Search Payment Details"
                                                                    ImageUrl="~/Images/search_blue.gif" OnClick="imgbtnPmtSrch_Click" />

                                                                <asp:RequiredFieldValidator ID="rfvPmtSrchType" runat="server" ControlToValidate="ddlPaymentSearch" ValidationGroup="vgPmtSearch"
                                                                    Enabled="true" InitialValue="-1" Display="None" ErrorMessage="Select the Search Type"></asp:RequiredFieldValidator>
                                                                <asp:RequiredFieldValidator ID="rfvPmtSrchText" runat="server" ControlToValidate="txtPmtSrchTxt" ValidationGroup="vgPmtSearch"
                                                                    Enabled="true" Display="None" ErrorMessage="Enter the Search Text"></asp:RequiredFieldValidator>

                                                            </td>
                                                            <td width="20%">
                                                                <asp:DropDownList ID="ddlPmtSortType" runat="server" ToolTip="Sort By" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlPmtSortType_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <asp:Button ID="btnPmtShowAll" runat="server" Text="Show All" CssClass="styleGridShortButton"
                                                                    ToolTip="Show All Payment Details" OnClick="btnPmtShowAll_Click" />
                                                            </td>
                                                            <td width="10%" align="right">
                                                                <asp:ImageButton ID="imgbtnExportPayment" runat="server" ImageUrl="~/Images/Excel_Over.png" ToolTip="Export Payment Details"
                                                                    Width="25px" OnClick="imgbtnExportPayment_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>

                                                    <asp:GridView ID="grvPaymentDtls" runat="server" AutoGenerateColumns="False" Width="98%"
                                                        OnRowDataBound="grvPaymentDtls_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnTran_Header_Id" runat="server" Value='<%#Eval("Tran_Header_Id") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Pay To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPayTo" runat="server" Text='<%# Bind("Pay_To") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Payment Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPayment_Date" runat="server" Text='<%# Bind("DocDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Payment Doc Reference Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPayment_No" runat="server" Text='<%# Bind("DocNo") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Instrument Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstrument_No" runat="server" Text='<%# Bind("InstrumentNo") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("InstrumentAmout") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Clearing Status">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkClearingStatus" OnCheckedChanged="chkClearingStatusP_CheckedChanged"
                                                                        AutoPostBack="true" runat="server"
                                                                        Checked='<%# Eval("Clearing_Status").ToString() == "1" ?  true:false %>' />
                                                                    <%--Checked='<%#DataBinder.Eval(Container.DataItem, "Clearing_Status").ToString().ToUpper() == "TRUE"%>' --%>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Realization date">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtRealizationDate" runat="server" Text='<%# Bind("Realization_date") %>'
                                                                        OnTextChanged="txtRealizationDateP_TextChanged" AutoPostBack="true" Width="90px"></asp:TextBox>
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRealizationDate"
                                                                        PopupButtonID="txtRealizationDate" ID="CEtxtRealizationDate" Enabled="True" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Bank Charges">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtBank_Charges" runat="server" Style="text-align: right;"
                                                                        Text='<%# Bind("Bank_Charges") %>' Width="90px"></asp:TextBox>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtPmtRemarks" runat="server" Rows="2" TextMode="MultiLine" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="InstrumentDate" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstrumentDate" runat="server" Text='<%# Bind("InstrumentDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Aut_Man" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAut_Man" runat="server" Text='<%# Bind("Aut_Man") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <%-- <tr align="right">
                                            <td>
                                                <table width="50%">
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            Uncleared Payments &nbsp;
                                                            <asp:TextBox ID="txtUnclearedPayments" runat="server" Style="text-align: right;"></asp:TextBox>
                                                            &nbsp; Charges &nbsp;
                                                            <asp:TextBox ID="txtPaymentCharges" runat="server" Style="text-align: right;"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>--%>

                                        <tr align="center" width="98%">
                                            <td>
                                                <uc1:PageNavigator ID="ucPaymentPaging" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <span runat="server" id="lblpmtPageErrorMsg" style="color: Red; font-size: medium"></span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <table width="100%" class="stylePagingControl">
                                                    <tr align="right" class="stylePagingControl">
                                                        <td align="left" width="15%">
                                                            <asp:Label ID="lblMatchedPmtDesc" CssClass="styleDisplayLabel" runat="server" Text="Matched Count"></asp:Label>
                                                        </td>
                                                        <td width="10%" align="right" colspan="2">
                                                            <asp:Label ID="lblMatchedPmtCnt" CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                        </td>
                                                        <td align="right" width="60%">
                                                            <asp:Label ID="lblClearedPmtDesc" CssClass="styleDisplayLabel" runat="server"
                                                                Text="Cleared Payments"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="right" colspan="2">
                                                            <asp:Label ID="lblClearedPmtAmount" ToolTip="Total amount of Cleared Payments"
                                                                CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr align="right" class="stylePagingControl">
                                                        <td align="left" width="15%">
                                                            <asp:Label ID="lblUnMatchedPmtDesc" CssClass="styleDisplayLabel" runat="server" Text="UnMatched Count"></asp:Label>
                                                        </td>
                                                        <td width="10%" align="right" colspan="2">
                                                            <asp:Label ID="lblUnMatchedPmtCnt" CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                        </td>
                                                        <td align="right" width="60%">
                                                            <asp:Label ID="lblUnclearedPayments" CssClass="styleDisplayLabel" runat="server"
                                                                Text="Uncleared Payments"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="right" colspan="2">
                                                            <asp:Label ID="txtUnclearedPayments" ToolTip="Total amount of Uncleared Payments"
                                                                CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="imgbtnExportPayment" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="BRS details" ID="tpOtherDetails" CssClass="tabpan"
                        BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upOtherDetails" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblExportType" runat="server" Text="Export Type" CssClass="styleDisplayLabel"></asp:Label>
                                                <asp:DropDownList ID="ddlExportType" runat="server">
                                                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Grouped" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Un-Grouped" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td>
                                                <%--<asp:Panel ID="pnlAdjustments" Height="500px" runat="server" GroupingText="Manual Adjustment"
                                                    CssClass="stylePanel">--%>
                                                <table width="98%">
                                                    <tr>
                                                        <td>
                                                            <asp:GridView ID="grvAdjustments" runat="server" AutoGenerateColumns="False" Width="98%"
                                                                ShowFooter="true" OnRowDataBound="grvAdjustments_RowDataBound" OnRowCommand="grvAdjustments_RowCommand"
                                                                OnRowDeleting="grvAdjustments_RowDeleting">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblgvadjHdrID" runat="server" Text='<%#Eval("Adjustment_Hdr_ID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Add or Less" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Left"
                                                                        FooterStyle-Width="10%" ItemStyle-Width="10%">
                                                                        <HeaderTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="lbladjhdrAddLessDesc" runat="server" Text="Add or Less"></asp:Label>
                                                                                        <asp:TextBox ID="txtHeaderSearch1" runat="server" Text="" Width="50px" AutoPostBack="true"
                                                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAddOrLess" ToolTip="Add or Less" runat="server" Text='<%#Eval("AddOrLess")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:DropDownList ID="ddlFooterAddOrLess" AutoPostBack="true" onmouseover="ddl_itemchanged(this)"
                                                                                OnSelectedIndexChanged="ddlFooterAddOrLess_SelectedIndexChanged" runat="server">
                                                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                <asp:ListItem Value="2">Add</asp:ListItem>
                                                                                <%--Receipt-Credit--%>
                                                                                <asp:ListItem Value="1">Less</asp:ListItem>
                                                                                <%--Payment-Debit--%>
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator Display="None" ID="RFVddlFooterAddOrLess" CssClass="styleMandatoryLabel"
                                                                                SetFocusOnError="True" ValidationGroup="GridPaymentadj" runat="server" ControlToValidate="ddlFooterAddOrLess"
                                                                                InitialValue="0" ErrorMessage="Select Add/Less"></asp:RequiredFieldValidator>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Group Doc Ref" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <HeaderTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="lbladjhdrGroupDocDesc" runat="server" Text="Group Doc Ref"></asp:Label>
                                                                                        <asp:TextBox ID="txtHeaderSearch2" runat="server" Text="" Width="80px" AutoPostBack="true"
                                                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtgvadjGroupDocNo" ToolTip="Date" Text='<%#Eval("Group_Doc_Ref")%>' Width="80px"
                                                                                runat="server" Enabled="false" MaxLength="3"></asp:TextBox>
                                                                            <%--<cc1:FilteredTextBoxExtender ID="ftbxgvadjGroupDocNo" runat="server" TargetControlID="txtgvadjGroupDocNo"
                                                                                FilterType="Numbers" Enabled="true">
                                                                            </cc1:FilteredTextBoxExtender>--%>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtgvadjFtrGroupDocRefNo" runat="server" MaxLength="3" Width="80px"></asp:TextBox>
                                                                            <%--<cc1:FilteredTextBoxExtender ID="ftbxgvadjFtrGroupDocRefNo" runat="server" TargetControlID="txtgvadjFtrGroupDocRefNo"
                                                                                FilterType="Numbers" Enabled="true">
                                                                            </cc1:FilteredTextBoxExtender>--%>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Doc Ref" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <HeaderTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="lbladjhdrDocDesc" runat="server" Text="Doc Ref"></asp:Label>
                                                                                        <asp:TextBox ID="txtHeaderSearch3" runat="server" Text="" AutoPostBack="true"
                                                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDoc_Ref" ToolTip="Date" Text='<%#Eval("Doc_Ref")%>' Width="100%"
                                                                                runat="server"></asp:Label>

                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtftrgvadjDocumentNo" runat="server" Text="" MaxLength="20" Enabled="false" Width="100px"></asp:TextBox>
                                                                            <asp:DropDownList ID="ddlDoc_Ref" runat="server" Visible="false">
                                                                            </asp:DropDownList>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <HeaderTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="lbladjhdrDocDate" runat="server" Text="Date"></asp:Label>
                                                                                        <asp:TextBox ID="txtHeaderSearch4" runat="server" Text="" Width="90px" AutoPostBack="true"
                                                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAdj_Date" ToolTip="Date" Text='<%#Eval("Adj_Date")%>' Width="100%"
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtAdj_Date" Width="90px" runat="server"></asp:TextBox>
                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtAdj_Date"
                                                                                PopupButtonID="txtAdj_Date" ID="CEtxtAdj_Date" Enabled="True" />
                                                                            <asp:RequiredFieldValidator ID="rfvAdj_Date" runat="server" Display="None" ControlToValidate="txtAdj_Date"
                                                                                ValidationGroup="Adjustments" ErrorMessage="Enter Date" CssClass="styleMandatoryLabel"
                                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <HeaderTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="lbladjhdrDescription" runat="server" Text="Description"></asp:Label>
                                                                                        <asp:TextBox ID="txtHeaderSearch5" runat="server" Text="" AutoPostBack="true"
                                                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDescription" ToolTip="Date" Text='<%#Eval("Description")%>' Width="100%"
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtDescription" Width="150px" runat="server"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" Display="None" ControlToValidate="txtDescription"
                                                                                ValidationGroup="Adjustments" ErrorMessage="Enter Description" CssClass="styleMandatoryLabel"
                                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <HeaderTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="lbladjhdrAmount" runat="server" Text="Amount"></asp:Label>
                                                                                        <asp:TextBox ID="txtHeaderSearch6" runat="server" Text="" Width="80px" AutoPostBack="true"
                                                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" Style="text-align: right" ToolTip="Amount" Width="100%"
                                                                                runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtAmount" Style="text-align: right" Width="95%" runat="server"></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                            <asp:RequiredFieldValidator ID="RFVtxtAmount" runat="server" Display="None" ControlToValidate="txtAmount"
                                                                                ValidationGroup="Adjustments" ErrorMessage="Enter Amount" CssClass="styleMandatoryLabel"
                                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Negate">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkNegate" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "Negate").ToString().ToUpper() == "TRUE"%>'
                                                                                OnCheckedChanged="chkNegate_CheckedChanged" AutoPostBack="true" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:CheckBox ID="chkNegateF" runat="server" />
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Adj Doc Ref" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtAdjDoc_Ref" ToolTip="Adj Doc Ref" Text='<%#Eval("Adj_Doc_Ref")%>'
                                                                                Width="100px" runat="server" Enabled="false"></asp:TextBox>
                                                                            <asp:DropDownList ID="ddlAdjDoc_RefI" OnSelectedIndexChanged="ddlAdjDoc_RefI_SelectedIndexChanged"
                                                                                AutoPostBack="true" runat="server" Visible="false">
                                                                            </asp:DropDownList>
                                                                            <%--  <asp:TextBox ID="txtAdjDoc_Ref" Style="text-align: right" Text='<%#Eval("Adj_Doc_Ref")%>'
                                                                        Width="90%" runat="server"></asp:TextBox>--%>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtftrgvAdjstDocRefNo" runat="server" Text="" MaxLength="20"></asp:TextBox>

                                                                            <asp:DropDownList ID="ddlAdjDoc_Ref" runat="server" Visible="false">
                                                                            </asp:DropDownList>
                                                                            <%-- <asp:RequiredFieldValidator ID="rfvddlAdjDoc_Ref" runat="server" Display="None" ControlToValidate="ddlAdjDoc_Ref"
                                                                        InitialValue="0" ValidationGroup="Adjustments" ErrorMessage="Select Doc Ref"
                                                                        CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="25%" FooterStyle-Width="25%" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtAdjstRemarks" TextMode="MultiLine" Wrap="true" Rows="2" Width="195px"
                                                                                MaxLength="100" onkeyup="maxlengthfortxt(100);" runat="server" Text='<%#Eval("Remarks")%>'></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtAdjstFtrRemarks" TextMode="MultiLine" Rows="2" Width="195px" MaxLength="100"
                                                                                onkeyup="maxlengthfortxt(100);" runat="server" Wrap="true"></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="AutoManual" Visible="false" ItemStyle-Width="25%"
                                                                        FooterStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAutoManual" Text='<%#Eval("AutoManual")%>' Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
                                                                        ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkbtngvAdjEdit" runat="server" OnClick="lnkbtngvAdjEdit_Click"
                                                                                CausesValidation="false" Text="Edit"></asp:LinkButton>
                                                                            <asp:LinkButton ID="lnkbtngvRemove" runat="server" OnClick="lnkbtngvRemove_Click"
                                                                                CausesValidation="false" Text="Delete"></asp:LinkButton>
                                                                            <asp:LinkButton ID="lnkbtngvAdjCancel" runat="server" OnClick="lnkbtngvAdjCancel_Click"
                                                                                CausesValidation="false" Text="Cancel"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="lnkAdd" ToolTip="Add to the grid" runat="server" ValidationGroup="Adjustments"
                                                                                Text="Add" CommandName="Add" CssClass="styleGridShortButton"></asp:Button>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr align="center" width="98%">
                                                        <td>
                                                            <uc1:PageNavigator ID="ucAdjstPaging" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <span runat="server" id="lblAdjstPageError" style="color: Red; font-size: medium"></span>
                                                        </td>
                                                    </tr>

                                                    <tr align="center">
                                                        <td>
                                                            <asp:Button ID="btnGetAdj" Text="Adjustments" ToolTip="Adjustments" runat="server"
                                                                ValidationGroup="Save" CssClass="styleSubmitButton" OnClick="btnGetAdj_Click" />
                                                            &nbsp;
                                                            <asp:Button ID="btnProbableMatch" Text="Probable Match" ToolTip="Probable Match Details" runat="server"
                                                                CssClass="styleSubmitButton" OnClick="btnProbableMatch_Click" />
                                                            &nbsp;
                                                            <asp:Button ID="btnAdjShowAll" Text="Show All" ToolTip="Show All Reconciliation Details" runat="server"
                                                                CssClass="styleSubmitButton" OnClick="btnAdjShowAll_Click" />
                                                            &nbsp;
                                                            <asp:Button ID="btnExcel" Text="Excel" ToolTip="Excel" runat="server"
                                                                ValidationGroup="Save" CssClass="styleSubmitButton" OnClick="btnExcel_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                            <table style="text-align: left">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblAMCreditCount" runat="server" Text="" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblAMDebitCount" runat="server" Text="" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <%-- </asp:Panel>--%>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td>
                                                <asp:GridView ID="grvStagingtbl" runat="server" AutoGenerateColumns="true" ShowFooter="false">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Recon Status">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkRecon" runat="server" Enabled="false" Checked='<%#Convert.ToBoolean(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"Recon_Status"))) == true %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="Panel1" Height="100%" runat="server" GroupingText="Previous Adjustment"
                                                    CssClass="stylePanel" Visible="false">
                                                    <asp:GridView ID="grvPrevAdjustments" runat="server" AutoGenerateColumns="False"
                                                        Width="98%" OnRowDataBound="grvPrevAdjustments_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Add or Less" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Left"
                                                                FooterStyle-Width="10%" ItemStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAddOrLess" ToolTip="Add or Less" runat="server" Text='<%#Eval("AddOrLess")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Ref" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                                                FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoc_Ref" ToolTip="Date" Text='<%#Eval("Doc_Ref")%>' Width="100%"
                                                                        runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                                                FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAdj_Date" ToolTip="Date" Text='<%#Eval("Adj_Date")%>' Width="100%"
                                                                        runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                                                FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDescription" ToolTip="Date" Text='<%#Eval("Description")%>' Width="100%"
                                                                        runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                                                FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmount" Style="text-align: right" ToolTip="Amount" Width="100%"
                                                                        runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Negate">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkNegate" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "Negate").ToString().ToUpper() == "TRUE"%>' OnCheckedChanged="chkNegate_CheckedChanged" AutoPostBack="true" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Adj Doc Ref" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%"
                                                                FooterStyle-Width="15%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAdjDoc_Ref" ToolTip="Adj Doc Ref" Text='<%#Eval("Adj_Doc_Ref")%>'
                                                                        Width="100%" runat="server"></asp:Label>
                                                                    <asp:DropDownList ID="ddlAdjDoc_RefI" OnSelectedIndexChanged="ddlAdjDoc_RefI_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                                    </asp:DropDownList>
                                                                    <%--  <asp:TextBox ID="txtAdjDoc_Ref" Style="text-align: right" Text='<%#Eval("Adj_Doc_Ref")%>'
                                                                        Width="90%" runat="server"></asp:TextBox>--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtRemarks" TextMode="MultiLine" Wrap="true" Rows="2" Width="195px"
                                                                        MaxLength="100" onkeyup="maxlengthfortxt(100);" runat="server" Text='<%#Eval("Remarks")%>'></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%-- <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
                                                                ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="lnkRemove" ToolTip="Remove from the grid" runat="server" CommandName="Delete"
                                                                        CausesValidation="false" Text="Delete" CssClass="styleGridShortButton"></asp:Button>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <table width="100%" class="stylePagingControl">
                                                    <tr class="stylePagingControl">
                                                        <td align="left" width="15%">
                                                            <asp:Label ID="lblAdjBankCredit" CssClass="styleDisplayLabel" runat="server" Text="Bank Credit"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="left">
                                                            <asp:Label ID="lblTotBankCredit" ToolTip="Total amount of Bank Credit" CssClass="styleDisplayLabel"
                                                                runat="server" Text="0"></asp:Label>
                                                        </td>
                                                        <td width="40%">&nbsp;
                                                        </td>
                                                        <td align="right" width="15%">
                                                            <asp:Label ID="lblUnclearedAdjust" CssClass="styleDisplayLabel" runat="server" Text="Bank Arrived"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="right" colspan="2">
                                                            <asp:Label ID="txtUnclearedAdjust" ToolTip="Total amount of Uncleared Adjust" CssClass="styleDisplayLabel"
                                                                runat="server" Text="0"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr class="stylePagingControl">
                                                        <td align="left" width="15%">
                                                            <asp:Label ID="lblAdjBankDebit" CssClass="styleDisplayLabel" runat="server" Text="Bank Debit"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="left">
                                                            <asp:Label ID="lblTotBankDebit" ToolTip="Total amount of Bank Debit" CssClass="styleDisplayLabel"
                                                                runat="server" Text="0"></asp:Label>
                                                        </td>
                                                        <td width="40%">&nbsp;
                                                        </td>
                                                        <td align="right" width="15%">
                                                            <asp:Label ID="lblBankStamt" CssClass="styleDisplayLabel" runat="server" Text="Bank Statement"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="right" colspan="2">
                                                            <asp:TextBox ID="lblTotBankStamt" Style="text-align: right;" ToolTip="Total amount of Uncleared Adjust"
                                                                CssClass="styleDisplayLabel" runat="server" onchange="javascript:fnCalcDiff();"></asp:TextBox>
                                                            <%-- <asp:RequiredFieldValidator Display="None" ID="RFVlblTotBankStamt" CssClass="styleMandatoryLabel"
                                                                SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="lblTotBankStamt"
                                                                ErrorMessage="Enter Bank Statement in BRS details"></asp:RequiredFieldValidator>--%>
                                                        </td>
                                                    </tr>
                                                    <tr class="stylePagingControl">
                                                        <td align="left" width="15%"></td>
                                                        <td align="left" width="15%"></td>
                                                        <td width="40%">&nbsp;
                                                        </td>
                                                        <td align="right" width="15%">
                                                            <asp:Label ID="lblBSDiff" CssClass="styleDisplayLabel" runat="server" Text="Diff"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="right" colspan="2">
                                                            <asp:Label ID="lblBRSDiffAmount" CssClass="styleDisplayLabel" runat="server" Text=""></asp:Label>
                                                            <asp:Label ID="lblSuffix" CssClass="styleDisplayLabel" runat="server" Text="" Style="display: none;"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnExcel" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <cc1:ModalPopupExtender ID="mpePblMatch" runat="server" TargetControlID="btnModal" PopupControlID="pnlPblMatch"
                                BackgroundCssClass="styleModalBackground" Enabled="true" />
                            <asp:Panel ID="pnlPblMatch" Style="display: none; vertical-align: middle;" runat="server"
                                BorderStyle="Solid" BackColor="White" Width="800px" ScrollBars="Auto" GroupingText="Probable Match"
                                CssClass="stylePanel" Height="500px">
                                <asp:UpdatePanel ID="updtpnlMatch" runat="server">
                                    <ContentTemplate>
                                        <table width="95%">
                                            <tr>
                                                <td width="40%">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="gvPblMatchType" runat="server" AutoGenerateColumns="false" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Add">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtgvpblAdd" runat="server" Text="" Width="60px" MaxLength="1"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftbxgvpblAdd" runat="server" TargetControlID="txtgvpblAdd"
                                                                                    FilterType="Numbers" Enabled="true">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="25%" HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Less">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtgvpblLess" runat="server" Text="" Width="60px" MaxLength="1"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftbxgvpblLess" runat="server" TargetControlID="txtgvpblLess"
                                                                                    FilterType="Numbers" Enabled="true">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="25%" HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Type Code" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvpblSearchType" runat="server" Text='<%#Eval("Lookup_Code")%>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="50%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvpblSearchDesc" runat="server" Text='<%#Eval("Lookup_Desc")%>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="50%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="25%">
                                                    <table>
                                                        <tr align="left">
                                                            <td>
                                                                <asp:Button ID="btnpblMatchProcess" runat="server" Text="Fetch" CssClass="styleGridShortButton"
                                                                    OnClick="btnpblMatchProcess_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="btnpblMatchFixed" runat="server" Text="Match" CssClass="styleGridShortButton"
                                                                    OnClick="btnpblMatchFixed_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="btnPblMtchExport" runat="server" Text="Excel" CssClass="styleGridShortButton"
                                                                    OnClick="btnPblMtchExport_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="btnPblMtchReDup" runat="server" Text="Duplicate" CssClass="styleGridShortButton"
                                                                    OnClick="btnPblMtchReDup_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="35%"></td>
                                            </tr>
                                        </table>

                                        <table width="95%">
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="gvpblMatchDtl" runat="server" AutoGenerateColumns="false" Width="98%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Hdr ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvMtchAdjHdrID" runat="server" Text='<%#Eval("Adj_Hdr_ID")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvMtchDocDate" runat="server" Text='<%#Eval("Document_Date")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Group Doc Ref">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvMtchGroupDocRef" runat="server" Text='<%#Eval("Group_Doc_Ref")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Ref">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvMtchDocRef" runat="server" Text='<%#Eval("Document_Number")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Description">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvMtchDesc" runat="server" Text='<%#Eval("Description")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Deposit Slip">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvMtchDepositSlip" runat="server" Text='<%#Eval("Deposit_Slip")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Add">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvMtchAddAmount" runat="server" Text='<%#Eval("Credit_Amount")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Less">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvMtchLessAmount" runat="server" Text='<%#Eval("Debit_Amount")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkbxHdrSelectAll" runat="server" Text="Select All"
                                                                        OnCheckedChanged="chkbxHdrSelectAll_CheckedChanged" AutoPostBack="true" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkbxDtlSelect" runat="server"
                                                                        Checked='<%# Eval("Is_Checked").ToString() == "1" ?  true:false %>' onclick="fnPblMatchChange();" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr align="center" width="98%">
                                                <td>
                                                    <uc1:PageNavigator ID="ucPblMatchPaging" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table width="98%" class="stylePagingControl">
                                                        <tr>
                                                            <td align="right" width="80%">
                                                                <asp:Label ID="lblpblMtchAddDesc" runat="server" Text="Total ADD Amount" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                            <td align="right" width="10%">
                                                                <asp:Label ID="lblpblMtchAddAmt" runat="server" Text="" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" width="80%">
                                                                <asp:Label ID="lblpblMtchLessDesc" runat="server" Text="Total Less Amount" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                            <td align="right" width="10%">
                                                                <asp:Label ID="lblpblMtchLessAmt" runat="server" Text="" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <span runat="server" id="lblPblPageError" style="color: Red; font-size: medium"></span>
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="95%">
                                            <tr align="center">
                                                <td>
                                                    <asp:Button ID="btnpblClose" runat="server" Text="Close" CssClass="styleGridShortButton" OnClick="btnpblClose_Click" />
                                                    <asp:Button ID="btnpblMtchUpdate" runat="server" Text="Update" CssClass="styleGridShortButton" OnClick="btnpblMtchUpdate_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnPblMtchExport" />
                                        <asp:PostBackTrigger ControlID="btnpblMtchUpdate" />
                                        <asp:PostBackTrigger ControlID="btnPblMtchReDup" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </asp:Panel>
                            <asp:Button ID="btnModal" Style="display: none" runat="server" />

                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
                <asp:HiddenField ID="hdnPblMatchChange" runat="server" />
            </td>
        </tr>

        <tr align="center">
            <td>
                <asp:Button runat="server" ID="btnSave" Text="Save" ToolTip="Save Bank Reconciliation Details,Alt+S"
                    CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Save')"
                    ValidationGroup="Save" OnClick="btnSave_Click" AccessKey="S" />
                &nbsp;
                <asp:Button runat="server" ID="btnClear" OnClick="btnClear_Click" ToolTip="Clear_FA"
                    Text="Clear_FA" CausesValidation="false" CssClass="styleSubmitButton" />
                &nbsp;
                <asp:Button runat="server" ID="btnCancel" Text="Exit" ToolTip="Cancel" CausesValidation="false"
                    CssClass="styleSubmitButton" OnClick="btnCancel_Click" AccessKey="X" />
                &nbsp;
                <asp:Button runat="server" ID="btnPrint" Text="Print" ToolTip="Print" CausesValidation="false"
                    CssClass="styleSubmitButton" OnClick="btnPrint_Click" />
                &nbsp;
                <asp:Button runat="server" ID="btnAdjst" Text="Manual Group List" ToolTip="Manual Group List" CausesValidation="false"
                    CssClass="styleSubmitButton" OnClick="btnAdjst_Click" />
                &nbsp;
                <asp:Button runat="server" ID="btnAutoMatch" Text="Auto Match" ToolTip="Auto Match" CausesValidation="false"
                    Visible="false" CssClass="styleSubmitButton" OnClick="btnAutoMatch_Click" />
                <asp:Button runat="server" ID="btnAutoMatchNew" Text="Auto Match" ToolTip="Auto Match,Alt+M" AccessKey="M" CausesValidation="false"
                    CssClass="styleSubmitButton" OnClick="btnAutoMatchNew_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="CVBRS" runat="server" CssClass="styleMandatoryLabel" Enabled="true" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ValidationGroup="Save" ID="vs_BRS" runat="server" CssClass="styleMandatoryLabel"
                    HeaderText="Correct the following validation(s):  " />
                &nbsp;
                <asp:ValidationSummary ValidationGroup="Adjustments" ID="VSAdjustment" runat="server"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                <asp:ValidationSummary ValidationGroup="vgRcptSearch" ID="vsRcptSearch" runat="server"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                <asp:ValidationSummary ValidationGroup="vgPmtSearch" ID="vsPmtSearch" runat="server"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
            </td>
        </tr>
    </table>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
