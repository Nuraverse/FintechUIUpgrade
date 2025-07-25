<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FAMaturityReturns, App_Web_upeq32zu" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Maturity Returns Report" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                    <table width="100%">
                        <tr>
                           
                            <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblLocation" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <%-- <asp:DropDownList ID="ddlLocation" runat="server" Width="170px" ToolTip="Location">
                                </asp:DropDownList>--%>
                                <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    Width="155px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvLocation" ValidationGroup="vgGo" CssClass="styleMandatoryLabel"
                                    runat="server" ControlToValidate="ddlLocation" SetFocusOnError="True" ErrorMessage="Select Location"
                                    Display="None" InitialValue="--Select--">
                                </asp:RequiredFieldValidator>
                            </td>
                            
                            <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblINVType" CssClass="styleReqFieldLabel" Text="Investment Type"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <%-- <asp:DropDownList ID="ddlActivity" runat="server" Width="170px" ToolTip="Activity"
                                    AutoPostBack="true">
                                </asp:DropDownList>--%>
                                <cc1:ComboBox ID="ddlINVType" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    Width="155px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvINVType" ValidationGroup="vgGo" CssClass="styleMandatoryLabel"
                                    runat="server" ControlToValidate="ddlINVType" SetFocusOnError="True" ErrorMessage="Select Investment Type"
                                    Display="None" InitialValue="--Select--">
                                </asp:RequiredFieldValidator>
                            </td>
                            <%--<td class="styleFieldLabel" width="20%">
                                <asp:Label runat="server" ID="lblDenomination" CssClass="styleReqFieldLabel" Text="Denomination"></asp:Label>
                            </td>
                            <td class="styleFieldLabel" width="30%">
                                <asp:DropDownList ID="ddlDenomination" runat="server" Width="170px" ToolTip="Denomination"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvDenomination" ValidationGroup="vgGo" CssClass="styleMandatoryLabel"
                                    runat="server" ControlToValidate="ddlDenomination" SetFocusOnError="True" ErrorMessage="Select Denomination"
                                    Display="None" InitialValue="0">
                                </asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblFromDate" Text="From Date" />
                            </td>
                            <td class="styleFieldAlign" >
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtFromDate" Width="170px" 
                                AutoPostBack="true"  OnTextChanged ="txtFromDate_OnTextChanged" />
                                <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                   Format ="dd/mm/yyyy"  PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                    ErrorMessage="Select From Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblToDate" Text="To Date" />
                            </td>
                            <td class="styleFieldAlign" >
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtToDate" Width="170px"
                                AutoPostBack="true"  OnTextChanged ="txtToDate_OnTextChanged"  />
                                <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate"
                                    ErrorMessage="Select To Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                           
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="styleFieldLabel" height="8px">
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitButton" Text="Go" OnClick="btnGo_Click"
                    ValidationGroup="vgGo" ToolTip="Go" />&nbsp;
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear_FA"
                    OnClick="btnClear_Click" OnClientClick="return fnConfirmClear();" ToolTip="Clear_FA" />
                &nbsp;
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false"
                    CssClass="styleSubmitButton" ToolTip="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td class="styleFieldAlign">
            </td>
        </tr>
        <tr>
            <td class="styleFieldAlign">
                <asp:Panel ID="pnlMaturityReturns" runat="server" CssClass="stylePanel"  Visible="false"
                    GroupingText="Maturity Returns">
                    <asp:Panel ID="pnlEXP" Height="200px" ScrollBars="Vertical" runat="server" HorizontalAlign="Center">
                        <asp:GridView ID="gvMaturityReturns" runat="server" AutoGenerateColumns="False" Width="97%"
                            OnRowDataBound="gv_RowDataBound" CssClass="styleInfoLabel" ShowFooter="true">
                            <Columns>
                                <%--<asp:TemplateField HeaderText="Sl.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSlNo" Text='<%#Container.DataItemIndex+1%>' runat="server"  ToolTip="Serial Number" ></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>' ToolTip="Location"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="28%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Investment Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblINVType" runat="server" Text='<%# Bind("Investment_Type") %>' ToolTip="Investment Type"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Investment Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblINVDesc" runat="server" Text='<%# Bind("INV_DESC") %>' ToolTip="Investment Description"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="28%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Investment Ref Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblINVRefNo" runat="server" Text='<%# Bind("INV_Ref_No") %>' ToolTip="Investment Ref Number"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Maturity Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMaturityDate" runat="server" Text='<%# Bind("Maturity_Date") %>' ToolTip="Maturity Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                      <FooterTemplate >
                                    <asp:Label ID="lblTotal" Text ="Total" runat ="server"  ToolTip ="Total" />
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign ="Right" />
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Available Quantity">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAvailQty" runat="server" Text='<%# Bind("Available_Quantity") %>' ToolTip="Available Quantity"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="center" />
                                      <FooterTemplate >
                                    <asp:Label ID="lblTotQuantity" runat ="server"  ToolTip ="Total Available Quantity"/>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign ="center" />
                                </asp:TemplateField>
                                
                                 <asp:TemplateField HeaderText="Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount1") %>' ToolTip="Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <FooterTemplate >
                                    <asp:Label ID="lblTotAmount" runat ="server"  ToolTip ="Total Amount"/>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign ="Right" />
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Realization Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRealStatus" runat="server" Text='<%# Bind("Realization_Status") %>' ToolTip="Realization Status"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                  
                </asp:Panel>
            </td>
        </tr>
        
        <tr>
            <td class="styleFieldAlign">
                <table width="100%">
                    <tr>
                        <td class="styleFieldTotal" align="right" width="85%">
                            <asp:Label ID="lblGT" Visible="false" runat="server" Text="Grand Total :" />
                        </td>
                        <td class="styleFieldTotal" align="left" width="15%">
                            <asp:Label ID="lblGTAmount" Visible="false" runat="server" Text="" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="btnPrint" CssClass="styleSubmitButton" runat="server" Text="Print"
                    OnClick="btnPrint_Click" Visible="false" ToolTip="Submit" />
                <asp:Button ID="btnEmail" CssClass="styleSubmitButton" runat="server" Text="e-Mail"
                    OnClick="btnEmail_Click" Visible="false" ToolTip="Submit" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="VSTrialBal" runat="server" CssClass="styleMandatoryLabel"
                    CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="vgGo" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvProfitLoss" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
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
