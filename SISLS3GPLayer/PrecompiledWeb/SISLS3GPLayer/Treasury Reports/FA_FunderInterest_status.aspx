<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_FunderInterest_status, App_Web_aagoig1p" title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Funder Interest Status Report" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
        <td>
         <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
          <table width="100%">
         <tr>
     <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblLocation" CssClass="styleReqFieldLabel" Text="Location1"></asp:Label>
                        </td>
   <td class="styleFieldLabel" width="25%">
       <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" 
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
       </cc1:ComboBox>
      <%-- <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" AutoPostBack="true"></asp:DropDownList>--%>
      <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvLocation1" runat="server"
                                                        ErrorMessage="Select Location" ControlToValidate="ddlLocation" CssClass="styleMandatoryLabel"
                                                        InitialValue="--Select--" Display="None" SetFocusOnError="True" ></asp:RequiredFieldValidator>
         </td>
                        <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblFunder" CssClass="styleReqFieldLabel" Text="Funder Name"></asp:Label>
                        </td>
                        <td class="styleFieldLabel" width="25%">
                         <cc1:ComboBox ID="ddlFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" 
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                 <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvfunder" runat="server"
                                                        ErrorMessage="Select Funder Name" ControlToValidate="ddlFunder" CssClass="styleMandatoryLabel"
                                                        InitialValue="--Select--" Display="None" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                         <%--<asp:DropDownList ID="ddlFunder" runat="server" ToolTip="Funder Name" AutoPostBack="true"></asp:DropDownList>--%>
                         
                        </td>
                        </tr>
                        <tr>
                       <td  class="styleFieldLabel" width="10%">
                            <asp:Label runat="server" Text="From Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                        </td>
                        
                       <td width="25%" class="styleFieldAlign"  align="left">
                            <asp:TextBox ID="txtStartDateSearch" runat="server"  
                                AutoPostBack="True" OnTextChanged="txtStartDateSearch_OnTextChanged" onmouseover="txt_MouseoverTooltip(this)" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFromdate" runat="server" ControlToValidate="txtStartDateSearch"
                                                        Display="None" ErrorMessage="Select Start Date" SetFocusOnError="True" 
                                                        ValidationGroup="Main" />
                            <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                            </cc1:CalendarExtender>
                          
                        </td>
                        <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblDenomination" CssClass="styleReqFieldLabel" Text="Denomination"></asp:Label>
                        </td>
                    <td class="styleFieldLabel" width="25%">
                         <asp:DropDownList ID="ddlDenomination" runat="server" Width="170px" ToolTip="Denomination" AutoPostBack="true"> 
                                <%--OnSelectedIndexChanged="ddlDenomination_SelectedIndexChanged"--%>
                                </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvDenomination" ValidationGroup="Main" CssClass="styleMandatoryLabel"
                                runat="server" ControlToValidate="ddlDenomination" SetFocusOnError="True" 
                                InitialValue="0" ErrorMessage="Select Denomination" Display="None" >
                        </asp:RequiredFieldValidator>
                        </td> 
                        </tr>
        </table>

</asp:Panel>
</td>
</tr>

         <tr>
                          
            <td align="center" colspan="4">
                <asp:Button ID="btnGo" runat="server"  CssClass="styleSubmitButton" Text="Go" OnClick="btnGo_Click"
                    ValidationGroup="Main" ToolTip="Go" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" 
                    Text="Clear_FA"   OnClientClick="return fnConfirmClear();"  ToolTip="Clear_FA" OnClick="btnClear_Click" />
                     <asp:Button ID="BtnCancel" CssClass="styleSubmitButton" Visible="True" runat="server" Text="Cancel"   ToolTip="Cancel" OnClick="BtnCancel_Click" />
            </td>
        </tr>
          
         <tr>
        <td class="styleFieldAlign" >
     <asp:Panel ID="pnlFunder" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Funder Status Details">
                        <div id="divFunder" runat="server" style="overflow: scroll; height: 200px; display:none" >
                        <asp:GridView ID="grvFunder" runat="server" AutoGenerateColumns="False"  BorderWidth="2"
                            CssClass="styleInfoLabel" Width="100%" ShowFooter="true" ShowHeader="true" OnRowDataBound="grvFunder_RowDataBound" >
                            <Columns>
                             <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("LOCATION") %>' ToolTip="Location"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Funder Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFundname" runat="server" Text='<%# Bind("FUNDER_NAME") %>' ToolTip="Funder Name"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Transaction Ref No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTRN" runat="server" Text='<%# Bind("FUND_REF_NO") %>' ToolTip="Funder Ref No"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Received Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRcvdAmt" runat="server" Text='<%# Bind("RECEIVED_AMOUNT1") %>' ToolTip="Received Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRcvdAmt" runat="server" ToolTip="sum of Received Amount"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                             <asp:TemplateField HeaderText="Interest Due">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInterestDue" runat="server" Text='<%#Bind("Interest_Due1") %>' ToolTip="Repaid Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotInterestDue" runat="server" ToolTip="sum of Interest Due Amount"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interest Paid">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInterestPaid" runat="server" Text='<%#Bind("Interest_Paid1")%>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotInterestPaid" runat="server" ToolTip="sum of Ageing 0 days"></asp:Label>
                                    </FooterTemplate>
                                    
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interest Payable">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInterestPayable" runat="server" Text='<%# Bind("Interest_Payable1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotInterestPayable" runat="server" ToolTip="sum of Ageing 30 days"></asp:Label>
                                    </FooterTemplate>
                                    
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                
                                
                            </Columns>
                        </asp:GridView>
                        </div>
                        </asp:Panel>
                        </td>
                        </tr>
                
         <tr align="center">
            <td>
                <asp:Button ID="BtnPrint" CssClass="styleSubmitButton" Visible="false" runat="server" Text="Print" OnClick="BtnPrint_Click"   ToolTip="Print" />
                <asp:Button ID="btnexcel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Excel" OnClick="FunExcelExport"  />
            </td>
        </tr>
        
    <tr>
        <td>
        <asp:ValidationSummary ID="vsfundinterest" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
         ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
        <asp:CustomValidator ID="cvFundInterest" runat="server" CssClass="styleMandatoryLabel"
       Enabled="true" />
        </td>
        </tr>

</table>





</asp:Content>

