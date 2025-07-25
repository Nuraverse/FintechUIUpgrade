<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S3G_ORG_PRDDCDocViewer.aspx.cs" Inherits="S3G_ORG_PRDDCDocViewer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <script language="javascript" type="text/javascript">
            function setPreviousButtonImage(type) {
                if (type = "O") {
                    document.getElementById("<%= btnPlay.ClientID %>").src = "Images/images.png";
                }
                else {
                    document.getElementById("<%= btnPlay.ClientID %>").src = "Images/1423082447_circle_back_arrow-128.png";
                }
            }

            function setNextButtonImage(type) {
                if (type = "O") {
                    document.getElementById("<%= btnPlay.ClientID %>").src = "Images/S3G_pause_green.png";
                }
                else {
                    document.getElementById("<%= btnPlay.ClientID %>").src = "Images/S3G_Play-128.png";
                }
            }

            //Added By Sathish R on 14-Jul-2016
            function setPlayPauseImage(type) {
                var vImageType = document.getElementById("<%= btnPlayPause.ClientID %>").value;
                if (vImageType.toString() == "Play") {

                    document.getElementById("<%= btnPlay.ClientID %>").src = "Images/S3G_Play.png";
                    document.getElementById("<%= btnPlayPause.ClientID %>").value = "Pause";
                }
                else {
                    document.getElementById("<%= btnPlay.ClientID %>").src = "Images/S3G_stop_green.png";
                    document.getElementById("<%= btnPlayPause.ClientID %>").value = "Play";
                }
            }
        </script>
        <table border="0" width="100%">
            <tr align="center">
                <td align="center" colspan="4">
                    <img id="btnPrevious" alt="Previous" runat="server" width="50" src="~/Images/S3G_Previous.png" />
                    <img id="btnPlay" onclick="setPlayPauseImage('O')" runat="server" width="50" src="~/Images/S3G_stop_green.png" />
                    <asp:HiddenField ID="btnPlayPause" Value="Play" runat="server" />
                    <img id="btnNext" alt="Next" runat="server" width="50" src="~/Images/S3G_Next.png" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td colspan="3" align="center">
                    <br />
                    <b>File Name:</b>
                    <asp:Label ID="lblImageTitle" runat="server" Text="Label" />
                    <br />
                    <b>Customer Name:</b>
                    <asp:Label ID="lblImageDescription" runat="server" Text="Label" />
                </td>
            </tr>
        </table>

        <table border="0" cellpadding="0" cellspacing="0" width="100%">

            <tr>

                <td>
                    <asp:Image ID="Image1" runat="server" />
                    <cc1:SlideShowExtender ID="SlideShowExtender" runat="server" TargetControlID="Image1"
                        SlideShowServiceMethod="GetImages" ImageTitleLabelID="lblImageTitle" ImageDescriptionLabelID="lblImageDescription"
                        AutoPlay="true" PlayInterval="3000" Loop="true" PlayButtonID="btnPlay" StopButtonText="Stop"
                        PlayButtonText="Play" NextButtonID="btnNext" PreviousButtonID="btnPrevious">
                    </cc1:SlideShowExtender>
                </td>

            </tr>
            <%-- <tr>
              
            </tr>--%>
            <tr>
                <td style="display: none">
                    <asp:CheckBox ID="chkLoop" runat="server" Text="Loop" AutoPostBack="true" OnCheckedChanged="chkLoop_CheckedChanged" />
                </td>
                <td style="display: none">
                    <asp:CheckBox ID="chkAutoPlay" runat="server" AutoPostBack="true" Text="Auto Play" OnCheckedChanged="chkAutoPlay_CheckedChanged" />
                </td>
            </tr>

        </table>

    </form>
</body>
</html>





