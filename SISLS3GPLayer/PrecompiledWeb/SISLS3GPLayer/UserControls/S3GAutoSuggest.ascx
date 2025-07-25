<%@ control language="C#" autoeventwireup="true" inherits="UserControls_S3GAutoSuggest, App_Web_yuh0ce1b" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<table cellpadding="0" cellspacing="0" runat="server" id="tblContent" style="width: 100%;">
    <tr>
        <td style="width: 100%; padding: 0px !important;">
            <asp:UpdatePanel ID="dfd" runat="server">
                <ContentTemplate>
                    <div>
                        <table style="width: 100%">
                            <tr>
                                <td style="padding: 0px !important">
                                    <asp:TextBox ID="txtItemName" runat="server"
                                        class="md-form-control form-control login_form_content_input Auto_Complete_txt"></asp:TextBox>

                                    <asp:TextBox ID="txtLastSelectedText" Style="display: none" runat="server"
                                        class="md-form-control form-control login_form_content_input Auto_Complete_txt"></asp:TextBox>

                                    <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" Enabled="false" runat="server" TargetControlID="txtItemName"
                                        WatermarkText="--Select--">
                                    </cc1:TextBoxWatermarkExtender>
                                    <div id="divrfvSuggest" runat="server" class="validation_msg_box">
                                        <asp:RequiredFieldValidator ControlToValidate="hdnSelectedValue" ID="rfvMultiSuggest"
                                            Enabled="false" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="0">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <cc1:AutoCompleteExtender ID="autoCompletor" MinimumPrefixLength="1" runat="server" FirstRowSelected="true"
                                        TargetControlID="txtItemName" Enabled="True" CompletionSetCount="5" CompletionListCssClass="CompletionList"
                                        DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                        ShowOnlyCurrentWordInCompletionListItem="true" CompletionInterval="2">
                                    </cc1:AutoCompleteExtender>
                                    <asp:HiddenField ID="hdnAutoPostBack" runat="server" Value="0" />
                                    <asp:HiddenField ID="hdnControlID" runat="server" Value="0" />
                                    <asp:TextBox ID="hdnSelectedValue" runat="server" Text="0" Style="display: none; position: absolute" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                </td>
                                <td style="padding: 0px !important">
                                    <asp:Button ID="btnSelected" runat="server" Style="display: none; position: absolute"
                                        OnClick="btnItem_Selected" CausesValidation="false" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>

<script language="javascript" type="text/javascript">

    function AutoSuggest_ItemSelected(sender, e) {
        var strControlID = sender._id.replace('_autoCompletor', '');
        var hdnSelectedValue = document.getElementById(strControlID + '_hdnSelectedValue');
        if (e.get_value() == "-1") {
            document.getElementById(strControlID + '_txtItemName').value = "";
            hdnSelectedValue.value = "0";
        }
        else {
            document.getElementById(strControlID + '_txtItemName').value = e._text;
            document.getElementById(strControlID + '_txtLastSelectedText').value = e._text;
            //document.getElementById(strControlID + '_txtItemName').title = e._text;
            hdnSelectedValue.value = e.get_value();
        }
        if (e.get_value() != "-1") {
            AutoSuggest_doPostBack(strControlID);
        }
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

