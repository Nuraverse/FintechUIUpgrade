<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FADimensionMaster_view, App_Web_tfexpijv" title="Dimension Master" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        <asp:GridView runat="server" ID="gvDimensionMaster" OnRowDataBound="gvDimensionMaster_RowDataBound"
                            OnRowCommand="gvDimensionMaster_RowCommand" Width="100%" AutoGenerateColumns="false"
                            RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ToolTip="Query" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("Dim_ID") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="8%">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ToolTip="Modify" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("Dim_ID") %>' CommandName="Modify" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dimension Code" ItemStyle-HorizontalAlign="Left" SortExpression="Dim_Code"
                                    HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="15%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDimensionCode" runat="server" ToolTip="Dimension Code" Text='<%# Bind("Dim_Code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr align="center">
                                                <td>
                                                    <asp:LinkButton ID="lnkbtnDimension_Code" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                        runat="server" ToolTip="Sort By Dimension Code" Text="Dimension Code"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnDimension_Code" runat="server" CssClass="styleImageSortingAsc"
                                                        ImageAlign="Middle" />
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td>
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" MaxLength="4"  runat="server"
                                                        CssClass="styleSearchBox" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                        Width="120px"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtHeaderSearch1"
                                                        FilterType="UppercaseLetters, LowercaseLetters, Numbers" Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dimension Description" ItemStyle-HorizontalAlign="Left"
                                    SortExpression="Dim_Desc" HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="30%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDimension_Desc" runat="server" ToolTip="Dimension Description" Text='<%# Bind("Dim_Desc") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr align="center">
                                                <td>
                                                    <asp:LinkButton ID="lnkbtnDimension_Desc" OnClick="FunProSortingColumn" ToolTip="Sort By Dimension Description"
                                                        CssClass="styleGridHeaderLinkBtn" runat="server" Text="Dimension Description"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnDimension_Desc" CssClass="styleImageSortingAsc" runat="server"
                                                        ImageAlign="Middle" />
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td>
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" MaxLength="40" onkeypress="fnCheckSpecialChars(true);"
                                                         runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                        CssClass="styleSearchBox"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch2"
                                                        FilterType="UppercaseLetters, LowercaseLetters,Custom,Numbers" ValidChars=" " Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                               <asp:templatefield headertext="location" itemstyle-horizontalalign="left" Visible="false"
                                    sortexpression="locationcat_description" headerstyle-cssclass="stylegridheader" headerstyle-width="30%">
                                    <itemtemplate>
                                        <asp:label id="lbllocation" runat="server" tooltip="location description" text='<%# bind("locationcat_description") %>'></asp:label>
                                    </itemtemplate>
                                    <headerstyle cssclass="stylegridheader"></headerstyle>
                                    <headertemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr align="center">
                                                <td >
                                                    <asp:linkbutton id="lnkbtnlocation" onclick="FunProSortingColumn" tooltip="sort by location"
                                                        cssclass="stylegridheaderlinkbtn" runat="server" text="location"></asp:linkbutton>
                                                    <asp:imagebutton id="imgbtnlocation" cssclass="styleimagesortingasc" runat="server"
                                                        imagealign="middle" />
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td>
                                                    <asp:textbox autocompletetype="none" id="txtheadersearch3" maxlength="50" onkeypress="fncheckspecialchars(true);"
                                                         runat="server" autopostback="true" ontextchanged="FunProHeaderSearch"
                                                        cssclass="stylesearchbox"></asp:textbox>
                                                    <cc1:filteredtextboxextender id="filteredtextboxextender4" runat="server" targetcontrolid="txtheadersearch3"
                                                        filtertype="uppercaseletters, lowercaseletters,custom,numbers" validchars=" " enabled="true">
                                                    </cc1:filteredtextboxextender>
                                                </td>
                                            </tr>
                                        </table>
                                    </headertemplate>
                                </asp:templatefield>
                                <asp:TemplateField HeaderText="Dimension Type" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDimension_type" runat="server" ToolTip="Dimension Type" Text='<%# Bind("Dimension_Type") %>'></asp:Label>
                                    </ItemTemplate>
                                     <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr align="center">
                                                <td>
                                                    <asp:LinkButton ID="lnkbtnDimType" OnClick="FunProSortingColumn" ToolTip="Sort By Dim Type"
                                                        CssClass="styleGridHeaderLinkBtn" runat="server" Text="Dimension Type"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnDimType" CssClass="styleImageSortingAsc" runat="server"
                                                        ImageAlign="Middle" />
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td>
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" MaxLength="50" onkeypress="fnCheckSpecialChars(true);"
                                                         runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                        CssClass="styleSearchBox"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtHeaderSearch4"
                                                        FilterType="UppercaseLetters, LowercaseLetters,Custom,Numbers" ValidChars=" " Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dimension Pattern" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDimensionPattern" runat="server" ToolTip="Dimension Pattern" Text='<%# Bind("Dimension_Pattern") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Active"  HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:CheckBox Enabled="false" runat="server" ID="chkActive" ToolTip="Active" />
                                        <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%#Eval("Is_Active")%>'></asp:Label>
                                        <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                        <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%#Eval("User_Level_ID")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                         <%--Modified By Chandrasekar K On 18-09-2012--%>
                                        <asp:CheckBox ID="chkTrans" Checked='<%#DataBinder.Eval(Container.DataItem, "Trans").ToString().ToUpper() == "TRUE"%>' runat="server" />
                                        <%--<asp:CheckBox ID="chkTrans" runat="server" Checked='<%#Bind("Trans") %>'></asp:CheckBox>--%>
                                    </ItemTemplate>
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
