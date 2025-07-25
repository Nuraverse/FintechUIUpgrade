<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_RPT_Fund_LocStatus, App_Web_u0nem2mh" title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <tr>
                     <td class="styleFieldLabel" width="20%">
                                <asp:Label runat="server" ID="lblDate" Text="From Date" />
                            </td>
                     <td class="styleFieldAlign" width="20%" align="left">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtDate" Width="160px" />
                                <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtDate" ID="CalFromDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                    ErrorMessage="Select From Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            
                            </td>
                     <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblDenomination" CssClass="styleReqFieldLabel" Text="Denomination"></asp:Label>
                        </td>
                    <td class="styleFieldLabel" width="25%">
                         <asp:DropDownList ID="ddlDenomination" runat="server" Width="170px" ToolTip="Denomination" AutoPostBack="true"> 
                                <%--OnSelectedIndexChanged="ddlDenomination_SelectedIndexChanged"--%>
                                </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfvDenomination" ValidationGroup="btnGo" CssClass="styleMandatoryLabel"
                                runat="server" ControlToValidate="ddlDenomination" SetFocusOnError="True"
                                ErrorMessage="Select Denomination" Display="None" InitialValue="0">
                        </asp:RequiredFieldValidator>
                        </td> 
                    </tr>
                    </table>
                    </asp:Panel>
                    </td>
                    </tr>
                      <tr>
                        <td align="center" colspan="4">
                        <asp:Button ID="btnGo" runat="server"  CssClass="styleSubmitButton" Text="Go" OnClick="btnGo_Click"  
                            ValidationGroup="btnGo" ToolTip="Go" />&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear_FA" 
                            OnClientClick="return fnConfirmClear();" ToolTip="Clear_FA" />
                            <asp:Button ID="BtnCancel" CssClass="styleSubmitButton" Visible="True" runat="server" Text="Cancel" OnClick="BtnCancel_Click"  ToolTip="Cancel" />
                        </td>
                        </tr>
      <tr>
                        <td class="styleFieldAlign" >
                        <asp:Panel ID="pnlFunder" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Funder Status Details">
                        <div id="divFunder" runat="server" style="overflow: scroll; height: 200px; display:none" >
                        <asp:GridView ID="grvFunder" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvFunder_RowDataBound"  BorderWidth="2"
                            CssClass="styleInfoLabel" Width="100%" ShowFooter="true" ShowHeader="true" >
                            <Columns>
                             <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("LOCATION") %>' ToolTip="Funder Name"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Funder Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFundname" runat="server" Text='<%# Bind("FUNDER_NAME") %>' ToolTip="Funder Name"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Transaction Ref No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTRN" runat="server" Text='<%# Bind("FUND_REF_NO") %>' ToolTip="Transaction Ref No"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblComAmt" runat="server" Text='<%# Bind("COMMITMENT_AMT1") %>' ToolTip="Committed Amount"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="FC Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFCAmt" runat="server" Text='<%# Bind("FC_AMOUNT1") %>' ToolTip="Allocated Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                   
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Allocated Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAlctdAmt" runat="server" Text='<%# Bind("ALLOCATED_AMOUNT1") %>' ToolTip="Allocated Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotAlctdAmt" runat="server" ToolTip="sum of Allocated Amount"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Received Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRcvdAmt" runat="server" Text='<%# Bind("RECEIVED_AMOUNT1") %>' ToolTip="Received Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRcvdAmt" runat="server" ToolTip="sum of Received Amount"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Repaid Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRpdAmt" runat="server" Text='<%# Bind("REPAID_AMOUNT1") %>' ToolTip="Repaid Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRpdAmt" runat="server" ToolTip="sum of Repaid Amount"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="0-30">
                                    <ItemTemplate>
                                        <asp:Label ID="lblageing0days" runat="server" Text='<%# Bind("AGEING0DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotageing0days" runat="server" ToolTip="sum of Ageing 0 days"></asp:Label>
                                    </FooterTemplate>
                                    
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="31-60">
                                    <ItemTemplate>
                                        <asp:Label ID="lblageing30days" runat="server" Text='<%# Bind("AGEING30DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotageing30days" runat="server" ToolTip="sum of Ageing 30 days"></asp:Label>
                                    </FooterTemplate>
                                    
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="61-90">
                                    <ItemTemplate>
                                        <asp:Label ID="lblageing60days" runat="server" Text='<%# Bind("AGEING60DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotageing60days" runat="server" ToolTip="sum of Ageing 60 days"></asp:Label>
                                    </FooterTemplate>
                                    
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="91-120">
                                    <ItemTemplate>
                                        <asp:Label ID="lblageing90days" runat="server" Text='<%# Bind("AGEING90DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotageing90days" runat="server" ToolTip="sum of Ageing 0 days"></asp:Label>
                                    </FooterTemplate>
                                    
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=">120">
                                    <ItemTemplate>
                                        <asp:Label ID="lblageing120days" runat="server" Text='<%# Bind("AGEING120DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotageing120days" runat="server" ToolTip="sum of Ageing 120 days"></asp:Label>
                                    </FooterTemplate>
                                    
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                        </div>
                        </asp:Panel>
                        </td>
                        </tr>
<tr align="center">
        <td>
        <asp:Button ID="BtnPrint" CssClass="styleSubmitButton" runat="server" Text="Print" OnClick="BtnPrint_Click" Visible="false" 
        ToolTip="Print" />
            <asp:Button ID="btnexcel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Excel" OnClick="FunExcelExport"  />
        <%--OnClick="BtnPrint_Click"--%>
        </td>
        </tr>
         <tr>
        <td>
        <asp:CustomValidator ID="cvFund" runat="server" CssClass="styleMandatoryLabel" Enabled="true" />
        </td>
        </tr>
        </table>
        <script type="text/javascript"> 
 function Resize()
     {
       if(document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
       {
         if(document.getElementById('divMenu').style.display=='none')
            {
             (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
            }
         else
           {
             (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
           }
        }  
      }
      
      
    function showMenu(show) 
      {
       if (show == 'T') 
         {
        
          if(document.getElementById('divGrid1')!=null)
            {
                document.getElementById('divGrid1').style.width="800px";
                document.getElementById('divGrid1').style.overflow="scroll";
            }
        
            document.getElementById('divMenu').style.display = 'Block';
            document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

            document.getElementById('ctl00_imgShowMenu').style.display = 'none';
            document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

            if(document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
            (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
        }
        if (show == 'F') 
        {
            if(document.getElementById('divGrid1')!=null)
                {
                    document.getElementById('divGrid1').style.width="960px";
                    document.getElementById('divGrid1').style.overflow="auto";
                }
                
            document.getElementById('divMenu').style.display = 'none';
            document.getElementById('ctl00_imgHideMenu').style.display = 'none';
            document.getElementById('ctl00_imgShowMenu').style.display = 'Block';
           
            if(document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
           (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
        }
    }
 
    </script>
</asp:Content>

