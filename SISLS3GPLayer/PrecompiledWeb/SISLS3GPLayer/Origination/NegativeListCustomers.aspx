<%@ page language="C#" title="Negative List Customers" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_NegativeListCustomers, App_Web_w304vrwx" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    

<table width="100%">
 
 
 <tr>
 
 
 <td align="center"><asp:LinkButton ID="labelxml" Font-Underline="false" runat="server" Style="position: static" OnClick="Uploadbtn_Click" Font-Size="Large" Text="Upload XML" Font-Bold="true" Width="104px"></asp:LinkButton>
    <asp:FileUpload ID="FileUpload" runat="server" Height="24px" Style="position: static" Width="255px"  />
    
    
 </td>
 </tr>
 <tr>
  <td colspan="100 px">
  </td>
 </tr>
 <tr>

 <asp:GridView ID = "Grid1" runat="server" AutoGenerateColumns="false">
<Columns>
 <asp:TemplateField HeaderText="NAME">
 <ItemTemplate>
 <asp:Label ID="lblName" runat="server" Text='<%# Bind("FIRST_NAME") %>'></asp:Label>

 
 </ItemTemplate>

  
 
 </asp:TemplateField>
 <%--<asp:TemplateField HeaderText="Second Name">
 <ItemTemplate>
 <asp:Label ID="lblSec" runat="server" Text='<%Bind("SECOND_NAME") %>' Visible="true"></asp:Label>
 </ItemTemplate>
 </asp:TemplateField>--%>
 <asp:TemplateField HeaderText="Passport Number">
 <ItemTemplate>
 <asp:Label ID="lblPass" runat="server" Text='<%#Bind("NUMBER") %>'></asp:Label>
 </ItemTemplate>
 </asp:TemplateField>
<%-- <asp:TemplateField HeaderText="Quality">
 <ItemTemplate>
 <asp:Label ID="lblQuality" runat="server" Text='<%#Bind("QUALITY") %>'></asp:Label>
 </ItemTemplate>
 </asp:TemplateField>--%>
  <asp:TemplateField HeaderText="National Identification Number">
 <ItemTemplate>
 <asp:Label ID="lblNat" runat="server" Text='<%#Bind("NOTE") %>'></asp:Label>
 </ItemTemplate>
 </asp:TemplateField>
 </Columns>
 </asp:GridView>

 </tr>
    
    
<%--    
<td> <asp:Label ID="StatusMessageLbl" runat="server" Style="position: static" Text="Label" Font-Bold="true" Width="304px">
 </asp:Label></td>
--%>
<%--<asp:Table ID="Table1" runat="server" Font-Bold="False" BackColor="#ABCDEF" GridLines="Both" CellSpacing="1" HorizontalAlign="Left" EnableViewState="False" BorderStyle="Solid" BorderWidth="1px">
 <asp:TableRow> <asp:TableHeaderCell>Serial No.</asp:TableHeaderCell> <asp:TableHeaderCell>Download Files</asp:TableHeaderCell>
 </asp:TableRow> 
</asp:Table>
 
    </div>
    </form>--%>

</table>
</asp:Content>

