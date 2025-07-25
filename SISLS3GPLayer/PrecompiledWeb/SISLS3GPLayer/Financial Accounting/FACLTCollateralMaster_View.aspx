<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FACLTCollateralMaster_View, App_Web_4hds5vgj" title="Untitled Page" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate >
            <table id="table1" runat ="server" width ="100%">
            <tr>
                <td class ="stylePageHeading">
                    <table id="table2" runat ="server" width ="100%">
                    <tr><td><asp:Label ID="lblHeading" runat ="server" CssClass="styleInfoLabel" ></asp:Label></td></tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="grvPaging" OnRowCommand ="grvPaging_RowCommand" OnRowDataBound ="grvPaging_RowDataBound" runat ="server" AutoGenerateColumns ="false" Width ="100%" HeaderStyle-CssClass ="styleGridHeader" >
                    <Columns >
                        <asp:TemplateField ItemStyle-HorizontalAlign ="Center"  >
                            <HeaderStyle CssClass ="styleGridHeader" />
                            <HeaderTemplate >
                                <asp:Label ID="lblQuery" runat ="server" Text ="Query"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate >
                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("Collateral_ID") %>' CommandName="Query"
                                            runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField >
                        <asp:TemplateField ItemStyle-HorizontalAlign ="Center"  >
                            <HeaderStyle CssClass ="styleGridHeader" />
                            <HeaderTemplate >
                                <asp:Label ID ="lblModify" runat ="server" Text ="Modify"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate >
                                <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("Collateral_ID") %>' CommandName="Modify"
                                            runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderStyle-Width ="15%"  ItemStyle-HorizontalAlign ="Center"  >
                            <HeaderStyle CssClass ="styleGridHeader" />
                            <HeaderTemplate >
                                <table id="table3" runat ="server" >
                                <tr align ="center" >
                                    <td><asp:LinkButton ID="lnkbtnSort1" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By Collateral Ref No" Text="Collateral Ref No"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnSort1" CssClass="styleImageSortingAsc" runat="server"
                                                        ImageAlign="Middle" /></td>
                                </tr>
                                <tr align ="center" >
                                    <td><asp:TextBox ID="txtHeaderSearch1" Width="100%" runat ="server" AutoCompleteType ="None" AutoPostBack ="true" OnTextChanged ="FunProHeaderSearch" CssClass ="styleSearchBox"></asp:TextBox></td>
                                </tr>
                                </table>
                                
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCollateralRefNo" style="text-align :center " runat ="server" Text ='<% #Bind("Collateral_Ref_No") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign ="Center" >
                            <HeaderStyle CssClass ="styleGridHeader" />
                            <HeaderTemplate >
                               Date
                            </HeaderTemplate>
                            <ItemTemplate >
                                
                                <asp:Label ID="blDate"  runat="server" Text='<%#Eval("DAte")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign ="Center" >
                            <HeaderStyle CssClass ="styleGridHeader" />
                            <HeaderTemplate >
                               Active
                            </HeaderTemplate>
                            <ItemTemplate >
                                <asp:CheckBox ID="chkActive" runat="server" AutoPostBack="true" align="center" Enabled ="false"/>
                                <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%#Eval("Is_Active")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible ="false"  >
                            <ItemTemplate >
                                    <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By")%>'></asp:Label>
                                    <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align ="center" valign ="top" >
                <uc1:PageNavigator ID="ucCustomPaging" runat ="server" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblErrorMessage" runat ="server" ></asp:Label></td>
            </tr>
            <tr align ="center" >
                <td align ="center" ><asp:Button OnClick ="btnCreate_Click" ID="btnCreate" runat ="server" Text ="Create" CssClass ="styleSubmitButton" />&nbsp;
                    <asp:Button ID="btnShowAll" OnClick ="btnShowAll_Click" runat ="server" Text ="Show All" CssClass ="styleSubmitButton" /></td>
            </tr>
            </table>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

