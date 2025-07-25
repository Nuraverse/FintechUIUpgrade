<%@ control language="C#" autoeventwireup="true" inherits="UserControls_InwardCustomerView, App_Web_yuh0ce1b" %>
<asp:TextBox ID="txtName" runat="server" ValidationGroup="btnSave"></asp:TextBox>
<asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="false" 
    onclick="btnGetLOV_Click" />
<asp:HiddenField ID="hdnID" runat="server" />
<asp:HiddenField ID="hdnCtrlId" runat="server" />
<asp:HiddenField ID="hdnLovCode" runat="server" />

