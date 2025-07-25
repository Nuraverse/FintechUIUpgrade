<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_RPT_FunderStatus, App_Web_upeq32zu" title="Funder Status Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
        <td class="stylePageHeading">
        <asp:Label runat="server" Text="Funder Status Report" ID="lblHeading" CssClass="styleDisplayLabel">
        </asp:Label>
        </td>
        </tr>
        <tr>
        <td>
        <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
        <table width="100%">
                        <tr>
                        <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblLocation" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                        </td>
                        <td class="styleFieldLabel" width="25%">
                        <%--<asp:DropDownList ID="ddlLocation" runat="server" OnTextChanged="ddlLocation_OnTextChanged" Width="170px" 
                        ToolTip="Location" AutoPostBack="true"></asp:DropDownList>--%>
                        <cc1:ComboBox ID ="ddlLocation" runat="server" Width="145px" ToolTip="Location" 
                        OnTextChanged="ddlLocation_OnTextChanged" CssClass="WindowsStyle" DropDownStyle="DropDownList" 
                        AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                        </cc1:ComboBox>
                        <asp:RequiredFieldValidator ID="rfvLocation" ValidationGroup="btnGo" CssClass="styleMandatoryLabel"
                                runat="server" ControlToValidate="ddlLocation" SetFocusOnError="True"
                                ErrorMessage="Select Location" Display="None" InitialValue="--Select--">
                        </asp:RequiredFieldValidator> 
                        </td>
                         <td class="styleFieldLabel" width="25%">
                        <asp:Label runat="server" ID="lblDenomination" CssClass="styleReqFieldLabel" Text="Denomination"></asp:Label>
                        </td>
                         <td class="styleFieldLabel" width="25%">
                         <%--<asp:DropDownList ID="ddlDenomination" runat="server" Width="170px" ToolTip="Denomination" AutoPostBack="true"> 
                                </asp:DropDownList>--%>
                          <cc1:ComboBox ID ="ddlDenomination" runat="server" Width="145px" ToolTip="Denomination" 
                         CssClass="WindowsStyle" DropDownStyle="DropDownList" 
                        AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                        </cc1:ComboBox>
                        </td>     
                        </tr>
                        <tr>
                        <td class="styleFieldLabel" width="25%">
                                <asp:Label runat="server" Text="Date" ID="lblDate" CssClass="styleReqFieldLabel" ToolTip="Date">
                                </asp:Label>
                            </td>
                            <td class="styleFieldAlign" width="25%">
                                <asp:TextBox ID="txtDate" runat="server" OnTextChanged="txtDate_OnTextChanged" Width="168px" ToolTip="Date">
                                </asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" 
                                PopupButtonID="txtDate" Enabled="true" BehaviorID="calendar1" TargetControlID="txtDate" 
                                OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" 
                                ErrorMessage="Select Date" ValidationGroup="btnGo" Display="None" SetFocusOnError="True" >
                                </asp:RequiredFieldValidator>
                            </td>  
                          <td class="styleFieldLabel" width="25%">
                          </td>
                          <td class="styleFieldLabel" width="25%">
                          </td>                                                 
                        </tr>
                         <tr>
                        <td class="styleFieldLabel" colspan="4" height="8px"></td>
                        </tr>
                        </table>
                        </asp:Panel>
                        </td>
                        </tr>
                        <tr>
                        <td class="styleFieldLabel" colspan="4" height="8px"></td>
                        </tr>                               
                        <tr>
                        <td align="center" colspan="4">
                        <asp:Button ID="btnGo" runat="server"  CssClass="styleSubmitButton" Text="Go"  
                            ValidationGroup="btnGo" OnClick="btnGo_Click" ToolTip="Go" />&nbsp;&nbsp;&nbsp;
                            
                        <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" OnClick="btnClear_Click" Text="Clear_FA" 
                            OnClientClick="return fnConfirmClear();" ToolTip="Clear_FA" />&nbsp;&nbsp;&nbsp;
                            <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false" 
                            CssClass="styleSubmitButton" ToolTip="Cancel" OnClick="btnCancel_Click" />
                        </td>
                        </tr>
                        <tr>
                        <td class="styleFieldAlign" colspan="4"></td>
                        </tr>
                        <tr>
                        <td class="styleFieldAlign" colspan="4">
                        <asp:Panel ID="pnlFunder" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Funder Status Details">
                        <div id="divFunder" runat="server" style="overflow: scroll; height: 200px; display:none" >
                        <asp:GridView ID="grvFunder" runat="server" AutoGenerateColumns="False"  BorderWidth="2"
                            CssClass="styleInfoLabel" Width="100%" ShowFooter="true" ShowHeader="true" OnRowDataBound="grvFunder_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Funder Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFundname" runat="server" Text='<%# Bind("Funder_Name") %>' ToolTip="Funder Name"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Transaction Ref No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTRN" runat="server" Text='<%# Bind("Tran_Ref_No") %>' ToolTip="Transaction Ref No"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblComAmt" runat="server" Text='<%# Bind("COMMITTED_AMOUNT1") %>' ToolTip="Committed Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate >
                                    <asp:Label ID="lblTotal" runat ="server" Text ="Total :" />
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign ="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Allocated Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAlctdAmt" runat="server" Text='<%# Bind("ALLOCATED_AMOUNT1") %>' ToolTip="Allocated Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotAlctdAmt" runat="server" Text='<%#Eval("TotalAlctdAmt") %>'></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Received Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRcvdAmt" runat="server" Text='<%# Bind("RECEIVED_AMOUNT1") %>' ToolTip="Received Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRcvdAmt" runat="server" Text='<%#Eval("TotalRcvdAmt") %>'></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Repaid Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRpdAmt" runat="server" Text='<%# Bind("REPAID_AMOUNT1") %>' ToolTip="Repaid Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRpdAmt" runat="server" Text='<%#Eval("TotalRpdAmt") %>'></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="0-30">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRpAmt30" runat="server" Text='<%# Bind("AGEING30DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRpAmt30" runat="server" Text='<%#Eval("Total30days") %>'></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="31-60">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRpAmt60" runat="server" Text='<%# Bind("AGEING60DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRpAmt60" runat="server" Text='<%#Eval("Total60days") %>'></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="61-90">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRpAmt90" runat="server" Text='<%# Bind("AGEING90DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRpAmt90" runat="server" Text='<%#Eval("Total90days") %>'></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="91-120">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRpAmt120" runat="server" Text='<%# Bind("AGEING120DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRpAmt120" runat="server" Text='<%#Eval("Total120days") %>'></asp:Label>
                                    </FooterTemplate>

                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=">120">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRpAmtmore" runat="server" Text='<%# Bind("AGEINGABOVE120DAYS1") %>' ToolTip="Repayable Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Label ID="lbltotRpAmtmore" runat="server" Text='<%#Eval("TotalAb120days") %>'></asp:Label>
                                    </FooterTemplate>
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
        <asp:Button ID="BtnPrint" OnClick="BtnPrint_Click" CssClass="styleSubmitButton" runat="server" Text="Print" Visible="false" 
        ToolTip="Print" />
        </td>
        </tr>
        <tr>
        <td>
        <asp:ValidationSummary ID="VSFunder" runat="server" CssClass="styleMandatoryLabel"
            CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="btnGo" />
        </td>
        </tr>
        <tr>
        <td>
        <asp:CustomValidator ID="CVFunder" runat="server" CssClass="styleMandatoryLabel" Enabled="true" />
        </td>
        </tr>
        </table>
         <script language="javascript" type="text/javascript">
    function Resize()
     {
       if(document.getElementById('ctl00_ContentPlaceHolder1_divFunder') != null)
       {
         if(document.getElementById('divMenu').style.display=='none')
            {
             (document.getElementById('ctl00_ContentPlaceHolder1_divFunder')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
            }
         else
           {
             (document.getElementById('ctl00_ContentPlaceHolder1_divFunder')).style.width = screen.width - 270;
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

            if(document.getElementById('ctl00_ContentPlaceHolder1_divFunder') != null)
            (document.getElementById('ctl00_ContentPlaceHolder1_divFunder')).style.width = screen.width - 270;
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
           
            if(document.getElementById('ctl00_ContentPlaceHolder1_divFunder') != null)
           (document.getElementById('ctl00_ContentPlaceHolder1_divFunder')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
        }
    }

    </script>
</asp:Content>

