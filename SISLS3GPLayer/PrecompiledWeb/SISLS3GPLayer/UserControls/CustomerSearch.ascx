<%@ control language="C#" autoeventwireup="true" inherits="UserControls_CustomerSearch, App_Web_ylpojzbs" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc5" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:TextBox ID="txtName" runat="server" TabIndex="-1" CausesValidation="false" ValidationGroup="btnSave"></asp:TextBox>
<asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="false"
    OnClick="btnGetLOV_Click" />
<%--<asp:Button ID="btnAddress" runat="server" TabIndex="-1" Text="<+>"  i CausesValidation="false" />--%>
<asp:ImageButton  ID="btnAddress" runat="server" Visible="true" TabIndex="-1"  Height="25px" Width="40px"  ImageUrl="~/Images/Address2.png"   CausesValidation="false" />
<asp:HiddenField ID="hdnID" runat="server" />
<asp:HiddenField ID="hdnCtrlId" runat="server" />
<asp:HiddenField ID="hdnLovCode" runat="server" />
<asp:Panel ID="pnlCommAddress" runat="server" CssClass="popupMenu" HorizontalAlign="Justify" GroupingText="Customer Information"
    Width="50%">
    <div style="border: 1px outset white; display: block">
        <uc5:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" ActiveViewIndex="1"
            FirstColumnWidth="20%" SecondColumnWidth="30%" ThirdColumnWidth="20%" FourthColumnWidth="30%" />
    </div>
</asp:Panel>
<cc1:HoverMenuExtender ID="hvCustomerAddressLeft" runat="server" HoverCssClass="popupHover"
    PopupControlID="pnlCommAddress" Enabled="false" PopupPosition="Left" TargetControlID="btnAddress">
</cc1:HoverMenuExtender>
<cc1:HoverMenuExtender ID="hvCustomerAddressRight" runat="server" HoverCssClass="popupHover"
    PopupControlID="pnlCommAddress" Enabled="false" PopupPosition="Right" TargetControlID="btnAddress">
</cc1:HoverMenuExtender>
<cc1:HoverMenuExtender ID="hvCustomerAddressBottom" runat="server" HoverCssClass="popupHover"
    PopupControlID="pnlCommAddress" Enabled="false" PopupPosition="Bottom" TargetControlID="btnAddress">
</cc1:HoverMenuExtender>
<cc1:HoverMenuExtender ID="hvCustomerAddressTop" runat="server" HoverCssClass="popupHover"
    PopupControlID="pnlCommAddress" Enabled="false" PopupPosition="Top" TargetControlID="btnAddress">
</cc1:HoverMenuExtender>
<cc1:HoverMenuExtender ID="hvCustomerAddressCenter" runat="server" HoverCssClass="popupHover"
    PopupControlID="pnlCommAddress" Enabled="false" PopupPosition="Center" TargetControlID="btnAddress">
</cc1:HoverMenuExtender>