<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_SubAccountLedgerReport, App_Web_ygb51gin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
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
                        <%--Row for Activity & Location --%>
                        <tr>
                            <td class="styleFieldLabel"  width="15%">
                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                            </td>
                            <td class="styleFieldAlign" width="20%">
                               <%-- <asp:DropDownList ID="ddlActivity" runat="server" ToolTip="Activity" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged" />--%>
                                <cc1:ComboBox ID="ddlActivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                   AutoPostBack="true" Width="130px" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged"
                                    AppendDataBoundItems="true" CaseSensitive="false" 
                                    AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ControlToValidate="ddlActivity"
                                    InitialValue="--Select--" ErrorMessage="Select Activity" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" width="15%">
                                <asp:Label runat="server" ID="lblLocation" Text="Location" />
                            </td>
                            <td class="styleFieldAlign"  width="20%">
                               <%-- <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" Width="170px"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" />--%>
                                  <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                     AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                     Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                
                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                    InitialValue="--Select--" ErrorMessage="Select Location" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" width="15%">
                                <asp:Label runat="server" ID="lblLocationPrint" Text="Location Print" />
                            </td>
                            <td class="styleFieldLabel"  width="10%"    >
                                <asp:CheckBox ID="chkLocationPrint" runat="server"  AutoPostBack="true"  OnSelectedIndexChanged ="ddlSL_SelectedIndexChanged" />
                            </td>
                        </tr>
                        <%--Row for Account From and Account To and All --%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblAccFrom" CssClass="styleReqFieldLabel" Text="Account From"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <%--  <asp:DropDownList ID="ddlAccountFrom" runat="server" ToolTip="Account From" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlAccountFrom_SelectedIndexChanged" />
                                --%>
                                <cc1:ComboBox ID="ddlAccountFrom" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlAccountFrom_SelectedIndexChanged"
                                    Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <cc1:ComboBox ID="ddlSLFrom" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                     AutoPostBack="true"  OnSelectedIndexChanged ="ddlSL_SelectedIndexChanged">
                                </cc1:ComboBox>
                                <%--AutoPostBack="true" OnSelectedIndexChanged="ddlAccountFrom_SelectedIndexChanged"--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlAccountFrom"
                                    InitialValue="--Select--" ErrorMessage="Select Account From" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblAccTo" CssClass="styleReqFieldLabel" Text="Account To"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <%--  <asp:DropDownList ID="ddlAccountTo" runat="server" ToolTip="Account To" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlAccountTo_SelectedIndexChanged" />
                                --%>
                                <cc1:ComboBox ID="ddlAccountTo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlAccountTo_SelectedIndexChanged"
                                    Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <cc1:ComboBox ID="ddlSLTo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                     AutoPostBack="true"  OnSelectedIndexChanged ="ddlSL_SelectedIndexChanged">
                                </cc1:ComboBox>
                                <%--AutoPostBack="true" OnSelectedIndexChanged="ddlAccountTo_SelectedIndexChanged"--%>
                                <%--<asp:RequiredFieldValidator ID="rfvAccountTo" runat="server" ControlToValidate="ddlAccountTo"
                                    InitialValue="--Select--" ErrorMessage="Select Account To" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />--%>
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblSubAccount" Text="Sub Account" />
                            </td>
                            <td class="styleFieldLabel" align="left">
                                <asp:CheckBox ID="chkSubAccount" runat="server"  AutoPostBack="true"  OnSelectedIndexChanged ="ddlSL_SelectedIndexChanged" />
                            </td>
                        </tr>
                        <%--Row For Date Range--%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblFromDate" Text="From Date" />
                            </td>
                            <td class="styleFieldAlign"  align="left">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtFromDate" Width="146px" 
                                 AutoPostBack="true"    OnTextChanged ="txtFromDate_OnTextChanged"/>
                                <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                    ErrorMessage="Select From Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblToDate" Text="To Date" />
                            </td>
                            <td class="styleFieldAlign"  align="left">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtToDate" Width="146px" 
                                 AutoPostBack="true"  OnTextChanged ="txtToDate_OnTextChanged"/>
                                <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate"
                                    ErrorMessage="Select To Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                             <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblRemarks" Text="Remarks"   AutoPostBack="true"  OnSelectedIndexChanged ="ddlSL_SelectedIndexChanged"/>
                            </td>
                            <td class="styleFieldAlign" align="left">
                                <asp:CheckBox ID="chkRemarks" runat="server" />
                            </td>
                           
                        </tr>
                       
                    </table>
                   
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnGo" runat="server" ValidationGroup="vgGo" Text="Go" CssClass="styleSubmitButton"
                    OnClick="btnGo_Click" />  &nbsp;
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                    &nbsp;
                    <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" 
                    CssClass="styleSubmitButton" ToolTip="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <%--For Showing Grid--%>
        <tr>
            <td>
                <asp:Panel ID="pnlAccountLedger" runat="server" Visible="false" GroupingText="Account Ledger Details"
                    Width="100%" CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td width="50%" align="left">
                                            <asp:Label ID="lblLocationG" runat="server" Text="Location" />
                                        </td>
                                        <%--<td>
                                            <asp:TextBox ID="txtLocationG" runat="server" Text="" />
                                        </td>--%>
                                        <td width="50%" align="right">
                                            <asp:Label ID="lblUserName" Font-Size="Small" runat="server" Text="User Name" />
                                        </td>
                                        <%-- <td>
                                            <asp:TextBox ID="txtUserName" runat="server" Text="" />
                                           
                                        </td>--%>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblOpenBal" runat="server" Text="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="height: 250px; overflow: auto">
                                    <asp:Panel ID="pnlScroll" runat="server" GroupingText="" Width="100%" CssClass="stylePanel">
                                        <asp:GridView ID="gvAccountLedger" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                            RowStyle-Width="0" OnRowDataBound="gvAccountLedger_RowDataBound" Width="100%">
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Location--%>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                                    </ItemTemplate>
                                                     <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Doc Date --%>
                                                <asp:TemplateField HeaderText="Document Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" Width ="10%"/>
                                                </asp:TemplateField>
                                                <%--Doc No --%>
                                                <asp:TemplateField HeaderText="Document Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" Width ="10%"/>
                                                </asp:TemplateField>
                                                <%--Value Date --%>
                                                <asp:TemplateField HeaderText="Value Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("Value_Date") %>' ToolTip="Value Date" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" Width ="10%"/>
                                                </asp:TemplateField>
                                                 <%--Account --%>
                                              <%--  <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Description --%>
                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>'  />

                                                        <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />
                                                        <asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                        <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />
                                                    </ItemTemplate>
                                                       <FooterTemplate>
                                                        <asp:Label ID="lblTotalD"  runat="server" Text="Total :" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                    <ItemStyle HorizontalAlign="Left" Width ="20%"/>
                                                </asp:TemplateField>
                                                <%--SL Code--%>
                                                <asp:TemplateField HeaderText="Remarks">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSubAccount" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                    <ItemStyle HorizontalAlign="Left" Width ="15%"/>
                                                </asp:TemplateField>
                                                <%--Debit--%>
                                                <asp:TemplateField HeaderText="Debit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" Width ="10%" />
                                                </asp:TemplateField>
                                                <%--Credit--%>
                                                <asp:TemplateField HeaderText="Credit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" Width ="10%" />
                                                </asp:TemplateField>
                                                <%--Balance--%>
                                                <asp:TemplateField HeaderText="Balance">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance1") %>' ToolTip="Balance" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotBalance" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" Width ="10%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                  <asp:HiddenField ID="hdn_FTDate" runat ="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="btnPrint" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Print" OnClick="btnPrint_Click" />
                <asp:Button ID="btnEmail" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Email" OnClick="btnEmail_Click" />
                <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsAccountLedger" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />--%>
                <asp:CustomValidator ID="cvAccountLedger" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
</asp:Content>

