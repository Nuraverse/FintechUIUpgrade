<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FA_Sys_Holiday_Master_View, App_Web_zogfwrp2" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:UpdatePanel ID="PnlDimensionmaster" runat="server">
        <ContentTemplate>
            <table width="100%" align="center">
                <tr>
                    <td style="width: 100%;" class="stylePageHeading">
                        <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleInfoLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView runat="server" ID="gvHolidayMaster" OnRowDataBound="gvHolidayMaster_RowDataBound"
                            OnRowCommand="gvHolidayMaster_RowCommand" Width="100%" AutoGenerateColumns="false"
                            RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ToolTip="Query" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("Master_Id") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="8%">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ToolTip="Modify" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("Master_Id") %>' CommandName="Modify" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:templatefield headertext="location" itemstyle-horizontalalign="left" 
                                    sortexpression="locationcat_description" headerstyle-cssclass="stylegridheader" headerstyle-width="30%">
                                    <itemtemplate>
                                        <asp:label id="lbllocation" runat="server" tooltip="location description" text='<%# bind("locationcat_description") %>'></asp:label>
                                    </itemtemplate>
                                    <headerstyle cssclass="stylegridheader"></headerstyle>
                                    <headertemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr align="center">
                                                <td >
                                                  
                                                        <asp:LinkButton ID="lnkbtnlocation" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                        runat="server" ToolTip="Sort By Location" Text="location"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnlocation" runat="server" CssClass="styleImageSortingAsc"
                                                        ImageAlign="Middle" />
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td>
                                                    <asp:textbox autocompletetype="none" id="txtheadersearch1" maxlength="50" onkeypress="fncheckspecialchars(true);"
                                                         runat="server" autopostback="true" ontextchanged="FunProHeaderSearch"
                                                        cssclass="stylesearchbox"></asp:textbox>
                                                    <cc1:filteredtextboxextender id="filteredtextboxextender1" runat="server" targetcontrolid="txtheadersearch1"
                                                        filtertype="uppercaseletters, lowercaseletters,custom,numbers" validchars=" " enabled="true">
                                                    </cc1:filteredtextboxextender>
                                                </td>
                                            </tr>
                                        </table>
                                    </headertemplate>
                                </asp:templatefield>
                                <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" ToolTip="Dimension Pattern" Text='<%# Bind("Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Active" Visible="false"  HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="8%">
                                    <ItemTemplate>

                                        <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                        <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%#Eval("User_Level_ID")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                    
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <asp:Button ID="btnCreate" runat="server" Text="Create" ToolTip="Create" CssClass="styleSubmitButton"
                            OnClick="btnSave_Click" />
                        <asp:Button ID="btnShow" runat="server" Text="Show All" ToolTip="Show All" CssClass="styleSubmitButton"
                            OnClick="btnShow_Click" />
                    </td>
                </tr>
            </table>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

