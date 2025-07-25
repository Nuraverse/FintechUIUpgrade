<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Loan_Admin_S3GFacDayOpenClose, App_Web_fteskag1" title="Day Open Close" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server">
        <ContentTemplate>
            <table width="99%" align="center" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td class="stylePageHeading" colspan="2">
                        <table>
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
                        <div id="dvInvImgs" style="float: right; border-bottom: 1px; width: 400px; height: 0px; cursor: pointer; background-image: none; position: relative; margin-top: -5px; margin-right: 260px;">
                            <table>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblLOB" CssClass="styleReqFieldLabel" Text="Day Open/Close"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlDayOpenClose" AutoPostBack="true" ToolTip="Day Open /Close" Width="125px" OnSelectedIndexChanged="ddlDayOpenClose_SelectedIndexChanged" runat="server">
                                            <asp:ListItem Value="1"  Text="Open"></asp:ListItem>
                                            <asp:ListItem Value="2" Selected="True" Text="Closure"></asp:ListItem>
                                        </asp:DropDownList>

                                        <%--  <cc1:ComboBox ID="ddlLOB" runat="server" ToolTip="Line of Business" Width="93px" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                    CssClass="WindowsStyle" DropDownStyle="DropDown"
                                    AppendDataBoundItems="false" CaseSensitive="false" AutoCompleteMode="None"
                                    AutoPostBack="true">
                                </cc1:ComboBox>--%>

                                        <%--  <asp:RequiredFieldValidator ID="rfvddlDayOpenClose" runat="server" ErrorMessage="Select the Line of Business"
                                            SetFocusOnError="true" ControlToValidate="ddlLob" InitialValue="--Select--" ValidationGroup="Main Page"
                                            Display="None"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="rfvddlLob"
                                            HighlightCssClass="validatorCalloutHighlight" />--%>

                                    </td>
                                </tr>
                            </table>

                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="styleFieldAlign">
                        <asp:Panel ID="pnlDayOpenClose" runat="server" CssClass="stylePanel" GroupingText="Day Close"
                            Width="98%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <%-- LOB --%>
                                    <td class="styleFieldLabel" width="17%">
                                        <asp:Label runat="server" Text="Closure Date" ID="lblClosureDate" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <asp:TextBox ID="txtClosureDate" Width="100px" runat="server" ToolTip="Closure Date">
                                        </asp:TextBox>
                                        <asp:Image ID="imgClosureDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtClosureDate" PopupButtonID="imgClosureDate"
                                            Format="DD/MM/YYYY" ID="CEClosureDate" Enabled="True" OnClientDateSelectionChanged="checkDate_ApplicationDate">
                                        </cc1:CalendarExtender>
                                        <%--<asp:RequiredFieldValidator ID="rfvClosureDate" runat="server" ControlToValidate="txtAccountDate"
                                            Display="None" ValidationGroup="Main Page" CssClass="styleMandatoryLabel" SetFocusOnError="True"
                                            ErrorMessage="Enter an Account Date"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel" width="17%">
                                        <asp:Label runat="server" Text="Open Day" ID="lblOpenDay" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <asp:TextBox ID="txtOpenDay" Style="text-align: left" Width="100px" runat="server" ToolTip="Open Date">
                                        </asp:TextBox>

                                    </td>
                                    <td class="styleFieldLabel" width="17%">
                                        <asp:Label runat="server" Text="Branch" ID="lblLocation" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="20%">
                                        <asp:DropDownList ID="ddlLocation" Width="125px" runat="server" ToolTip="Branch" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="4">&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>

                <tr>
                    <%--Gridview for Days--%>
                    <td colspan="2" class="styleFieldAlign">
                        <asp:Panel ID="PNLDays" runat="server" CssClass="stylePanel" GroupingText="Day Close"
                            Width="98%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <asp:GridView runat="server" ID="GRVDays" AutoGenerateColumns="False" ShowFooter="true"
                                            OnRowDeleting="GRVDays_RowDeleting" OnRowCommand="GRVDays_RowCommand1" ToolTip="Days"
                                            Width="100%" OnRowCancelingEdit="GRVDays_RowCancelingEdit" OnRowEditing="GRVDays_RowEditing"
                                            OnRowUpdating="GRVDays_RowUpdating" EmptyDataText="No Records Found" OnRowCreated="GRVDays_RowCreated"
                                            OnRowDataBound="GRVDays_RowDataBound">
                                            <Columns>
                                                <%--S.no--%>
                                                <asp:TemplateField HeaderText="Sl.No." HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsno" runat="server" Text='<%#Container.DataItemIndex+1  %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblsnoF" runat="server"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Documents" HeaderStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("Descvalue")%>' ID="lblDescriptionDaysVal"
                                                            Visible="false"></asp:Label>
                                                        <asp:Label runat="server" Text='<%#Eval("DescriptionDays")%>' ID="lblDescriptionDays"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlDescriptionDaysEdit" Width="97%" runat="server" ValidationGroup="VGDays">
                                                        </asp:DropDownList>
                                                        <asp:HiddenField ID="hdnDescDays" runat="server" Value='<%#Eval("Descvalue") %>' />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlDescriptionDaysF" Width="97%" runat="server" ValidationGroup="VGDays">
                                                        </asp:DropDownList>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="20%" />
                                                </asp:TemplateField>
                                                <%--From Days--%>
                                                <asp:TemplateField HeaderText="Pending" HeaderStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFromDays" runat="server" Text='<%# Bind("Fromdays")%>' Style="text-align: right;"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtFromDaysEdit" runat="server" MaxLength="4" Width="97%" Text='<%# Bind("Fromdays")%>'
                                                            Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtFromDaysEdit" runat="server" TargetControlID="txtFromDaysEdit"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtFromDaysF" runat="server" MaxLength="4" Width="97%" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEFromDaysF" runat="server" TargetControlID="txtFromDaysF"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                </asp:TemplateField>
                                                <%--To days--%>
                                                <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblToDays" runat="server" Text='<%# Bind("ToDays")%>' Style="text-align: right;"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtToDaysEdit" runat="server" MaxLength="4" Width="97%" Text='<%# Bind("ToDays")%>'
                                                            Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtToDaysEdit" runat="server" TargetControlID="txtToDaysEdit"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtToDaysF" runat="server" MaxLength="4" Width="97%" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEToDaysF" runat="server" TargetControlID="txtToDaysF"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                </asp:TemplateField>
                                                <%-- Description (Days)--%>

                                                <asp:TemplateField HeaderText="Credit Weightage" Visible="false" HeaderStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCreditWeightage" runat="server" Text='<%# Bind("CreditWeightage")%>' Style="text-align: right;"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtCreditWeightageEdit" runat="server" MaxLength="2" Width="97%" Text='<%# Bind("CreditWeightage")%>'
                                                            Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtCreditWeightageEdit" runat="server" TargetControlID="txtCreditWeightageEdit"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCreditWeightageF" runat="server" MaxLength="2" Width="97%" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTtxtCreditWeightageF" runat="server" TargetControlID="txtCreditWeightageF"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false" HeaderStyle-Width="25%">
                                                    <ItemTemplate>
                                                        &nbsp;
                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                        &nbsp;
                                                        <asp:LinkButton ID="btnRemoveDays" Text="Delete" CommandName="Delete" runat="server"
                                                            CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        &nbsp;
                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                            CausesValidation="false"></asp:LinkButton>
                                                        &nbsp;
                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                            CausesValidation="false"></asp:LinkButton>
                                                    </EditItemTemplate>
                                                   
                                                    <ItemStyle Width="20%" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>

                <tr class="styleButtonArea" align="center" style="padding-left: 4px">
                    <td colspan="2">
                        <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators('VGBuck');"
                            CssClass="styleSubmitButton" Text="Confirm Closure" ValidationGroup="VGBuck" OnClick="btnSave_Click"
                            ToolTip="Save,Alt+S" AccessKey="S" />
                        &nbsp;<asp:Button runat ="server" ID="btnClear" AccessKey="L" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                            ToolTip="Clear,Alt+L" />
                        &nbsp;<asp:Button runat="server" ID="btnCancel" Text="Exit" AccessKey="X" ValidationGroup="PRDDC" CausesValidation="false" CssClass="styleSubmitButton" 
                            ToolTip="Exit,Alt+X" OnClientClick="parent.RemoveTab();" />
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td colspan="2">
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinf" HeaderText="Correct the following validation(s):"
                            Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                            ShowSummary="true" ValidationGroup="VGBuck" />
                    </td>
                </tr>
                <tr>
                    <td class="styleButtonArea" colspan="2">
                        <asp:CustomValidator ID="CVBucketParameter" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" />
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td colspan="2">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        <input type="hidden" runat="server" value="0" id="hdnRowID" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

