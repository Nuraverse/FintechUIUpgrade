<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true" CodeFile="S3GSysAdmin_EntityType_Add.aspx.cs" Inherits="System_Admin_S3GSysAdmin_EntityType_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="up1" runat="server">
        <ContentTemplate>

            <table width="100%" align="center" cellpadding="5" cellspacing="5">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel">
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
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblEntityType" CssClass="styleReqFieldLabel" runat="server" Text="Entity Type"></asp:Label></td>
                                <td class="styleFieldAlign">
                                    <asp:TextBox ID="txtEntityType" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvtxtEntityType"
                                        runat="server" ErrorMessage="Enter the Entity Type" SetFocusOnError="True" ValidationGroup="Save"
                                        ControlToValidate="txtEntityType" Display="None"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td class="styleFieldLabel">Active
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:CheckBox ID="chkIsActive" runat="server" /></td>
                            </tr>
                        </table>
                    </td>

                </tr>
                <tr>
                    <td>

                        <asp:Panel runat="server" ID="pnlReferenceGrid" GroupingText="Program Reference Grid"
                            CssClass="stylePanel" Style="overflow: hidden">
                            <div style="height: 190px; overflow-y: auto; overflow-x: hidden" width="100%" class="container">
                                <asp:GridView ID="gvProgramList" runat="server" Width="100%" AutoGenerateColumns="False"
                                    DataKeyNames="Program_ID" OnRowDataBound="gvProgramList_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProgramID" runat="server" Text='<%# Eval("Program_ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Program Ref. No." HeaderStyle-CssClass="styleGridHeader">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProgramRefNo" ToolTip="Program Reference No." runat="server" Text='<%# Eval("Program_Ref_No") %>' />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            <ItemStyle Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Program Description" HeaderStyle-CssClass="styleGridHeader">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProgramName" ToolTip="Program Description" runat="server" Text='<%# Eval("Program_Name") %>' />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            <ItemStyle Width="50%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Capture" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="CbxCapture" Enabled="false" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Display" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="CbxDisplay" Enabled="false" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Applicable" HeaderStyle-CssClass="styleGridHeader">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbxApplicable" ToolTip="Applicable" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </asp:Panel>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel GroupingText="Constitution Documents" ID="pnlDocs" runat="server" CssClass="stylePanel">
                            <table width="100%">
                                <tr>
                                    <td style="display: inline">
                                        <asp:GridView ShowFooter="True" runat="server" ID="grvConsDocuments" Width="100%"
                                            Height="10px" OnRowDataBound="grvConsDocuments_RowDataBound" DataKeyNames="Sno" AutoGenerateColumns="False"
                                            OnRowCommand="grvConsDocuments_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Document Type" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <%#Eval("Doc_Cat_Flag")%>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <table>
                                                            <tr>
                                                                <td align="center" valign="middle">
                                                                    <%--<asp:DropDownList ID="ddlDocCatGird" runat="server" Visible="true" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlDocCatGrid_SelectedIndexChanged" ToolTip="Document Type">
                                                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ErrorMessage="Select Document Flag" ValidationGroup="Constitution"
                                                                        ID="reqDoc" ControlToValidate="ddlDocCatGird" InitialValue="0" runat="server"
                                                                        Enabled="false" Display="None"></asp:RequiredFieldValidator>--%>
                                                                    <uc2:Suggest ID="ddlDocCatGird" runat="server" ServiceMethod="GetDocumentFlags" AutoPostBack="true" ToolTip="Document Type"
                                                                        OnItem_Selected="ddlDocCatGrid_SelectedIndexChanged" ErrorMessage="Select Document Flag" Width="300px"
                                                                        ValidationGroup="Save" IsMandatory="false" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                    <FooterStyle VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Doc_Cat_Name" ItemStyle-HorizontalAlign="Left" Visible="false"
                                                    HeaderText="Document Category">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Document Description" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <%#Eval("Doc_Cat_Desc")%>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:UpdatePanel ID="upd" runat="server">
                                                            <ContentTemplate>
                                                                <asp:TextBox runat="server" Width="160px" ID="txtOthersGrid" MaxLength="40" AutoPostBack="true"
                                                                    Enabled="false" OnTextChanged="txtOthersGrid_TextChanged" ToolTip="Document Description">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtOthersGrid"
                                                                    FilterType="Numbers, UppercaseLetters, LowercaseLetters,Custom" ValidChars=" "
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <cc1:AutoCompleteExtender ID="AutoCompleteExtenderDemo" runat="server" TargetControlID="txtOthersGrid"
                                                                    ServiceMethod="getDocumentsList" MinimumPrefixLength="1" CompletionSetCount="20"
                                                                    DelimiterCharacters="" Enabled="True" ServicePath="">
                                                                </cc1:AutoCompleteExtender>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Doc_Cat_Flag" HeaderText="Document Flag" Visible="false">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Doc_Cat_Desc" Visible="false" HeaderText="Document Description">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderStyle-Wrap="true" HeaderText="Mandatory">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkOptMan" runat="server" Enabled="false" ToolTip="Mandatory"></asp:CheckBox>
                                                        <asp:Label Visible="false" ID="lblOptMan" runat="server" Text='<%#Eval("Doc_Cat_OptMan")%>'></asp:Label>
                                                        <asp:Label Visible="false" ID="lblDocCatID" runat="server" Text='<%#Eval("Doc_Cat_ID")%>'></asp:Label>
                                                        <asp:Label Visible="false" ID="lblDocCatIDAssigned" runat="server" Text='<%#Eval("Doc_Cat_IDAssigned")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="True" />
                                                    <FooterTemplate>
                                                        <asp:CheckBox ID="chkOptManIns" runat="server" ToolTip="Mandatory"></asp:CheckBox>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Image Copy">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkImageCopy" runat="server" Enabled="false" ToolTip="Image Copy"></asp:CheckBox>
                                                        <asp:Label Visible="false" ID="lblImageCopy" runat="server" ToolTip="Image Copy" Text='<%#Eval("Doc_Cat_ImageCopy")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:CheckBox ID="chkImageCopyIns" runat="server" ToolTip="Image Copy"></asp:CheckBox>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks">
                                                    <ItemTemplate>
                                                        <asp:TextBox runat="server" ID="txtRemarks" Wrap="true" onkeydown="maxlengthfortxt(60);"
                                                            Columns="25" Rows="2" Text='<%#Eval("Remarks")%>' Width="210px" Height="35px"
                                                            TextMode="MultiLine" ToolTip="Remarks"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox runat="server" ID="txtRemarks" Wrap="true" onkeydown="maxlengthfortxt(60);"
                                                            Columns="25" Rows="2" Text='<%#Eval("Remarks")%>' Width="210px" Height="35px"
                                                            TextMode="MultiLine" ToolTip="Remarks"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnRemove" runat="server" Text="Remove" CommandName="Remove"
                                                            ToolTip="Remove" OnClick="RemoveRow" OnClientClick="return confirm('Are you sure you want to delete this document?');" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Button ID="btnSave" CssClass="styleGridShortButton" runat="server" Text="Add"
                                                            ToolTip="Add" CausesValidation="false" CommandName="Save" OnClick="SaveRow" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" Width="7%" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr class="styleButtonArea" align="center" style="padding-left: 4px">
                    <td>

                        <asp:Button runat="server" ID="btnSave" CssClass="styleSubmitButton" Text="Save" AccessKey="S" ToolTip="Save, Alt+S"
                            OnClick="btnSave_Click" ValidationGroup="Save" OnClientClick="return fnCheckPageValidators('Save');" />
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton" ToolTip="Clear, Alt+L" AccessKey="L"
                            Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" ToolTip="Cancel, Alt+N" AccessKey="N"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" />
                        <%--  <div id="divTooltip" runat="server" style="border: 1px solid #000000; background-color: #FFFFCE; position: absolute; display: none;">
                            </div>--%>
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td>
                        <input type="hidden" value="0" runat="server" id="hdnConstitution" />
                        <input type="hidden" value="0" runat="server" id="hdnMode" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary runat="server" ID="vsummary" ValidationGroup="Save"
                            HeaderText="Correct the following validation(s):" CssClass="styleSummaryStyle"
                            Width="500px" ShowMessageBox="false" ShowSummary="true" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript" language="javascript">

        function fnUnselectAllExpectSelected(TargetControl, gRow) {
            var TargetBaseControl = document.getElementById('<%=gvProgramList.ClientID %>');
            var Inputs = TargetBaseControl.getElementsByTagName("input");

            for (var n = 0; n < Inputs.length; ++n) {
                Inputs[n].parentElement.parentElement.parentElement.style.backgroundColor = "white";
                if (Inputs[n].type == 'checkbox' && Inputs[n].uniqueID != TargetControl.uniqueID) {
                    Inputs[n].checked = false;
                }
            }
            if (TargetControl.checked == true) {
                document.getElementById(gRow).style.backgroundColor = "#f5f8ff";
            }
            else {
                document.getElementById(gRow).style.backgroundColor = "white";
            }
        }

    </script>
</asp:Content>

