<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FA_Sys_OpeningBalance, App_Web_mr11ufc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="upd1" runat="server">
        <ContentTemplate>
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
                        <%--Row for Location and Date --%>
                        <tr>
                          <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblLocation" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                               <%-- <asp:DropDownList ID="ddlFunder" runat="server" ToolTip="Funder" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlFunder_SelectedIndexChanged" />
                               --%>
                                <cc1:ComboBox ID="ddllocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" 
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                
                                <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                               
                            </td>
                                <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblactivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                               <%-- <asp:DropDownList ID="ddlFunder" runat="server" ToolTip="Funder" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlFunder_SelectedIndexChanged" />
                               --%>
                                <cc1:ComboBox ID="ddlactivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" 
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                
                                <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                               
                            </td>
                            
                            
                        </tr>
                        <%--Row For Funder--%>
                        <tr>

                              <td  class="styleFieldLabel" >
                            <asp:Label runat="server" Text="Account Code" ID="lblaccount" CssClass="styleDisplayLabel" />
                        </td>
                        <td class="styleFieldAlign"  align="left">
                            <cc1:ComboBox ID="ddlglcode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlglcode_SelectedIndexChanged" 
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                          
                        </td> 
                             <td  class="styleFieldLabel">
                            <asp:Label runat="server" Text="Sub Account Code" ID="lblsubaccount" CssClass="styleDisplayLabel" />
                        </td>
                        <td  class="styleFieldAlign"  align="left">
                               <cc1:ComboBox ID="ddlslcode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                     
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                        </td>   
                        </tr>
                        <tr>

                              <td  class="styleFieldLabel" >
                            <asp:Label runat="server" Text="Debit" ID="lbldebit" Visible="false" CssClass="styleDisplayLabel" />
                        </td>
                        <td  class="styleFieldAlign"  align="left">
                            <asp:TextBox ID="txtdebit" Visible="false"  onmouseover="txt_MouseoverTooltip(this)"  runat="server"  
                                ></asp:TextBox>
                               
                          
                        </td> 
                             <td  class="styleFieldLabel" >
                            <asp:Label runat="server" Text="Credit" Visible="false" ID="lblcredit" CssClass="styleDisplayLabel" />
                        </td>
                        <td class="styleFieldAlign"  align="left">
                            <asp:TextBox ID="txtcredit" Visible="false" onmouseover="txt_MouseoverTooltip(this)"  runat="server"  
                                AutoPostBack="True" ></asp:TextBox>
                              <asp:Button ID="btnupdate" Text="Update" Visible="false" runat="server" OnClick="btnupdate_Click" /> 
                          
                        </td>   
                        </tr>
                        <tr>
                             <td class="styleFieldLabel" width="15%">
                                <asp:Label runat="server" ID="lbldisplLocation" Text="Location" />
                            </td>
                            <td class="styleFieldLabel"  width="10%"    >
                                <asp:CheckBox ID="chkLocation" runat="server"  AutoPostBack="true"/>
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
                <asp:Button ID="btnGo" runat="server" Text="Go" ValidationGroup="vgGo" OnClick="btnGo_Click" CssClass="styleSubmitButton"
                    />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"  />
                     <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" 
                    CssClass="styleSubmitButton" ToolTip="Cancel" />
            </td>
        </tr>
     <tr>
  <td>
         <asp:Panel ID="pnlDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Opening Balance">
            <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display:none" >
                    <table width="100%">
                    <tr>
                    <td>
                        <asp:GridView ID="grvtransaction" runat="server" AutoGenerateColumns="False"  BorderWidth="2"
                            CssClass="styleInfoLabel"    ShowFooter="true" ShowHeader="true" Width="100%">
                            <Columns>
                             <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="SI_No" runat="server" Text='<%# Bind("SINo") %>' ToolTip="Cashflow Type" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbllocationid" runat="server"  Text='<%# Bind("Location_id") %>' ToolTip="Location Id"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lbllocation" runat="server" Text='<%# Bind("location") %>' ToolTip="Location"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="GL Code" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblglcode" runat="server" Text='<%# Bind("GL_Code") %>' ToolTip="Gl Code"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgldesc" runat="server" Text='<%# Bind("gl_desc") %>' ToolTip="Account Description"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SL Code" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblslcode" runat="server" Text='<%# Bind("SL_Code") %>' ToolTip="SL Code"></asp:Label>
                                    </ItemTemplate>
                                    
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Sub Account">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsldesc" runat="server" Text='<%# Bind("sl_desc") %>' ToolTip="Sub Account"></asp:Label>
                                    </ItemTemplate>
                                    
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Debit">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDebit" runat="server" Text='<%# Bind("Debit") %>' ToolTip="Debit"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbldebittotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Credit">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcredit" runat="server" Text='<%# Bind("credit") %>' ToolTip="Debit"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblcredittotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right"  />
                                </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Select">
                                    <ItemTemplate>
                                       <asp:CheckBox ID="chkselect" runat="server" AutoPostBack="true" OnCheckedChanged="chkselect_OnCheckedChanged"/>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>
                                
                             
                            </Columns>
                          </asp:GridView>
                         </td>
                         </tr>
                          <tr>
                           <td>
                                                    <asp:Label ID="lblSlNo" runat="server" Visible="False"></asp:Label>
                                                   
                                                </td>
                          </tr>
                         </table>
                        </div>
             </asp:Panel>
             </td>
     </tr>
       <tr>
            <td align="center">
                <br />
                <asp:Button ID="btnsave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="True" Text="Save" OnClick="btnSave_Click"/>
                
                <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsopening" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="cvDealInflow" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

