<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="true" inherits="Financial_Accounting_FAInvestmentMaster_Add, App_Web_zogfwrp2" title="Investment Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">

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


        //Round of to desired prefix and sufix   
        function funChkDecimialPercentage(txtbox, prefixLen, sufixLen, strFieldName, IsZeroCheckReq) {
            if (txtbox.value != '') {
                if (IsZeroCheckReq) {
                    if (parseFloat(txtbox.value) == 0) {
                        txtbox.focus();
                        txtbox.value = '';
                        if (strFieldName == undefined) {
                            alert('Value should be greater than 0');
                            txtbox.value = '';
                            txtbox.focus();
                            return false;
                        }
                        else {
                            alert(strFieldName + ' should be greater than 0');
                            txtbox.value = '';
                            txtbox.focus();
                            return false;
                        }
                    }
                }
                if (isNaN(parseFloat(txtbox.value))) {
                    alert('Enter a valid decimal');
                    txtbox.value = '';
                    txtbox.focus();
                    return false;
                }
                else {
                    var str = txtbox.value.split('.');

                    if (str[0].length > prefixLen) {
                        if (strFieldName == '') {
                            alert('Value precision should not exceed ' + prefixLen + ' digits');
                        }
                        else {
                            alert(strFieldName + ' precision should not exceed ' + prefixLen + ' digits');
                        }
                        txtbox.focus();
                        return false;
                    }
                    txtbox.value = parseFloat(txtbox.value).toFixed(sufixLen);
                }
            }
            if (parseFloat(txtbox.value) > 100) {
                alert(strFieldName + ' should not exceed 100 ');
                txtbox.focus();
                return false;
            }
            return true;
        }
        

    </script>

    <asp:UpdatePanel ID="upInvestmentMaster" runat="server" RenderMode="Block" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="margin: 2px 2px 2px 2px;">
                            <cc1:TabContainer ID="tcInvestMaster" runat="server" CssClass="styleTabPanel" ScrollBars="None">
                                <cc1:TabPanel runat="server" ID="tpMaster" CssClass="tabpan" BackColor="Red">
                                    <HeaderTemplate>
                                        Master
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="upMasterDet" runat="server">
                                            <ContentTemplate>
                                                <table width="100%">
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleDisplayLabel">Location</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                       <%--     <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddllocation_SelectedIndexChanged"
                                                                onmouseover="ddl_itemchanged(this)">
                                                            </asp:DropDownList>--%>
                                                            
                                                                <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" OnItem_Selected="ddllocation_SelectedIndexChanged" AutoPostBack ="true"  ItemToValidate ="Value"  WatermarkText="--ALL--" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Investment Type</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlInvestmentType" runat="server" onmouseover="ddl_itemchanged(this)">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvInvestmentType" ControlToValidate="ddlInvestmentType"
                                                                InitialValue="0" runat="server" Display="None" SetFocusOnError="true" ErrorMessage="Select the Investment Type"
                                                                ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Investment Code</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtInvestmentCode" runat="server" MaxLength="8" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvInvestmentCode" ControlToValidate="txtInvestmentCode"
                                                                SetFocusOnError="true" runat="server" Display="None" ErrorMessage="Enter the Investment Code"
                                                                ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtInvestmentCode"
                                                                ID="revInvestmentCode" ValidationExpression="^([a-zA-Z]){4}([0-9]){4}$" ErrorMessage="The Investment Code first four char should be Alpha and last four char should be Numeric"
                                                                ValidationGroup="BtnSave" Display="None"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Investment Description</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtInvestmentDesc" TextMode="MultiLine" runat="server" MaxLength="60"
                                                                onkeyup="return maxlengthfortxt(60)" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvInvestmentDesc" ControlToValidate="txtInvestmentDesc"
                                                                runat="server" Display="None" ErrorMessage="Enter the Investment Description"
                                                                SetFocusOnError="true" ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                            <cc1:FilteredTextBoxExtender ID="ftbInvestment_Desc" runat="server" TargetControlID="txtInvestmentDesc"
                                                                FilterType="UppercaseLetters, LowercaseLetters, Numbers,Custom" ValidChars=" .,<>@#$%^&*()_-+=|}]{[:;?\/!"
                                                                Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleDisplayLabel">Addtional Description</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtAdditionalDesc" TextMode="MultiLine" runat="server" ValidationGroup="BtnSave"
                                                                MaxLength="40" onkeyup="return maxlengthfortxt(40)" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftbAddionalDesc" runat="server" TargetControlID="txtAdditionalDesc"
                                                                FilterType="UppercaseLetters, LowercaseLetters, Numbers,Custom" ValidChars=" .,<>@#$%^&*()_-+=|}]{[:;?\/!"
                                                                Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Unit Value</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtUnitValue" runat="server" MaxLength="17" onkeypress="fnAllowNumbersDesimal(false)" onpaste="return false;"
                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvUnitValue" ControlToValidate="txtUnitValue" runat="server"
                                                                SetFocusOnError="true" Display="None" ErrorMessage="Enter the Unit Value" ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Unit Face Value</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtUnitFaceValue" runat="server" MaxLength="17" onkeypress="fnAllowNumbersDesimal(false)" onpaste="return false;"
                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvUnitFaceValue" ControlToValidate="txtUnitFaceValue"
                                                                SetFocusOnError="true" runat="server" Display="None" ErrorMessage="Enter the Unit Face Value"
                                                                ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Interest Periodicity</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlInterestPeriodicity" runat="server" AutoPostBack="true"
                                                                onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddlInterestPeriodicity_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvInterestPeriodicity" ControlToValidate="ddlInterestPeriodicity"
                                                                runat="server" Display="None" ErrorMessage="Select the Interest Periodicity"
                                                                InitialValue="0" SetFocusOnError="true" ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Rate of Interest</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtRateofInterest" runat="server" MaxLength="5" onpaste="return false;"
                                                                Style="text-align: right;" onblur="return funChkDecimialPercentage(this,3,2,'Rate of Interest',true);"
                                                                onkeypress="fnAllowNumbersDesimal(false)" AutoPostBack="True" OnTextChanged="txtRateofInterest_TextChanged"
                                                                onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvRateofInterest" ControlToValidate="txtRateofInterest"
                                                                SetFocusOnError="true" runat="server" Display="None" ErrorMessage="Enter the Rate of Interest"
                                                                Enabled="false" ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                            <%-- <asp:RegularExpressionValidator runat="server" ID="revRateofInterest" ControlToValidate="txtRateofInterest"
                                                            ErrorMessage="Rate of Interest should be valid" Display="None" SetFocusOnError="true"
                                                            ValidationExpression="^-?[0-9]{0,2}(\.[0-9]{1,2})?$|^-?(100)(\.[0]{1,2})?$"></asp:RegularExpressionValidator>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <%-- --%>
                                                            <span class="styleReqFieldLabel">Nature of Interest</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlNatureofInterest" runat="server" onmouseover="ddl_itemchanged(this)">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvNatureofInterest" ControlToValidate="ddlNatureofInterest"
                                                                InitialValue="0" SetFocusOnError="true" runat="server" Display="None" ErrorMessage="Select the Nature of Interest"
                                                                ValidationGroup="BtnSave" Enabled="false">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Interest Type</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlInterestType" runat="server" onmouseover="ddl_itemchanged(this)">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvInterestType" ControlToValidate="ddlInterestType"
                                                                InitialValue="0" SetFocusOnError="true" Enabled="false" runat="server" Display="None"
                                                                ErrorMessage="Select the Interest Type" ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Interest Frequency</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlInterestFrequency" runat="server" onmouseover="ddl_itemchanged(this)">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvInterestFrequency" ControlToValidate="ddlInterestFrequency"
                                                                InitialValue="0" SetFocusOnError="true" Enabled="false" runat="server" Display="None"
                                                                ErrorMessage="Select the Interest Frequency" ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Principal Frequency</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlPrincipalFrequency" runat="server" onmouseover="ddl_itemchanged(this)">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvPrincipalFrequency" ControlToValidate="ddlPrincipalFrequency"
                                                                runat="server" Display="None" ErrorMessage="Enter the Principal Frequency" InitialValue="0"
                                                                SetFocusOnError="true" ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Account Number</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <cc1:ComboBox ID="ddlGLCodeF" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlGLCodeF_SelectedIndexChanged"
                                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Sub Account Number</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <cc1:ComboBox ID="ddlSLCodeF" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Remarks</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox runat="server" ID="txtRemarks" TextMode="MultiLine" onkeyup="return maxlengthfortxt(300)"
                                                                onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <%-- <asp:RequiredFieldValidator ID="rfvremarks" ControlToValidate="txtRemarks" runat="server"
                                                                Display="None" ErrorMessage="Enter the Remarks" SetFocusOnError="true" ValidationGroup="BtnSave">
                                                            </asp:RequiredFieldValidator>--%>
                                                        </td>
                                                        <td>
                                                            <span class="styleFieldLabel">Active</span>
                                                        </td>
                                                        <td class="styleFieldAlign" valign="middle">
                                                            <asp:CheckBox ID="chkActive" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="tcHistory" runat="server" CssClass="tabpan" BackColor="Red">
                                    <HeaderTemplate>
                                        History
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:Panel ID="pnlHistory" runat="server" GroupingText="Investment History" CssClass="stylePanel"
                                            Width="99%">
                                            <div class="container" style="min-height: 50px; max-height: 300px; overflow-y: scroll;
                                                overflow-x: scroll;" runat="server">
                                                <asp:GridView ID="gvhistory" runat="server" AutoGenerateColumns="false" Width="120%"
                                                    OnRowDataBound="gvhistory_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Purchase Serial No" DataField="Purchase_Tran_No" ItemStyle-Width="9%" />
                                                        <asp:BoundField HeaderText="Investment Serial No" DataField="Investment_Serial_No"
                                                            ItemStyle-Width="9%" />
                                                        <asp:BoundField HeaderText="Purchase Date" DataField="Purchase_Date" ItemStyle-Width="6%" />
                                                        <asp:TemplateField HeaderText="No of Units" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtNoofUnits" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Purchase_Units") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Unit Value" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtUnit_Value" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Unit_Value") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Total Cost" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtTotal_Cost" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Purchase_Cost") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Sale Serial No" DataField="Sale_Tran_No" ItemStyle-Width="9%" />
                                                        <asp:BoundField HeaderText="Sale Date" DataField="Sale_Date" ItemStyle-Width="6%" />
                                                        <asp:TemplateField HeaderText="Sale Units" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtSale_Units" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Sale_Units") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sale Value" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtSale_Value" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Sale_Value") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Selling Cost" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtSelling_Cost" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Selling_Cost") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Profit/Loss" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtProfit_Loss" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Profit_Loss") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Balance Units" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtBalance_Units" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Bal_Units") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Balance Value" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtBalance_Value" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("Bal_Value") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Weighted Average Value" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtWeighted_Avg_Value" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("WIRR") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Unpaid Amount" ItemStyle-Width="6%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtUnRealized_Amount" runat="server" Style="text-align: right;" ReadOnly="true"
                                                                    Width="95%" Text='<%#Bind("UR_Amount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="tpROI" runat="server" CssClass="tabpan" BackColor="Red">
                                    <HeaderTemplate>
                                        ROI
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:Panel ID="pnlInvestmentROI" runat="server" GroupingText="Investment ROI" CssClass="stylePanel"
                                            Width="99%">
                                            <div id="Div1" class="container" style="min-height: 150px; max-height: 300px; overflow-y: auto;
                                                overflow-x: auto; width: 100%;" runat="server">
                                                <asp:GridView ID="gvROI" runat="server" AutoGenerateColumns="false" Width="98%" OnRowDataBound="gvROI_RowDataBound">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Serial No" DataField="S_No" ItemStyle-Width="7%" ItemStyle-HorizontalAlign="Right" />
                                                        <asp:TemplateField HeaderText="Investment Serial No" ItemStyle-Width="20%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInvestment_Tran_No" runat="server" Text='<%#Bind("Investment_Tran_No") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Due On" ItemStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInterest_Due_On" runat="server" Width="99%" Text='<%#Bind("Interest_Due_On") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Due Amount" ItemStyle-Width="12%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInterest_Due_Amount" runat="server" Width="99%" Text='<%#Bind("Interest_Due_Amount") %>'
                                                                    Style="text-align: right;"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipt No" ItemStyle-Width="20%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipt_Ref_No" runat="server" Width="99%" Text='<%#Bind("Receipt_Ref_No") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipt Date" ItemStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipt_Date" runat="server" Text='<%#Bind("Receipt_Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipt Amount" ItemStyle-Width="12%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipt_Amount" runat="server" Style="text-align: right;" Width="99%"
                                                                    Text='<%#Bind("Receipt_Amount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </div>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="upbuttonEvent" runat="server">
                <ContentTemplate>
                    <div style="width: 100%; vertical-align: middle; text-align: center; margin-top: 10px;
                        margin-bottom: 10px;">
                        <asp:Button ID="btnSave" runat="server" ValidationGroup="BtnSave" Text="Save" OnClientClick="return fnCheckPageValidators();"
                            CssClass="styleSubmitButton" OnClick="btnSave_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear_FA" OnClick="btnClear_Click" OnClientClick="return fnConfirmClear();"
                            CssClass="styleSubmitButton" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                            CssClass="styleSubmitButton" />
                    </div>
                    <div style="width: 95%; vertical-align: middle; text-align: center; margin-left: 20px;">
                        <asp:ValidationSummary CssClass="styleSummaryStyle" runat="server" ID="vsInvestmentMaster"
                            HeaderText="Correct the following validation(s):  " ShowSummary="true" ShowMessageBox="false"
                            ValidationGroup="BtnSave" />
                    </div>
                    <asp:CustomValidator ID="cvInvestmentMaster" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
