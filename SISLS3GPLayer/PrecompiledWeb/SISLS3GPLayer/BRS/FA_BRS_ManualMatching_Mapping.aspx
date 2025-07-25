<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="BRS_FA_BRS_ManualMatching_Mapping, App_Web_kopy3kxt" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/PageNavigator.ascx" TagPrefix="uc1" TagName="PageNavigator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr width="100%">
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="BRS ManualMatching" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
            </td>
        </tr>

          <tr>
                                            <td>
                                                <asp:Panel ID="pnlBankReconciliation" Height="100%" runat="server" CssClass="stylePanel">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblLocation" Text="Location" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                               <%-- <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" OnItem_Selected="ddlLocation_SelectedIndexChanged"
                                                                    AutoPostBack="true" ItemToValidate="Value" ValidationGroup="Save" IsMandatory="true" ErrorMessage="Select Location" />--%>
                                                                <asp:DropDownList ID="ddlLocation" runat="server" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                <%--   <cc1:ComboBox ID="ddlLocation" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                                                    CssClass="WindowsStyle" MaxLength="0" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                                                </cc1:ComboBox>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVddlLocation" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="--Select--"
                                                                    ErrorMessage="Select Location" ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblDocumentNo" Text="Document Number"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtDocumentNo" runat="server" ToolTip="Document Number"
                                                                    ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblBankName" Text="Bank Name *"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <cc1:ComboBox ID="ddlBankName" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                    AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                    >
                                                                </cc1:ComboBox>
                                                                <asp:RequiredFieldValidator ID="rfvddlBankName" runat="server" ControlToValidate="ddlBankName"
                                                                    InitialValue="--Select--" ErrorMessage="Select Bank Name" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Save" />
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblDocumentDate" Text="Document Date *"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtDocumentDate" runat="server" 
                                                                    AutoPostBack="true" ></asp:TextBox>
                                                                <asp:Image ID="imgPaymentRequestDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                <cc1:CalendarExtender ID="CEDocumentDate" runat="server" PopupButtonID="imgDocumentDate"
                                                                    TargetControlID="txtDocumentDate" Enabled="true">
                                                                </cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtDocumentDate" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtDocumentDate"
                                                                    ErrorMessage="Enter Document Date"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                       
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblStartDate" runat="server" Text="Start Date *" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtStartDate" runat="server" ></asp:TextBox>
                                                                <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                <cc1:CalendarExtender ID="CEStartDate" runat="server" PopupButtonID="imgStartDate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtStartDate">
                                                                </cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtStartDate" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtStartDate"
                                                                    ErrorMessage="Enter Start Date"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblEnddate" runat="server" Text="End Date *" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtEndDate" runat="server" ></asp:TextBox>
                                                                <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                <cc1:CalendarExtender ID="CEEndDate" runat="server" PopupButtonID="ImgEndDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                    TargetControlID="txtEndDate">
                                                                </cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtEndDate" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtEndDate"
                                                                    ErrorMessage="Enter End Date"></asp:RequiredFieldValidator>
                                                                <asp:Button ID="btnFetch" Text="Fetch" ToolTip="Fetch,Alt+F" runat="server" 
                                                                    CssClass="styleSubmitShortButton"  AccessKey="F" OnClick="btnFetch_Click"  />
                                                            </td>
                                                        </tr>


    </table>
                                                    </asp:Panel>
                                                </td>
              </tr>
        <tr>
            <td>
            <table width="100%">
                <tr>
                    <td width="50%">
                        <asp:Panel ID="pnlBankBook" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Bank Book Details">
                        <table width="100%">
                            <tr>
                                <td>
 
                                   <asp:DropDownList ID="ddlSearchFilter" runat="server" >
                                        <asp:ListItem Value="0" Text="--Filter By--"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="By Date"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="By Document Number"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="By ref No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSearch" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        
                       
                            <asp:GridView runat="server" Width="100%" AutoGenerateColumns="false" ID="grvBankbook">
                                  <Columns>
                                                                        <asp:TemplateField HeaderText="Sl.No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUpldSno" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                     
                                                                        <asp:TemplateField HeaderText="Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbldate" runat="server" Text='<%# Bind("Doc_Date") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Doc. No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbldocno" runat="server" Text='<%# Bind("Doc_no") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                       <asp:TemplateField HeaderText="Ref Doc. No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRefDocno" runat="server" Text='<%# Bind("Ref_Doc_no") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Debit Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbldebitamount" runat="server" Text='<%# Bind("Debit_Amount") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                       <asp:TemplateField HeaderText="Credit Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCredit_Amount" runat="server" Text='<%# Bind("Credit_Amount") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkselect" runat="server" Text='<%# Bind("Manual_match") %>' Style="display: none"></asp:CheckBox>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                       
                                                                    </Columns>
                            </asp:GridView>

                      
                                    </td>
                                </tr>
                            <tr>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="bklindocNo" runat="server" Text="Link Doc No."></asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:TextBox ID="txtBkLinkDocNo" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblBkpTotalDebits" runat="server" Text="Total Debits"></asp:Label>
                                </td>
                                <td  class="styleFieldAlign">
                                    <asp:TextBox ID="txtTotalDebits" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblBkpTotalCredits" runat="server" Text="Total Credits"></asp:Label>
                                </td>
                                <td  class="styleFieldAlign">
                                    <asp:TextBox ID="txtTotalCredits" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            </table>
                            </asp:Panel>
                    </td>

                    <td width="50%">
                            <asp:Panel ID="pnlBankStatement" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Bank Statement Details">
                         <table width="100%">
                            <tr>
                                <td>
                                   <asp:DropDownList ID="DropDownList1" runat="server" >
                                        <asp:ListItem Value="0" Text="--Filter By--"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="By Date"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="By Document Number"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="By ref No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                    
                            <asp:GridView runat="server" Width="100%" AutoGenerateColumns="false" ID="grvBankStatement">
                                  <Columns>
                                                                        <asp:TemplateField HeaderText="Sl.No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUpldSno" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                     
                                                                        <asp:TemplateField HeaderText="Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbldate" runat="server" Text='<%# Bind("Doc_Date") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Doc. No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbldocno" runat="server" Text='<%# Bind("Doc_no") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                       <asp:TemplateField HeaderText="Ref Doc. No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRefDocno" runat="server" Text='<%# Bind("Ref_Doc_no") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Debit Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbldebitamount" runat="server" Text='<%# Bind("Debit_Amount") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                       <asp:TemplateField HeaderText="Credit Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCredit_Amount" runat="server" Text='<%# Bind("Credit_Amount") %>' Style="display: none"></asp:Label>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkselect" runat="server" Text='<%# Bind("Manual_match") %>' Style="display: none"></asp:CheckBox>
                                                                             </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                       
                                                                    </Columns>
                            </asp:GridView>

                        
                                    </td>
                                </tr>
                                <tr>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="Label1" runat="server" Text="Link Doc No."></asp:Label>
                                </td>
                                <td  class="styleFieldAlign">
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="Label2" runat="server" Text="Total Debits"></asp:Label>
                                </td>
                                <td  class="styleFieldAlign">
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="Label3" runat="server" Text="Total Credits"></asp:Label>
                                </td>
                                <td  class="styleFieldAlign">
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             </table>
                                </asp:Panel>
                    </td>
                </tr>
            </table>
                </td>
        </tr>

             <tr align="center">
            <td>
                <asp:Button runat="server" ID="btnSave" Text="Save" ToolTip="Save,Alt+S"
                    CssClass="styleSubmitButton" 
                    ValidationGroup="Save" Enabled="false" AccessKey="S" />
                &nbsp;
                <asp:Button runat="server" ID="btnClear" OnClick="btnClear_Click" ToolTip="Clear_FA"
                    Text="Clear_FA" CausesValidation="false" CssClass="styleSubmitButton" />
                &nbsp;
                <asp:Button runat="server" ID="btnCancel" Text="Exit" ToolTip="Cancel" CausesValidation="false"
                    CssClass="styleSubmitButton" OnClick="btnCancel_Click" AccessKey="X" />
               
            </td>
        </tr>
        </table>
</asp:Content>

