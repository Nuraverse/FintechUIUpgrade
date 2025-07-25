<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_Funder_Allocation, App_Web_ygb51gin" title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Funder Allocation Wise Status Report" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        
                <tr>
        <td>
         <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
          <table width="100%">
          <tr>
           <td class="styleFieldLabel" width="25%">
             <asp:Label runat="server" ID="lblLocation1" CssClass="styleReqFieldLabel" Text="Location1"></asp:Label>
             </td>
             <td class="styleFieldLabel" width="25%">
              <cc1:ComboBox ID="ddlLocation1" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                      AutoPostBack="true" Width="170px" AppendDataBoundItems="true" CaseSensitive="false"  AutoCompleteMode="SuggestAppend">
             </cc1:ComboBox>
             <%--<asp:DropDownList ID="ddlLocation1" runat="server" ToolTip="Location1" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation1_SelectedIndexChanged"></asp:DropDownList>--%>
               <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvLocation1" runat="server"
              ErrorMessage="Select Location1" ControlToValidate="ddlLocation1" CssClass="styleMandatoryLabel"
         InitialValue="--Select--" Display="None" SetFocusOnError="True" ></asp:RequiredFieldValidator>
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
          <tr>
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
                         
                        </td>
                               <td  class="styleFieldLabel" width="10%">
                            <asp:Label runat="server" Text="From Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                        </td>
                        <td width="25%" class="styleFieldAlign"  align="left">
                            <asp:TextBox ID="txtStartDateSearch" runat="server"  
                                AutoPostBack="True" onmouseover="txt_MouseoverTooltip(this)" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFromdate" runat="server" ControlToValidate="txtStartDateSearch"
                                                        Display="None" ErrorMessage="Select From Date" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
                            <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                            </cc1:CalendarExtender>
                          
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
                    Text="Clear_FA"   OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" ToolTip="Clear_FA"  />
                     <asp:Button ID="BtnCancel" CssClass="styleSubmitButton" Visible="True" runat="server" Text="Cancel" OnClick="BtnCancel_Click"  ToolTip="Cancel"  />
            </td>
        </tr>
        <tr>
        <td>
        <table width="100%">
        <tr>
            <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblcommitment" Visible="false" CssClass="styleReqFieldLabel" Text="Commitment Amount"></asp:Label>
   </td>
   <td>
    <asp:TextBox ID="txtcommitment" Visible="false" runat="server" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
   </td>
      <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblReceived" Visible="false" CssClass="styleReqFieldLabel" Text="Received Amount"></asp:Label>
   </td>
   <td>
    <asp:TextBox ID="txtreceivedamt" Visible="false" runat="server" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
   </td>
        </tr>
           <tr>
            <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblallocationExcess" Visible="false" CssClass="styleReqFieldLabel" Text="Allocation Excess"></asp:Label>
   </td>
   <td>
    <asp:TextBox ID="txtallocationexcess" runat="server" Visible="false" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
   </td>
      <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblallocationshortage" Visible="false" CssClass="styleReqFieldLabel" Text="Allocation Shortage"></asp:Label>
   </td>
   <td>
    <asp:TextBox ID="txtallocationshortage" runat="server" Visible="false" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
   </td>
        </tr>
        </table>
        </td>
        </tr>
        
    <tr>
   <td class="styleFieldAlign" >
   <asp:Panel ID="pnlFunder" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Funder Allocation Status Details">
    <div id="divFunder" runat="server" style="overflow: scroll; height: 200px; display:none" >
   <asp:GridView ID="grvFunder" runat="server" AutoGenerateColumns="False"  BorderWidth="2"
                            CssClass="styleInfoLabel" Width="100%" ShowFooter="true" ShowHeader="true">
                            <Columns>
                             <asp:TemplateField HeaderText="Activity">
                                    <ItemTemplate>
                                        <asp:Label ID="lblActivity" runat="server" Text='<%# Bind("LOBName") %>' ToolTip="Activity"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lbllocation" runat="server" Text='<%# Bind("LOCATION_CODE") %>' ToolTip="Location Code"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Funder Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFunder" runat="server" Text='<%# Bind("FUNDERNAME") %>' ToolTip="Funder Name"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Customer Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcustomername" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip="Customer Name"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                             <asp:TemplateField HeaderText="Account Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpanum" runat="server" Text='<%#Bind("PANUM") %>' ToolTip="Account Number"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                    <FooterStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sub Account Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsanum" runat="server" Text='<%#Bind("SANUM")%>' ToolTip="Sub Account Number"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <FooterStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Net Exposure">
                                    <ItemTemplate>
                                        <asp:Label ID="lblnetexposure" runat="server" Text='<%# Bind("NET_EXPOSURE") %>' ToolTip="Net Exposure"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotnetexposure" runat="server" ToolTip="sum of Ageing 30 days"></asp:Label>
                                    </FooterTemplate>
                                    
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Arrear Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldues" runat="server" Text='<%# Bind("DUES") %>' ToolTip="Arrear Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotArrearAmount" runat="server" ToolTip="sum of Arrear Amount"></asp:Label>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Maturity Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMaturitydate" runat="server" Text='<%# Bind("MATURITY_DATE") %>' ToolTip="Maturity Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("STATUS") %>' ToolTip="Status"></asp:Label>
                                    </ItemTemplate>
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
            <td >
                <asp:Button ID="BtnPrint" CssClass="styleSubmitButton" Visible="false" runat="server" Text="Print" OnClick="BtnPrint_Click"  ToolTip="Print" />
                      
            </td>
           
        </tr>
           <tr>
        <td>
        <asp:ValidationSummary ID="vsFund" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
        <asp:CustomValidator ID="cvFund" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
        </td>
        </tr>
 </table>
          
</asp:Content>

