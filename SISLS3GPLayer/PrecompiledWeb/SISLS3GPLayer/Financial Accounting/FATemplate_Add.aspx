<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="FATemplate_Add, App_Web_jj5zdzwe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" Text="Template Master" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="Panel2" Height="100%" runat="server" CssClass="stylePanel">
                            <table width="100%">
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblTemplate" runat="server" Text="Template Name" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTemplate" runat="server" />
                                        <asp:RequiredFieldValidator Display="None" ID="rfvTemplate" CssClass="styleMandatoryLabel"
                                            SetFocusOnError="True" runat="server" ControlToValidate="txtTemplate" ErrorMessage="Enter Template Name"
                                            ValidationGroup="Save">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblRefNum" runat="server" Text="Ref Number" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRefNum" runat="server" ReadOnly="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblLocationT" runat="server" Text="Location" />
                                    </td>
                                    <td>
                                        <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            Width="130px" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                            AutoCompleteMode="SuggestAppend" MaxLength="0" />
                                        <asp:RequiredFieldValidator Display="None" ID="rfvLocation" CssClass="styleMandatoryLabel"
                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" ErrorMessage="Select the Location"
                                            ValidationGroup="Save" InitialValue="--Select--">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblDate" runat="server" Text="Date" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDate" runat="server" />
                                        <cc1:CalendarExtender ID="cldrDate" runat="server" PopupButtonID="txtDate" TargetControlID="txtDate"
                                            Enabled="True" />
                                        <asp:RequiredFieldValidator Display="None" ID="rfvDate" CssClass="styleMandatoryLabel"
                                            SetFocusOnError="True" runat="server" ControlToValidate="txtDate" ErrorMessage="Enter Date"
                                            ValidationGroup="Save">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblFromDateT" runat="server" Text="From Date" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFromDateT" runat="server" />
                                        <cc1:CalendarExtender ID="cldrFromDate" runat="server" PopupButtonID="txtFromDateT"
                                            TargetControlID="txtFromDateT" Enabled="True" />
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator1" CssClass="styleMandatoryLabel"
                                            SetFocusOnError="True" runat="server" ControlToValidate="txtFromDateT" ErrorMessage="Enter From Date"
                                            ValidationGroup="Save">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblToDateT" runat="server" Text="To Date" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtToDateT" runat="server" />
                                        <cc1:CalendarExtender ID="cldrToDate" runat="server" PopupButtonID="txtToDateT" TargetControlID="txtToDateT"
                                            Enabled="True" />
                                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidator2" CssClass="styleMandatoryLabel"
                                            SetFocusOnError="True" runat="server" ControlToValidate="txtToDateT" ErrorMessage="Enter To Date"
                                            ValidationGroup="Save">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblActive" runat="server" Text="Active" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ChkActive" runat="server" Checked="True" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="Panel3" runat="server" CssClass="stylePanel" GroupingText="Template Details"
                            Width="100%">
                            <asp:GridView runat="server" ShowFooter="true" ID="gvTemplate" OnRowDataBound="gvTemplate_RowDataBound"
                                OnRowCommand="gvTemplate_RowCommand" OnRowEditing="gvTemplate_RowEditing" OnRowDeleting="gvTemplate_RowDeleting"
                                OnRowCancelingEdit="gvTemplate_RowCancelingEdit" OnRowUpdating="gvTemplate_RowUpdating"
                                Width="100%" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl No">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblSNOT" Text='<%#Container.DataItemIndex+1%>' ToolTip="Sl No"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trans Type">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Trans_Type") %>' ID="lblDocTypeT" ToolTip="Location"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <cc1:ComboBox ID="ddlDocTypeT" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <asp:RequiredFieldValidator Display="None" Enabled="true" ID="rfvDocType" CssClass="styleMandatoryLabel"
                                                SetFocusOnError="True" ValidationGroup="Add" runat="server" ControlToValidate="ddlDocTypeT"
                                                InitialValue="--Select--" ErrorMessage="Select Trans Type in Template Details"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <cc1:ComboBox ID="ddlDocTypeT" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                Width="130px" AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <asp:HiddenField ID="hdnDocTypeT" runat="server" Value='<%# Bind("ID") %>' />
                                        <asp:RequiredFieldValidator Display="None" Enabled="true" ID="rfvDocType" CssClass="styleMandatoryLabel"
                                                SetFocusOnError="True" ValidationGroup="Update" runat="server" ControlToValidate="ddlDocTypeT"
                                                InitialValue="--Select--" ErrorMessage="Select Trans Type in Template Details"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" Width="20%" />
                                        <ItemStyle HorizontalAlign="Left" Width="20%" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="GL Account">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("GL_Desc") %>' ID="lblGLAccT" ToolTip="Account"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <cc1:ComboBox ID="ddlGLCodeT" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCodeT_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <asp:RequiredFieldValidator Display="None" Enabled="true" ID="rfvGLCode" CssClass="styleMandatoryLabel"
                                                SetFocusOnError="True" ValidationGroup="Add" runat="server" ControlToValidate="ddlGLCodeT"
                                                InitialValue="--Select--" ErrorMessage="Select GL Code in Template Details"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <cc1:ComboBox ID="ddlGLCodeT" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCodeT_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <asp:HiddenField ID="hdn_GLAccT" runat="server" Value='<%# Bind("GL_Code") %>' />
                                            <asp:RequiredFieldValidator Display="None" Enabled="true" ID="rfvGLCode" CssClass="styleMandatoryLabel"
                                                SetFocusOnError="True" ValidationGroup="Update" runat="server" ControlToValidate="ddlGLCodeT"
                                                InitialValue="--Select--" ErrorMessage="Select GL Code in Template Details"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" Width="20%" />
                                        <ItemStyle HorizontalAlign="Left" Width="20%" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SL Account">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("SL_Desc") %>' ID="lblSLAccT" ToolTip="Sub Account"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <cc1:ComboBox ID="ddlSLCodeT" runat="server" CssClass="WindowsStyle" Width="130px"
                                                DropDownStyle="DropDownList" AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend" AutoPostBack="True">
                                            </cc1:ComboBox>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <cc1:ComboBox ID="ddlSLCodeT" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                AutoPostBack="True">
                                            </cc1:ComboBox>
                                            <asp:HiddenField ID="hdn_SLAccT" runat="server" Value='<%# Bind("SL_Code") %>' />
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" Width="20%" />
                                        <ItemStyle HorizontalAlign="Left" Width="20%" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Amount") %>' ID="lblAmountT" ToolTip="Debit"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox MaxLength="15" Width="80px" runat="server" ID="txtAmountT" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                Style="text-align: right;" ToolTip="Debit"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAmountT"
                                                FilterType="Numbers,Custom" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                            <asp:RequiredFieldValidator Display="None" Enabled="true" ID="rfvAmount" CssClass="styleMandatoryLabel"
                                                SetFocusOnError="True" ValidationGroup="Add" runat="server" ControlToValidate="txtAmountT"
                                                ErrorMessage="Enter Amount in Template Details"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <center>
                                                <asp:TextBox MaxLength="15" Width="80px" Text='<%# Bind("Amount") %>' runat="server"
                                                    ToolTip="Debit" onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right;"
                                                    ID="txtAmountT"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1Hdr" runat="server" TargetControlID="txtAmountT"
                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                </cc1:FilteredTextBoxExtender>
                                                 <asp:RequiredFieldValidator Display="None" Enabled="true" ID="rfvAmount" CssClass="styleMandatoryLabel"
                                                SetFocusOnError="True" ValidationGroup="Update" runat="server" ControlToValidate="txtAmountT"
                                                ErrorMessage="Enter Amount in Template Details"></asp:RequiredFieldValidator>
                                            </center>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" Width="20%" />
                                        <ItemStyle HorizontalAlign="Right" Width="20%" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEditT" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                ToolTip="Edit">
                                            </asp:LinkButton>&nbsp;|
                                            <asp:LinkButton ID="lnkDeleteT" runat="server" CommandName="Delete" Text="Delete"
                                                OnClientClick="return confirm('Are you sure you want to Delete this record?');"
                                                ToolTip="Delete">
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="lnkAddT" runat="server" CommandName="Add" ToolTip="Add" CausesValidation="true"
                                                Text="Add" CssClass="styleGridShortButton" ValidationGroup="Add"></asp:Button>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkUpdateT" runat="server" Text="Update" CommandName="Update"
                                                CausesValidation="true" ToolTip="Update" ValidationGroup="Update"></asp:LinkButton>&nbsp;|
                                            <asp:LinkButton ID="lnkCancelT" runat="server" Text="Cancel" CommandName="Cancel"
                                                CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" Width="10%" />
                                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="styleGridHeader" />
                            </asp:GridView>
                            <asp:HiddenField ID="HiddenField2T" runat="server" />
                            <asp:HiddenField ID="hdn_DIM2_Type_MineT" runat="server" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" align="center">
                            <tr>
                                <td align="center">
                                    &nbsp;&nbsp;<asp:Button ID="btnSave" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                                        Text="Save" ValidationGroup="BtnSave" OnClientClick="return fnCheckPageValidators('Save')"
                                        OnClick="btnSave_Click" />
                                    &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                                        Text="Clear_FA" OnClick="btnClear_Click" />
                                    &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                                        Text="Cancel" OnClick="btnCancel_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td>
                        <asp:ValidationSummary ValidationGroup="Save" ID="vsTemplateMaster" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                        <asp:ValidationSummary ValidationGroup="Add" ID="vsTemplateDetails" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                         <asp:ValidationSummary ValidationGroup="Update" ID="ValidationSummary1" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                        <input type="hidden" runat="server" value="0" id="hdnRowID" />
                        <input type="hidden" runat="server" value="1" id="hdnAccValid" />
                        <input type="hidden" runat="server" value="0" id="hdnStatus" />
                        <asp:CustomValidator ID="cvTemplateMaster" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
