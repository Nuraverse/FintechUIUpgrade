<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FAPortfolioLedger, App_Web_upeq32zu" title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        <%--Row for Location and Investment Type --%>
                        <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblLocation" Text="Location" />
                            </td>
                            <td class="styleFieldAlign" >
                                <%--<asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" Width="170px"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" />--%>
                                 <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" 
                                    Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                    InitialValue="--Select--" ErrorMessage="Select Location" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                            
                                  <td class="styleFieldLabel">
                                <asp:Label runat="server" ID="lblInvestmentType" CssClass="styleReqFieldLabel" Text="Investment Type"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                               <%-- <asp:DropDownList ID="ddlFunder" runat="server" ToolTip="Funder" AutoPostBack="true"
                                    Width="170px" OnSelectedIndexChanged="ddlFunder_SelectedIndexChanged" />
                               --%>
                                <cc1:ComboBox ID="ddlInvestmentType" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                
                                <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                                <asp:RequiredFieldValidator ID="rfvddlinvestmenttype" runat="server" ControlToValidate="ddlInvestmentType"
                                    InitialValue="--Select--" ErrorMessage="Select Investment Type" Display="None" SetFocusOnError="True"
                                    ValidationGroup="vgGo" />
                            </td>
                        </tr>
                       
                 <tr>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblFromDate" Text="From Date" />
                            </td>
                            <td class="styleFieldAlign"  align="left">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtFromDate" Width="146px" 
                                 AutoPostBack="true"   />
                                <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                    ErrorMessage="Select From Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                            <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblToDate" Text="To Date" />
                            </td>
                            <td class="styleFieldAlign"  align="left">
                                <asp:TextBox runat="server" CssClass="styleReqFieldLabel" ID="txtToDate" Width="146px" 
                                 AutoPostBack="true" />
                                <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate"
                                    ErrorMessage="Select To Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                            </td>
                             <td class="styleFieldLabel" >
                                <asp:Label runat="server" ID="lblRemarks" Text="Remarks"   AutoPostBack="true"  OnSelectedIndexChanged ="ddlSL_SelectedIndexChanged"/>
                            </td>
                            <td class="styleFieldAlign" align="left">
                                <asp:CheckBox ID="chkRemarks" runat="server" />
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
                <asp:Button ID="btnGo" runat="server" Text="Go" ValidationGroup="vgGo" CssClass="styleSubmitButton" OnClick="btnGo_Click" 
                    />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Clear_FA" OnClientClick="return fnConfirmClear();"   />
            </td>
        </tr>
        <%--For Showing Grid--%>
        <tr>
            <td>
                <asp:Panel ID="pnlInvestment" runat="server" Visible="false" GroupingText="Acquisition Details"
                    Width="100%" CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <div style="height: 200px; overflow: auto">
                                    <asp:Panel ID="pnlScroll" runat="server" GroupingText="" CssClass="stylePanel" Width="100%">
                                        <asp:GridView ID="gvportfoliocquisition" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                           Width="99%">  <%--OnRowDataBound="gvFunderPR_RowDataBound"--%>
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Doc Date --%>
                                                 <%--Funder Name --%>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location_Name") %>' ToolTip="Funder Name" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                 <%--Location  --%>
                                                <%--<asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Location" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--FundER TRANSACTION Number --%>
                                                <asp:TemplateField HeaderText="Investment Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblinvestmenttype" runat="server" Text='<%#Eval("INVESTMENT_TYPE") %>' ToolTip="Funder Transaction Number" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Commitment Amount --%>
                                                <asp:TemplateField HeaderText="Investment Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvestmentname" runat="server" Text='<%#Eval("INVESTMENT_NAME") %>' ToolTip="Commitment Amount" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Right" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Fund Referece Number --%>
                                                <asp:TemplateField HeaderText="Investment Ref. No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvestmentrefno" runat="server" Text='<%#Eval("investment_refno") %>' ToolTip="Fund Referece Number" />
                                                    </ItemTemplate>
                                                   <%-- <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total(R):<br/>Total(RP):" />
                                                    </FooterTemplate>--%>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                       <ItemStyle HorizontalAlign="Left" Width ="10%"/>
                                                </asp:TemplateField>
                                                <%--Received Amount --%>
                                                <asp:TemplateField HeaderText="Acquisition Quantity/units">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblunits" runat="server" Text='<%#Eval("units") %>' ToolTip="Received Amount" />
                                                    </ItemTemplate>
                                                     <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                   <%-- <FooterTemplate>
                                                        <asp:Label ID="lblReceivingTotal" runat="server" Text="" />
                                                    </FooterTemplate>--%>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--Repaid Amount--%>
                                                <asp:TemplateField HeaderText="Acquisition Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblacquisition" runat="server" Text='<%#Eval("due_date") %>' ToolTip="Repaid Amount" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                   
                                                </asp:TemplateField>
                                                <%--0 - 30 --%>
                                                   <asp:TemplateField HeaderText="Acquisition Cost Per Unit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblunitvalue" runat="server" Text='<%#Eval("UNIT_VALUE") %>' ToolTip="Ageing 0-30" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA1_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                                  <%--0 - 60 --%>
                                                   <asp:TemplateField HeaderText="Total Cost">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblamount" runat="server" Text='<%#Eval("AMOUNT") %>' ToolTip="Ageing 0-60" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA2_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                                  <%--0 - 30 --%>
                                                   <asp:TemplateField HeaderText="Others">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" runat="server" Text='<%#Eval("OTHERS") %>' ToolTip="Ageing 0-90" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA3_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                              
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        
              <tr>
            <td>
                <asp:Panel ID="pnlliqidity" runat="server" Visible="false" GroupingText="Liquidity Details"
                    Width="100%" CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <div style="height: 200px; overflow: auto">
                                    <asp:Panel ID="Panel2" runat="server" GroupingText="" CssClass="stylePanel" Width="100%">
                                        <asp:GridView ID="grvliquidity" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                           Width="99%">  <%--OnRowDataBound="gvFunderPR_RowDataBound"--%>
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Doc Date --%>
                                                 <%--Funder Name --%>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocationL" runat="server" Text='<%#Eval("Location_Name") %>' ToolTip="Funder Name" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                 <%--Location  --%>
                                                <%--<asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Location" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--FundER TRANSACTION Number --%>
                                                <asp:TemplateField HeaderText="Liquidity Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblinvestmenttypeL" runat="server" Text='<%#Eval("INVESTMENT_TYPE") %>' ToolTip="Funder Transaction Number" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Commitment Amount --%>
                                                <asp:TemplateField HeaderText="Investment Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvestmentnameL" runat="server" Text='<%#Eval("INVESTMENT_NAME") %>' ToolTip="Commitment Amount" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Right" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Fund Referece Number --%>
                                                <asp:TemplateField HeaderText="Investment Ref. No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvestmentrefnoL" runat="server" Text='<%#Eval("investment_refno") %>' ToolTip="Fund Referece Number" />
                                                    </ItemTemplate>
                                                   <%-- <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total(R):<br/>Total(RP):" />
                                                    </FooterTemplate>--%>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                       <ItemStyle HorizontalAlign="Left" Width ="10%"/>
                                                </asp:TemplateField>
                                                <%--Received Amount --%>
                                                <asp:TemplateField HeaderText="Liquidity Quantity">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblunits" runat="server" Text='<%#Eval("units") %>' ToolTip="Received Amount" />
                                                    </ItemTemplate>
                                                     <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                   <%-- <FooterTemplate>
                                                        <asp:Label ID="lblReceivingTotal" runat="server" Text="" />
                                                    </FooterTemplate>--%>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--Repaid Amount--%>
                                                <asp:TemplateField HeaderText="Liquidity Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblliquiditydate" runat="server" Text='<%#Eval("due_date") %>' ToolTip="Repaid Amount" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                   
                                                </asp:TemplateField>
                                                <%--0 - 30 --%>
                                                   <asp:TemplateField HeaderText="Liquidity Value per Unit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblunitvalueL" runat="server" Text='<%#Eval("UNIT_VALUE") %>' ToolTip="Ageing 0-30" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA1_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                                  <%--0 - 60 --%>
                                                   <asp:TemplateField HeaderText="Total Realisation">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblamountL" runat="server" Text='<%#Eval("AMOUNT") %>' ToolTip="Ageing 0-60" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA2_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                                  <%--0 - 30 --%>
                                                   <asp:TemplateField HeaderText="Others">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" runat="server" Text='<%#Eval("OTHERS") %>' ToolTip="Ageing 0-90" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA3_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                              
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        
           <tr>
            <td>
                <asp:Panel ID="pnldividend" runat="server" Visible="false" GroupingText="Dividend/Interest Details"
                    Width="100%" CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <div style="height: 200px; overflow: auto">
                                    <asp:Panel ID="Panel3" runat="server" GroupingText="" CssClass="stylePanel" Width="100%">
                                        <asp:GridView ID="grvdividendd" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                           Width="99%">  <%--OnRowDataBound="gvFunderPR_RowDataBound"--%>
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Doc Date --%>
                                                 <%--Funder Name --%>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocationd" runat="server" Text='<%#Eval("Location_Name") %>' ToolTip="Funder Name" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                 <%--Location  --%>
                                                <%--<asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Location" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--FundER TRANSACTION Number --%>
                                                <asp:TemplateField HeaderText="Investment Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblinvestmenttyped" runat="server" Text='<%#Eval("INVESTMENT_TYPE") %>' ToolTip="Funder Transaction Number" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Commitment Amount --%>
                                                <asp:TemplateField HeaderText="Investment Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvestmentnamed" runat="server" Text='<%#Eval("INVESTMENT_NAME") %>' ToolTip="Commitment Amount" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Right" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Fund Referece Number --%>
                                                <asp:TemplateField HeaderText="Investment Ref. No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvestmentrefnod" runat="server" Text='<%#Eval("investment_refno") %>' ToolTip="Fund Referece Number" />
                                                    </ItemTemplate>
                                                   <%-- <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total(R):<br/>Total(RP):" />
                                                    </FooterTemplate>--%>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                       <ItemStyle HorizontalAlign="Left" Width ="10%"/>
                                                </asp:TemplateField>
                                                <%--Repaid Amount--%>
                                                <asp:TemplateField HeaderText="Liquidity Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblliquiditydated" runat="server" Text='<%#Eval("due_date") %>' ToolTip="Repaid Amount" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                   
                                                </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="JV Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="jvdate" runat="server" Text='<%#Eval("jv_date") %>' ToolTip="Repaid Amount" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                   
                                                </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblamountd" runat="server" Text='<%#Eval("jv_amount") %>' ToolTip="Ageing 0-60" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA2_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                            
                             
                                                
                                              
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        
             <tr>
            <td>
                <asp:Panel ID="pnlbalance" runat="server" Visible="false" GroupingText="Balance Details"
                    Width="100%" CssClass="stylePanel">
                    <table width="100%">
                        <tr>
                            <td>
                                <div style="height: 200px; overflow: auto">
                                    <asp:Panel ID="pnlbal" runat="server" GroupingText="" CssClass="stylePanel" Width="100%">
                                        <asp:GridView ID="grvbalance" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                           Width="99%">  <%--OnRowDataBound="gvFunderPR_RowDataBound"--%>
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Doc Date --%>
                                                 <%--Funder Name --%>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocationb" runat="server" Text='<%#Eval("Location_Name") %>' ToolTip="Funder Name" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                 <%--Location  --%>
                                                <%--<asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Location" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--FundER TRANSACTION Number --%>
                                                <asp:TemplateField HeaderText="Investment Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblinvestmenttypeb" runat="server" Text='<%#Eval("INVESTMENT_TYPE") %>' ToolTip="Funder Transaction Number" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Left" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Commitment Amount --%>
                                                <asp:TemplateField HeaderText="Investment Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvestmentnameb" runat="server" Text='<%#Eval("INVESTMENT_NAME") %>' ToolTip="Commitment Amount" />
                                                    </ItemTemplate>
                                                       <ItemStyle HorizontalAlign="Right" Width ="7%"/>
                                                </asp:TemplateField>
                                                <%--Fund Referece Number --%>
                                                <asp:TemplateField HeaderText="Investment Ref. No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvestmentrefnob" runat="server" Text='<%#Eval("investment_refno") %>' ToolTip="Fund Referece Number" />
                                                    </ItemTemplate>
                                                   <%-- <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total(R):<br/>Total(RP):" />
                                                    </FooterTemplate>--%>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                       <ItemStyle HorizontalAlign="Left" Width ="10%"/>
                                                </asp:TemplateField>
                                                <%--Repaid Amount--%>
                                                <asp:TemplateField HeaderText="Balance Quantity">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblliquiditydateb" runat="server" Text='<%#Eval("UNIT_VALUE") %>' ToolTip="Repaid Amount" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                   
                                                </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Acquisition Cost">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblac" runat="server" Text='<%#Eval("AMOUNT") %>' ToolTip="Repaid Amount" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                   
                                                </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Market Value">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblamountd" runat="server" Text='<%#Eval("market_value") %>' ToolTip="Ageing 0-60" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblA2_Total" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width ="10%"/>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                
                                            
                             
                                                
                                              
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
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
                    Visible="false" Text="Print" OnClick="btnPrint_Click" />
                <asp:Button ID="btnEmail" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Email" />
                <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsFunderPR" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="cvportfolio" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
</asp:Content>

