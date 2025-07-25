<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_FA_Tre_BucketParameter, App_Web_zogfwrp2" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function Trim(strInput) {
            var FieldValue = document.getElementById(strInput).value;
            document.getElementById(strInput).value = FieldValue.trim();
        }
    </script>  

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="tbDNC" runat="server" border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <td>
                                </td>
                            </tr>
                             <tr>
                                <td align="left" class="styleFieldLabel" width="20%">
                                    <asp:Label runat="server"  Text="Serial Number" ID="lblserialnumber"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                   <asp:TextBox ID="txtserialnumber" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 20%">
                                    <%--<asp:RequiredFieldValidator ID="rfvFinYear" runat="server" Display="None" ErrorMessage="Select the Financial Year"
                                        ControlToValidate="ddlFinYear" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="styleFieldLabel"  width="20%">
                                    <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Description"  
                                        ID="lbldesc"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="ddldesc" runat="server"   Width="205px" TabIndex="1">
                                        <asp:ListItem Value="0" Text="Days"></asp:ListItem>
                                        <asp:ListItem Value="'1" Text="Month"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="lblDDCSlNo" runat="server" Visible="False"></asp:Label>
                                    </td>
                                                                
                            </tr>
                             <tr>
                                <td align="left" class="styleFieldLabel"  width="20%">
                                    <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="From Days"  
                                        ID="Label1"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtfromdays" runat="server" Text=""></asp:TextBox>
                                    </td>
                                                                
                            </tr>
                                 <tr>
                                <td align="left" class="styleFieldLabel"  width="20%">
                                    <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="To Days"  
                                        ID="lbltodays"></asp:Label>
                                </td>
                                <td align="left" class="styleFieldAlign" style="width: 55%">
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txttodays" runat="server"  Text=""></asp:TextBox>
                                    </td>
                                                                
                            </tr>
                            
                        </table>
                    </td>
                </tr>
                 <tr align="center">
                                                <td align="center" colspan="4" width="100%" valign="top" height="30px">
                                                    <asp:Button ID="btnAddDDC" runat="server" CssClass="styleSubmitShortButton" Text="Add"
                                                        ValidationGroup="btnAddDDC" OnClick="btnAddDDC_Click" />
                                                    <asp:Button ID="btnModifyDDC" runat="server" CssClass="styleSubmitShortButton" Text="Edit"
                                                        ValidationGroup="btnModifyDDC" Enabled="False" OnClick="btnModifyDDC_Click" />
                                                    <asp:Button ID="btnClearDDC" runat="server" CausesValidation="False" CssClass="styleSubmitShortButton"
                                                        Text="Clear_FA" />
                                                </td>
                                            </tr>
                              <tr width="100%">
                                                <td class="styleFieldLabel" colspan="4" align="center">
                                                    <asp:GridView ID="grvBucketDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                      
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <ItemTemplate>
                                                                    <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBSelectDDC_CheckedChanged" 
                                                                        AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="15px" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <%-- <ItemStyle Width="6%" HorizontalAlign="Center" />--%>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Line Number" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbllinenumber" runat="server" Text='<%#Eval("line_number") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Description">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldescription" runat="server" Text='<%#Eval("description") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                              <asp:TemplateField HeaderText="Days"  HeaderStyle-Width="31%" >
                                                                      <HeaderTemplate >
                                                                    <table id="table6" runat="server" width="100%">
                                                                        <tr align="center" style="border-bottom: solid 1px #bad4ff;">
                                                                            <td colspan="2" align="center">
                                                                                Days
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="50%" align="left">
                                                                                From Days
                                                                            </td>
                                                                            <td width="50%" align="right">
                                                                                To Days
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                   <ItemTemplate>
                                                                            <table id="table7" runat="server" width="100%" >
                                                                        <tr >
                                                                            <td width="50%" style="text-align: left">
                                                                                <asp:Label ID="lblInterestDate"  runat="server" Text='<%#Eval("From_Days") %>'
                                                                                    ToolTip="Repay Date" />
                                                                            </td>                                                                         

                                                                            <td width="50%" style="text-align: right">
                                                                                <asp:Label ID="lblInterestAmount" Style="text-align: right" runat="server" Text='<%#Eval("To_Days") %>'
                                                                                    ToolTip="Repay Amount" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>        
                                                                </ItemTemplate>                                                                   
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Months"  HeaderStyle-Width="31%" >
                                                                <HeaderTemplate>
                                                                    <table id="table1" runat="server" width="100%">
                                                                        <tr align="center" style="border-bottom: solid 1px #bad4ff;">
                                                                            <td colspan="2" align="center">
                                                                                Month
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="50%" align="left">
                                                                                From Month
                                                                            </td>
                                                                            <td width="50%" align="right">
                                                                                To Month
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                            <ItemTemplate>
                                                                            <table id="table2" runat="server" width="100%" >
                                                                        <tr >
                                                                            <td width="50%" style="text-align: left">
                                                                                <asp:Label ID="Label2"  runat="server" Text='<%#Eval("From_Month") %>' ></asp:Label>
                                                                                     
                                                                            </td>                                                                         

                                                                            <td width="50%" style="text-align: right">
                                                                                <asp:Label ID="Label3" Style="text-align: right" Text='<%#Eval("To_Month") %>' runat="server"></asp:Label>
                                                                                     
                                                                            </td>
                                                                        </tr>
                                                                    </table>        
                                                                </ItemTemplate>                                                                   
                                                            </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        CausesValidation="false">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                 <tr>
            <td align="center">
             
                        <br />
                        <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Text="Save"
                            OnClick="btnSave_Click" CausesValidation="true" OnClientClick="return fnCheckPageValidators('Main')"
                            ValidationGroup="Main" />
                        <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                            Text="Clear_FA" OnClientClick="return fnConfirmClear();" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                             Text="Cancel" />
                        <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" /> --%>
                  
              
            </td>
        </tr>
            </table>
            <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:content>
