<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_Sysad_ItemProSetup, App_Web_tfexpijv" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function Program_ItemSelected(sender, e) {
            var hdnLocationID = $get('<%= hdnProgram.ClientID %>');
            hdnLocationID.value = e.get_value();
        }
        function Program_ItemPopulated(sender, e) {
            var hdnLocationID = $get('<%= hdnProgram.ClientID %>');
            hdnLocationID.value = '';
        }


    </script>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
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
                    <td width="100%" align="left">
                        <asp:Panel GroupingText="Item Profile Setup" ID="pnlLookInfo" runat="server"
                            CssClass="stylePanel">
                            <table cellpadding="0" cellspacing="0" width="100%">

                                <tr>
                                    <td class="styleFieldAlign">
                                        <asp:Label ID="lblProgramName" Text="Program Name" runat="server" class="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 10%;">
                                        <asp:TextBox ID="txtProgramName" Width="182px" runat="server" AutoPostBack="false" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvProgramName" runat="server" ControlToValidate="txtProgramName"
                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="btnGo" SetFocusOnError="True"
                                            ErrorMessage="Select the Program Name"></asp:RequiredFieldValidator>


                                    </td>
                                    <cc1:AutoCompleteExtender ID="AutoProgramNameSearch" MinimumPrefixLength="1" OnClientPopulated="Program_ItemPopulated"
                                        OnClientItemSelected="Program_ItemSelected" runat="server" TargetControlID="txtProgramName"
                                        ServiceMethod="GetProgramName" Enabled="True" ServicePath="" CompletionSetCount="5"
                                        CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                    </cc1:AutoCompleteExtender>
                                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtProgramName"
                                        WatermarkText="--Select--">
                                    </cc1:TextBoxWatermarkExtender>
                                    <asp:HiddenField ID="hdnProgram" runat="server" />

                                    <td class="styleFieldAlign">
                                        <asp:Label ID="lblEffectiveStartDate" Text="Effective Start Date" runat="server" class="styleDisplayLabel"></asp:Label>
                                    </td>

                                    <td class="styleFieldAlign" style="width: 10%;">
                                        <asp:TextBox ID="txtEFFECTIVEFROM"  OnTextChanged="txtEFFECTIVEFROM_TextChanged" AutoPostBack="true" runat="server" Width="90px"></asp:TextBox>
                                       <%-- <asp:RequiredFieldValidator ID="rfvEFFECTIVEFROM" runat="server" ControlToValidate="txtEFFECTIVEFROM"
                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="btnGo" SetFocusOnError="True"
                                            ErrorMessage="Enter the Effective Start Date"></asp:RequiredFieldValidator>--%>
                                        <cc1:CalendarExtender ID="calEFFECTIVEFROM" runat="server" Enabled="True" TargetControlID="txtEFFECTIVEFROM"
                                            OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:Label ID="lblEffectiveEndDate" Text="Effective End Date" runat="server" class="styleDisplayLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 10%;">
                                        <asp:TextBox ID="txtEFFECTIVETO"  OnTextChanged="txtEFFECTIVETO_TextChanged" runat="server" Width="90px"></asp:TextBox>
                                          <input id="hidDate" type="hidden" runat="server" />
                                        <%--<asp:RequiredFieldValidator ID="rfvtxtEFFECTIVETO" runat="server" ControlToValidate="txtEFFECTIVETO"
                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="btnGo" SetFocusOnError="True"
                                            ErrorMessage="Enter the Effective End Date"></asp:RequiredFieldValidator>--%>
                                         <cc1:CalendarExtender ID="calEFFECTIVETo" runat="server" Enabled="True" TargetControlID="txtEFFECTIVETO"
                                            OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                        </cc1:CalendarExtender>
                                    </td>

                                </tr>
                                <tr align="center">
                                    <td  align="center" colspan="6">
                                        <asp:Button runat="server" ID="btnGo" AccessKey="G" ValidationGroup="btnGo"
                                            CssClass="styleSubmitShortButton" Text="Go" OnClick="btnGoProgramName_TextChanged" />
                                         <asp:Button runat="server" ID="btnExit" 
                                            CssClass="styleSubmitShortButton" AccessKey="N" OnClientClick="parent.RemoveTab();" Text="Exit" OnClick="btnExit_TextChanged" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="vsbtnGo" runat="server" CssClass="styleMandatoryLabel"
                                            Enabled="true" ValidationGroup="btnGo" Width="98%" ShowMessageBox="false"
                                            HeaderText="Correct the following validation(s):  " ShowSummary="true" />
                                    </td>
                                </tr>
                            </table>
                            <table width="100%">
                                <tr>
                                    <td width="90%" align="center">
                                        <asp:Panel GroupingText="Details" ID="pnlDetail" runat="server"
                                            CssClass="stylePanel" Width="70%">
                                            <div style="height: 235px; overflow-x: auto; overflow-y: auto;">
                                                <asp:GridView ID="grvItmProfSetUp" runat="server" Width="70%" AutoGenerateColumns="false"
                                                    OnRowDataBound="grvItmProfSetUp_RowDataBound" OnRowUpdating="grvItmProfSetUp_RowUpdating">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNO" runat="server" Text='<%#Bind("S_NO") %>'></asp:Label>
                                                                <asp:Label ID="lblPAGESETUPID" Visible="false" runat="server" Text='<%#Bind("PAGESETUP_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="5%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Display Name">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtDISPLAYTEXT" Width="120px" runat="server" Text='<%#Bind("Display_Name") %>'></asp:TextBox>

                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tool Tip">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtTOOLTIP" runat="server" Width="120px" Text='<%#Bind("TOOL_TIP") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Data Type">
                                                            <ItemTemplate>
                                                                <asp:DropdownList ID="ddlDATATYPE" runat="server" Width="120px" ></asp:DropdownList>
                                                                <asp:Label ID="lblDATATYPE" Text='<%#Bind("Data_Type") %>' Visible="false" runat="server" ></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Column Width">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtCOLUMNWIDTH" runat="server" Style="text-align: right" Width="50px" Text='<%#Bind("COLUMN_WIDTH") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Column Decimal">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtCOLUMNDECIMAL" runat="server" Style="text-align: right" Width="50px" Text='<%#Bind("COLUMN_DECIMAL") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <%-- <asp:TemplateField HeaderText="Effective From">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtEFFECTIVEFROM" runat="server" Width="90px" Text='<%#Bind("EFFECTIVE_FROM") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" />
                                                        </asp:TemplateField>--%>
                                                        <%--<asp:TemplateField HeaderText="Effective To">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtEFFECTIVETO" runat="server" Width="90px" Text='<%#Bind("EFFECTIVE_TO") %>'></asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" />
                                                        </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Update">
                                                            <ItemTemplate>
                                                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" OnClick="btnUpdate_Click"
                                                                    CssClass="styleSubmitShortButton" CausesValidation="false"></asp:Button>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                            <%-- <table width="100%">
                                <tr align="center">
                                    <td>
                                        <asp:Button runat="server" ID="btnSave" ValidationGroup="save"
                                            CssClass="styleSubmitButton" Text="Save" OnClick="btnSave_Click" Enabled="false" />
                                        <asp:Button runat="server" ID="btnClear" CssClass="styleSubmitButton" CausesValidation="false"
                                            Text="Clear_FA" OnClick="btnClear_Click" Enabled="false" />
                                    </td>
                                </tr>
                            </table>--%>
                            <table>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary runat="server" ID="vsCurrency" ValidationGroup="Add"
                                            HeaderText="Please correct the following validation(s):" ShowSummary="false"
                                            ShowMessageBox="false" />
                                    </td>
                                </tr>
                                <tr class="styleButtonArea">
                                    <td colspan="3">
                                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
