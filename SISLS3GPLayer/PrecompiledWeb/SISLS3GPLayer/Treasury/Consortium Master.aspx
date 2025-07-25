<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_Consortium_Master, App_Web_insjbia3" enableeventvalidation="false" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagPrefix="cc1" TagName="LOV" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
  
    
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:UpdatePanel ID="upCons" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
   
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Consortium Master" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Consortium Master (Amounts entered should be in lakhs)">
                    <table width="100%">
                        <tr>
                            <%--Col1--%>
                            <td width="50%">
                                <%--table for Location and Funder Code --%>
                                <table width="100%" cellpadding="2 px">
                                    <%--Row for Funder Code --%>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="lblSlno" runat="server" Visible="false" Enabled="false"></asp:Label>
                                            <asp:Label runat="server" ID="lblCons" CssClass="styleReqFieldLabel" Text="Consortium Name :"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtCons" runat="server" ToolTip="Consortium Name" AutoPostBack="false"
                                                Width="269px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCons" runat="server" ControlToValidate="txtCons"
                                                ValidationGroup="INVDetails" ErrorMessage="Please enter the Consortium name"
                                                Display="None"></asp:RequiredFieldValidator>
                                            <cc1:FilteredTextBoxExtender ID="filName" runat="server" FilterType="LowercaseLetters, UppercaseLetters"
                                                TargetControlID="txtCons">
                                            </cc1:FilteredTextBoxExtender>
                                            <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                                            <%--             <asp:RequiredFieldValidator ID="rfvFunderCode" runat="server" ControlToValidate="ddlFunderCode"
                                                 ErrorMessage="Select Funder Code/Name"  SetFocusOnError="True"
                                                ValidationGroup="Save" ></asp:RequiredFieldValidator>
                                                --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10 px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="LabelBoard" runat="server" CssClass="styleReqFieldLabel" Text="Resolution Amount :"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtBoard"  Style="text-align: right;" runat="server" Width="169px"
                                                 ToolTip="Board Resoln. Amount"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvBoard" runat="server" ControlToValidate="txtBoard"
                                                ValidationGroup="INVDetails" ErrorMessage="Please enter the Board Resoln. Amount"
                                                Display="None"></asp:RequiredFieldValidator>
                                            <%--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers"
                                                TargetControlID="txtBoard">
                                            </cc1:FilteredTextBoxExtender>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="LabelLimit" runat="server" CssClass="styleReqFieldLabel" Text="Total Limit :"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="TextBoxLimit" AutoPostBack="false" Style="text-align: right;" OnTextChanged="TextBoxLimit_TextChanged"
                                                runat="server" Width="169px"   ToolTip="Total Limit"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvLimit" runat="server" ControlToValidate="TextBoxLimit"
                                                ValidationGroup="INVDetails" ErrorMessage="Please enter the total Limit" Display="None"></asp:RequiredFieldValidator>
                                           <%-- <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers"
                                                TargetControlID="TextBoxLimit">
                                            </cc1:FilteredTextBoxExtender>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10 px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="LabelStartDate" runat="server" Text="Start Date :" />
                                        </td>
                                        <td class="styleFieldAlign" align="right">
                                            <asp:TextBox ID="TextStart" Width="165px" ToolTip="Start Date" AutoPostBack="false"
                                                OnTextChanged="txtFrom_TextChanged" runat="server"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="TextStart"
                                                PopupButtonID="Image2" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <asp:RequiredFieldValidator ID="rfvStart" runat="server" ControlToValidate="TextStart"
                                                ErrorMessage="Please select the start date" ValidationGroup="INVDetails" Display="None"></asp:RequiredFieldValidator>
                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="TextStart"
                                                ValidationGroup="INVDetails" SetFocusOnError="true" ErrorMessage="Please select the date range"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <%--Row for Location --%>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%"> 
                                            <asp:Label ID="lblBorrow" runat="server" CssClass="styleReqFieldLabel" Text="Security Type :"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:DropDownList ID="ddlBorrow" OnSelectedIndexChanged="ddlBorrow_SelectedIndexChange"
                                                runat="server" Width="169px" AutoPostBack="true">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">Secured</asp:ListItem>
                                                <asp:ListItem Value="2">Unsecured</asp:ListItem>
                                                <asp:ListItem Value="3">Partially Secured</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvBor" InitialValue="0" runat="server" Display="None"
                                                ControlToValidate="ddlBorrow" ValidationGroup="INVDetails" ErrorMessage="Select the Security Name"></asp:RequiredFieldValidator>
                                            <tr>
                                                <td class="styleFieldLabel" width="50%">
                                                    <asp:Label ID="lblSecName" runat="server" CssClass="styleReqFieldLabel" Text="Security Name :"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlSecName" runat="server" Width="269px" OnSelectedIndexChanged="ddlSecName_SelectedIndexChange" AutoPostBack="true">
                                                        <%--      <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">Secured</asp:ListItem>
                                               <asp:ListItem Value="2">Unsecured</asp:ListItem>
                                                <asp:ListItem Value="3">Partially Secured</asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server"
                                                        Display="None" ControlToValidate="ddlSecName" ValidationGroup="INVDetails" ErrorMessage="Select the borrowing term"></asp:RequiredFieldValidator>
                                                    <%-- <td class="styleFieldAlign">
                                        <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" Width="141px"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>--%>
                                                    <%--<asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" Width="170px" />--%>
                                                    <%-- AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"--%>
                                                </td>
                                            </tr>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label runat="server" ID="lblRateAssigned" Text="Margin :" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtMargin" Style="text-align: left;" AutoPostBack="true" OnTextChanged="txtMargin_TextChanged"
                                                Width="165px" ToolTip="Margin" runat="server" />
                                            <asp:RequiredFieldValidator ID="rfvRating" runat="server" ControlToValidate="txtMargin"
                                                Display="None" ValidationGroup="INVDetails" ErrorMessage="Please enter the assigned rating"></asp:RequiredFieldValidator>
                                            <%--<asp:RegularExpressionValidator ID="regRatingAs" runat="server" ControlToValidate="txtRateAssigned"
                                                ValidationGroup="INVDetails" ValidationExpression="^[a-z]*$"></asp:RegularExpressionValidator>--%>
                                        </td>
                                    </tr>
                                    <%--       <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="lblFrom" runat="server" Text="Valid From" Visible="false" />
                                        </td>
                                        <td class="styleFieldAlign" align="right">
                                            <asp:TextBox ID="txtFrom" Width="165px" Visible="false" ToolTip="Valid From" AutoPostBack="true"
                                                OnTextChanged="txtFrom_TextChanged" runat="server"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFrom"
                                                PopupButtonID="txtFrom" Enabled="True">
                                            </cc1:CalendarExtender>
                                            
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="styleFieldLabel" width="50%">
                                            <asp:Label ID="lblRtingRef" runat="server" Text="Total Security :"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtSecurityLimit" runat="server" Style="text-align: right;" MaxLength="30"
                                                Width="165px"></asp:TextBox>
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
                                                        <asp:Label ID="lblDateRate" Text="Board Resolution Date :" runat="server" />
                                                    </td>
                                                    <td class="styleFieldAlign" width="50%">
                                                        <asp:TextBox ID="txtDate_Board" ToolTip="Board Resolution Date" Width="100px" runat="server"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalFromDate" runat="server" TargetControlID="txtDate_Board"
                                                            PopupButtonID="Imag" Enabled="True">
                                                        </cc1:CalendarExtender>
                                                        <asp:Image ID="Imag" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                    </td>
                                                    <asp:RequiredFieldValidator ID="rfvBord" runat="server" ControlToValidate="txtDate_Board"
                                                        ValidationGroup="INVDetails" Display="None" ErrorMessage="Please enter the resolution date"
                                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                                        <asp:Label runat="server" ID="lblRatingAmount" Text="Meeting Date :"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMeetingDate" OnTextChanged="txtFrom_TextChanged" Width="100px"
                                                            ToolTip="Meeting Date" MaxLength="30" runat="server"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtender12" runat="server" TargetControlID="txtMeetingDate"
                                                            PopupButtonID="Image4" Enabled="True">
                                                        </cc1:CalendarExtender>
                                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                    </td>
                                                    <asp:RequiredFieldValidator ID="rfvMeetingDate" runat="server" ControlToValidate="txtMeetingDate"
                                                        ValidationGroup="INVDetails" Display="None" ErrorMessage="Please select the consortium Date"
                                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" width="50%">
                                                        <asp:Label runat="server" ID="lblTo" Text="End Date :" />
                                                    </td>
                                                    <td class="styleFieldAlign" align="left">
                                                        <asp:TextBox ID="txtTo" OnTextChanged="txtTo_TextChanged" Width="100px" ToolTip="End Date"
                                                            runat="server" AutoPostBack="false"></asp:TextBox>
                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtTo" PopupButtonID="Image1"
                                                            ID="CalendarExtender2" Enabled="True">
                                                        </cc1:CalendarExtender>
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                <td class="styleFieldLabel" align="left">
                                                <asp:Label ID="lblChk" runat="server" Text="Is Active:" ></asp:Label>
                                                </td>
                                                    <td class="styleFieldAlign" align="left">
                                                        <asp:CheckBox ID="chkBox"  runat="server" Visible="true" />
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
                                                <%-- <table width="100%">
                                                    <tr>--%>
                                                <%-- <td class="styleFieldLabel" width="25%">
                               <asp:Label runat="server" ID="lblDateRange"  Text="Date Range" />  
                            </td>--%>
                                                <%-- <td class="styleFieldLabel" width="52%">
                                                            <asp:Label runat="server" ID="lblFromDate" Visible="false" Text="From" />
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtFromDate" Visible="false" runat="server" Width="165px" onmouseover="txt_MouseoverTooltip(this)"
                                                                ToolTip="From Date" />
                                                            <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                        </td>
                                        <tr>
                                            <td class="styleFieldLabel" width="50%">
                                                <asp:Label runat="server" ID="lblIsActive" Visible="false" Text="Is"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtIs_Active" runat="server" ToolTip="To Date" Visible="false" Width="165px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCreated_By" runat="server" Visible="false"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCreated_Date" runat="server" Visible="false"></asp:TextBox>
                                                <asp:TextBox ID="txtModified_By" runat="server" Visible="false"></asp:TextBox>
                                                <asp:TextBox ID="txtModified_Date" runat="server" Visible="false"></asp:TextBox>
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
    <%--<br />
    <br />--%>
 <tr>
                                    <td colspan="2" align="center">
                                    <table >
                                        <tr align="left">
                                          
                                            <td class="styleFieldAlign"  align="left">
                                                  <asp:Button ID="btnAddDDC" runat="server" CssClass="styleSubmitButton" Text="Add" ValidationGroup="INVDetails" 
                                                   OnClick="btnAddTrn_Click" />
                                                    <asp:Button ID="btnEdit" runat="server" Visible="true" CssClass="styleSubmitButton" Text="Edit" ValidationGroup="INVDetails"
                                                   OnClick="Edit_Click" />
                       
                            
                                                <%--<asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" Text="Cancel" />--%>
                                                 <asp:Button ID="Button2" runat="server" Text="Clear_FA" CssClass="styleSubmitButton"
                            ValidationGroup="Save" OnClientClick="return confirm('Are you sure want to Clear_FA?');"
                            OnClick="btnClear_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                    
                                    </td>
                                </tr>
        <%--                </tr>
            </table>
        </td>
    </tr>--%>
        <tr>
            <td>
                <asp:ValidationSummary ValidationGroup="INVDetails" ID="vsSummary" runat="server"
                    CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" HeaderText="Correct the following validation(s):  " />
            </td>
        </tr>
        <table width="750">
            <tr align="center">
                <td align="center">
                    <asp:GridView ID="grvCons" OnRowDataBound="grvCons_RowDataBound"  DataKeyNames="SlNo,Cons_Dtl_Id"
                        AlternatingRowStyle-Width="100" Visible="false" RowStyle-HorizontalAlign="Center" OnRowDeleting="grvCons_RowDeleting"
                        runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <%-- <asp:TemplateField HeaderText="SlNo" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblSllno" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Cons_Id" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblConsid" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" Visible="true">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbtnCons" AutoPostBack="true" OnCheckedChanged="rbtnCons_CheckedChanged"
                                        Visible="true" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SlNo" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblSllNo" runat="server" Text='<%# Eval("SlNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Consortium Name" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblCons" runat="server" Text='<%# Eval("Consortium_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resolution Amount" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label ID="lblResAm" runat="server" Text='<%# Eval("Resolution_Amount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblstdate" runat="server" Text='<%# Eval("Start_Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblenddate" runat="server" Text='<%# Eval("End_Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Board Resolution Date" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label ID="lblBoardRes" runat="server" Text='<%# Eval("Board_Resolution_Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Margin" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label ID="lblMargin" runat="server" Text='<%# Eval("Margin") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Security" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotSec" runat="server" Text='<%# Eval("Total_Security") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Limit" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                            <asp:Label ID="lblTotalLimit" runat="server" Text='<%# Eval("Total_Limit") %>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Member Banks">
                                <ItemTemplate>
                                <asp:HiddenField ID="HdnCon_Dtl_ID" runat ="server" Value='<%# Eval("Cons_Dtl_Id") %>' />
                                    <asp:Button ID="btnMemb" runat="server" Height="30" Text="Member Bank" CssClass="styleSubmitButton" />
                                </ItemTemplate>
                            </asp:TemplateField>
                  <asp:TemplateField HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnRemove" runat="server" Text="Remove" CommandName="Delete"
                                                                        CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btnSave" Visible="false" runat="server" CssClass="styleSubmitButton"
                        OnClick="btnSave_Click"   Text="Save" />
                 <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Visible="false" CssClass="styleSubmitButton" Text="Cancel" />
                </td>
            </tr>
        </table>
          </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
