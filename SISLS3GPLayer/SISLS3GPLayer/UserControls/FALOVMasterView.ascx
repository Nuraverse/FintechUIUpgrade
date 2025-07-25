<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FALOVMasterView.ascx.cs" Inherits="UserControls_FALOVMasterView" %>
<%--<%@ Register Src="FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc5" %>--%>
<%@ Register Src="S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc5" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<table style="width: 100%;">
    <tr>
        <td style="padding: 0px !important; padding-right:5px !important;">
<asp:TextBox ID="txtName" runat="server" TabIndex="-1" ValidationGroup="btnSave"  CssClass="md-form-control form-control" style="width:100%;     background-color: #fbfbfb;"  onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
            </td>
         <td style="padding:0px !important;     width: 24px;">
<asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="false" CssClass="btn_5" 
    onclick="btnGetLOV_Click" />
      </td>
        <td style="padding: 0px !important; padding-left:5px !important;    width: 24px;">
            <i style="font-size: 36px; color: aliceblue">
                 <button id="btnAddress" runat="server" class="btn_control"><i class="fa fa-user-plus"></i></button>
<%--<asp:ImageButton  ID="btnAddress" runat="server" Visible="true" TabIndex="-1"  Height="25px"   ImageUrl="~/Images/Address2.png"   CausesValidation="false" />--%>
                </i>
    </td>
        </tr>
    </table>
 


<asp:HiddenField ID="hdnID" runat="server" />
<asp:HiddenField ID="hdnCtrlId" runat="server" />
<asp:HiddenField ID="hdnLovCode" runat="server" />
<asp:Panel ID="pnlCommAddress" runat="server" CssClass="popupMenu" HorizontalAlign="Justify" GroupingText="Customer Information"
    Width="50%">
    <div style="border: 1px outset white; display: block">
      <%--  <uc5:FAAddressDetail ID="FAAddressDetail1" runat="server" ActiveViewIndex="1"
            FirstColumnWidth="20%" SecondColumnWidth="30%" ThirdColumnWidth="20%" FourthColumnWidth="30%" />--%>

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