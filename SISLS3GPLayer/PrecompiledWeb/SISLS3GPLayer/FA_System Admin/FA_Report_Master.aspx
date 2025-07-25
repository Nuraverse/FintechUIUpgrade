<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FA_Report_Master, App_Web_mr11ufc2" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%" align="center" cellpadding="0" cellspacing="0">

        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <table width="100%">

                            <tr style="width: 100%">

                                <td class="stylePageHeading" colspan="2">

                                    <asp:Label ID="lblHeading" runat="server" Text=" " CssClass="styleDisplayLabel">
                                    </asp:Label>

                                </td>

                            </tr>

                            <tr style="width: 100%">

                                <td colspan="2">
                                    <asp:Label ID="lblSlNo" runat="server" Visible="false" />
                                    <asp:Label ID="lblMode" runat="server" Visible="false" />
                                </td>

                            </tr>

                            <tr style="width: 100%">

                                <td style="width: 50%">
                                    <table width="100%">
                                        <tr>
                                            <td>

                                                                 

                                                   <asp:Panel ID="pnl1nput" runat="server" GroupingText="Report Details" CssClass="stylePanel">

                                                <table width="99%">

                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblReportName" runat="server" Text="Report Name" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtReportName" runat="server" />
                                                            <asp:RequiredFieldValidator ID="RFVtxtreportName" runat="server" ControlToValidate="txtReportName"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="btnAdd"
                                                                ErrorMessage="Enter Report Name"></asp:RequiredFieldValidator>
                                                          
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblReportShortName" runat="server" Text="Short Name" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtReportshortName" runat="server" />
                                                            <asp:RequiredFieldValidator ID="RFVtxtReportShortName" runat="server" ControlToValidate="txtReportshortName"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="btnAdd"
                                                                ErrorMessage="Enter Short Name"></asp:RequiredFieldValidator>
                                                          
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblReportHeading" runat="server" Text="Report Heading Line 1" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtReportHeading" runat="server" 
                                                              />
                                                              <asp:RequiredFieldValidator ID="rfvReportHeading" runat="server" ControlToValidate="txtReportHeading"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="btnAdd"
                                                                ErrorMessage="Enter Report Heading"></asp:RequiredFieldValidator>
                                                          
                                                        </td>

                                                    </tr>


                                                        <tr>
                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblReportHeadingLine2" runat="server" Text="Report Heading Line 2" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtReportHeadingLine2" runat="server" 
                                                              />
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtReportHeadingLine2"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="btnAdd"
                                                                ErrorMessage="Enter Report Heading Line2"></asp:RequiredFieldValidator>
                                                          
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblReportType" runat="server" Text="Report Type" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlReportType" runat="server" />
                                                          
                                                          
                                                        </td>
                                                         <td class="styleFieldLabel">
                                                            <asp:Label ID="lblFrequency" runat="server" Text="Report Frequency" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlFrequency" runat="server" />
                                                          
                                                          
                                                        </td>
                                                       

                                                    </tr>

                                                        <tr>
                                                           
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblSize" runat="server" Text="Size" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlSize" runat="server" />
                                                          
                                                          
                                                        </td>
                                                        

                                                    </tr>
                                             
                                                    <tr>
                                                        <td>
                                                            <asp:HiddenField ID="hid" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>

                                                  </asp:Panel>


                                            </td>
                                        </tr>
                                    </table>
                                </td>
                           
                        </tr>

                            <tr>
                                <td align="center" width="100%" colspan="2">
                                    <asp:Button ID="btnAdd" runat="server" CssClass="styleSubmitShortButton" Text="Add" ToolTip="Add,Alt+A" AccessKey="A"
                                        ValidationGroup="btnAdd" OnClick="btnAdd_Click" />
                                       <asp:Button ID="btnModify" runat="server" CssClass="styleSubmitShortButton" Text="Edit"
                                                        ValidationGroup="Edit" Enabled="False"  ToolTip="Edit,Alt+M" AccessKey="M" />&nbsp;&nbsp;&nbsp;
                                                   
                                  
                                </td>
                            </tr>
                                    <tr>
                                <td width="100%" colspan="2">
                                    <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="False" 
                                        ShowFooter="true" Width="100%"  >
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="rdSelect" runat="server" Checked="false" AutoPostBack="true"
                                                        Text="" Style="padding-left: 7px" />
                                                    <asp:Label ID="lblMode" runat="server" Visible="false" Text=""></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="20px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sl No" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                    <asp:HiddenField ID="hdnTaxDetailsID" runat="server" Value='<%# Eval("Report_Mst_ID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Report Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReportName" runat="server" Text='<%# Bind("Report_Name") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Short Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblshortName" runat="server" Text='<%# Bind("Short_Name") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Report Heading">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHeading" runat="server" Text='<%# Bind("Heading") %>' />
                                                   
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Report Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>' />
                                                   
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Report Frequency">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFrequency" runat="server" Text='<%# Bind("Frequency") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Size">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSize" runat="server" Text='<%# Bind("Size") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                         
                                       
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                     
                            <tr align="center">
                                <td colspan="6">
                                    <asp:Button runat="server" ID="btnSave" Text="Save" ToolTip="Save the Details,Alt+S" AccessKey="S" 
                                        CssClass="styleSubmitButton" ValidationGroup="Save" OnClientClick="return fnCheckPageValidators('Save',true)" />
                                    <asp:Button runat="server" ID="btnclear" Text="Clear_FA" ToolTip="Clear_FA the Details,,Alt+L" AccessKey="L"  
                                        CssClass="styleSubmitButton" OnClientClick="return fnConfirmClear();"  />
                                    <asp:Button runat="server" ID="btncancel" Text="Exit" ToolTip="Exit the Form,,Alt+X" AccessKey="X" 
                                    OnClientClick="return fnConfirmExit();" OnClick="btnCancel_Click"  CssClass="styleSubmitButton" />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="VSbtnAdd" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                        ValidationGroup="btnAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                    <asp:ValidationSummary ID="VSbtnModify" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                        ValidationGroup="btnModify" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                </td>
                            </tr>

                            

                          



                        </table>

                        <%--</asp:Panel>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

        <%--<tr>
            <td style="display: none">
                <asp:Button runat="server" ID="btnPrintNew" BackColor="White" Height="0px" CausesValidation="false"
                    OnClick="btnPrint_Click" />
            </td>
        </tr>--%>
    </table>

</asp:Content>


