<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_NCDBondsUpLoad, App_Web_insjbia3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td class="stylePageHeading">
                                    <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Panel ID="Panel3" runat="server" GroupingText="NCD" CssClass="stylePanel" Width="50%">
                                        <table border="0" cellpadding="0" cellspacing="0" width="98%">
                                            <tr align="center">
                                                <td colspan="2">
                                                <asp:RadioButtonList CssClass="styleDisplayLabel" RepeatDirection="Horizontal" runat="server" ID="rdbPrimary">
                                                <asp:ListItem Text="Primary" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Secondary" Value="1"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr align="center" width="50%">
                                                <td class="styleFieldLabel">
                                                    <asp:Label ID="lblNCDScan" runat="server" Text="NCD File upload" CssClass="styleReqFieldLabel" />
                                                </td>
                                                <td align="left" class="styleFieldAlign" width="50%">
                                                    <cc1:AsyncFileUpload ID="asyFileUpload" Width="200px" runat="server" OnClientUploadComplete="uploadComplete" />
                                                    <asp:HiddenField runat="server" ID="hdnThrobber" />
                                                </td>
                                            </tr>
                                            <tr align="center">
                                                <td colspan="2" style="height: 60px">
                                                    <br />
                                                    <asp:Button ID="btnProcess" CssClass="styleSubmitButton" runat="server" Text="Process"
                                                        CausesValidation="False" OnClick="btnProcess_Click" />
                                                    <asp:Button ID="btnCancel" CssClass="styleSubmitButton" runat="server" CausesValidation="False"
                                                        Text="Cancel" OnClick="btnCancel_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:ValidationSummary runat="server" ID="Vgsave" HeaderText="Correct the following validation(s):"
                                        CssClass="styleMandatoryLabel" ValidationGroup="Main" Width="500px" ShowMessageBox="false"
                                        ShowSummary="true" />
                                    <asp:CustomValidator ID="CVNCDSTP" runat="server" CssClass="styleMandatoryLabel"
                                        Enabled="true" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <script type="text/javascript">
        function uploadComplete(sender, args) {
            var obj = args._fileName.split("\\");
            var hdnThrobber = document.getElementById('<%=hdnThrobber.ClientID%>');
            if (hdnThrobber != null) {
                hdnThrobber.value = args._fileName;
            }

        }
    </script>

</asp:Content>
