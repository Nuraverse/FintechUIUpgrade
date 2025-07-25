<%@ page title="S3G - Tax Guide Master" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GSysAdminTaxGuide_Add, App_Web_vcipatnp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Tax Guide Master - Create" ID="lblHeading" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" Width="100%" GroupingText="Tax Guide Master">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Tax Code" ID="lblTaxCode">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:TextBox ID="txtTaxCode" Enabled="false" runat="server" Width="60%"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Eligible %" ID="lblEligible" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:TextBox ID="txtEligible" MaxLength="6" runat="server" Width="20%" Style="text-align: right"
                                            TabIndex="7"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEligible" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="txtEligible" ErrorMessage="Enter Eligible %" Display="None">
                                        </asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvEligible" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="txtEligible" Type="Double" MaximumValue="100" ErrorMessage="Eligible % should not exceed 100.00%"
                                            Display="None">
                                        </asp:RangeValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtEligible"
                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Tax Type" ID="lblTaxType" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:DropDownList ID="ddlTaxType" AutoPostBack="true" OnSelectedIndexChanged="ddlTaxType_OnSelectedIndexChanged"
                                            onchange="fnDisableControls();" runat="server" TabIndex="1" Width="80%">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvTaxType" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlTaxType" InitialValue="0" ErrorMessage="Select Tax Type"
                                            Display="None">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Recovery" ID="lblRecovery" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:DropDownList ID="ddlRecovery" runat="server" Width="80%" TabIndex="8">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvRecovery" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlRecovery" InitialValue="0" ErrorMessage="Select Recovery"
                                            Display="None">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" ControlToCompare="ddlRemittance" runat="server"
                                            ControlToValidate="ddlRecovery" Display="None" Operator="Equal" ErrorMessage="Recovery and Remittance should be same">
                                        </asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" Width="80%" TabIndex="2"
                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvLOB" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlLOB" InitialValue="0" ErrorMessage="Select Line of Business"
                                            Display="None">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Remittance" ID="lblRemittance" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:DropDownList ID="ddlRemittance" runat="server" Width="80%" TabIndex="9">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvRemittance" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlRemittance" InitialValue="0" ErrorMessage="Select Remittance"
                                            Display="None">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Location" ID="lblBranch" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:DropDownList ID="ddlBranch" Width="80%" runat="server" TabIndex="3" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvBranch" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlBranch" InitialValue="0" ErrorMessage="Select Location"
                                            Display="None">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Effective From" ID="lblEffFrom" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:TextBox ID="txtEffFrom" runat="server" Width="68%" TabIndex="10"></asp:TextBox>
                                        <asp:Image ID="imgEffFrom" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                        <asp:RequiredFieldValidator ID="rfvEffFrom" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="txtEffFrom" ErrorMessage="Enter Effective From" Display="None">
                                        </asp:RequiredFieldValidator>
                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtEffFrom"
                                            PopupButtonID="imgEffFrom" ID="CalendarExtender1" Enabled="True">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Rate %" ID="lblRate" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:TextBox ID="txtRate" MaxLength="6" runat="server" Width="20%" Style="text-align: right"
                                            TabIndex="4"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvRate" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="txtRate" ErrorMessage="Enter Rate %" Display="None">
                                        </asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvRate" CssClass="styleMandatoryLabel" runat="server" ControlToValidate="txtRate"
                                            Type="Double" MaximumValue="99.99" ErrorMessage="Rate % should not exceed 99.99%"
                                            Display="None">
                                        </asp:RangeValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRate"
                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Tax" ID="lblTax" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:TextBox ID="txtTax" onblur="fnValidateTax();" MaxLength="6" runat="server" Width="20%"
                                            TabIndex="11" Style="text-align: right"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtTax"
                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:RequiredFieldValidator ID="rfvTax" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="txtTax" Enabled="false" ErrorMessage="Enter Tax" Display="None">
                                        </asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvTax" CssClass="styleMandatoryLabel" Enabled="false" runat="server"
                                            ControlToValidate="txtTax" Type="Double" MaximumValue="99.99" ErrorMessage="Tax should not exceed 99.99%"
                                            Display="None">
                                        </asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="On FC" ID="lblOnFC" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:DropDownList ID="ddlOnFC" runat="server" Width="80%" TabIndex="5">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvOnFC" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlOnFC" InitialValue="0" ErrorMessage="Select On FC" Display="None">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Surcharge" ID="lblSurcharge" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:TextBox ID="txtSurcharge" onblur="fnValidateTax();" runat="server" MaxLength="6"
                                            TabIndex="12" Width="20%" Style="text-align: right"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSurcharge" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="txtSurcharge" Enabled="false" ErrorMessage="Enter Surcharge"
                                            Display="None">
                                        </asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvSurcharge" CssClass="styleMandatoryLabel" Enabled="false"
                                            runat="server" ControlToValidate="txtSurcharge" Type="Double" MaximumValue="99.99"
                                            ErrorMessage="Surcharge should not exceed 99.99%" Display="None">
                                        </asp:RangeValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtSurcharge"
                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Set off" ID="lblSetoff" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:DropDownList ID="ddlSetoff" onchange="fnSetOffValidation();" runat="server"
                                            TabIndex="6" Width="80%">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSetoff" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="ddlSetoff" InitialValue="0" ErrorMessage="Select Set off"
                                            Display="None">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Cess" ID="lblCess" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:TextBox ID="txtCess" onblur="fnValidateTax();" runat="server" MaxLength="6"
                                            TabIndex="13" Width="20%" Style="text-align: right"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCess" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="txtCess" Enabled="false" ErrorMessage="Enter Cess" Display="None">
                                        </asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvCess" CssClass="styleMandatoryLabel" runat="server" ControlToValidate="txtCess"
                                            Type="Double" MaximumValue="99.99" Enabled="false" ErrorMessage="Cess should not exceed 99.99%"
                                            Display="None">
                                        </asp:RangeValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtCess"
                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="GL Code" ID="lblGLCode" CssClass="styleMandatoryLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="width: 30%">
                                        <asp:DropDownList ID="ddlGLCode" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_SelectedIndexChanged"
                                            runat="server" Width="80%" TabIndex="5">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="padding-left: 7px;">
                                        <asp:CheckBox ID="chkActive" Checked="true" runat="server" TabIndex="14" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:TabContainer ID="tcTaxAsset" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                            Width="99%" ScrollBars="Auto" TabStripPlacement="top" AutoPostBack="false">
                            <cc1:TabPanel ID="tpTaxAsset" runat="server" HeaderText="Asset Details">
                                <HeaderTemplate>
                                    Asset Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="upTaxAsset" runat="server">
                                        <ContentTemplate>
                                            <div style="height: 135px; overflow-x: hidden; overflow-y: auto; width: 100%">
                                                <div>
                                                    <asp:GridView ID="gvTaxAsset" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                        OnRowDataBound="gvTaxAsset_RowDataBound" Width="100%" OnRowCommand="gvTaxAsset_RowCommand"
                                                        OnRowDeleting="gvTaxAsset_RowDeleting">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No." ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <%--<asp:Label ID="lblAssetSerialNo" runat="server" Text='<%#Bind("Asset_Serial_Number") %>' Width="70px"></asp:Label>--%>
                                                                    <asp:Label ID="lblAssetSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'
                                                                        Width="20px" ToolTip="Serial No."></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Asset Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAssetType" runat="server" Text='<%#Bind("Asset_Type") %>' ToolTip="Asset Type"></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlAssetType" runat="server" AutoPostBack="true" ToolTip="Asset Type">
                                                                    </asp:DropDownList>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" Width="25%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Asset Class">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAssetCode" runat="server" Text='<%#Bind("Asset_Class") %>' ToolTip="Asset Code"></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlAssetClass" runat="server" Width="100%" ToolTip="Asset Class">
                                                                    </asp:DropDownList>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" Width="75%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Add | Delete" HeaderStyle-Wrap="false" ItemStyle-Width="20%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTaxAssetID" runat="server" Text='<%#Bind("Tax_Asset_ID") %>' Visible="false"
                                                                        ToolTip="Asset Code"></asp:Label>
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        ToolTip="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" CausesValidation="false"
                                                                        ToolTip="Add"></asp:LinkButton>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="left" Width="20%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td align="center">
                        <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidation();"
                            TabIndex="15" CssClass="styleSubmitButton" Text="Save" OnClick="btnSave_Click" />
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                            TabIndex="16" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" TabIndex="17" />
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td>
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </td>
                </tr>
                </td></tr>
                <tr>
                    <td>
                        <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Please correct the following validation(s):"
                            Height="250px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                            ShowSummary="true" />
                    </td>
                </tr>
                <input type="hidden" id="hdnID" runat="server" />
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

 function fnSetOffValidation()
     {
        
        if (document.getElementById('<%=ddlSetoff.ClientID%>').options.value==76)
            {
                document.getElementById('<%=txtEligible.ClientID%>').disabled=true;
                document.getElementById('<%=txtEligible.ClientID%>').className='styleReqFieldDefalut';
                document.getElementById('<%=txtEligible.ClientID%>').value='';
                document.getElementById('<%=rfvEligible.ClientID%>').enabled=false;
                document.getElementById('<%=rvEligible.ClientID%>').enabled=false;
            }
          else
            {
                document.getElementById('<%=txtEligible.ClientID%>').disabled=false;
                document.getElementById('<%=txtEligible.ClientID%>').className='styleReqFieldFocus';
                document.getElementById('<%=rfvEligible.ClientID%>').enabled=true;
                document.getElementById('<%=rvEligible.ClientID%>').enabled=true;
            }
        
     }
    

