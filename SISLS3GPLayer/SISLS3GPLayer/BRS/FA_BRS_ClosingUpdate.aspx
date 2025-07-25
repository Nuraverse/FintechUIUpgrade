<%@ Page Title="" Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true" CodeFile="FA_BRS_ClosingUpdate.aspx.cs" Inherits="BRS_FA_BRS_ClosingUpdate" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/PageNavigator.ascx" TagPrefix="uc1" TagName="PageNavigator" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table width="100%">
        <tr width="100%">
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="BRS Closing Update" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
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
                                                                <asp:DropDownList ID="ddlLocation" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"></asp:DropDownList>
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
                                                                 <td class="styleFieldLabel" width="25%">
                                <asp:Label runat="server" Text="From Month/Year" ID="lblFrmMonth" CssClass="styleReqFieldLabel" ToolTip="From Month/Year">
                                </asp:Label>
                            </td>
                                                               <td class="styleFieldAlign" width="25%">
                                <asp:TextBox ID="txtFrmMonthyr" runat="server" Width="148px"   ToolTip="From Month/Year"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="txtFrmMonthyr" 
                                BehaviorID="calendar1" Format="MMM/yyyy" TargetControlID="txtFrmMonthyr" OnClientShown="onCalendarShown">
                                </cc1:CalendarExtender>
                                 <asp:Button ID="Button1" Visible="false" Text="Fetch" ToolTip="Fetch,Alt+F" runat="server" 
                                                                    CssClass="styleSubmitShortButton"  AccessKey="F"   />
                            </td>
                                                       </tr>
   <tr align="center">
            <td colspan="4">
                <asp:Button runat="server" ID="btnSave" Text="Save" ToolTip="Save,Alt+S"
                    CssClass="styleSubmitButton" 
                    ValidationGroup="Save" Enabled="false" AccessKey="S" />
                &nbsp;
                <asp:Button runat="server" ID="btnClear"  ToolTip="Clear_FA"
                    Text="Clear_FA" CausesValidation="false" CssClass="styleSubmitButton" />
                &nbsp;
                <asp:Button runat="server" ID="btnCancel" Text="Exit" ToolTip="Cancel" CausesValidation="false"
                    CssClass="styleSubmitButton" OnClick="btnCancel_Click" AccessKey="X" />
               
            </td>
        </tr>
                                                             
                                                       


    </table>
                                                    </asp:Panel>
                                                </td>
              </tr>
          </table>
          
</asp:Content>

