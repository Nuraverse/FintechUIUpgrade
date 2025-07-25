<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FAAddressDetail.ascx.cs"
    Inherits="UserControls_FAAddressDetail" %>
<asp:MultiView ID="mvAddressView" runat="server" ActiveViewIndex="0">
    <asp:View ID="vAddressDetailVer" runat="server">
        <table cellspacing="0" width="100%" runat="server" id="tbleV1">
            <tr>
                <td id="V1FirstColumn1">
                    <asp:Label ID="lblVCode" runat="server" CssClass="styleDisplayLabel" Text="Code"></asp:Label>
                    <asp:HiddenField ID="hdnType" runat="server" />
                </td>
                <td id="V1SecondColumn1">
                    <asp:TextBox ID="txtVCode" runat="server" ReadOnly="True" Width="75%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td id="V1FirstColumn2">
                    <asp:Label ID="lblVName" runat="server" CssClass="styleDisplayLabel" Text="Name">
                    </asp:Label>
                    &nbsp;
                </td>
                <td id="V1SecondColumn2">
                    <asp:TextBox ID="txtVName" runat="server" ReadOnly="True" onmouseover="txt_MouseoverTooltip(this)"
                        Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" id="V1FirstColumn7">
                    <asp:Label ID="lblVAccount" runat="server" CssClass="styleDisplayLabel" Text="Account"></asp:Label>
                </td>
                <td id="V1SecondColumn7">
                    <asp:TextBox ID="txtVAccount" runat="server" ReadOnly="true" Width="95%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" id="V1FirstColumn8">
                    <asp:Label ID="lblVSubAccount" runat="server" CssClass="styleDisplayLabel" Text="Sub Account"></asp:Label>
                </td>
                <td id="V1SecondColumn8">
                    <asp:TextBox ID="txtVSubaccount" runat="server" ReadOnly="true" Width="95%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" id="V1FirstColumn3">
                    <asp:Label ID="lblVAddress" runat="server" CssClass="styleDisplayLabel" Text="Address"></asp:Label>
                </td>
                <td id="V1SecondColumn3">
                    <asp:TextBox ID="txtVAddress" runat="server" ReadOnly="true" Width="85%" Rows="3"
                        TextMode="MultiLine" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td id="V1FirstColumn4">
                    <asp:Label ID="lblVPhone" runat="server" CssClass="styleDisplayLabel" Text="Phone"></asp:Label>
                </td>
                <td id="V1SecondColumn4">
                    <asp:TextBox ID="txtVPhone" runat="server" ReadOnly="True" Width="44%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                    <asp:Label ID="lblVMobile" runat="server" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                    <asp:TextBox ID="txtVMobile" runat="server" ReadOnly="true" Width="38%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td id="V1FirstColumn5">
                    <asp:Label ID="lblVEmail" runat="server" CssClass="styleDisplayLabel" Text="Email Id"></asp:Label>
                </td>
                <td id="V1SecondColumn5">
                    <asp:TextBox ID="txtVEmail" runat="server" ReadOnly="True" Width="85%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="35%" id="V1FirstColumn6">
                    <asp:Label ID="lblVWebsite" runat="server" CssClass="styleDisplayLabel" Text="Website"></asp:Label>
                </td>
                <td id="V1SecondColumn6">
                    <asp:TextBox ID="txtVWebSite" runat="server" ReadOnly="True" Width="85%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="vAddressDetailHor" runat="server">
        <table cellspacing="0" width="100%" runat="server" id="tblView2">
            <tr>
                <td class="styleFieldLabel" id="FirstColumn1">
                    <asp:Label ID="lblHCode" runat="server" CssClass="styleDisplayLabel" Text="Code"></asp:Label>
                </td>
                <td class="styleFieldAlign" id="SecondColumn1" width="30%">
                    <asp:TextBox ID="txtHCode" runat="server" ReadOnly="True" Width="65%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
                <td class="styleFieldLabel" id="ThirdColumn1">
                <asp:Label ID="lblHAccount" runat="server" CssClass="styleDisplayLabel" Text="Account"></asp:Label>
                   
                </td>
                <td class="styleFieldAlign" id="FourthColumn1" width="30%">
                <asp:TextBox ID="txtHAccount" runat="server" ReadOnly="True" Width="90%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td class="styleFieldLabel" id="FirstColumn5">
                     <asp:Label ID="lblHName" runat="server" CssClass="styleDisplayLabel" Text="Name"> </asp:Label>
                </td>
                <td class="styleFieldAlign" id="SecondColumn5" width="30%">
                    <asp:TextBox ID="txtHName" runat="server" ReadOnly="True" onmouseover="txt_MouseoverTooltip(this)"
                        Width="95%"></asp:TextBox>
                </td>
                <td class="styleFieldLabel" id="ThirdColumn5">
                    <asp:Label ID="lblHSubAccount" runat="server" CssClass="styleDisplayLabel" Text="Sub Account"> </asp:Label>
                </td>
                <td class="styleFieldAlign" id="FourthColumn5" width="30%">
                    <asp:TextBox ID="txtHSubAccount" runat="server" ReadOnly="True" onmouseover="txt_MouseoverTooltip(this)"
                        Width="90%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="styleFieldLabel" id="FirstColumn2">
                    <asp:Label ID="lblHAddress" runat="server" CssClass="styleDisplayLabel" Text="Address"></asp:Label>
                </td>
                <td rowspan="3" class="styleFieldAlign" id="SecondColumn2">
                    <asp:TextBox ID="txtHAddress" runat="server" ReadOnly="true" Width="95%" Rows="3"
                        TextMode="MultiLine" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
                <td class="styleFieldLabel" id="ThirdColumn2">
                    <asp:Label ID="lblHPhone" runat="server" CssClass="styleDisplayLabel" Text="Phone"></asp:Label>
                </td>
                <td class="styleFieldAlign" id="FourthColumn2">
                    <asp:TextBox ID="txtHPhone" runat="server" ReadOnly="True" Width="44%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                    <asp:Label ID="lblHMobile" runat="server" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                    <asp:TextBox ID="txtHMobile" runat="server" ReadOnly="True" Width="37%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="styleFieldLabel" id="FirstColumn3">
                </td>
                <td class="styleFieldLabel" id="ThirdColumn3">
                    <asp:Label ID="lblHEmail" runat="server" CssClass="styleDisplayLabel" Text="Email Id"></asp:Label>
                </td>
                <td class="styleFieldAlign" id="FourthColumn3">
                    <asp:TextBox ID="txtHEmail" runat="server" ReadOnly="True" Width="90%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="styleFieldLabel" id="FirstColumn4">
                </td>
                <td class="styleFieldLabel" id="ThirdColumn4">
                    <asp:Label ID="lblHWebSite" runat="server" CssClass="styleDisplayLabel" Text="Website"></asp:Label>
                </td>
                <td class="styleFieldAlign" id="FourthColumn4">
                    <asp:TextBox ID="txtHWebSite" runat="server" ReadOnly="True" Width="90%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>
