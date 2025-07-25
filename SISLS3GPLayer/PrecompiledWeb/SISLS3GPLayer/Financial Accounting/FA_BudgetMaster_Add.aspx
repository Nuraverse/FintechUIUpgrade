<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_BudgetMaster_Add, App_Web_hqzzel3u" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td class="stylePageHeading">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="Currency" ID="currency"></asp:Label>
                        </td>
                        <td class="styleFieldAlign" width="25%">
                            <asp:TextBox ID="txtcurrency" runat="server" ToolTip="Currency" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                        </td>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="Financial Year" ID="FinancialYear"></asp:Label>
                        </td>
                        <td class="styleFieldAlign" width="25%">
                            <asp:TextBox ID="txtfinyear" runat="server" ToolTip="Financial Year" ReadOnly="true"
                                onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="Location" ID="Location"></asp:Label>
                        </td>
                        <td align="left" class="styleFieldAlign" width="25%">
                            <%--<cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_OnSelectedIndexChanged"
                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                            </cc1:ComboBox>--%>
                             <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" AutoPostBack ="true"
                                  OnItem_Selected="ddlLocation_OnSelectedIndexChanged" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="Main"
                                  ErrorMessage="Select Location" />
                            <%-- <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlLocation_OnSelectedIndexChanged"
                                Width="165px">
                            </asp:DropDownList>--%>
                        <%--    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                InitialValue="--Select--" ErrorMessage="Select Location" Display="None" SetFocusOnError="True"
                                ValidationGroup="Main" />--%>
                        </td>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="Year Budget" ID="YearBudget"></asp:Label>
                        </td>
                        <td class="styleFieldAlign" width="25%" align="right">
                            <asp:TextBox ID="txtamount" runat="server" Style="text-align: right;" MaxLength="25"
                                onmouseover="txt_MouseoverTooltip(this)" ToolTip="Budget Amount" 
                                OnTextChanged="txtamount_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="ftxtamount" TargetControlID="txtamount" FilterType="Custom,Numbers"
                                ValidChars="." runat="server" Enabled="True" />
                            <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="txtamount"
                                InitialValue="" ErrorMessage="Enter the Amount" Display="None" SetFocusOnError="True"
                                ValidationGroup="Main" />
                        </td>
                    </tr>
                    <tr>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="GL Account" ID="GLCode"></asp:Label>
                        </td>
                        <td align="left" class="styleFieldAlign" width="25%">
                            <cc1:ComboBox ID="ddlGLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_OnSelectedIndexChanged"
                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                            </cc1:ComboBox>
                            <%--<asp:DropDownList ID="ddlGLCode" runat="server" AutoPostBack="true"
                                Width="165px" OnSelectedIndexChanged="ddlGLCode_OnSelectedIndexChanged">--%>
                            <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                             <asp:ListItem Text="GL1" Value="1"></asp:ListItem>
                                             <asp:ListItem Text="GL2" Value="2"></asp:ListItem>--%>
                            <%--</asp:DropDownList>--%>
                            <asp:RequiredFieldValidator ID="rfvddlGlcode" runat="server" ControlToValidate="ddlGLCode"
                                InitialValue="--Select--" ErrorMessage="Select the GLCode" Display="None" SetFocusOnError="True"
                                ValidationGroup="Main" />
                        </td>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="SL Account" ID="SLCode"></asp:Label>
                        </td>
                        <td align="left" class="styleFieldAlign" width="25%">
                            <cc1:ComboBox ID="ddlSLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                            </cc1:ComboBox>
                            <%-- <asp:DropDownList ID="ddlSLCode" runat="server" Width="165px">--%>
                            <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>--%>
                            <%-- <asp:ListItem Text="SL1" Value="1"></asp:ListItem>
                                             <asp:ListItem Text="SL2" Value="2"></asp:ListItem>--%>
                            <%--</asp:DropDownList>--%>
                            <%--  <asp:RequiredFieldValidator ID="rfvddlslcode" runat="server" ControlToValidate="ddlSLCode"
                                                        InitialValue="0" ErrorMessage="Select the SLCode" Display="None" SetFocusOnError="True"
                                                        ValidationGroup="Main" Enabled="false" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="Budget Type" ID="BudgetType"></asp:Label>
                        </td>
                        <td align="left" class="styleFieldAlign" width="25%">
                            <%--      <asp:DropDownList ID="ddlBudgetType" AutoPostBack="true"
                                runat="server" Width="165px">
                            </asp:DropDownList>--%>
                            <asp:TextBox ID="txtbudgettype" runat="server" ReadOnly="true" Text="Original" MaxLength="25"
                                onmouseover="txt_MouseoverTooltip(this)" ToolTip="Budget Type" AutoPostBack="true"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="rfvBudgetType" runat="server"
                                ControlToValidate="ddlBudgetType" InitialValue="0"
                                ErrorMessage="Select the Budget Type" Display="None"
                                SetFocusOnError="True" ValidationGroup="Main" />--%>
                        </td>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="Budget Pattern" ID="lblBudPattern"></asp:Label>
                        </td>
                        <td align="left" class="styleFieldAlign" width="25%">
                            <asp:DropDownList ID="ddlBudgetPattern" runat="server" AutoPostBack="true" Width="165px"
                                OnSelectedIndexChanged="ddlBudgetPattern_OnSelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvBudgetPattern" runat="server" ControlToValidate="ddlBudgetPattern"
                                InitialValue="0" ErrorMessage="Select Budget Pattern" Display="None" SetFocusOnError="True"
                                ValidationGroup="Main" />
                        </td>
                    </tr>
                    <tr>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="Active" ID="lblActive"></asp:Label>
                        </td>
                        <td class="styleFieldAlign" width="25%">
                            <asp:CheckBox ID="CbxActive" runat="server" ToolTip="Active" />
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btngo" CssClass="styleSubmitButton" Text="Go" ToolTip="GO"
                                OnClick="btngo_Click" CausesValidation="true" ValidationGroup="Main" />
                        </td>
                        <td>
                            <asp:Button OnClientClick="return fnCopyProfile();" CssClass="styleSubmitButton"
                                Text="Copy Profile" ID="lnkCopyProfile" Enabled="false" ToolTip="Copy Profile"
                                runat="server"></asp:Button>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="User Name" ID="lblUsername" Visible="false"></asp:Label>
                        </td>
                        <td class="styleFieldAlign" width="25%">
                            <asp:TextBox ID="txtUsername" runat="server" ToolTip="Username" Visible="false" onmouseover="txt_MouseoverTooltip(this)"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="styleFieldLabel" width="25%">
                            <asp:Label runat="server" Text="Password" ID="lblPassword" Visible="false"></asp:Label>
                        </td>
                        <td class="styleFieldAlign" width="25%">
                            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" ToolTip="Password"
                                Visible="false"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvpwd" runat="server" ControlToValidate="txtpassword"
                                ErrorMessage="Enter the Password" Display="none" Enabled="false" SetFocusOnError="True"
                                ValidationGroup="Main" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div id="divCopyProfile" style="display: none">
                    <table>
                        <tr class="styleRecordCount" runat="server" id="trCopyProfileMessage" visible="false">
                            <td align="center" width="100%">
                                <br />
                                <asp:Label runat="server" ID="Label4" Text="No Records Found" Font-Size="Medium"
                                    class="styleMandatoryLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="overflow-x: hidden; overflow-y: auto; height: 112px; width: 750px">
                                    <asp:GridView runat="server" ID="grvCOpyBudget" Width="748px" OnRowDataBound="grvCOpyBudget_RowDataBound"
                                        AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSel" OnCheckedChanged="FunPriGetCopyProfileDetails" AutoPostBack="true"
                                                        runat="server"></asp:CheckBox>
                                                    <asp:Label Visible="false" ID="lblBudgetMaster_Id" runat="server" Text='<%#Eval("BudgetMaster_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location")%>'></asp:Label>
                                                    <asp:Label ID="lblLocationId" Visible="false" runat="server" Text='<%#Eval("Location_Id")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GlCode" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGL_Code" runat="server" Text='<%#Eval("GL_Code")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td align="center">
                            <div style="overflow-x: hidden; overflow-y: auto; width: 500px" visible="false" id="divDetails"
                                runat="server">
                                <asp:Panel runat="server" ID="pnlBudgetDetails" CssClass="stylePanel" Visible="false"
                                    GroupingText="Budget Details" Width="80%">
                                    <asp:GridView ID="gvBudgetDetails" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvBudgetDetails_RowDataBound"
                                        OnRowCommand="gvBudgetDetails_RowCommand" OnRowEditing="gvBudgetDetails_RowEditing"
                                        OnRowUpdating="gvBudgetDetails_RowUpdating" OnRowDeleting="gvBudgetDetails_RowDeleting"
                                        OnRowCancelingEdit="gvBudgetDetails_RowCancelingEdit" ShowFooter="true" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Budget_Detail_ID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Year-Month" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLookupCode" runat="server" Text='<%#Bind("Month") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblmonth" runat="server" ToolTip="Year-Month" Text='<%#Bind("Month") %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnmonth" runat="server" Value='<%#Eval("Month") %>' />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddlmonthEdit" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:HiddenField ID="hdnmonth" runat="server" Value='<%#Eval("Month") %>' />
                                                    <asp:RequiredFieldValidator ID="rfvtxtmonth" runat="server" Display="None" ErrorMessage="Please Select the Month"
                                                        ControlToValidate="ddlmonthEdit" SetFocusOnError="true" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:DropDownList ID="ddlmonth" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvtxtfmonth" runat="server" Display="None" ErrorMessage="Please Select the Month"
                                                        ControlToValidate="ddlmonth" SetFocusOnError="true" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>
                                                    <%-- <asp:Label ID="lblMonthFoot" runat="server" Text='<%#Bind("Month") %>'  />--%>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Budget" Visible="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBudget" runat="server" Text='<%#Bind("Budget") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtTargetAmount" Text='<%#Bind("Budget") %>' runat="server" Style="text-align: right;"
                                                        ToolTip="Target Amount" MaxLength="25" onmouseover="txt_MouseoverTooltip(this)"
                                                        onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvtxtamount" runat="server" Display="None" ErrorMessage="Please Enter the amount"
                                                        ControlToValidate="txtTargetAmount" SetFocusOnError="true" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtTargetAmount" runat="server" MaxLength="25" Style="text-align: right;"
                                                        ToolTip="Target Amount" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvtxtamount" runat="server" Display="None" ErrorMessage="Please Enter the amount"
                                                        ControlToValidate="txtTargetAmount" SetFocusOnError="true" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtTargetAmount"
                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" Visible="true">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit"
                                                        CausesValidation="false"></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete" CommandName="Delete"
                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" ToolTip="Update" CommandName="Update"
                                                        CausesValidation="false" />
                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" ToolTip="Cancel" CommandName="Cancel"
                                                        CausesValidation="false" />
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" ToolTip="Add" CommandName="Add"
                                                        ValidationGroup="vgAdd" CausesValidation="true" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Trans" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltrans" runat="server" Text='<%#Bind("trans") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <%--   <asp:Label ID="lbltrans" runat="server" Text='<%#Bind("trans") %>' Visible="false"></asp:Label>--%>
                                                    <asp:HiddenField ID="hdntrans" runat="server" Value='<%#Bind("trans") %>' />
                                                    <asp:TextBox ID="txttrans" Text='<%#Bind("trans") %>' runat="server" Style="text-align: right;"
                                                        ToolTip="Target Amount" MaxLength="25" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                        Visible="false"></asp:TextBox>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txttrans" runat="server" MaxLength="25" Style="text-align: right;"
                                                        ToolTip="Target Amount" onkeypress="fnAllowNumbersOnly(true,false,this)" Visible="false"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td id="Td1" runat="server" align="center">
                            <asp:Button runat="server" ID="btnSave" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Main');"
                                Text="Save" ToolTip="Save" Enabled="false" ValidationGroup="Save" OnClick="btnSave_Click"
                                CausesValidation="true" />
                            <asp:Button runat="server" ID="btnClear" CssClass="styleSubmitButton" OnClientClick="return fnConfirmClear();"
                                Text="Clear_FA" OnClick="btnClear_Click" ToolTip="Clear_FA" CausesValidation="False" />
                            <asp:Button runat="server" ID="btnCancel" CssClass="styleSubmitButton" OnClick="btnCancel_Click"
                                CausesValidation="False" ToolTip="Clear_FA" Text="Cancel" />
                        </td>
                    </tr>
                    <tr class="styleButtonArea">
                        <td>
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" Style="color: Red;
                                font-size: medium"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="vgAdd" runat="server" ValidationGroup="vgAdd" CssClass="styleMandatoryLabel"
                    HeaderText="Correct the following validation(s):" ShowSummary="true" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="Main" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="Save" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="cvBudget" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
            <td>
                <input type="hidden" value="0" runat="server" id="hdnBudget" />
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">

    function fnCopyProfile()
    {      
        if(document.getElementById('<%=lnkCopyProfile.ClientID%>').value=='Hide Copy Profile')
        {
            document.getElementById('<%=lnkCopyProfile.ClientID%>').value='Copy Profile';
            document.getElementById('divCopyProfile').style.display='none';
            document.getElementById('<%=divDetails.ClientID%>').style.display='inline';
            document.getElementById('<%=btnSave.ClientID%>').disabled=false;
            document.getElementById('<%=btnClear.ClientID%>').disabled=false;
        }
        else
        {
            document.getElementById('<%=lnkCopyProfile.ClientID%>').value='Hide Copy Profile';
            document.getElementById('divCopyProfile').style.display='Block';
            document.getElementById('<%=divDetails.ClientID%>').style.display='none';
            document.getElementById('<%=btnSave.ClientID%>').disabled=true;
            document.getElementById('<%=btnClear.ClientID%>').disabled=true;
        }
        return false;
    }
    </script>

</asp:Content>
