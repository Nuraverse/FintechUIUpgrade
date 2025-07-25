<%@ control language="C#" autoeventwireup="true" inherits="UserControls_LOBMasterView, App_Web_yuh0ce1b" %>
<%--<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left:0px!important; padding-right:0px !important;">
        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10"  style="padding-left:0px!important; padding-right:0px !important;width:100% !important;">
            <asp:TextBox ID="txtName" runat="server" ValidationGroup="btnSave"  CssClass="md-form-control form-control" style="width:100% !important;padding-left:5px;"></asp:TextBox>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="margin-top: -30px !important;float: right !important;margin-right: 0px !important;padding-left:0px!important; padding-right:0px !important;">
            <asp:Button ID="btnGetLOV" runat="server" Enabled="false" Text="..." CausesValidation="false" OnClick="btnGetLOV_Click" CssClass="btn_5" />
        </div>
    </div>
</div>--%>

<table style="width: 100%;">
    <tr>
        <td style="padding: 0px !important; padding-right:5px !important;">
            <asp:TextBox ID="txtName" runat="server" ValidationGroup="btnSave" CssClass="md-form-control form-control" Style="width: 100% !important; padding-left: 5px;"></asp:TextBox>
        </td>
        <td style="padding: 0px !important; width: 24px;">
            <asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="false" OnClick="btnGetLOV_Click" CssClass="btn_5" />
        </td>
    </tr>
</table>
<asp:HiddenField ID="hdnID" runat="server" />
<asp:HiddenField ID="hdnCtrlId" runat="server" />
<asp:HiddenField ID="hdnLovCode" runat="server" />

