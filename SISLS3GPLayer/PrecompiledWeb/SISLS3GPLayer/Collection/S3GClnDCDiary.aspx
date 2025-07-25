<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnDCDiary, App_Web_4kkykzxm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GDynamicLOV.ascx" TagName="FLOV" TagPrefix="uc" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function MFCUser_ItemSelected(sender, e) {
            var hdnMFCUserID = $get('<%= hdnMFCUserID.ClientID %>');
            hdnMFCUserID.value = e.get_value();
        }
        function MFCUser_ItemPopulated(sender, e) {
            var hdnMFCUserID = $get('<%= hdnMFCUserID.ClientID %>');
            hdnMFCUserID.value = '';
        }
        function fnNewLoadCustomer() {
            document.getElementById("<%= btnNewLoadCustomer.ClientID %>").click();

        }
    </script>
    <asp:UpdatePanel ID="updDCDiary" runat="server">
        <ContentTemplate>
            <table width="100%" border="0">
                <tr>
                    <td class="stylePageHeading" width="100%">

                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="DC Diary">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        <asp:Panel ID="pnlGeneral" runat="server" CssClass="stylePanel" GroupingText="Common Details"
                            Width="99%">
                            <table width="100%">
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Diary Number" ID="lblDairyNo" CssClass="styleDisplayLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox runat="server" ID="txtDairyNumber" Width="120px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            ToolTip="Line of Business">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Branch" ID="lblBranch" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlBranch" AutoPostBack="true" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                            runat="server">
                                        </asp:DropDownList>
                                      <%--  <uc:Suggest ID="ddlBranch" ToolTip="Location" runat="server" AutoPostBack="True"
                                            OnItem_Selected="ddlBranch_SelectedIndexChanged" ServiceMethod="GetBranchList"
                                            IsMandatory="true" ValidationGroup="VGPDC" ErrorMessage="Select a Location" WatermarkText="--Select--" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code/Name" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txt_CustomerNames" runat="server" MaxLength="50" Style="display: none;"></asp:TextBox>
                                        <uc3:ICM ID="ucCustomerCodeLov" HoverMenuExtenderLeft="true" runat="server" TextWidth="122px" DispalyContent="Both" onblur="return fnNewLoadCustomer();" strLOV_Code="CMDFOUR" />
                                        <asp:Button ID="btnNewLoadCustomer" runat="server" Text="Load Customer" OnClick="btnNewLoadCustomer_Click"
                                            Style="display: none" /><input id="hdnCustID" type="hidden" runat="server" />
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Account Number" ID="lblprimeaccno" CssClass="styleDisplayLabel"></asp:Label></td>
                                    <td class="styleFieldAlign">
                                        <uc:Suggest ID="ddlPAN" runat="server" ServiceMethod="GetAccountList" />
                                    </td>
                                    <td class="styleFieldLabel">

                                        <td class="styleFieldAlign"></td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Action Start Date" ID="lblActionStartDate" CssClass="styleDisplayLabel"></asp:Label></td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox runat="server" ID="txtActionStartDate" Width="80px" ContentEditable="False"></asp:TextBox>
                                        <asp:Image ID="imgActionStartDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                            ToolTip="Transaction Date" />
                                        <cc1:CalendarExtender ID="CECActionStartDate" runat="server" Enabled="false" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="imgActionStartDate" TargetControlID="txtActionStartDate" Format="dd/MM/yyyy">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Action End Date" ID="lblActionEndDate" CssClass="styleDisplayLabel"></asp:Label></td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox runat="server" ID="txtActionEndDate" Width="80px" ContentEditable="False"></asp:TextBox>
                                        <asp:Image ID="imgActionEndDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                            ToolTip="Transaction Date" />
                                        <cc1:CalendarExtender ID="calActionEndDate" runat="server" Enabled="false" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="imgActionEndDate" TargetControlID="txtActionEndDate" Format="dd/MM/yyyy">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Button ID="btnSearch" CssClass="styleSubmitShortButton" runat="server" Text="Go"
                                            ToolTip="Go to the Details, Alt+G" AccessKey="G" OnClick="btnSearch_Click" /></td>
                                    <td class="styleFieldAlign"></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:TabContainer ID="TabContainerAP" runat="server" CssClass="styleTabPanel" Width="100%"
                            ScrollBars="None" ActiveTabIndex="0" onchange="fnSetDivWidth();">
                            <cc1:TabPanel runat="server" ID="TabMainPage" CssClass="tabpan" BackColor="Red" Width="100%">
                                <HeaderTemplate>
                                    DC Diary
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="upOfferTerms" runat="server">
                                        <ContentTemplate>
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <div id="divacc" runat="server" class="container" style="height: 280px; overflow-y: scroll; overflow-x: hidden; display: block">
                                                            <asp:Panel ID="pnlacc" runat="server" GroupingText="Account Details" Visible="false" CssClass="stylePanel">
                                                                <asp:GridView ID="grvprimeaccount" runat="server" AutoGenerateColumns="False"
                                                                    BorderWidth="2">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="2%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1%>" ToolTip="SI.NO"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account No." ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMLA" runat="server" Text='<%#Eval("PRIMEACCOUNTNO")%>' ToolTip="Account No"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sub Account No." Visible="false" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSLA" runat="server" Text='<%#Eval("SUBACCOUNTNO")%>' ToolTip="Sub Account No"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account Status" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccountStatus" runat="server" Text='<%#Eval("ACCOUNTSTATUS")%>' ToolTip="Account Status"></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select" SortExpression="Sellect">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSelectAccount" runat="server" AutoPostBack="true" ToolTip="Select Account" OnCheckedChanged="chkSelectAccount_CheckedChanged" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:LinkButton ID="lnkViewSOA" runat="server" CssClass="styleSubmitButton" Text="View SOA"
                                                            Visible="false" AccessKey="V" ToolTip="To View SOA Details, ALT+V" />
                                                        <asp:LinkButton ID="lnkODIView" runat="server" CssClass="styleSubmitButton" Text="View ODI Calculation"
                                                            Visible="false" AccessKey="A" ToolTip="To View ODI Details, ALT+A" />
                                                        <asp:LinkButton ID="lnkRemarksEntry" runat="server" CssClass="styleSubmitButton" Text="Remarks Entry"
                                                            Visible="false" AccessKey="R" ToolTip="To View Remarks Details, ALT+R" />
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td>
                                                        <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitButton" Text="Go" OnClientClick="return fnCheckPageValidators('btnGo',false);"
                                                            ValidationGroup="btnGo" Visible="false" />
                                                        <asp:Button ID="btnclear" runat="server" CssClass="styleSubmitButton" Text="Clear" OnClientClick="return fnConfirmClear();" Visible="false" />

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" style="width: 95%">
                                                        <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="divUpUpdChqHdrDtls"
                                                            ExpandControlID="divUpUpdChqHdr" CollapseControlID="divUpUpdChqHdr" Collapsed="True"
                                                            TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                                                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
                                                        <asp:Panel ID="divUpUpdChqHdr" runat="server" CssClass="accordionHeader" Width="98.5%">
                                                            <div style="float: left;">
                                                                Update Cheque Remarks
                                                            </div>
                                                            <div style="float: left; margin-left: 20px;">
                                                                <asp:Label ID="lblDetails" runat="server">(Show Details...)</asp:Label>
                                                            </div>
                                                            <div style="float: right; vertical-align: middle;">
                                                                <asp:ImageButton ID="imgDetails" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                                    AlternateText="(Show Details...)" />
                                                            </div>
                                                        </asp:Panel>
                                                        <asp:Panel ID="divUpUpdChqHdrDtls" runat="server" GroupingText="Update Cheque Remarks" CssClass="stylePanel" Width="95%" ScrollBars="None">
                                                            <div id="div1" runat="server" class="container" style="height: 280px; width: 100%; overflow-y: scroll; overflow-x: hidden; display: block">
                                                                <asp:GridView ID="grvUpdateChequeRemarks" OnRowDataBound="grvUpdateChequeRemarks_RowDataBound" runat="server" AutoGenerateColumns="False" ShowFooter="false"
                                                                    Width="98%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCSlNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="2%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Receipt No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReceiptNo" runat="server" Text='<%# Bind("RECEIPT_NO")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Receipt Date" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReceiptDate" runat="server" Text='<%# Bind("RECEIPT_DATE")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Return Date" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRetrurnDate" runat="server" Text='<%# Bind("CHEQUE_RETURN_ADVICE_DATE")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Reason" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReason" runat="server" Text='<%# Bind("Reason")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PTP Date" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtPTPDate" runat="server" Width="100px" Text='<%# Bind("PTP_Date")%>'></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="CEPTPDateChqDet" runat="server" Enabled="True" TargetControlID="txtPTPDate">
                                                                                </cc1:CalendarExtender>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtRemarks" TextMode="MultiLine" onkeyup="maxlengthfortxt(200);" runat="server" Text='<%# Bind("Remarks")%>'></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EmptyDataTemplate>
                                                                        <span>No Records Found...</span>
                                                                    </EmptyDataTemplate>
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="width: 95%">
                                                        <asp:Panel ID="pnldiary" runat="server" GroupingText="Diary Details" Visible="false" CssClass="stylePanel" Width="95%" ScrollBars="None">
                                                            <div id="divpopup" runat="server" class="container" style="height: 280px; width: 100%; overflow-y: scroll; overflow-x: hidden; display: block">
                                                                <asp:GridView ID="grvDCDairyPopUp" OnRowDataBound="grvDCDairyPopUp_RowDataBound" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                                                                    Width="98%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCSlNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="2%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCPANUM" runat="server" Text='<%# Bind("PANUM")%>'></asp:Label>
                                                                                <asp:Label ID="lbldiary_id" Visible="false" runat="server" Text='<%# Bind("diary_id")%>'></asp:Label>
                                                                                <asp:Label ID="lblDemandProcessdtl_id" Visible="false" runat="server" Text='<%# Bind("Demand_Process_Detail_ID")%>'></asp:Label>
                                                                                <asp:Label ID="lblDemandProcess_id" Visible="false" runat="server" Text='<%# Bind("Demand_Process_ID")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Cash Flow Desc" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCCASHFLOW" runat="server" Visible="false" Text='<%# Bind("DUE_FLAG")%>'>></asp:Label>
                                                                                <asp:Label ID="lblgrvDCCASHFLOW_DESC" runat="server" Text='<%# Bind("CASHFLOWDESCRIPTION")%>'>></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Due Date" ControlStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCDueDate" runat="server" Text='<%# Bind("DUE_DATE")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblgrvDCTotal" runat="server" Text="Total"></asp:Label>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCDueAmount" runat="server" Text='<%# Bind("DUE_AMOUNT")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtgrvDCDueSum" runat="server" Width="75px" ContentEditable="False" Text='<%# Bind("DUE_AMOUNT_SUM")%>'>
                                                                                </asp:TextBox>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collection" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCCollection" runat="server" Text='<%# Bind("COLLECTION")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtgrvDCTotalCollection" Width="75px" ContentEditable="False" runat="server">
                                                                                </asp:TextBox>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Balance" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCBalance" runat="server" Text='<%# Bind("BALANCE")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtgrvDCTotalbalSum" Width="75px" ContentEditable="False" runat="server">
                                                                                </asp:TextBox>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="DC Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCName" runat="server" Text='<%# Bind("DC_NAME")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="1%" />

                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Recorded By" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCUserId" Text='<%# Bind("User_Id")%>' Visible="false" runat="server"></asp:Label>
                                                                                <asp:Label ID="lblgrvDCRecordedby" Text='<%# Bind("User_Name")%>' runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="1%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="1%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PTP Date" ControlStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtgrvDCPTPdate" Text='<%# Bind("PTP_DATE")%>' runat="server"> </asp:TextBox>
                                                                                <cc1:CalendarExtender
                                                                                    ID="CEPTPDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" TargetControlID="txtgrvDCPTPdate">
                                                                                </cc1:CalendarExtender>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PTP Amount">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtgrvDCValue" Style="text-align: right" Text='<%# Bind("VALUE_AMNT")%>' Width="60px" MaxLength="15" runat="server"> </asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fgrvDCvalue" runat="server" Enabled="True" FilterType="Custom,Numbers" ValidChars="."
                                                                                    TargetControlID="txtgrvDCValue">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtgrvDCRemarks" Text='<%# Bind("REMARKS")%>' Width="200px" onkeyup="maxlengthfortxt(200)" TextMode="MultiLine" runat="server"> </asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDcStatus" Visible="false" runat="server" Text='<%# Bind("STATUS_ID")%>'></asp:Label>
                                                                                <asp:DropDownList ID="ddlgrvDCStatus" runat="server"></asp:DropDownList>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="UpdateStatus" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgrvDCUpdateStatus" Visible="false" runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="1%" />
                                                                            <FooterStyle HorizontalAlign="Right" Width="1%" />
                                                                        </asp:TemplateField>

                                                                    </Columns>
                                                                    <EmptyDataTemplate>
                                                                        <span>No Records Found...</span>
                                                                    </EmptyDataTemplate>
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="width: 95%">
                                                        <asp:Panel ID="pnldiaryhistory" runat="server" GroupingText="History Details" Visible="false" CssClass="stylePanel" Width="95%" ScrollBars="None">
                                                            <div id="divhis" runat="server" class="container" style="height: 250px; width: 100%; overflow-y: scroll; overflow-x: hidden; display: block">
                                                                <asp:GridView ID="grvDCDairyPopUpOld" OnRowDataBound="grvDCDairyPopUpOld_RowDataBound" runat="server" AutoGenerateColumns="False"
                                                                    Width="98%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDSlNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDPANUM" runat="server" Text='<%# Bind("PANUM")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Cash Flow Desc" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDCASHFLOW" runat="server" Visible="false" Text='<%# Bind("DUE_FLAG")%>'>></asp:Label>
                                                                                <asp:Label ID="lblgvDCOLDCASHFLOW_DESC" runat="server" Text='<%# Bind("CASHFLOWDESCRIPTION")%>'>></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Due Date" ControlStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDDueDate" runat="server" Text='<%# Bind("DUE_DATE")%>'></asp:Label>
                                                                            </ItemTemplate>

                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDDueAmount" runat="server" Text='<%# Bind("DUE_AMOUNT")%>'></asp:Label>
                                                                            </ItemTemplate>

                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collection" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDCollection" runat="server" Text='<%# Bind("COLLECTION")%>'></asp:Label>
                                                                            </ItemTemplate>

                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Balance" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDBalance" runat="server" Text='<%# Bind("BALANCE")%>'></asp:Label>
                                                                            </ItemTemplate>

                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="DC Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDDCName" runat="server" Text='<%# Bind("DC_NAME")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="1%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Recorded By" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDUserId" Text='<%# Bind("User_Id")%>' Visible="false" runat="server"></asp:Label>
                                                                                <asp:Label ID="lblgvDCOLDRecordedby" Text='<%# Bind("User_Name")%>' runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PTP Date" ControlStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="txtgvDCOLDPTPdate" Text='<%# Bind("PTP_DATE")%>' runat="server"> </asp:Label>
                                                                                <%-- <cc1:CalendarExtender
                                                                    ID="CEgvDCOLDPTPDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" TargetControlID="txtgvDCOLDPTPdate">
                                                                </cc1:CalendarExtender>--%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PTP Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="txtgvDCOLDValue" Text='<%# Bind("VALUE_AMNT")%>' Width="60px" runat="server"> </asp:Label>
                                                                                <%--                                                    <cc1:FilteredTextBoxExtender ID="fvalue" runat="server" Enabled="True" FilterType="Custom,Numbers" ValidChars="."
                                                                    TargetControlID="txtgvDCOLDValue">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="txtgvDCOLDRemarks" Text='<%# Bind("REMARKS")%>' onkeyup="maxlengthfortxt(200)"
                                                                                    TextMode="MultiLine" runat="server"> </asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDDcStatus" Visible="true" runat="server" Text='<%# Bind("STATUS_ID")%>'></asp:Label>
                                                                                <asp:DropDownList ID="ddlgvDCOLDStatus" Visible="false" runat="server"></asp:DropDownList>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="UpdateStatus" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvDCOLDUpdateStatus" Visible="false" runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
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
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabOfferTerms" CssClass="tabpan" BackColor="Red"
                                Width="100%">
                                <HeaderTemplate>
                                    Remarks Entry
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="updRemarks" runat="server">
                                        <ContentTemplate>
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="center">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label runat="server" Text="Remarks Type" ID="Label1" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldLabelBold" style="font-weight: bold;" align="center">
                                                                    <asp:RadioButtonList ID="rbnRemarksType" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="rbnRemarksType_SelectedIndexChanged">
                                                                        <asp:ListItem Value="1" Text="Outbox"></asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="InBox"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 15px;"></td>
                                                </tr>
                                                <tr class="stylePagingControl">
                                                    <td class="styleFieldLabelBold" style="font-weight: bold; height: 30px;" align="center">
                                                        <asp:Label ID="lblhdrR" runat="server" Width="80px" Text="Outbox"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel GroupingText="Inbox Details" ID="pnlInBoxDts" runat="server"
                                                            CssClass="stylePanel" Visible="false">
                                                            <asp:GridView ID="grvInBox" runat="server" AutoGenerateColumns="False"
                                                                BorderWidth="2">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="2%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1%>" ToolTip="SI.NO"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblMLA" runat="server" Text='<%#Eval("Account_Number")%>' ToolTip="Account No"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Diary Number" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDairy_Number" runat="server" Text='<%#Eval("Dairy_Number")%>' ToolTip="Sub Account No"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action Date" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAction_Date" runat="server" Text='<%#Eval("Action_Date")%>' ToolTip="Account Status"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Origin Location" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblOrigin_Location" runat="server" Text='<%#Eval("Origin_Location")%>' ToolTip="Account Status"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Origin User" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblOrigin_User" runat="server" Text='<%#Eval("Origin_User")%>' ToolTip="Account Status"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Next Action Date" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblNext_Action_Date" runat="server" Text='<%#Eval("Next_Action_Date")%>' ToolTip="Account Status"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <RowStyle HorizontalAlign="Center" />
                                                            </asp:GridView>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table width="100%">
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" ID="lblRemarksTypes" Text="Remark Type" CssClass="styleDisplayLabel" ToolTip="Remark Type"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign">
                                                                    <asp:DropDownList ID="ddlRemarksTypes" runat="server" ToolTip="Issuer By">
                                                                    </asp:DropDownList></td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" ID="lblhdrRemarkSubType" Text="Remark Sub Type" CssClass="styleDisplayLabel" ToolTip="Remark Sub Type"></asp:Label></td>
                                                                <td class="styleFieldAlign" colspan="3">
                                                                    <asp:DropDownList ID="ddlRemarkSubType" runat="server" ToolTip="Remark Sub Type">
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" ID="lblComments" Text="Comments" CssClass="styleDisplayLabel" ToolTip="Comments"></asp:Label>
                                                                </td>
                                                                <td colspan="5" class="styleFieldAlign">
                                                                    <asp:TextBox ID="txtRemarks" runat="server" MaxLength="2500" TextMode="MultiLine"
                                                                        Width="98%" onkeyDown="maxlengthfortxt(2500)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" ID="lblActiontobeTaken" Text="Action to be taken" CssClass="styleDisplayLabel" ToolTip="Comments"></asp:Label>
                                                                </td>
                                                                <td colspan="5" class="styleFieldAlign">
                                                                    <asp:RadioButtonList ID="rbnActiontaken" runat="server" RepeatDirection="Horizontal" CssClass="styleFieldLabelBold" Style="font-weight: bold;">
                                                                        <asp:ListItem Value="1" Text="Remark Only"></asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="Assignment Call"></asp:ListItem>
                                                                        <asp:ListItem Value="3" Text="Self Follow-up"></asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" ID="lblAssignmentToBranch" Text="Assign To Branch" CssClass="styleDisplayLabel" ToolTip="Assign To Branch"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign">
                                                                    <uc:Suggest ID="suRemarkBranch" ToolTip="Location" runat="server" ServiceMethod="GetBranchList"
                                                                        IsMandatory="false" ValidationGroup="VGPDC" ErrorMessage="Select Assign To Branch" WatermarkText="--Select--" />
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" ID="lblRemarkUSer" Text="User" CssClass="styleDisplayLabel" ToolTip="User"></asp:Label></td>
                                                                <td class="styleFieldAlign">
                                                                    <asp:TextBox ID="txtMfcCode" runat="server" MaxLength="120"
                                                                        Style="text-align: Left;" ToolTip="MFC Employee Code"></asp:TextBox>
                                                                    <cc1:AutoCompleteExtender ID="aceMfcCode" MinimumPrefixLength="3" OnClientPopulated="MFCUser_ItemPopulated"
                                                                        OnClientItemSelected="MFCUser_ItemSelected" runat="server" TargetControlID="txtMfcCode"
                                                                        ServiceMethod="GetUserList" Enabled="True" CompletionSetCount="10"
                                                                        CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                                                    </cc1:AutoCompleteExtender>
                                                                    <cc1:TextBoxWatermarkExtender ID="tbeMfcCode" runat="server" TargetControlID="txtMfcCode"
                                                                        WatermarkText="--Select--">
                                                                    </cc1:TextBoxWatermarkExtender>
                                                                    <asp:HiddenField ID="hdnMFCUserID" runat="server" />
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" ID="lblNextActionDates" Text="Next Action Date" CssClass="styleDisplayLabel" ToolTip="Next Action Date"></asp:Label></td>
                                                                <td class="styleFieldAlign">
                                                                    <asp:TextBox runat="server" ID="txtNextActionDate" Width="80px" ContentEditable="False"></asp:TextBox>
                                                                    <asp:Image ID="imgNextActionDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                        ToolTip="Transaction Date" Visible="false" />
                                                                    <cc1:CalendarExtender ID="calNextActionDate" runat="server" Enabled="false" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                        PopupButtonID="imgNextActionDate" TargetControlID="txtNextActionDate" Format="dd/MM/yyyy">
                                                                    </cc1:CalendarExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label runat="server" ID="lblHistory" Text="Call History" CssClass="styleDisplayLabel" ToolTip="Call History"></asp:Label>
                                                                </td>
                                                                <td colspan="5" class="styleFieldAlign">
                                                                    <asp:TextBox ID="txtCallHistory" runat="server" MaxLength="2500" TextMode="MultiLine"
                                                                        onkeyDown="maxlengthfortxt(2500)" Width="98%"></asp:TextBox>
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
                        </cc1:TabContainer>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button runat="server" ID="btndcAdd" Enabled="false" ValidationGroup="Save" OnClientClick="return fnCheckPageValidators('Save');"
                            CssClass="styleSubmitButton" Text="Save" OnClick="btndcAdd_Click" ToolTip="Save the Details, Alt+S" AccessKey="S" />
                        &nbsp;<asp:Button ID="btnClearAll" runat="server" CausesValidation="false" CssClass="styleSubmitButton"
                            OnClick="btnbtnClear_Click" Text="Clear" ToolTip="Clear the Details, Alt+L" AccessKey="L" OnClientClick="return fnConfirmClear();" />
                        &nbsp;<asp:Button ID="Button1" runat="server" CausesValidation="false" CssClass="styleSubmitButton"
                            OnClick="btnCancel_Click" Text="Exit" ToolTip="Exit the Details, Alt+X" AccessKey="X" OnClientClick="return fnConfirmExit();" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="vgSave" runat="server" ValidationGroup="vgSave" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="vgUp"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                        <asp:CustomValidator ID="cvFollowUp" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btndcAdd" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


