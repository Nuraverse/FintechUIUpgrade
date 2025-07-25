<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_Deal_Inflow_Statement, App_Web_u0nem2mh" %>
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
                                <asp:Label runat="server" ID="lblFunder" CssClass="styleReqFieldLabel" Text="Funder"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                               <%-- <asp:DropDownList ID="ddlFunder" runat="server" ToolTip="Funder" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlFunder_SelectedIndexChanged" />
                               --%>
                                <cc1:ComboBox ID="ddlFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" 
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="ddlFunder_OnSelectedIndexChanged">
                                </cc1:ComboBox>
                                
                                <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                                <asp:RequiredFieldValidator ID="rfvFunder" runat="server" ControlToValidate="ddlFunder"
                                    InitialValue="--Select--" ErrorMessage="Select Funder" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            
                             <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblDate" Text="As On Date" />
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
                        </tr>
                        <%--Row For Funder--%>
                        <tr>
                       <td class="styleFieldLabel" width="15%">
                                <asp:Label runat="server" ID="lblReceiptPrint" Text="Receipt Details" />
                            </td>
                            <td class="styleFieldLabel"  width="10%"    >
                                <asp:CheckBox ID="chkReceiptPrint" runat="server"  AutoPostBack="true"/>
                            </td>
                            <td class="styleFieldLabel" width="15%">
                                                           <asp:Label runat="server" ID="lblfund" Text="Funder Sort" />
                                                           <asp:CheckBox ID="chkfunder" runat="server"   AutoPostBack="true" OnCheckedChanged="chkfunder_OnCheckedChanged"/>
                            </td>
                            <td class="styleFieldLabel"  width="10%"    >
                                <asp:Label runat="server" ID="lblsortdate" Text="Date Sort" />
                                 <asp:CheckBox ID="chkdate" runat="server" Checked="true"  AutoPostBack="true"/>
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
                <asp:Button ID="btnGo" runat="server" Text="Go" ValidationGroup="vgGo" OnClick="btnGo_Click" CssClass="styleSubmitButton"
                    />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Clear_FA" OnClientClick="return fnConfirmClear();"  />
                     <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" 
                    CssClass="styleSubmitButton" ToolTip="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
        <td>
         <asp:Panel ID="pnlDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Deal Inflow Details">
            <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display:none" >
                    <table >
                    <tr>
                    <td>
                        <asp:GridView ID="grvtransaction" runat="server" AutoGenerateColumns="False"  BorderWidth="2"
                            CssClass="styleInfoLabel"    ShowFooter="true" ShowHeader="true" >
                            <Columns>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server"  Text='<%# Bind("Date") %>' ToolTip="Date"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Deal Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDealnumber" runat="server" Text='<%# Bind("Deal_Number") %>' ToolTip="Deal_Number"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Funder Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFundername" runat="server" Text='<%# Bind("Funder_name") %>' ToolTip="Funder name"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tranche">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTranche" runat="server" Text='<%# Bind("Tranche") %>' ToolTip="Tranche"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sanction Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSanctionNumber" runat="server" Text='<%# Bind("Sanction_number") %>' ToolTip="Sanction number"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Tran Currency Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltranamount" runat="server" Text='<%# Bind("FC_AMount1") %>' ToolTip="Sanction number"></asp:Label>
                                    </ItemTemplate>
                                    
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDueamount" runat="server" Text='<%# Bind("Due_Amount1") %>' ToolTip="Due Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblDueamountTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Currency">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcurrency" runat="server" Text='<%# Bind("Currency") %>' ToolTip="Currency"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotalDues" runat="server" Text="" ToolTip="sum of  Debit amount"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                    <FooterStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblbaserate" runat="server" Text='<%# Bind("Base_Rate1") %>' ToolTip="Base Rate"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotalBaserate" runat="server" ToolTip="sum of  Credit amount" Text=""></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right"  />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Spread Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblspreadrate" runat="server" Text='<%# Bind("Spread_Rate1") %>'></asp:Label>
                                    </ItemTemplate>
                                      <FooterTemplate>
                                        <asp:Label ID="lblTotalspreadrate" runat="server" ToolTip="sum of  Credit amount" Text=""></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right"  />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="COF%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcof" runat="server" Text='<%# Bind("COF") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right"  />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Receipt Reference">
                                    <ItemTemplate>
                                        <asp:Label ID="lblreceiptref" runat="server" Text='<%# Bind("Receipt_Ref_No") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                    <FooterStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Receipt Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblreceiptdate" runat="server" Text='<%# Bind("Receipt_Date") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                    <FooterStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Receipt Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblreceiptAmount" runat="server" Text='<%# Bind("Receipt_Amount1") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotalreceiptAmount" runat="server" ToolTip="sum of  Receipt amount" Text=""></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right"  />
                                    <FooterStyle HorizontalAlign="Right" />
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
                    Visible="false" Text="Print" OnClick="btnPrint_Click"/>
                <asp:Button ID="btnEmail" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Email"  />
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

