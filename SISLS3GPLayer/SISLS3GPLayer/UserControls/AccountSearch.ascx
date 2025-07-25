<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccountSearch.ascx.cs" Inherits="UserControls_AccountSearch" %>
<%@ Register Src="S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc5" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>--%>
<style type="text/css">
    .auto-style1
    {
        width: 3%;
    }
</style>
<table>
    <tr style="width: 50px">
        <td>
            <asp:TextBox ID="TxtAccNumber" runat="server" Width="150px"></asp:TextBox>
            <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" runat="server" TargetControlID="TxtAccNumber"
                WatermarkText="--Select--">
            </cc1:TextBoxWatermarkExtender>
            <asp:TextBox ID="txtAccItemNumber" runat="server"></asp:TextBox>
            <asp:Button ID="btnSelected" runat="server" Style="display: none; position: absolute"
                OnClick="btnItem_Selected" CausesValidation="false" />
            <asp:RequiredFieldValidator ControlToValidate="hdnSelectedValue" ID="rfvMultiSuggest"
                Enabled="false" runat="server" Display="None" InitialValue="0">
            </asp:RequiredFieldValidator>
            <cc1:AutoCompleteExtender ID="autoCompletor" MinimumPrefixLength="1" runat="server" FirstRowSelected="true"
                TargetControlID="TxtAccNumber" Enabled="True" CompletionSetCount="5" CompletionListCssClass="CompletionList"
                DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                ShowOnlyCurrentWordInCompletionListItem="true" CompletionInterval="2">
            </cc1:AutoCompleteExtender>
            <asp:HiddenField ID="hdnAutoPostBack" runat="server" Value="0" />
            <asp:HiddenField ID="hdnControlID" runat="server" Value="0" />
            <asp:TextBox ID="hdnSelectedValue" runat="server" Text="0" Style="display: none; position: absolute" />
        </td>
        <%--<td class="">
            <uc2:Suggest ID="ddlAccountNo" runat="server" ServiceMethod="GetAccuntNoList" AutoPostBack="true" TabIndex="-1"
                IsMandatory="true" ValidationGroup="VGNoc" ErrorMessage="Enter a A/C Number" Width="150px" height="50px" />
        </td>--%>
        <td style="flex-align: initial;">
            <asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="false"
                OnClick="btnGetLOV_Click" />
        </td>
    </tr>
</table>
<script language="javascript" type="text/javascript">


    function AutoSuggest_ItemSelected(sender, e) {
        //try
        //{
            var strControlID = sender._id.replace('_autoCompletor', '');
            var hdnSelectedValue = document.getElementById(strControlID + '_hdnSelectedValue');
            if (e.get_value() == "-1") {
                document.getElementById(strControlID + '_TxtAccNumber').value = "";
                hdnSelectedValue.value = "0";
            }
            else {
                document.getElementById(strControlID + '_TxtAccNumber').value = e._text;
                document.getElementById(strControlID + '_TxtAccNumber').title = e._text;
                hdnSelectedValue.value = e.get_value();
            }
            if (e.get_value() != "-1") {
                AutoSuggest_doPostBack(strControlID);
            }
        //}
        //catch(ex)
        //{
        //    throw ex
        //}

    }

    function AutoSuggest_ItemPopulated(sender, e) {
        var strControlID = sender._id.replace('_autoCompletor', '');
        document.getElementById(strControlID + '_hdnSelectedValue').value = 0;
    }

    function AutoSuggest_doPostBack(strControlID) {

        var AutoPostBack = document.getElementById(strControlID + '_hdnAutoPostBack').value;
        if (AutoPostBack == '1') {
            document.getElementById(strControlID + '_btnSelected').click();
        }
    }

    function AutoSuggest_ShowOptions(sender, e) {
        sender._completionListElement.style.zIndex = 10000001;
    }

</script>
<%--<asp:TextBox ID="txtName" runat="server" ReadOnly="true" CausesValidation="false" Visible="true" ValidationGroup="btnSave"></asp:TextBox>--%>
<asp:HiddenField ID="hdnName" runat="server" />

<%--<asp:Button ID="btnAddress" runat="server" TabIndex="-1" Text="<+>"  i CausesValidation="false" />--%>
<asp:ImageButton ID="btnAddress" runat="server" Visible="false" TabIndex="-1" Height="25px" Width="40px" ImageUrl="~/Images/Address2.png" CausesValidation="false" />
<asp:HiddenField ID="hdnID" runat="server" />
<asp:HiddenField ID="hdnAccountNumber" runat="server" />
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