function fnDisableControls()
{

    var index=document.getElementById('<%=ddlTaxType.ClientID%>');
    //alert(index.options.value);
    //If TaxType is TDS or TCS
    //Modified by nataraj to Service tax on 30-12-2010
    if ( (index.options.value==68) ||  (index.options.value==69) ||  (index.options.value==64) || (index.options.value==66))
        {
        
            document.getElementById('<%=ddlBranch.ClientID%>').selectedIndex=0;
            document.getElementById('<%=ddlBranch.ClientID%>').disabled=false;
            document.getElementById('<%=rfvBranch.ClientID%>').enabled=false;
            
        }
    else
        {
            document.getElementById('<%=ddlBranch.ClientID%>').disabled=false;
            document.getElementById('<%=rfvBranch.ClientID%>').enabled=true;
        }
        
        
}

function fnValidateTax()
{

if( document.getElementById('<%=txtTax.ClientID%>').value!='' ||  document.getElementById('<%=txtSurcharge.ClientID%>').value!='' || document.getElementById('<%=txtCess.ClientID%>').value!='' )//If onFC is Yes
         {
         
            if(document.getElementById('<%=txtTax.ClientID%>').value=='')
                {
                    document.getElementById('<%=rfvTax.ClientID%>').enabled=true;
                    return false;
                }
         
            if(document.getElementById('<%=txtSurcharge.ClientID%>').value=='')
                {
                    document.getElementById('<%=rfvSurcharge.ClientID%>').enabled=true;
                    return false;
                }
                
            if(document.getElementById('<%=txtCess.ClientID%>').value=='')
                {
                    document.getElementById('<%=rfvCess.ClientID%>').enabled=true;
                    return false;
                }
         
     if(document.getElementById('<%=txtTax.ClientID %>').value>99.99)
      {
             document.getElementById('<%=rvTax.ClientID%>').enabled=true;
             return false;       
      }
      if(document.getElementById('<%=txtSurcharge.ClientID %>').value>99.99)
      {     
             document.getElementById('<%=rvSurcharge.ClientID%>').enabled=true;
             return false;         
      }
      if(document.getElementById('<%=txtCess.ClientID %>').value>99.99)
      {     
             document.getElementById('<%=rvCess.ClientID%>').enabled=true;
             return false;        
      }
        
   }  

else
    {
        document.getElementById('<%=rfvTax.ClientID%>').enabled=false;
document.getElementById('<%=rfvSurcharge.ClientID%>').enabled=false;
document.getElementById('<%=rfvCess.ClientID%>').enabled=false;
    }   
          
}

