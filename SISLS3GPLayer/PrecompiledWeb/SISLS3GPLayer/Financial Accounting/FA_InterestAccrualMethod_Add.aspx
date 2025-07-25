<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_InterestAccrualMethod_Add, App_Web_mv5fp02i" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <asp:UpdatePanel ID="upIntMthd" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td class="stylePageHeading">
                                    <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                                        <table width="100%">
                                            <tr>
                                                <td class="styleFieldLabel" style="width: 18%">
                                                    <asp:Label runat="server" Text="Activity" ID="lblActivity" CssClass="styleReqFieldLabel"
                                                        ToolTip="Activity" Width="100px"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" style="width: 25%">
                                                    <asp:DropDownList ID="ddlActivity" runat="server" Width="95%" ToolTip="Activity"
                                                        AutoPostBack="true">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator Display="None" ID="RFVddlActivity" CssClass="styleMandatoryLabel"
                                                        SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                        ErrorMessage="Select Activity" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator Display="None" ID="RFVddlActivity2" CssClass="styleMandatoryLabel"
                                                        SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                        ErrorMessage="Select Activity" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblDate" Text="Date"></asp:Label>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:TextBox ID="txtDate" runat="server" ToolTip="Date" AutoPostBack="true" onmouseover="txt_MouseoverTooltip(this)"
                                                        OnTextChanged="txtDate_OnTextChanged" />
                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="txtDate"
                                                        ID="caldate" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <asp:RequiredFieldValidator ID="rfvdate" runat="server" ControlToValidate="txtDate"
                                                        ErrorMessage="Select  Date" Display="None" SetFocusOnError="True" ValidationGroup="Main" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblLocation" Text="Location" />
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <%-- <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location"
                                    AutoPostBack="true" Width="165px" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                </asp:DropDownList>--%>
                                                    <asp:RequiredFieldValidator ID="rfvlocation" runat="server" ControlToValidate="ddlLocation"
                                                        InitialValue="--select--" ErrorMessage="Select Location" Display="None" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblInterestAccrualNumber" Text="Interest Accrual Number" />
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:TextBox ID="txtInterestAccrualNumber" ToolTip="Interest Accrual Number" runat="server"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblLastCalcDate" Text="Last Calculated Date"></asp:Label>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:TextBox ID="txtLastcalcDate" runat="server" ToolTip="Last Calculation Date" />
                                                </td>
                                                <td class="styleFieldLabel" width="15%">
                                                    <asp:Label runat="server" ToolTip="Funder" Text="Funder" ID="Label1" CssClass="styleMandatoryLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="28%">
                                                    <asp:TextBox ID="txtCode" ToolTip="Funder Code" runat="server" Style="display: none;"
                                                        MaxLength="50" Width="65%"></asp:TextBox>
                                                    <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server" DispalyContent="Code"
                                                        TextWidth="65%" />
                                                    <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="true" Text="Create"
                                                        Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                        CausesValidation="false" />
                                                    <%--   <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1"
                                    CssClass="styleMandatoryLabel" runat="server" SetFocusOnError="True"
                                    ControlToValidate="txtCode" ErrorMessage="Select Entity/Funder"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                                    <asp:Label runat="server" ID="lblfunderdate" Visible="false" Text="Funder Date"></asp:Label>
                                                    <asp:TextBox ID="txtfunderdate" runat="server" Visible="false" ToolTip="Funderdate" />
                                                </td>
                                                <%-- <td class="styleFieldLabel" width="25%" visible="false">
                               
                            </td>
                            <td class="styleFieldLabel" width="25%">
                              
                            </td>--%>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="PnlEntityInformation" runat="server" ToolTip="Funder Information"
                                        GroupingText="Funder Information" CssClass="stylePanel">
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <uc1:FAAddressDetail ActiveViewIndex="1" ID="ucFAAddressDetail" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" align="center">
                                    <asp:Button ID="btnGo" runat="server" OnClick="btnGo_Click" CssClass="styleSubmitButton"
                                        Text="Go" CausesValidation="true" ValidationGroup="Main" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="divInterest" runat="server" style="overflow: auto; height: 400px; display: none">
                                        <asp:Panel ID="pnlLaoding" runat="server" GroupingText="Details" CssClass="stylePanel">
                                            <asp:Panel ID="pnlDetail" runat="server" GroupingText="" CssClass="stylePanel">
                                                <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                    OnRowDataBound="gvDetail_RowDataBound" Width="99%">
                                                    <Columns>
                                                        <%--Serial Number--%>
                                                        <asp:TemplateField HeaderText="Sl No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--Funder Tran Id--%>
                                                        <asp:TemplateField HeaderText="Funder Tran Id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTranid" runat="server" Text='<%#Eval("Funder_Tran_ID") %>' ToolTip="Funder Reference Number" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--Funder Reference Number --%>
                                                        <asp:TemplateField HeaderText="Funder Reference Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRefNo" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Funder Reference Number" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Grand Total" ToolTip="Total" />
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount Outstanding">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAmountOutstanding" runat="server" Text='<%#Eval("AmountOutstanding") %>'
                                                                    ToolTip="Amount Outstanding" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblfooterAmountOutstanding" runat="server" Text="" ToolTip="Amount Outstanding" />
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Rate Of Interest">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblROI" runat="server" Text='<%#Eval("RateOfInterest") %>' ToolTip="Rate Of Interest" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInterestAmount" runat="server" Text='<%#Eval("InterestAmount") %>'
                                                                    ToolTip="Interest Amount" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Principal Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrincipalAmount" runat="server" Text='<%#Eval("PrincipalAmount") %>'
                                                                    ToolTip="Principal Amount" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Last calculated Date">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtLastCalculatedDate" runat="server" ReadOnly="true" Text='<%#Eval("LastCalculateddate") %>'
                                                                    ToolTip="Last Calculated Date"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Select All" Visible="false">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblselectAll" runat="server" Text="Select All" ToolTip="Select"></asp:Label>
                                                                <br />
                                                                <asp:CheckBox ID="chkAll" runat="server" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkbox" runat="server" ToolTip="Select" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="JV No.">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtJVNo" runat="server" Text='<%#Eval("JVNo") %>' ReadOnly="true"
                                                                    ToolTip="JV No."></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkDelete" runat="server" ToolTip="Delete" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </asp:Panel>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <br />
                                    <asp:Button ID="btnPost" runat="server" OnClick="btnSave_Click" OnClientClick="return fnCheckPageValidators();"
                                        CssClass="styleSubmitButton" Text="Post" Enabled="false" CausesValidation="true"
                                        ValidationGroup="Main" />
                                    <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                        Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                                    <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                        Text="Cancel" OnClick="btnCancel_Click" />
                                    <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
                                </td>
                            </tr>
                            <tr align="Left">
                                <td>
                                    <asp:ValidationSummary ID="Main" runat="server" ValidationGroup="Main" CssClass="styleMandatoryLabel"
                                        HeaderText="Correct the following validation(s):" ShowSummary="true" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <script type="text/javascript" language="javascript">
        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }
        function fnSelectUser(grdid, chkAll, chkbox) {

            var gvDetail = document.getElementById('ctl00_ContentPlaceHolder1_pnlDetail_gvDetail');
            var TargetChildControl = chkSelectAll;
            var selectall = 0;
            var Inputs = gvDetail.getElementsByTagName("input");
            if (!chkbox.checked) {
                chkAll.checked = false;
            }
            else {
                for (var n = 0; n < Inputs.length; ++n) {
                    if (Inputs[n].type == 'checkbox') {
                        if (Inputs[n].checked) {
                            selectall = selectall + 1;
                        }
                    }
                }
                if (selectall == gvDetail.rows.length - 1) {
                    chkAll.checked = true;
                }
            }


        }    
    </script>

</asp:Content>
