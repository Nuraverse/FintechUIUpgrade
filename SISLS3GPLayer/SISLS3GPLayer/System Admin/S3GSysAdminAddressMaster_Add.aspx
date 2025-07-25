<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    AutoEventWireup="true" CodeFile="S3GSysAdminAddressMaster_Add.aspx.cs" Inherits="System_Admin_S3GSysAdminAddressMaster_Add" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="../Scripts/Common.js"></script>
    <script language="javascript" type="text/javascript">
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleInfoLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px">
                        <cc1:TabContainer ID="tcAddressSetup" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                            Width="99%" ScrollBars="Auto">
                            <cc1:TabPanel runat="server" HeaderText="Name Setup" ID="tbNameSetup" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Name Setup
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label ID="lblNationality" runat="server" Text="Nationality" CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <cc1:ComboBox ID="cmbNationality" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                    Width="100px" MaxLength = "30" >
                                                </cc1:ComboBox>
                                            </td>
                                             <td class="styleFieldLabel">
                                                <asp:Label ID="lblStartDate" runat="server" Text="Effective From Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtStartDate" runat="server" Width="100px" MaxLength="80"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="None" ErrorMessage="Enter the Effective From Date"
                                                    ControlToValidate="txtStartDate" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                              <td class="styleFieldLabel">
                                                <asp:Label ID="lblEffectiveEndDate" runat="server" Text="Effective End Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtEffectiveEndDate" runat="server" Width="100px" MaxLength="80"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvEffectiveEdate" runat="server" Display="None" ErrorMessage="Enter the Effective End Date"
                                                    ControlToValidate="txtEffectiveEndDate" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                       
                                    
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Address Setup" ID="tbCorporateDetails"
                                CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Address Setup
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="100%">
                                      test
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                           
                        </cc1:TabContainer>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnPrev" runat="server" Text="<<" CssClass="styleButtonNext" CausesValidation="false"
                            OnClick="btnPrev_Click" Visible="false" />
                        <asp:Button ID="btnNext" runat="server" Text=">>" CssClass="styleButtonNext" CausesValidation="false"
                            OnClick="btnNext_Click" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="styleSubmitButton"
                            OnClick="btnSave_Click" OnClientClick="return fnCheckPageValidation();" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="styleSubmitButton"
                            OnClick="btnCancel_Click" CausesValidation="False" Visible="False" />
                        <input id="hdnIds" type="hidden" runat="server" />
                        <input id="hdnUserId" type="hidden" runat="server" value="0" />
                        <input id="hdnUserLevelId" type="hidden" runat="server" value="0" />
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td align="center">
                        <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium">
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="vsCompanyAdd" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                            ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:content>
