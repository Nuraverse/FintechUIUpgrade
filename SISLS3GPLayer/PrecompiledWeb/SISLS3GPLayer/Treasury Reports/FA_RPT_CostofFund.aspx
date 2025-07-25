<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_RPT_CostofFund, App_Web_u0nem2mh" %>
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
                     
                        </tr>
                        <%--Row For Funder--%>
                          <tr>
                                <td  class="styleFieldLabel" width="10%">
                            <asp:Label runat="server" Text="From Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                        </td>
                        <td width="25%" class="styleFieldAlign"  align="left">
                            <asp:TextBox ID="txtStartDateSearch"  onmouseover="txt_MouseoverTooltip(this)"  runat="server"  
                                AutoPostBack="True" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFromdate" runat="server" ControlToValidate="txtStartDateSearch"
                                                        Display="None" ErrorMessage="Select Start Date" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
                            <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                            </cc1:CalendarExtender>
                          
                        </td>
                          <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" ID="lblEndDateSearch" Text="To Date" CssClass="styleDisplayLabel" />
                        </td>
                        <td width="25%" class="styleFieldAlign" align="left">
                            <asp:TextBox ID="txtEndDateSearch" runat="server" Width="150px" 
                                AutoPostBack="True" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                PopupButtonID="imgEndDate" TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                            </cc1:CalendarExtender>
                            <asp:Image runat="server" ID="imgEndDate" Visible="false" />
                            <asp:RequiredFieldValidator ID="rfvenddate" runat="server" ControlToValidate="txtEndDateSearch"
                                                        Display="None" ErrorMessage="Select End Date" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
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
                               
                                      <asp:TemplateField HeaderText="Deal Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDealnumber" runat="server" Text='<%# Bind("Deal_Number") %>' ToolTip="Deal_Number"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server"  Text='<%# Bind("Date") %>' ToolTip="Date"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Funder Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFundername" runat="server" Text='<%# Bind("Funder_name") %>' ToolTip="Funder name"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sanction Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsanctionnumber" runat="server" Text='<%# Bind("sanction_num") %>' ToolTip="Funder name"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commitment Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCommitmentamount" runat="server" Text='<%# Bind("commitment_amount1") %>' ToolTip="commitment_amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblcommitmentTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Availment Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblavailmentamount" runat="server" Text='<%# Bind("avail_amount1") %>' ToolTip="Facility Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblavailmentTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Drawn Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldrawnamt" runat="server" Text='<%# Bind("drawn_amt") %>' ToolTip="Facility Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbldrawnamtTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Paid Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpaidamount" runat="server" Text='<%# Bind("paid_amt") %>' ToolTip="Facility Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblpaidamountTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Payable Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpayableamount" runat="server" Text='<%# Bind("payable_amt") %>' ToolTip="Facility Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblpayableTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
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


