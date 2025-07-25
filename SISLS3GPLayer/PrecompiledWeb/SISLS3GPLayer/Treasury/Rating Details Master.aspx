<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_Rating_Details_Master, App_Web_insjbia3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Rating Details Master" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Rating Details Master">
                    <table width="100%">
                        <tr>
                            <%--Col1--%>
                            <td width="50%">
                                <%--table for Location and Funder Code --%>
                                <table width="100%" cellpadding="2 px">
                                    <%--Row for Funder Code --%>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblRate" CssClass="styleReqFieldLabel" Text="Rating Agency Name"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtRate" runat="server" ToolTip="Rating Agency Name" AutoPostBack="false"
                                                Width="269px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                                                ValidationGroup="INVDetails" ErrorMessage="Please enter the agency name" Display="None"></asp:RequiredFieldValidator>
                                            <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                                            <%--             <asp:RequiredFieldValidator ID="rfvFunderCode" runat="server" ControlToValidate="ddlFunderCode"
                                                 ErrorMessage="Select Funder Code/Name"  SetFocusOnError="True"
                                                ValidationGroup="Save" ></asp:RequiredFieldValidator>
                                                --%>
                                         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRate"
                                                            FilterType="LowercaseLetters">
                                                        </cc1:FilteredTextBoxExtender>
                                       
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10 px">
                                        </td>
                                    </tr>
                                    <%--Row for Location --%>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="lblBorrow" runat="server" CssClass="styleReqFieldLabel" Text="Borrowing Term"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:DropDownList ID="ddlBorrow" runat="server" Width="169px" AutoPostBack="true">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">Short Term</asp:ListItem>
                                                <asp:ListItem Value="2">Medium Term</asp:ListItem>
                                                <asp:ListItem Value="3">Long Term</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvBor" InitialValue="0" runat="server" Display="None"
                                                ControlToValidate="ddlBorrow" ValidationGroup="INVDetails" ErrorMessage="Select the borrowing term"></asp:RequiredFieldValidator>
                                            <%-- <td class="styleFieldAlign">
                                        <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" Width="141px"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>--%>
                                            <%--<asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" Width="170px" />--%>
                                            <%-- AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblRateAssigned" Text="Rating Assigned" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtRateAssigned" Width="165px" ToolTip="Rating Assigned" runat="server" />
                                            <asp:RequiredFieldValidator ID="rfvRating" runat="server" ControlToValidate="txtRateAssigned"
                                                Display="None" ValidationGroup="INVDetails" ErrorMessage="Please enter the assigned rating"></asp:RequiredFieldValidator>
                                            <%--<asp:RegularExpressionValidator ID="regRatingAs" runat="server" ControlToValidate="txtRateAssigned"
                                                ValidationGroup="INVDetails" ValidationExpression="^[a-z]*$"></asp:RegularExpressionValidator>--%>
                                        
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtRateAssigned"
                                                            FilterType="Numbers">
                                                        </cc1:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="lblFrom" runat="server" Text="Valid From" />
                                        </td>
                                        <td class="styleFieldAlign" align="right">
                                            <asp:TextBox ID="txtFrom" Width="165px" ToolTip="Valid From" AutoPostBack="true"
                                                OnTextChanged="txtFrom_TextChanged" runat="server"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFrom"
                                                PopupButtonID="txtFrom" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvFrom" Display="None" runat="server" ControlToValidate="txtFrom"
                                                ValidationGroup="INVDetails" SetFocusOnError="true" ErrorMessage="Please select the date range"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="lblRtingRef" runat="server" Text="Rating Reference"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtRatingReference" runat="server" MaxLength="30" Width="165px"></asp:TextBox>
                                            <%--<cc1:FilteredTextBoxExtender ID="flRef" TargetControlID="txtRatingReference" BehaviorID="bhvRate"
                                        
                                         FilterType="LowercaseLetters"  FilterMode="ValidChars" runat="server" Enabled="true" ></cc1:FilteredTextBoxExtender>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="ibiAddress" Text="Address" Visible="false" />
                                        </td>
                                        <%--<td class="styleFieldAlign">
                                            <asp:TextBox ID="txtAddress" Width="165px"   onmouseover="txt_MouseoverTooltip(this)" ToolTip="Address" TextMode="MultiLine"
                                                runat="server" ReadOnly="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblPhone" Text="Phone" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtPhone" Width="100px"  onmouseover="txt_MouseoverTooltip(this)" ToolTip="Phone" runat="server" ReadOnly="true" />--%>
                                        <%--   <asp:Label runat="server" ID="tbtMobile" Text="[M]" />
                                <asp:TextBox ID="txtMobile" Width ="165px" runat="server" ReadOnly="true" />--%>
                                        <%--</td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblMail" Text="EMail Id" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtMail" Width="165px"  onmouseover="txt_MouseoverTooltip(this)" ToolTip="Email Id" runat="server" ReadOnly="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblWeb" Text="Web Site" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtWeb" Width="165px"  onmouseover="txt_MouseoverTooltip(this)" ToolTip="Web Site" runat="server" ReadOnly="true" />
                                        </td>
                                    </tr>--%>
                                </table>
                                <%--Custom Control for Address--%>
                                <table width="100%">
                                    <%-- <tr> 
                            
                            <td width="50%">
                            <uc1:FAAddressDetail ID="FAAddressDetail" ActiveViewIndex="1" ShowCode ="false" ShowName ="false"  runat="server" 
                             FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                            </td>
                            </tr>--%>
                                </table>
                            </td>
                            <%--Col2--%>
                            <td width="33%">
                                <%--table for Funder Code and Amount details --%>
                                <table width="100%" cellspacing="4px">
                                    <tr>
                                        <td width="100%">
                                            <table width="100%">
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label ID="lblDateRate" Text="Date of Rating" runat="server" />
                                                    </td>
                                                    <td class="styleFieldAlign" width="50%">
                                                        <asp:TextBox ID="txtDate_Rating" ToolTip="Date of Rating" Width="165px" runat="server"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalFromDate" runat="server" TargetControlID="txtDate_Rating"
                                                            PopupButtonID="txtDate_Rating" Enabled="True">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <%--       <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblDate" Text="Date of Rating"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtDate" Width="165px" ToolTip="Allocation Date" runat="server"></asp:TextBox>
                                                       
                                                           
                                                    </td>
                                                </tr>--%>
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblRatingAmount" Text="Rating Amount"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtRatingAmount" Width="165px" ToolTip="Rating Amount" MaxLength="30"
                                                            runat="server"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="flRatingAmount" runat="server" TargetControlID="txtRatingAmount"
                                                            FilterType="Numbers">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblTo" Text="Valid To" />
                                                    </td>
                                                    <td class="styleFieldAlign" align="left">
                                                        <asp:TextBox ID="txtTo" OnTextChanged="txtTo_TextChanged" Width="165px" Style="text-align: right;"
                                                            ToolTip="Valid To" runat="server" AutoPostBack="true"></asp:TextBox>
                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtTo" PopupButtonID="txtTo"
                                                            ID="CalendarExtender2" Enabled="True">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <%--<tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblAllocatedAmt" Text="Allocated Amount" />
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtAllocatedAmt" Width="165px" Style="text-align: right;" ToolTip="Allocated Amount"
                                                            onmouseover="txt_MouseoverTooltip(this)"  runat="server" ReadOnly="true" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="100%">
                                            <asp:Panel ID="pnldateRange" Width="98%" runat="server" GroupingText="Date Range"
                                                CssClass="stylePanel">
                                                <%--table for Date Range details  --%>
                                                <table width="100%">
                                                    <tr>
                                                        <%-- <td class="styleFieldLabel" width="25%">
                               <asp:Label runat="server" ID="lblDateRange"  Text="Date Range" />  
                            </td>--%>
                                                        <td class="styleFieldLabel" width="52%">
                                                            <asp:Label runat="server" ID="lblFromDate" Visible="false" Text="From" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtFromDate" Visible="false" runat="server" Width="165px" onmouseover="txt_MouseoverTooltip(this)"
                                                                ToolTip="From Date" />
                                                            <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                        </td>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="50%">
                                                                <asp:Label runat="server" ID="lblToDate" Visible="false" Text="To"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtToDate" runat="server" ToolTip="To Date" Visible="false" Width="165px"></asp:TextBox>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate2"
                                                                    PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                        <%--     <tr>
                                                                <td class="styleFieldLabel" width="50%">
                                                                    <asp:Label runat="server" ID="lblShowAll" Text="Show All" ></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign" align="left">
                                                                    <asp:CheckBox ID="chkShowAll" runat="server" ToolTip="Show All" AutoPostBack="true"
                                                                        OnCheckedChanged="chkShowAll_OnCheckedChanged" />
                                                                    &nbsp; &nbsp;
                                                                    <asp:Button ID="btnGo" runat="server" Enabled="true" Text="Go" ToolTip="To list the Accounts for Allocation"
                                                                      ValidationGroup="VgGo"  CssClass="styleSubmitButton" OnClick="btnGo_Click" />
                                                                </td>
                                                            </tr>--%>
                                                        <%--</table>--%>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </td> </tr> </table>
    <br />
    <br />
    <tr class="styleFieldAlign">
        <td align="right">
            <table>
                <tr>
                    <td colspan="10">
                    </td>
                    <td colspan="10">
                    </td>
                    <td align="center" colspan="10">
                        <asp:Button ID="btnSave" runat="server" CausesValidation="true" Text="Save" ToolTip="Save the Payment request"
                            CssClass="styleSubmitButton" ValidationGroup="INVDetails" OnClientClick="return fnCheckPageValidators('INVDetails');"
                            OnClick="btnSave_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear_FA" CssClass="styleSubmitButton"
                            ValidationGroup="Save" OnClientClick="return confirm('Are you sure want to Clear_FA?');"
                            OnClick="btnClear_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CausesValidation="false"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <td>
        <asp:ValidationSummary ValidationGroup="INVDetails" ID="vsSummary" runat="server" CssClass="styleMandatoryLabel"
            ShowMessageBox="false" ShowSummary="true" HeaderText="Correct the following validation(s):  " />
    </td>
    </tr> </td> </tr>
    <table cellpadding="0 px" cellspacing="200 px">
</asp:Content>
