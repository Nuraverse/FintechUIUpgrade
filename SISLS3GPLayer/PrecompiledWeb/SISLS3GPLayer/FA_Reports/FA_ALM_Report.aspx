<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_ALM_Report, App_Web_upeq32zu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                   <table width="100%">
                      <%--Row For Date Range--%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblFromDate" Text="From Date" />
                            </td>
                            <td class="styleFieldAlign"  align="left">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtFromDate"  
                                 AutoPostBack="true"    />
                                <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                    ErrorMessage="Select From Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblToDate" Text="To Date" />
                            </td>
                            <td class="styleFieldAlign"  align="left">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtToDate" 
                                 AutoPostBack="true" />
                                <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" 
                                    PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate"
                                    ErrorMessage="Select To Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
             
                        </tr>
                        <tr>
                 
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblBreakupfreq" CssClass="styleReqFieldLabel" Text="Breakup Frequency"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <%--  <asp:DropDownList ID="ddlAccountTo" runat="server" ToolTip="Account To" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlAccountTo_SelectedIndexChanged" />
                                --%>
                                <cc1:ComboBox ID="cmbBreakupfreq" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" 
                                     AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="cmbBreakupfreq"
                                    InitialValue="--Select--" ErrorMessage="Select Breakup Frequency" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnGo" runat="server" ValidationGroup="vgGo" Text="Go" CssClass="styleSubmitButton" OnClick="btnGo_Click"  />  &nbsp;
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False" 
                    Text="Clear_FA" OnClientClick="return fnConfirmClear();" />
                    &nbsp;
                    <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" 
                    CssClass="styleSubmitButton" ToolTip="Cancel"  />
            </td>
        </tr>
            <tr>
            <td>
                <asp:Panel ID="pnlalm" runat="server" Visible="false" GroupingText="Asset"
                    Width="100%" CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <div style="height: 250px; overflow: auto">
                                   
                                        <asp:GridView ID="gvalmreport" runat="server" AutoGenerateColumns="True" ShowFooter="false"
                                            RowStyle-Width="0" Width="100%" OnRowDataBound="gvalmreport_RowDataBound">
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Location--%>
                                               <%-- <asp:TemplateField HeaderText="GL_Code" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgl_code" runat="server" Text='<%#Eval("GL_Code") %>' ToolTip="GL Code" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                  <%--Dimension--%>
                                                <%--<asp:TemplateField HeaderText="GL_Desc">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgl_desc" runat="server" Text='<%#Eval("GL_Desc") %>' ToolTip="GL Description" />
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                           
                                            </Columns>
                                        </asp:GridView>
                              
                                   
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
          <tr>
            <td>
                <asp:Panel ID="pnlliability" runat="server" Visible="false" GroupingText="Liability"
                    Width="100%" CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <div style="height: 250px; overflow: auto">
                                   
                                        <asp:GridView ID="grvliability" runat="server" AutoGenerateColumns="True" ShowFooter="false"
                                            RowStyle-Width="0" Width="100%">
                                            <Columns>
                                            
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Location--%>
                                               <%-- <asp:TemplateField HeaderText="GL_Code" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgl_code" runat="server" Text='<%#Eval("GL_Code") %>' ToolTip="GL Code" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                  <%--Dimension--%>
                                                <%--<asp:TemplateField HeaderText="GL_Desc">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgl_desc" runat="server" Text='<%#Eval("GL_Desc") %>' ToolTip="GL Description" />
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                           
                                            </Columns>
                                        </asp:GridView>
                              
                                   
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <%--For Showing Grid--%>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="btnPrint" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Print"  />
                <asp:Button ID="btnEmail" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Email"  />
                     <asp:Button ID="btnexcel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Excel" OnClick="FunExcelExport"  />
                <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsjournal" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />--%>
                <asp:CustomValidator ID="cvjournal" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
</asp:Content>


