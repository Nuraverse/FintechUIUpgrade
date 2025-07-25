<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_RPT_Fund_Availability, App_Web_ygb51gin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
                        <%--Row for Location and Date --%>
                        <tr>
                          <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblDate" Text="Drawdown Date" />
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtDate" 
                                  AutoPostBack ="true"  Width="160px" />
                                <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtDate" 
                                    PopupButtonID="txtDate" ID="CalDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate"
                                    ErrorMessage="Select Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                         <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblFunder" CssClass="styleReqFieldLabel" Text="Priority"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                               <%-- <asp:DropDownList ID="ddlFunder" runat="server" ToolTip="Funder" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlFunder_SelectedIndexChanged" />
                               --%>
                                <cc1:ComboBox ID="ddlsort" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" 
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                    <asp:ListItem Text="--Select--" Value=0></asp:ListItem>
                                    <asp:ListItem Text="Best Rate" Value=1></asp:ListItem>
                                    <asp:ListItem Text="Date" Value=2></asp:ListItem>
                                    <asp:ListItem Text="Funder" Value=3></asp:ListItem>
                                </cc1:ComboBox>
                                
                                <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                                
                            </td>
                        </tr>
                        <%--Row For Funder--%>
                        <tr>
                       <td class="styleFieldLabel" width="15%">
                                <asp:Label runat="server" ID="lblToFund" Text="Expand" />
                            </td>
                            <td class="styleFieldLabel"  width="10%"    >
                                <asp:CheckBox ID="chkfund" runat="server"  AutoPostBack="true"/>
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
                <asp:Button ID="btnGo" runat="server" Text="Go" ValidationGroup="vgGo" OnClick="btnGo_Click"  CssClass="styleSubmitButton"
                    />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Clear_FA" OnClientClick="return fnConfirmClear();"  />
                     <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" 
                    CssClass="styleSubmitButton" ToolTip="Cancel"/>
            </td>
        </tr>
        <tr>
        <td>
         <asp:Panel ID="pnlDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Fund Availability Details">
            <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display:none" >
                    <table>
                    <tr>
                    <td>
                        <asp:GridView ID="grvtransaction" runat="server" AutoGenerateColumns="False"  BorderWidth="2"
                            CssClass="styleInfoLabel"   ShowFooter="true" ShowHeader="true" >
                            <Columns>
                                    <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server"  Text='<%# Bind("Due_Date") %>' ToolTip="Date"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" Width="10%" />
                                    <ItemStyle HorizontalAlign="Left" Width="10%"  />
                                     <FooterStyle HorizontalAlign="Left" Width="10%"  />
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Funder Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFundername" runat="server" Text='<%# Bind("Funder_name") %>' ToolTip="Funder name"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                              <asp:TemplateField HeaderText="Fund Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFundtype" runat="server" Text='<%# Bind("Fund_Type") %>' ToolTip="Funder name"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Currency">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcurrency" runat="server" Text='<%# Bind("Currency") %>' ToolTip="Currency"></asp:Label>
                                    </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                    <FooterStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Commitment Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcommitmentamount" runat="server" Text='<%# Bind("commitment_amount1") %>' ToolTip="Tranche"></asp:Label>
                                    </ItemTemplate>
                                       <FooterTemplate>
                                        <asp:Label ID="lblcommitmenttotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right"  />
                                     <FooterStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tranche Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltrancheamount" runat="server" Text='<%# Bind("tranche_amount1") %>' ToolTip="Sanction number"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltrancheamounttotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Right"  />
                                     <FooterStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Drawdown Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDueamount" runat="server" Text='<%# Bind("Due_Amount1") %>' ToolTip="Due Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbldueamounttotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Right"  />
                                     <FooterStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                
                              <asp:TemplateField HeaderText="Received Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblreceivedamount" runat="server" Text='<%# Bind("received_amount1") %>' ToolTip="Due Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblreceivedamountotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                       <ItemStyle HorizontalAlign="Right"  />
                                     <FooterStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Available Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblavailableamount" runat="server" Text='<%# Bind("available_amount1") %>' ToolTip="Due Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblavailableamounttotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Right"  />
                                     <FooterStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbaserate" runat="server" Text='<%# Bind("Base_Rate1") %>' ToolTip="Base Rate"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotalReceipts" runat="server" ToolTip="sum of  Credit amount"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Right"  />
                                     <FooterStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Spread Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblspreadrate" runat="server" Text='<%# Bind("Spread_Rate1") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotalbalance" runat="server" ToolTip="sum of  Balance amount"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Right"  />
                                     <FooterStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                             
                                  <asp:TemplateField HeaderText="COF%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcof" runat="server" Text='<%# Bind("COF1") %>'></asp:Label>
                                    </ItemTemplate>
                                    
                                    <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Right"  />
                                     <FooterStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                 
                            </Columns>
                          </asp:GridView>
                         </td>
                         </tr>
                          
                         </table>
                        </div>
             </asp:Panel>
        </td>
        </tr>
        
  
        <%--For Showing Grid--%>
      <tr>
            <td align="center">
                <br />
                <asp:Button ID="btnPrint" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Print" OnClick="btnPrint_Click" />
                <asp:Button ID="btnEmail" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Email" OnClick="btnEmail_Click"  />
                    <asp:Button ID="btnexcel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Excel" OnClick="FunExcelExport"  />
                <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsDealinflow" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="cvDealInflow" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
</asp:Content>

