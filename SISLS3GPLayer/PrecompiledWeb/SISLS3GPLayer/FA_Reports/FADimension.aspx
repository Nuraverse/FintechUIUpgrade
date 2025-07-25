<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FADimension, App_Web_ygb51gin" title="Untitled Page" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                        <%--Row for Activity & Location --%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                            </td>
                            <td class="styleFieldAlign" >
                                <%--<asp:DropDownList ID="ddlActivity" runat="server" ToolTip="Activity" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged" />--%>
                               <cc1:ComboBox ID="ddlActivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                   AutoPostBack="true" Width="143px" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged"
                                    AppendDataBoundItems="true" CaseSensitive="false" 
                                    AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ControlToValidate="ddlActivity"
                                    InitialValue="--Select--" ErrorMessage="Select Activity" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblLocation" Text="Location" />
                            </td>
                            <td class="styleFieldAlign" >
                               <%-- <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" Width="170px"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" />--%>
                                    <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                     AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                     Width="143px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                    InitialValue="--Select--" ErrorMessage="Select Location" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                        </tr>
                        
                        <%--Row for Dim Type & Detailed Checkbox --%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblDimType" CssClass="styleReqFieldLabel" Text="Dimension Type"></asp:Label>
                            </td>
                            <td class="styleFieldAlign" >
                               <%-- <asp:DropDownList ID="ddlDimType" runat="server" ToolTip="Dimension Type" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlDimType_SelectedIndexChanged" />--%>
                                <cc1:ComboBox ID="ddlDimType" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                     AutoPostBack="true" OnSelectedIndexChanged="ddlDimType_SelectedIndexChanged"
                                     Width="143px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                
                                <asp:RequiredFieldValidator ID="rfvDimType" runat="server" ControlToValidate="ddlDimType"
                                    InitialValue="--Select--" ErrorMessage="Select Dimension Type" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblDetailed" Text="Detailed" />
                            </td>
                            <td class="styleFieldAlign" >
                                <asp:CheckBox ID="chkDetailed" runat= "server" ToolTip ="Detailed" />
                            </td>
                        </tr>
                        
                        <%--Row for Dimension From and Dimension To and All --%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblDimFrom" CssClass="styleReqFieldLabel" Text="From Dimension"></asp:Label>
                            </td>
                            <td class="styleFieldAlign" >
                                <%--  <asp:DropDownList ID="ddlAccountFrom" runat="server" ToolTip="Account From" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlAccountFrom_SelectedIndexChanged" />
                                --%>
                                <cc1:ComboBox ID="ddlDimFrom" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDimFrom_SelectedIndexChanged"
                                    Width="143px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvDimFrom" runat="server" ControlToValidate="ddlDimFrom"
                                    InitialValue="--Select--" ErrorMessage="Select From Dimension" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblDimTo" CssClass="styleReqFieldLabel" Text="To Dimension"></asp:Label>
                            </td>
                            <td class="styleFieldAlign" >
                                <%--  <asp:DropDownList ID="ddlAccountTo" runat="server" ToolTip="Account To" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlAccountTo_SelectedIndexChanged" />
                                --%>
                                <cc1:ComboBox ID="ddlDimTo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDimTo_SelectedIndexChanged"
                                    Width="143px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvDimTo" runat="server" ControlToValidate="ddlDimTo"
                                    InitialValue="--Select--" ErrorMessage="Select To Dimension" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                          
                        </tr>
                        <%--Row For Date Range--%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblFromDate" Text="From Date" />
                            </td>
                            <td class="styleFieldAlign" >
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtFromDate" Width="160px" 
                                onmouseover="txt_MouseoverTooltip(this)" AutoPostBack ="true" OnTextChanged ="txtFromDate_OnTextChanged"/>
                                <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtFromDate"
                                    ErrorMessage="Select From Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblToDate" Text="To Date" />
                            </td>
                            <td class="styleFieldAlign" >
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtToDate" Width="160px"
                              onmouseover="txt_MouseoverTooltip(this)"  AutoPostBack ="true" OnTextChanged ="txtToDate_OnTextChanged" />
                                <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtToDate"
                                    ErrorMessage="Select To Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                            
                        </tr>
                        <%--Row For setting Visibity to Location,SL Code,Remarks--%>
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
                <asp:Button ID="btnGo" runat="server" ValidationGroup="vgGo" Text="Go" CssClass="styleSubmitButton"
                   ToolTip ="Go"  OnClick="btnGo_Click" />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                  ToolTip ="Clear_FA" Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                   
                    <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" 
                    ToolTip ="Cancel" CssClass="styleSubmitButton"  OnClick="btnCancel_Click" />
           
            </td>
        </tr>
        <%--For Showing Grid--%>
        <tr>
            <td>
                <asp:Panel ID="pnlDimension" runat="server" Visible="false" GroupingText="Dimension Details"
                    Width="100%" CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td width="50%" align="left">
                                            <asp:Label ID="lblLocationG" runat="server" Text="Location" />
                                        </td>
                                        <%--<td>
                                            <asp:TextBox ID="txtLocationG" runat="server" Text="" />
                                        </td>--%>
                                        <td width="50%" align="right">
                                            <asp:Label ID="lblUserName" Font-Size="Small" runat="server" Text="User Name" />
                                        </td>
                                        <%-- <td>
                                            <asp:TextBox ID="txtUserName" runat="server" Text="" />
                                           
                                        </td>--%>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <div style="height: 250px; overflow: auto">
                                    <asp:Panel ID="pnlScroll" runat="server" GroupingText="" Width="100%" CssClass="stylePanel">
                                        <asp:GridView ID="gvDimension" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                            RowStyle-Width="0" OnRowDataBound="gvDimension_RowDataBound" Width="100%">
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Location--%>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <%--Dimension--%>
                                                <asp:TemplateField HeaderText="Dimension">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDimension" runat="server" Text='<%#Eval("Dim_Desc") %>' ToolTip="Dimension" />
                                                        <asp:HiddenField ID="hdn_DimCode" runat ="server" Value ='<%#Eval("Dim_Code") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--Doc Date --%>
                                                <asp:TemplateField HeaderText="Document Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--Doc No --%>
                                                <asp:TemplateField HeaderText="Document Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--GL COde --%>
                                                <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGLDate" runat="server" Text='<%#Eval("GL_Desc") %>' ToolTip="Value Date" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 
                                                <%--SL Code --%>
                                                <asp:TemplateField HeaderText="Sub Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSLDesc" runat="server" Text='<%#Eval("SL_Desc") %>' ToolTip="Description" />
                                                        <%--<asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                        <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />--%>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                               
                                                <%--Debit--%>
                                                <asp:TemplateField HeaderText="Debit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--Credit--%>
                                                <asp:TemplateField HeaderText="Credit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                               
                                               
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <asp:HiddenField ID="hdn_FTDate" runat ="server" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="btnPrint" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                   ToolTip ="Print"  Visible="false" Text="Print" OnClick="btnPrint_Click" />
                <asp:Button ID="btnEmail" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    ToolTip ="Email" Visible="false" Text="Email" OnClick="btnEmail_Click" />
                <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsDimension" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />--%>
                <asp:CustomValidator ID="cvDimension" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
</asp:Content>

