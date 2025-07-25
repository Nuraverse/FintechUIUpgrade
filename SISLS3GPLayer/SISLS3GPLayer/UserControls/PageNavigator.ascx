<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageNavigator.ascx.cs"
    Inherits="PageNavigator" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div class="styleMainTable">
    <div class="styleRecordCount" runat="server" id="trMessage">
            <asp:Label runat="server" ID="lblMessage" Text="No Records Found" Font-Size="Medium"
                class="styleMandatoryLabel"></asp:Label>
    </div>
    <div class="row " runat="server" id="trControl">


        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"  align="left" style="padding: 7px 15px;">
            <asp:Label runat="server" ID="lblTotalRecords"></asp:Label>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"  align="left" style="padding: 7px 15px;">
            <div class="row">
                <table>
                    <tr>
                        <td style="padding-top:0px !important; padding-bottom:0px !important;">
                            <asp:ImageButton ID="btnFirst" runat="server" CommandName="First" OnCommand="Navigation_Link" Enabled="true" ImageUrl="../Images/First.gif" CausesValidation="false" style="width:17px; height:17px;" />
                        </td>
                        <td style="padding-top:0px !important; padding-bottom:0px !important;">
                            <asp:ImageButton ID="btnPrevious" runat="server" Enabled="true" CommandName="Prev" OnCommand="Navigation_Link" ImageUrl="../Images/Prev.gif" CausesValidation="false" style="width:17px; height:17px;" />
                        </td>
                        <td style="padding-top:0px !important; padding-bottom:0px !important;">
                            <asp:Label runat="server" Text="1" CssClass="stylePagingRecFieldLabel" ID="lblCurrentPage"></asp:Label>
                            <span class="stylePagingRecFieldLabel">/ </span>
                            <asp:Label runat="server" Text="1" CssClass="stylePagingRecFieldLabel" ID="lblTotalPages"></asp:Label>
                        </td>
                        <td style="padding-top:0px !important; padding-bottom:0px !important;">
                            <asp:ImageButton ID="btnNext" runat="server" Enabled="true" CommandName="Next" OnCommand="Navigation_Link" ImageUrl="../Images/Next.gif" CausesValidation="false" style="width:17px; height:17px;" />
                        </td>
                        <td style="padding-top:0px !important; padding-bottom:0px !important;">
                            <asp:ImageButton ID="btnLast" runat="server" Enabled="true" CommandName="Last" OnCommand="Navigation_Link" ImageUrl="../Images/Last.gif" CausesValidation="false" style="width:17px; height:17px;" />
                        </td>
                    </tr>
                </table>
            </div>

        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"  align="left" style="padding: 7px 15px;">
            <asp:TextBox runat="server" ID="txtGotoPage" AutoPostBack="true" CssClass="stylePagingTextBox"
                MaxLength="4" onpaste="return false;" onblur="return fnValidateEmptyGotoPage();"
                OnTextChanged="btnGO_Click" Width="30px"></asp:TextBox>&nbsp;
                <%--</div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">--%>
            <asp:Label runat="server" Text="Page Number" CssClass="navigation_label" ID="lblPageNo"></asp:Label>

        </div>
        <%--<div class="col-lg-4 hidden-sm hidden-xs"></div>--%>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" align="left" style="padding: 7px 15px;">
            <%--<div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">--%>
            <asp:TextBox runat="server" CssClass="stylePagingTextBox" Width="30px" MaxLength="3"
                OnTextChanged="btnSize_Click" onpaste="return false;" AutoPostBack="true" onblur="return fnValidateEmpty();"
                ID="txtPageSize"></asp:TextBox>
            <%-- </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">--%>
            <asp:Label runat="server" Text="Page Size" CssClass="navigation_label" ID="lblPageSize"></asp:Label>
            <%--</div>
            </div>--%>
        </div>



    </div>
</div>

<input type="hidden" runat="server" width="1px" id="hdnTotRec" />
<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtGotoPage"
    FilterType="Numbers">
</cc1:FilteredTextBoxExtender>
<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtPageSize"
    FilterType="Numbers">
</cc1:FilteredTextBoxExtender>

<script language="javascript" type="text/javascript">

    function fnValidateGotoPage() {

        var iTotPage;
        var iGotoPage;
        iTotPage = document.getElementById('<%=lblTotalPages.ClientID%>').innerText;
        iGotoPage = document.getElementById('<%=txtGotoPage.ClientID%>').value;

        if (iGotoPage == 0) {
            alert('Page Number cannot be zero');
            document.getElementById('<%=txtGotoPage.ClientID%>').value = 1;
            return false;
        }

        if (parseInt(iTotPage) < parseInt(iGotoPage)) {
            alert('Page Number cannot be greater than total no of pages');
            document.getElementById('<%=txtGotoPage.ClientID%>').value = 1;
            return false;
        }

        return true;

    }

    function fnValidatePage() {
        var iTotRec;
        var iPageSize;
        iTotRec = document.getElementById('<%=hdnTotRec.ClientID%>').value;
        iPageSize = document.getElementById('<%=txtPageSize.ClientID%>').value;

        if (iPageSize == 0) {
            alert('Page Size cannot be zero');
            document.getElementById('<%=txtPageSize.ClientID%>').value = 100;
            return false;
        }

        // user can enter only page size of 1 - 100
        if (parseInt(iPageSize) > 100) {
            alert('Page Size cannot be greater than 100');
            document.getElementById('<%=txtPageSize.ClientID%>').value = 100;
            return true;
        }

        return true;

    }


    function fnValidateEmpty() {
        if (document.getElementById('<%=txtPageSize.ClientID%>').value == '' || document.getElementById('<%=txtPageSize.ClientID%>').value == 0) {
            document.getElementById('<%=txtPageSize.ClientID%>').value = 1;
            document.getElementById('<%=txtPageSize.ClientID%>').focus();
            alert('Page Size cannot be empty or zero');
            return false;
        }
        return (fnValidatePage());

    }

    function fnValidateEmptyGotoPage() {
        if (document.getElementById('<%=txtGotoPage.ClientID%>').value == '' || document.getElementById('<%=txtGotoPage.ClientID%>').value == 0) {
            document.getElementById('<%=txtGotoPage.ClientID%>').value = 1;
            document.getElementById('<%=txtGotoPage.ClientID%>').focus();
            alert('Page Number cannot be empty or zero');
            return false;
        }

        return (fnValidateGotoPage());

    }



</script>

