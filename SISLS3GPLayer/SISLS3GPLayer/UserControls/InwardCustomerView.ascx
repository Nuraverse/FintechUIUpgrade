<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InwardCustomerView.ascx.cs"
    Inherits="UserControls_InwardCustomerView" %>
<asp:TextBox ID="txtName" runat="server" ValidationGroup="btnSave"></asp:TextBox>
<asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="false" 
    onclick="btnGetLOV_Click" />
<asp:HiddenField ID="hdnID" runat="server" />
<asp:HiddenField ID="hdnCtrlId" runat="server" />
<asp:HiddenField ID="hdnLovCode" runat="server" />