function fnCheckPageValidation() {

    if ( (!fnCheckPageValidators(null,'false'))  )
          {
            if(Page_ClientValidate()==false)
            {
            Page_BlockSubmit=false;
            return false;
            }
          }
      
      document.getElementById('<%=txtTax.ClientID%>').className='styleReqFieldDefalut';
      document.getElementById('<%=txtSurcharge.ClientID%>').className='styleReqFieldDefalut';
      document.getElementById('<%=txtCess.ClientID%>').className='styleReqFieldDefalut';
      document.getElementById('<%=txtRate.ClientID%>').className='styleReqFieldDefalut';
      document.getElementById('<%=txtEligible.ClientID%>').className='styleReqFieldDefalut';
            
           
     if(Page_ClientValidate())
      {
        //Starting
      
      if(document.getElementById('<%=txtEligible.ClientID %>').value!='' && document.getElementById('<%=txtEligible.ClientID %>').value>100)
      {      
            document.getElementById('<%=rvEligible.ClientID %>').enabled=true;
            return false;       
      }
     
      //Ending
      
         if( document.getElementById('<%=txtTax.ClientID%>').value!='' ||  document.getElementById('<%=txtSurcharge.ClientID%>').value!='' || document.getElementById('<%=txtCess.ClientID%>').value!='' )//If onFC is Yes
         {
         
            if(document.getElementById('<%=txtTax.ClientID%>').value=='')
                {
                    document.getElementById('<%=rfvTax.ClientID%>').enabled=true;
                    return false;
                }
         
            if(document.getElementById('<%=txtSurcharge.ClientID%>').value=='')
                {
                    document.getElementById('<%=rfvSurcharge.ClientID%>').enabled=true;
                    return false;
                }
                
            if(document.getElementById('<%=txtCess.ClientID%>').value=='')
                {
                    document.getElementById('<%=rfvCess.ClientID%>').enabled=true;
                    return false;
                }
         
     if(document.getElementById('<%=txtTax.ClientID %>').value>100)
      {
             document.getElementById('<%=rvTax.ClientID%>').enabled=true;
             return false;       
      }
      if(document.getElementById('<%=txtSurcharge.ClientID %>').value>100)
      {     
             document.getElementById('<%=rvSurcharge.ClientID%>').enabled=true;
             return false;         
      }
      if(document.getElementById('<%=txtCess.ClientID %>').value>100)
      {     
             document.getElementById('<%=rvCess.ClientID%>').enabled=true;
             return false;        
      }
                       
            var RatePer = document.getElementById('<%=txtRate.ClientID%>').value;
            var Tax = document.getElementById('<%=txtTax.ClientID%>').value;
            var Surcharge = document.getElementById('<%=txtSurcharge.ClientID%>').value;
            var Cess = document.getElementById('<%=txtCess.ClientID%>').value;
            
            var Result;
            var Surcharge= parseFloat ((parseFloat(Tax) * ( Surcharge / 100 )));
            
            var Cess=parseFloat((parseFloat(Tax) + Surcharge) * parseFloat ( Cess / 100 ))
            
            Result=  parseFloat(Tax) + parseFloat(Surcharge) + parseFloat(Cess) 
            
            if(parseFloat(Result)!=parseFloat(RatePer))
            {
               alert('Please enter correct rate percentage (Tax+[(surcharge on Tax)+(cess(Tax+Surcharge of Tax))]=Rate%)');
                return false;
            }
         
         }
         
        index=document.getElementById('<%=ddlOnFC.ClientID%>');
        
        if((index.options.value==60))//If onFC is Yes
         {
            if(document.getElementById('<%=ddlSetoff.ClientID%>').options.value!=76)
                {
                    alert('If On FC is selected as Yes then Set off must be NA');
                    document.getElementById('<%=ddlSetoff.ClientID%>').focus();
                    return false;
                }
         }

         if (confirm('Are you sure want to save?')) {
             return true;
         }
         else {
             //Added by Santhosh S on 29/Jun/2013 to avoid Save button to be hidden in Modify mode, when modification is Cancelled.
             document.getElementById('<%=btnSave.ClientID%>').style.display = "inline";
             //End here
             return false;
         }
      } 
     
     return true;
    
 }       
    </script>

</asp:Content>
