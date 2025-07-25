<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FAFunderPayableReceivable, App_Web_upeq32zu" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        <%--Row for Location and Date --%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblLocation" Text="Location" />
                            </td>
                            <td class="styleFieldAlign" >
                                <%--<asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" Width="170px"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" />--%>
                                 <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                    InitialValue="--Select--" ErrorMessage="Select Location" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            
                             <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblDate" Text="Date" />
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtDate" 
                                 OnTextChanged ="txtDate_TextChanged" AutoPostBack ="true"  Width="160px" />
                                <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtDate" ID="CalDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate"
                                    ErrorMessage="Select Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                        </tr>
                        <%--Row For Funder--%>
                        <tr>
                             <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblFunder" CssClass="styleReqFieldLabel" Text="Funder"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                               <%-- <asp:DropDownList ID="ddlFunder" runat="server" ToolTip="Funder" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlFunder_SelectedIndexChanged" />
                               --%>
                                <cc1:ComboBox ID="ddlFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFunder_SelectedIndexChanged"
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                
                                <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                                <asp:RequiredFieldValidator ID="rfvFunder" runat="server" ControlToValidate="ddlFunder"
                                    InitialValue="--Select--" ErrorMessage="Select Funder" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            <td>
                            </td>
                            <td>
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
                <asp:Button ID="btnGo" runat="server" Text="Go" ValidationGroup="vgGo" CssClass="styleSubmitButton"
                    OnClick="btnGo_Click" />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                     <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" 
                    CssClass="styleSubmitButton" ToolTip="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <%--For Showing Grid--%>
        <tr>
            <td>
                <asp:Panel ID="pnlFunderPR" runat="server" Visible="false" GroupingText="Funder Payable Receivable"
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
                            <td>
                                <div style="height: 200px; overflow: auto">
                                    <asp:Panel ID="pnlScroll" runat="server" GroupingText="" CssClass="stylePanel" Width="100%">
                                  <div id="divHead" style =" text-align :right; font-size :small ; font-size :14">
                                  <%--<b>Yet to be Received/Repaid (Ageing) &nbsp &nbsp &nbsp &nbsp   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp </b>--%>
                                  <b>
                                  <asp:Label ID="lblcommonHead" runat="server" Text ="Yet to be Received/Repaid (Ageing)" />
                                  &nbsp &nbsp &nbsp &nbsp   &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp 
                                  </b>
                                  </div> 
                                        <asp:GridView ID="gvFunderPR" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                          OnRowDataBound ="gvFunderPR_RowDataBound"    Width="99%">  <%--OnRowDataBound="gvFunderPR_RowDataBound"--%>
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Doc Date --%>
                                                 <%--Funder Name --%>
                                                <asp:TemplateField HeaderText="Funder Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFunderName" runat="server" Text='<%#Eval("Funder_Name") %>' ToolTip="Funder Name" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                 <%--Location  --%>
                                                <%--<asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Location" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--FundER TRANSACTION Number --%>
                                                <asp:TemplateField HeaderText="Funder Transaction Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFund_Tran_No" runat="server" Text='<%#Eval("col1") %>' ToolTip="Funder Transaction Number" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Commitment Amount --%>
                                                <asp:TemplateField HeaderText="Commitment Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCommitmentAmt" runat="server" Text='<%#Eval("Commit_Amount") %>' ToolTip="Commitment Amount" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Right" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Fund Referece Number --%>
                                                <asp:TemplateField HeaderText="Fund Reference Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFund_Ref_No" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Fund Referece Number" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total(R):<br/>Total(RP):" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                       <ItemStyle HorizontalAlign="Left" Width ="10%"/>
                                                </asp:TemplateField>
                                                <%--Received Amount --%>
                                                <asp:TemplateField HeaderText="Received Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceivedAmt" runat="server" Text='<%#Eval("Received_Amount") %>' ToolTip="Received Amount" />
                                                        <asp:HiddenField ID="hdn_PRType" runat ="server" Value ='<%#Eval("col2") %>' />
                                                    </ItemTemplate>
                                                     <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblReceivingTotal" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--Repaid Amount--%>
                                                <asp:TemplateField HeaderText="Repaid Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRepaidAmt" runat="server" Text='<%#Eval("Repay_Amount") %>' ToolTip="Repaid Amount" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblRepaidTotal" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--0 - 30 --%>
                                                   <asp:TemplateField HeaderText="0-30">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblA1" runat="server" Text='<%#Eval("A30") %>' ToolTip="Ageing 0-30" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA1_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                                  <%--31 - 60 --%>
                                                   <asp:TemplateField HeaderText="31-60">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblA2" runat="server" Text='<%#Eval("A60") %>' ToolTip="Ageing 31-60" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA2_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                                  <%--61 - 90 --%>
                                                   <asp:TemplateField HeaderText="61-90">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblA3" runat="server" Text='<%#Eval("A90") %>' ToolTip="Ageing 61-90" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA3_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                                  <%--91 - 120 --%>
                                                   <asp:TemplateField HeaderText="91-120">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblA4" runat="server" Text='<%#Eval("A120") %>' ToolTip="Ageing 91-120" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA4_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                                  <%-- > 120 --%>
                                                   <asp:TemplateField HeaderText=">120">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblA5" runat="server" Text='<%#Eval("AG120") %>' ToolTip="Ageing >120" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA5_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right"  Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
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
                <asp:ValidationSummary ID="vsFunderPR" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="cvFunderPR" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
</asp:Content>
