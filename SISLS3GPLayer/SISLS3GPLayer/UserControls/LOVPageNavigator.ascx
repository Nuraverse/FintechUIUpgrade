<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LOVPageNavigator.ascx.cs"
    Inherits="UserControls_LOVPageNavigator" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div class="styleMainTable col-md-12">
    <div class="row" visible="false" runat="server" id="trMessage">
        <%--class="styleRecordCount"--%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 styleRecordCount">
            <asp:Label runat="server" ID="lblMessage" Text="No Records Found" Font-Size="Medium"
                class="styleMandatoryLabel"></asp:Label>
        </div>
    </div>
    <div class="row" runat="server" id="trControl">
        <div class="col">
            <div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                        <div class="md-input">
                            <asp:Label runat="server" CssClass="stylePagingFieldLabel" ID="lblTotalRecords"></asp:Label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                        <div class="md-input">
                           

                                <asp:ImageButton ID="btnPrevious" runat="server" Enabled="true" CommandName="Prev"
                                    OnCommand="Navigation_Link" ImageUrl="../Images/Prev.gif" CausesValidation="false" />


                                <asp:Label runat="server" Text="1" CssClass="stylePagingRecFieldLabel" ID="lblCurrentPage"></asp:Label><span
                                    class="stylePagingRecFieldLabel"> / </span>
                                <asp:Label runat="server" Text="1" CssClass="stylePagingRecFieldLabel" ID="lblTotalPages"></asp:Label>

                                <asp:ImageButton ID="btnNext" runat="server" Enabled="true" CommandName="Next" OnCommand="Navigation_Link"
                                    ImageUrl="../Images/Next.gif" CausesValidation="false" />
                           
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                        <div class="md-input">
                            <asp:TextBox runat="server" ID="txtGotoPage" AutoPostBack="true" CssClass="stylePagingTextBox"
                                MaxLength="3" onblur="return fnValidateEmptyGotoPage();" onpaste="return false;" OnTextChanged="btnGO_Click"
                                Width="40px"></asp:TextBox>&nbsp;
                               <asp:Label runat="server" Text="Page Number" CssClass="stylePagingFieldLabel" ID="lblPageNo"></asp:Label>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col" style="display: none;">
            <div>
                <div class="row">
                    <div class="col">
                        <asp:TextBox runat="server" CssClass="stylePagingTextBox" Width="40px" MaxLength="3" Text="10" Style="display: none;"
                            OnTextChanged="btnSize_Click" onpaste="return false;" AutoPostBack="true" onblur="return fnValidateEmpty();"
                            ID="txtPageSize"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Label runat="server" Text="Page Size" CssClass="stylePagingFieldLabel" ID="lblPageSize" Style="display: none;"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" runat="server" style="width: 1px;" id="hdnTotRec" />
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
            alert('Go to page cannot be zero');
            document.getElementById('<%=txtGotoPage.ClientID%>').value = 1;
                return false;
            }
            if (parseInt(iTotPage) < parseInt(iGotoPage)) {
                alert('Go to page cannot be greater than total no of pages');
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
                alert('Page size cannot be zero');
                document.getElementById('<%=txtPageSize.ClientID%>').value = 100;
            return false;
        }

            // user can enter only page size of 1 - 100
        if (parseInt(iPageSize) > 100) {
            alert('Page size cannot be greater than 100');
            document.getElementById('<%=txtPageSize.ClientID%>').value = 100;
        return true;
    }
    return true;
}
function fnValidateEmpty() {
    if (document.getElementById('<%=txtPageSize.ClientID%>').value == '' || document.getElementById('<%=txtPageSize.ClientID%>').value == 0) {
            document.getElementById('<%=txtPageSize.ClientID%>').value = 1;
            document.getElementById('<%=txtPageSize.ClientID%>').focus();
            alert('Page size cannot be empty or zero');
            return false;
        }
        return (fnValidatePage());
    }
    function fnValidateEmptyGotoPage() {
        if (document.getElementById('<%=txtGotoPage.ClientID%>').value == '' || document.getElementById('<%=txtGotoPage.ClientID%>').value == 0) {
        document.getElementById('<%=txtGotoPage.ClientID%>').value = 1;
        document.getElementById('<%=txtGotoPage.ClientID%>').focus();
        alert('Go to page cannot be empty or zero');
        return false;
    }
    return (fnValidateGotoPage());
}
</script>
