<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_FA_TRE_ALMParameter, App_Web_ezlcepmc" enableeventvalidation="false" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <table>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="User Management" ID="lblHeading" CssClass="styleInfoLabel">
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td>
                  
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                         <td class="styleFieldLabel" align="left" width="20%" >
                                                            <asp:Label ID="Label1" runat="server" CssClass="styleReqFieldLabel" Text="Type"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" align="left" width="55%">
                                                            <asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="true" >
                                                                <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Text="Inflow" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Outflow" Value="2"></asp:ListItem>
                                                             </asp:DropDownList>
                                                        </td>
                                                       
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" align="left" width="20%"  >
                                                            <asp:Label runat="server" Text="Line Number" ID="lblUserName" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </td>
                                                        <td  class="styleFieldAlign" align="left" width="55%" >
                                                            <asp:TextBox ID="txtLineNum" runat="server" MaxLength="50"  onblur="FunTrimwhitespace(this,'User Name');"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvUserName" ValidationGroup="save" CssClass="styleMandatoryLabel"
                                                                runat="server" ControlToValidate="txtLineNum" Display="None" ErrorMessage="Enter the User Name"></asp:RequiredFieldValidator><%--<cc1:FilteredTextBoxExtender
                                                                    ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtLineNum" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                                    ValidChars=" " Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                       <td class="styleFieldLabel" align="left" width="20%"  >
                                                            <asp:Label ID="LblDesc" runat="server" CssClass="styleReqFieldLabel" Text="Description"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" align="left" width="20%" >
                                                            <asp:DropDownList ID="DropDownList2" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChange">
                                                                <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Text="Heading" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Account Line" Value="2"></asp:ListItem>
                                                                  <asp:ListItem Text="Formula" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Under Line" Value="4"></asp:ListItem>
                                                            
                                                            </asp:DropDownList>
                                                        </td>
                                               <%--          <td class="styleFieldLabel" style="width: 20%">
                                                            <asp:Label runat="server" Text="Line Number" ID="Label5" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </td>
                                                        <td colspan="2" class="styleFieldAlign">
                                                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Style="width: 20%" onblur="FunTrimwhitespace(this,'User Name');"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="save" CssClass="styleMandatoryLabel"
                                                                runat="server" ControlToValidate="txtLineNum" Display="None" ErrorMessage="Enter the User Name"></asp:RequiredFieldValidator><cc1:FilteredTextBoxExtender
                                                                    ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtLineNum" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                                    ValidChars=" " Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                        </td>--%>
                                                    </tr>
                                                    <tr>
                                                          <td class="styleFieldLabel" align="left" width="20%"  >
                                                            <asp:Label ID="LblDescValue" runat="server" CssClass="styleReqFieldLabel" Text="Description Value"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" align="left" width="20%" >
                                                            <asp:DropDownList ID="ddlDescValue" runat="server"  AutoPostBack="true">
                                                            
                                                            
                                                            </asp:DropDownList>
                                                        
                                                     
                                                            <asp:TextBox ID="txtDescValue" runat="server" MaxLength="100" ></asp:TextBox>
                                                           
                                                        
                                                        </td>
                                                   
                                                        
                                                    </tr>
                                                 
                                           
                                                    <tr>
                                                        <td class="styleFieldLabel"  align="left" width="20%" >
                                                            <asp:Label ID="lblCondition" runat="server" CssClass="styleReqFieldLabel" Text="Condition"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" align="left" width="20%" >
                                                            <asp:DropDownList ID="ddlCondition" runat="server"  AutoPostBack="false" >
                                                            <asp:ListItem Value="0" Text="1-30"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="30-60"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="60-90"></asp:ListItem>
                                                         </asp:DropDownList>
                                                        </td>
                                                        
                                                    </tr>
                                                   <tr align="center">
        <td align="center" colspan="4">
            <asp:Button runat="server" ID="btnAdd" 
                CssClass="styleSubmitButton" Text="ADD"  OnClick="btnAdd_Click" />
            <asp:Button runat="server" ID="btnClear" Text="Clear_FA" CausesValidation="false"
                CssClass="styleSubmitButton" />
            <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false"
              CssClass="styleSubmitButton" />
        </td>
            </tr>
                                       
                                        <tr width="100%">
                                                        <td class="styleFieldLabel" align="center" colspan="4">
                                                           
                                                                    <asp:GridView ID="grvALM" runat="server" Width="100%" AutoGenerateColumns="False">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="" Visible="true">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbtnALM" AutoPostBack="true" OnCheckedChanged="rbtnALM_CheckedChanged"
                                            Visible="true" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Type" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblType" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Line Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstdate" runat="server" Text='<%# Eval("Line_Number") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description Value" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDescValue1" runat="server" Text='<%# Eval("Description_Value") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Condition" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Condition") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                                              
   
                                                                        </Columns>
                                                        
                                                                    </asp:GridView>
                                                              
                                                        </td>
                                                    </tr>
     
                                              
                                          
                       
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        
        <%--</tr>--%>
        <tr>
            <td>
                <asp:ValidationSummary runat="server" ID="VSUsermanagement" HeaderText="Correct the following validation(s):"
                    CssClass="styleSummaryStyle" ShowMessageBox="false" ShowSummary="true" />
            </td>
        </tr>
        <tr class="styleFieldAlign">
            <td>
                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                <asp:CustomValidator ID="CVUsermanagement" runat="server" Display="None" ValidationGroup="save"></asp:CustomValidator>
            </td>
        </tr>
    </table>
    </td>
            </tr>

          <tr>
            <td align="center">
             
                        <br />
                        <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Text="Save"
                            OnClick="btnSave_Click" CausesValidation="true" OnClientClick="return fnCheckPageValidators('Main')"
                            ValidationGroup="Main" />
                        <asp:Button ID="Button1" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                            Text="Clear_FA" OnClientClick="return fnConfirmClear();" />
                        <asp:Button ID="Button2" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                             Text="Cancel" />
                        <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" /> --%>
                  
              
            </td>
        </tr>
        </table>
    
</asp:content>

