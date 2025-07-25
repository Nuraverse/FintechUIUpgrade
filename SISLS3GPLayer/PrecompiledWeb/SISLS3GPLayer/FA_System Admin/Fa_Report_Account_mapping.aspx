<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_Fa_Report_Account_mapping, App_Web_tfexpijv" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function ChkToamountValidate(txtFrm, txtTo) {
            var frmamt = 'ctl00_ContentPlaceHolder1_' + txtFrm;
            var toamt = 'ctl00_ContentPlaceHolder1_' + txtTo;
            var txtfrmamt = document.getElementById(frmamt).value;
            var txttoamt = document.getElementById(toamt).value;
            if (txtfrmamt != "") {
                if (parseFloat(txttoamt) < parseFloat(txtfrmamt)) {
                    document.getElementById(toamt).value = "";
                    alert("ToAmount Should Be Greater Than FromAmount");
                    document.getElementById(toamt).focus();
                }
                else
                    return true;
            }
            else {
                document.getElementById(toamt).value = "";
                alert("Shoud Be Enter FromAmount Before Enter ToAmount");
                document.getElementById(frmamt).focus();
            }
        }
        

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="stylePageHeading">
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td class="styleFieldLabel" width="25%">
                                    <asp:Label runat="server" Text="Short Name" ID="lblShortName" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlshortName" runat="server" Width="196px" AutoPostBack="True">
                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                
                            </tr>
                  
                            <tr>
                                <td class="styleFieldLabel" width="25%">
                                    <asp:Label ID="Label1" runat="server" Text="Active"></asp:Label>&nbsp;
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:CheckBox ID="ChkActive" runat="server" Checked="True" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" width="100%">
                                    <asp:Panel ID="panDateFormat" GroupingText="Account Mapping" runat="server"
                                        Width="100%" CssClass="stylePanel">
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <br />
                                                    <asp:GridView ID="grvAuthorizationrulecardDetail" ShowFooter="true" AutoGenerateColumns="false"
                                                        runat="server"  Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                    <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                             <asp:TemplateField HeaderText="Type">
                                                                <ItemTemplate>
                                                                    
                                                                    <asp:Label ID="lblTypeID" runat="server" Text='<%# Bind("Type_ID")%>'
                                                                        Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type")%>'
                                                                       ></asp:Label>
                                                                  
                                                                </ItemTemplate>
                                                                <ItemStyle  HorizontalAlign="Center" />
                                                                <FooterTemplate>
                                                                   <asp:DropDownList ID="ddlType" runat="server">
                                                                       <asp:ListItem Text="T" Value="1"></asp:ListItem>
                                                                       <asp:ListItem Text="M" Value="2"></asp:ListItem>
                                                                       <asp:ListItem Text="D" Value="3"></asp:ListItem>
                                                                   </asp:DropDownList>
                                                                   
                                                                </FooterTemplate>
                                                                <FooterStyle  HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Report Line Name">
                                                                <ItemTemplate>
                                                                   
                                                                    <asp:Label ID="lblReportline" runat="server" Text='<%# Bind("Report_Line")%>'
                                                                        ></asp:Label>
                                                                    
                                                                </ItemTemplate>
                                                                <ItemStyle Width="30%" HorizontalAlign="Center" />
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtReportLine" ToolTip="Report Line" runat="server" 
                                                                        ></asp:TextBox>
                                                                    
                                                                </FooterTemplate>
                                                                <FooterStyle  HorizontalAlign="Center" />
                                                            </asp:TemplateField>

                                                                   <asp:TemplateField HeaderText="Description">
                                                                <ItemTemplate>
                                                                   
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description")%>'
                                                                        ></asp:Label>
                                                                    
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtDescription" ToolTip="Description" runat="server" 
                                                                        ></asp:TextBox>
                                                                    
                                                                </FooterTemplate>
                                                                <FooterStyle  HorizontalAlign="Center" />
                                                            </asp:TemplateField>

                                                              <asp:TemplateField HeaderText="Label">
                                                                <ItemTemplate>
                                                                   
                                                                    <asp:Label ID="lbllabel" runat="server" Text='<%# Bind("Label")%>'
                                                                        ></asp:Label>
                                                                    
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtLabel" ToolTip="Label" runat="server" 
                                                                        ></asp:TextBox>
                                                                    
                                                                </FooterTemplate>
                                                                <FooterStyle  HorizontalAlign="Center" />
                                                            </asp:TemplateField>

                                                               <asp:TemplateField HeaderText="Add/Subtract">
                                                                <ItemTemplate>
                                                                    
                                                                    <asp:Label ID="lbladdID" runat="server" Text='<%# Bind("add_ID")%>'
                                                                        Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbladd" runat="server" Text='<%# Bind("add")%>'
                                                                       ></asp:Label>
                                                                  
                                                                </ItemTemplate>
                                                                <ItemStyle  HorizontalAlign="Center" />
                                                                <FooterTemplate>
                                                                   <asp:DropDownList ID="ddladd" runat="server">
                                                                       <asp:ListItem Text="Add" Value="1"></asp:ListItem>
                                                                       <asp:ListItem Text="Subtract" Value="2"></asp:ListItem>
                                                                       <asp:ListItem Text="No operation" Value="3"></asp:ListItem>
                                                                   </asp:DropDownList>
                                                                   
                                                                </FooterTemplate>
                                                                <FooterStyle  HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                  
                                                           
                                                            <asp:TemplateField HeaderText="Account Code">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="btnIApprover" CssClass="styleSubmitShortButton" runat="server" Text="Account Code"
                                                                        />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                <FooterTemplate>
                                                                    <asp:Button ID="btnFApprover" CssClass="styleSubmitShortButton" runat="server" Text="Acc. Code"
                                                                        OnClick="btnFApprover_Click"  />
                                                                </FooterTemplate>
                                                                <FooterStyle  HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnRemove" Text="Remove" ToolTip="Remove" CommandName="Delete" runat="server"
                                                                        CausesValidation="false" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                <FooterTemplate>
                                                                    <asp:Button ID="btnDetails" Text="Add" ToolTip="Add"
                                                                        CommandName="AddNew" runat="server" CssClass="styleGridShortButton" CausesValidation="false" />
                                                                </FooterTemplate>
                                                                <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:Button ID="btnReset" Visible="false" CssClass="styleSubmitButton" Text="Reset"
                                                        runat="server" CausesValidation="false"  />&nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <br />
                                    <asp:Button runat="server" ID="btnSave" ValidationGroup="main" ToolTip="Save,Alt+S" OnClientClick="return fnCheckPageValidators('main');"
                                        CssClass="styleSubmitButton" Text="Save"  AccessKey="S"  />
                                    <asp:Button ID="btnClear" class="styleSubmitButton" runat="server" ToolTip="Clear_FA,Alt+L" Text="Clear_FA"
                                        OnClientClick="return fnConfirmClear();" CausesValidation="false" AccessKey="L" />
                                    <asp:Button runat="server" ID="btnCancel" Text="Exit" ToolTip="cancel,Alt+x" CausesValidation="false"
                                        CssClass="styleSubmitButton" OnClick="btnCancel_Click" AccessKey="X" />
                                </td>
                            </tr>
                            <tr class="styleButtonArea">
                                <td colspan="4">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <tr>
                            <td>
                                <asp:ValidationSummary ID="AuthorizationRulecardAdd" runat="server" ValidationGroup="main" ShowSummary="true"
                                    HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                                <input id="hdnGrvCnt" runat="server" value="0" type="hidden" />
                            </td>
                        </tr>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlApprover" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="PnlApprover" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="850px">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div id="divTransaction" class="container" runat="server" style="height: 200px; overflow: scroll">
                                            <asp:GridView ID="grvApprover" runat="server" AutoGenerateColumns="false" Height="50px"
                                                
                                                ShowFooter="true">
                                                <Columns>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" Text='<% #Bind("SNo")%>' Visible="false" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sequence Number" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSequenceNumber" ToolTip="Sequence Number" Text='<% #Bind("SequenceNumber")%>'
                                                                runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Approval Entity" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApprovalEntity" Visible="false" runat="server" Text='<% #Bind("ApprovEntity") %>'>
                                                            </asp:Label>
                                                            <asp:DropDownList ID="ddlApprovalEntity" ToolTip="Approval Entity" runat="server"
                                                                Visible="false">
                                                                <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Text="Designation" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="User Level" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="User Name" Value="3"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Account">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblaccount" runat="server" Text='<% #Bind("Account_Code")%>'>
                                                            </asp:Label>
                                                            <asp:Label ID="lblLocationID" runat="server" Visible="false" Text='<% #Bind("Account_code_ID")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:DropDownList ID="ddlaccount" AutoPostBack="true" 
                                                                ToolTip="Account" runat="server" Style="width: 340px">
                                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                            </asp:DropDownList>

                                                          
                                                        </FooterTemplate>
                                                        <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                        <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SL Account">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApprovalPerson" runat="server" Text='<% #Bind("SubGl_Code")%>'>
                                                            </asp:Label>
                                                            <asp:Label ID="ApprovPersonID" runat="server" Visible="false" Text='<% #Bind("SubGl_ID")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:DropDownList ID="ddlApprovPerson" ToolTip="Approval Authority" runat="server"
                                                                Style="width: 340px">
                                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                            </asp:DropDownList>
                                                           
                                                        </FooterTemplate>
                                                        <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                        <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnDelete" Text="Delete" CommandName="Delete" runat="server"
                                                                CausesValidation="false" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        <FooterTemplate>
                                                            <asp:Button ID="btnDetails" Text="Add" ValidationGroup="PopUpAdd" CommandName="Add"
                                                                runat="server" CssClass="styleGridShortButton" CausesValidation="false" OnClick="btnDetails_Click"
                                                                OnClientClick="return fnCheckPageValidators('PopUpAdd',false);" />
                                                        </FooterTemplate>
                                                        <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                        <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnDEVModalAdd" runat="server" Text="Save" ToolTip="Save" class="styleSubmitButton"
                                            OnClick="btnDEVModalAdd_Click" />
                                        <asp:Button ID="btnDEVModalCancel" runat="server" Text="Close" OnClick="btnDEVModalCancel_Click"
                                            ToolTip="Close" class="styleSubmitButton" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                            HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />

</asp:Content>

