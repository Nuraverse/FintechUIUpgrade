<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="UnderWriting_S3GUWUserGroupAccess_Add, App_Web_sq2fmotj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
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
                    <td valign="top">
                        <table cellpadding="0" cellspacing="0">
                            <td colspan="4" style="height: 5px;"></td>
                            <tr>
                                <td class="styleFieldLabel">User Name
                                </td>
                                <td class="styleFieldAlign">
                                    <uc2:Suggest ID="txtUserName" runat="server" ServiceMethod="GetUsernameList" AutoPostBack="true"
                                        OnItem_Selected="txtUserName_SelectedIndexChanged" ErrorMessage="Select User Name"
                                        ValidationGroup="Go" IsMandatory="true" Width="240px" />

                                </td>
                                <td class="styleFieldLabel">
                                    <asp:CheckBox ID="chkCopyProfile" runat="server" Text="Copy Profile" OnCheckedChanged="chkCopyProfile_OnCheckedChanged" AutoPostBack="true" /></td>
                                <td class="styleFieldLabel" id="tdCopyuserName" runat="server" visible="false">
                                   Source User Name
                                </td>
                                <td class="styleFieldAlign">
                                     <uc2:Suggest ID="txtCopyUserName" runat="server" Visible="false" ServiceMethod="GetCopyUsernameList" AutoPostBack="true"
                                        OnItem_Selected="txtCopyUserName_SelectedIndexChanged" ErrorMessage="Select User Name"
                                        ValidationGroup="Go" IsMandatory="false" Width="240px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="styleFieldLabel">Active
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" TabIndex="3" />
                                </td>
                                <td class="styleFieldAlign" colspan="3"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center">
                        <asp:Panel ID="pnlUW" GroupingText="Under Writing Master Details" runat="server"
                            Width="100%" CssClass="stylePanel" Visible="false">
                            <asp:GridView ID="grvUW" ShowFooter="true" AutoGenerateColumns="false"
                                runat="server" OnRowDataBound="grvUW_RowDataBound" Width="90%">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%" HeaderStyle-Width="3%" FooterStyle-Width="3%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="LOB" HeaderStyle-Width="80px" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLobName" runat="server" Text='<%# Bind("Lob_Name") %>'></asp:Label>
                                            <asp:Label ID="lblLobId" Visible="false" runat="server" Text='<%# Bind("LobId") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Product">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                                            <asp:Label ID="lblProductId" Visible="false" runat="server" Text='<%# Bind("Product_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Constitution">
                                        <ItemTemplate>
                                            <asp:Label ID="lblConstitution" runat="server" Text='<%# Bind("Constitution") %>'></asp:Label>
                                            <asp:Label ID="lblConstitutionId" Visible="false" runat="server" Text='<%# Bind("Constitution_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Short Name" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblShortNameName" runat="server" Text='<%# Bind("ShortName") %>'></asp:Label>
                                            <asp:Label ID="lblGuideId" runat="server" Visible="false" Text='<%# Bind("UnderWriting_Guide_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                                            <asp:Label ID="lblIsActive" runat="server" Visible="false" Text='<%# Bind("Is_Active") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Panel ID="pnlGroup" GroupingText="Group Details" runat="server"
                            Width="80%" CssClass="stylePanel" Visible="false">
                            <asp:GridView ID="grvGroup" ShowFooter="true" AutoGenerateColumns="false"
                                runat="server" OnRowDataBound="grvGroup_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%" HeaderStyle-Width="3%" FooterStyle-Width="3%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGSNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Groups">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUWGuideId" runat="server" Visible="false" Text='<%# Bind("UnderWriting_Guide_ID") %>'></asp:Label>
                                            <asp:Label ID="lblGroupName" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                            <asp:Label ID="lblGroupId" runat="server" Visible="false" Text='<%# Bind("Group_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkGAll" runat="server" Text="Select All" OnClick="CheckAllGroup(this);" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkGSelect" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectGrp_CheckedChanged" />
                                            <asp:Label ID="lblIs_Active" runat="server" Visible="false" Text='<%# Bind("Is_Active") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center">
                        <asp:Button ID="btnAdd" runat="server" Visible="false" CssClass="styleGridShortButton" Text="Add Group"
                            ToolTip="Add Groups" OnClick="btnAdd_Click"></asp:Button>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Panel ID="pnlGrpAdd" GroupingText="Group Details" runat="server"
                            Width="80%" CssClass="stylePanel" Visible="false">
                            <asp:GridView ID="grvGroupAdd" ShowFooter="true" AutoGenerateColumns="false"
                                runat="server" OnRowDeleting="grvGroupAdd_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%" HeaderStyle-Width="3%" FooterStyle-Width="3%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGSNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ref.No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHdrSno" runat="server" Text='<%# Bind("HdrSno") %>'></asp:Label>
                                            <asp:Label ID="lblHdrGuideID" runat="server" Visible="false" Text='<%# Bind("UnderWriting_Guide_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Groups">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGroupName" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                            <asp:Label ID="lblGroupId" runat="server" Visible="false" Text='<%# Bind("Group_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:ImageButton Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                runat="server" CausesValidation="false" ID="imgDelete" Width="20px" Height="20px" CommandName="Delete"
                                                ToolTip="Delete Group" CssClass="styleGridImgShortButton"
                                                ImageUrl="~/Images/delete1.png"></asp:ImageButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr class="styleButtonArea" align="center" style="padding-left: 4px">
                    <td>
                        <br />
                        <asp:Button runat="server" ID="btnSave" CausesValidation="false"
                            CssClass="styleSubmitButton" Text="Save" ToolTip="Save"
                            Enabled="false" OnClick="btnSave_Click" />
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear" OnClientClick="return fnConfirmClear();"
                            ToolTip="Clear" OnClick="btnClear_Click" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" ToolTip="Cancel" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" ValidationGroup="AddNumber" />
                    </td>
                </tr>

                <tr class="styleButtonArea">
                    <td>
                        <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" />
                        <asp:ValidationSummary runat="server" ID="VSCSM" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnAdd"
                            ShowSummary="true" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary2" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnEdit"
                            ShowSummary="true" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" value="0" runat="server" id="hdnUserID" />
                        <input type="hidden" value="0" runat="server" id="hdnCopyUserID" />
                        <input type="hidden" value="0" runat="server" id="hdnDelete" />
                        <input type="hidden" value="0" runat="server" id="hdnFooterAdd" />
                        <input type="hidden" value="0" runat="server" id="hdnUserAccessID" />
                        <input type="hidden" value="0" runat="server" id="hdnCanEdit" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function CheckAllUW(Checkbox) {
            var grvUW = document.getElementById("<%=grvGroup.ClientID %>");
            var chk = document.getElementById(grvUW.id + '_ctl01_chkGAll');
            var rowcount = 0;
            for (i = 1; i < grvUW.rows.length; i++) {
                if (grvUW.row[i].cells[2].getElementsByTagName("INPUT")[0].checked == true) {
                    rowcount = rowcount + 1;
                }
                else {
                    rowcount = rowcount - 1;
                };
            }
            if (rowcount == grvUW.rows.length) {
                chk.checked = true;
            }
            else {
                chk.checked = false;
            }
        }
        function CheckAllGroup(Checkbox) {
            var grvUW = document.getElementById("<%=grvGroup.ClientID %>");
            for (i = 1; i < grvUW.rows.length; i++) {
                grvUW.rows[i].cells[2].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
        function handleChange(cb) {
            if (cb.checked == true) {
                document.getElementById('<%=txtCopyUserName.ClientID %>').style.visibility = "visible";
            } else {
                document.getElementById('<%=txtCopyUserName.ClientID %>').style.visibility = "hidden";
            }
        }
    </script>
</asp:Content>

