<%@ Control Language="C#" AutoEventWireup="true" CodeFile="S3GCommonLOV.ascx.cs"
    Inherits="UserControls_S3GCommonLOV" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/LOVPageNavigator.ascx" %>
<div>
    <div class="row">
        <div class="col">
            <asp:TextBox ID="txtName" runat="server" ReadOnly="true"></asp:TextBox><asp:Button
                ID="btnGetLOV" runat="server" Text="..." CausesValidation="true" OnClick="btnGetLOV_Click" />
            <asp:HiddenField
                ID="hdnID" runat="server" Visible="false" />
            <asp:HiddenField
                ID="hdnShow" runat="server" />
        </div>
    </div>
</div>
<div>
    <div class="row">
        <div class="col">
            <div style="display: none; width: auto; min-width: 40%; max-width: 100%;">
                <asp:Panel ID="pnlLoadLOV" GroupingText="" runat="server" BackColor="White" BorderStyle="Solid"
                    Style="display: none; width: auto; min-width: 40%; max-width: 86%;">
                    <asp:UpdatePanel ID="upLOV" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div>
                                <div class="row">
                                    <div class="col">
                                        <asp:HiddenField ID="hdnQuery" runat="server" />
                                        <input type="hidden" id="hdnSearch" runat="server" />
                                        <input type="hidden" id="hdnOrderBy" runat="server" />
                                        <input type="hidden" id="hdnSortDirection" runat="server" />
                                        <input type="hidden" id="hdnSortExpression" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <%--OnRowDataBound="gvList_RowDataBound" --%>
                                        <div style="width: 100%">
                                            <asp:GridView ID="gvList" Width="100%" runat="server" AutoGenerateColumns="false"
                                                OnRowCommand="gvList_RowCommand" HeaderStyle-CssClass="styleGridHeader" ShowHeader="true">
                                                <Columns>
                                                    <%--    <asp:CommandField ShowSelectButton="True" Visible="false" />--%>
                                                </Columns>
                                                <SelectedRowStyle BackColor="AliceBlue" />
                                                <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:GridView>
                                            <uc1:PageNavigator ID="ucLOVPageNavigater" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <%--   <Triggers>
                            <asp:PostBackTrigger ControlID="gvList" />
                            <asp:PostBackTrigger ControlID="ucLOVPageNavigater" />
                        </Triggers>--%>
                    </asp:UpdatePanel>
                    <div align="center">
                        <div class="row">
                            <div class="col" align="center">
                                <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="styleSubmitShortButton" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</div>
<div style="height: 10px; width: 10px">
    <div class="row">
        <div class="col">
            <asp:Button runat="server" ID="btnNODdf" CssClass="styleSubmitButton" Text="Ok" Style="display: none" />
            <cc1:ModalPopupExtender ID="ucMPE" runat="server" TargetControlID="btnNODdf" PopupControlID="pnlLoadLOV"
                BackgroundCssClass="styleModalBackground" CancelControlID="btnClose" />
        </div>
    </div>
</div>

<%--</ContentTemplate>
</asp:UpdatePanel>--%>