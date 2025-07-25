<%@ control language="C#" autoeventwireup="true" inherits="UserControls_CommonSearch, App_Web_ylpojzbs" %>
<%@ Register Src="S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc5" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>--%>
<style type="text/css">
    .auto-style1 {
        width: 3%;
    }
</style>
<%--<div class="row">

    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px!important; padding-right: 0px !important; width: 100% !important;">
        <asp:TextBox ID="TxtName" runat="server" CssClass="md-form-control form-control"></asp:TextBox>
        <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" runat="server" TargetControlID="TxtName"
            WatermarkText="--Select--">
        </cc1:TextBoxWatermarkExtender>
        <asp:TextBox ID="txtItemName" runat="server" Style="display: none;"></asp:TextBox>
        <asp:Button ID="btnSelected" runat="server" Style="display: none; position: absolute"
            OnClick="btnItem_Selected" CausesValidation="false" />
        <asp:RequiredFieldValidator ControlToValidate="hdnSelectedValue" ID="rfvMultiSuggest"
            Enabled="false" runat="server" Display="None" InitialValue="0">
        </asp:RequiredFieldValidator>
        <cc1:AutoCompleteExtender ID="autoCompletor" MinimumPrefixLength="1" runat="server" FirstRowSelected="true"
            TargetControlID="TxtName" Enabled="True" CompletionSetCount="5" CompletionListCssClass="CompletionList"
            DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
            ShowOnlyCurrentWordInCompletionListItem="true" CompletionInterval="2">
        </cc1:AutoCompleteExtender>
        <asp:HiddenField ID="hdnAutoPostBack" runat="server" Value="0" />
        <asp:HiddenField ID="hdnControlID" runat="server" Value="0" />
        <asp:TextBox ID="hdnSelectedValue" runat="server" Text="0" Style="display: none; position: absolute" />
    </div>
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding: 0px;">
        <asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="false" OnClick="btnGetLOV_Click" CssClass="btn_5" />
    </div>
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding: 0px;">
        <i style="font-size: 36px; color: aliceblue">
          
            <button id="btnAddress" runat="server" style="font-size: 24px; color: black"><i class="fa fa-user-plus"></i></button>
        </i>
    </div>

</div>--%>


<table style="width: 100%;">
    <tr>
        <td style="padding: 0px !important; padding-right: 5px !important;">
            <asp:TextBox ID="TxtName" runat="server" CssClass="md-form-control form-control" Style="width: 100%; background-color: #fbfbfb;"></asp:TextBox>
            <%-- <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" runat="server" TargetControlID="TxtName"
                WatermarkText="--Select--">
            </cc1:TextBoxWatermarkExtender>--%>
            <asp:TextBox ID="txtItemName" runat="server" Style="display: none;" Height="0"></asp:TextBox>
            <asp:Button ID="btnSelected" runat="server" Style="display: none; position: absolute"
                OnClick="btnItem_Selected" CausesValidation="false" />
          
            <asp:RequiredFieldValidator ControlToValidate="hdnSelectedValue" ID="rfvMultiSuggest"
                Enabled="false" runat="server" Display="None" InitialValue="0">
            </asp:RequiredFieldValidator>
            <cc1:AutoCompleteExtender ID="autoCompletor" MinimumPrefixLength="1" runat="server" FirstRowSelected="true"
                TargetControlID="TxtName" Enabled="True" CompletionSetCount="5" CompletionListCssClass="CompletionList"
                DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                ShowOnlyCurrentWordInCompletionListItem="true" CompletionInterval="2">
            </cc1:AutoCompleteExtender>
            <asp:HiddenField ID="hdnAutoPostBack" runat="server" Value="0" />
            <asp:HiddenField ID="hdnControlID" runat="server" Value="0" />
              <asp:HiddenField ID="txtLastSelectedText" runat="server" Value="" />
            <asp:TextBox ID="hdnSelectedValue" runat="server" Text="0" Style="display: none; position: absolute" />
        </td>
        <td style="padding: 0px !important; width: 24px;">
            <asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="false" OnClick="btnGetLOV_Click" CssClass="btn_5" />
        </td>
        <td id="tdbtnAddress" runat="server" style="padding: 0px !important; padding-left: 5px !important; width: 24px;">
            <i style="font-size: 36px; color: aliceblue">
                <button id="btnAddress" runat="server" class="btn_control" type="button"><i class="fa fa-user-plus"></i></button>
            </i>
        </td>
    </tr>
</table>



<script language="javascript" type="text/javascript">
    function CommonAutoSuggest_ItemSelected(sender, e) {
        var strControlID = sender._id.replace('_autoCompletor', '');
        var hdnSelectedValue = document.getElementById(strControlID + '_hdnSelectedValue');
        var hdnID = document.getElementById(strControlID + '_hdnID');
        if (e.get_value() == "-1") {
            document.getElementById(strControlID + '_TxtName').value = "";
            document.getElementById(strControlID + '_txtItemName').value = "";
            hdnID.value=  hdnSelectedValue.value = "0";
        }
        else {
            document.getElementById(strControlID + '_TxtName').value = e._text;
            document.getElementById(strControlID + '_txtItemName').value = "";
            document.getElementById(strControlID + '_txtLastSelectedText').value = e._text;
            hdnID.value = hdnSelectedValue.value = e.get_value();
        }
        if (e.get_value() != "-1") {
            CommonAutoSuggest_doPostBack(strControlID);
        }
    }

    function CommonAutoSuggest_ItemPopulated(sender, e) {
        var strControlID = sender._id.replace('_autoCompletor', '');
        document.getElementById(strControlID + '_hdnSelectedValue').value = 0;
        document.getElementById(strControlID + '_hdnID').value = 0;
    }

    function CommonAutoSuggest_doPostBack(strControlID) {

        var AutoPostBack = document.getElementById(strControlID + '_hdnAutoPostBack').value;
        if (AutoPostBack == '1') {
            document.getElementById(strControlID + '_btnSelected').click();
        }
    }

    function CommonAutoSuggest_ShowOptions(sender, e) {
        sender._completionListElement.style.zIndex = 10000001;
    }

</script>
<asp:HiddenField ID="hdnName" runat="server" />

<asp:HiddenField ID="hdnID" runat="server" />
<asp:HiddenField ID="hdnAccountNumber" runat="server" />
<asp:HiddenField ID="hdnCtrlId" runat="server" />
<asp:HiddenField ID="hdnLovCode" runat="server" />
<asp:Panel ID="pnlCommAddress" runat="server" CssClass="popupMenu" HorizontalAlign="Justify" GroupingText="Address Information"
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
