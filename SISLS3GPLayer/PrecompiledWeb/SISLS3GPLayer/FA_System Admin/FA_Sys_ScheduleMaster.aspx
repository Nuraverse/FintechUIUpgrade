<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FA_Sys_ScheduleMaster, App_Web_tfexpijv" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%" align="center" cellpadding="0" cellspacing="0">

        <tr>
            <td>
                

                        <table width="100%">

                            <tr style="width: 100%">

                                <td class="stylePageHeading" colspan="2">

                                    <asp:Label ID="lblHeading" runat="server" Text=" " CssClass="styleDisplayLabel">
                                    </asp:Label>

                                </td>

                            </tr>
                            <tr>
                                <td>
                          <cc1:TabContainer ID="tcSchedule" runat="server" CssClass="styleTabPanel" Width="99%"
                    TabStripPlacement="top" ActiveTabIndex="0">
                 
                    <cc1:TabPanel runat="server" HeaderText="Schedule Details" ID="tbfund" CssClass="tabpan"
                        BackColor="Red" >
                         <HeaderTemplate>
                            Schedule Details
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel3" runat="server" Width="100%" GroupingText="Schedule Details" CssClass="stylePanel">
                                        <table width="99%" cellpadding="0" cellspacing="0">
                                              <tr>
                                                       
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblScheduleID" runat="server" Text="Schedule ID" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtScheduleID" runat="server" />
                                                          
                                                          
                                                        </td>

                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblSubsheduleDesc" runat="server" Text="Schedule Desc." />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtScheduleDesc" runat="server" />
                                                          
                                                          
                                                        </td>
                                                         

                                                    </tr>
                                                
                                           
                                            <tr align="center">
                                                <td align="center" colspan="4" width="100%" valign="top" height="30px">
                                                    <asp:Button ID="btnAddDDC" runat="server" CssClass="styleSubmitShortButton" Text="Add"
                                                        ValidationGroup="btnAddDDC" ToolTip="Add Schedule Details, Alt+T" AccessKey="T" />
                                                   
                                                </td>
                                            </tr>
                                           
                                            <tr width="100%">
                                                <td class="styleFieldLabel" colspan="4" align="center">
                                                    <asp:GridView ID="grvschedule" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        
                                                        Width="100%">
                                                        <Columns>
                                                            
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <%-- <ItemStyle Width="6%" HorizontalAlign="Center" />--%>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Schedule ID" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblscheduleId" runat="server" Text='<%#Eval("Schedule_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                       
                                                            <asp:TemplateField HeaderText="Schedule Description">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblScheduleDescription" runat="server" Text='<%#Eval("Schedule_Desc") %> '></asp:Label>
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
                                                <td>&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ValidationSummary ID="VSbtnAddDDC" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="btnAddDDC" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                    <asp:ValidationSummary ID="VSbtnModifyDDC" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="btnModifyDDC" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                                 <cc1:TabPanel runat="server" HeaderText="Sub Schedule Details" ID="TabPanel1" CssClass="tabpan"
                        BackColor="Red" >
                         <HeaderTemplate>
                            Sub Schedule Details
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel1" runat="server" Width="100%" GroupingText="Schedule Details" CssClass="stylePanel">
                                        <table width="99%" cellpadding="0" cellspacing="0">
                                              <tr>
                                                       
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblSchdeuleID1" runat="server" Text="Schedule ID" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:DropDownList ID="ddlScheduleID" runat="server" >
                                                               <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                           </asp:DropDownList>
                                                          
                                                          
                                                        </td>

                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblsubschdeuleid" runat="server" Text="Sub Schdeule ID" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtSubscheduleid" runat="server" />
                                                          
                                                          
                                                        </td>
                                                         

                                                    </tr>
                                            <tr>
                                                 

                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblSerialNo" runat="server" Text="Serial Number" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtSerialNumber" runat="server" />
                                                          
                                                          
                                                        </td>
                                            </tr>
                                                
                                           
                                            <tr align="center">
                                                <td align="center" colspan="4" width="100%" valign="top" height="30px">
                                                    <asp:Button ID="btnsubschedule" runat="server" CssClass="styleSubmitShortButton" Text="Add"
                                                        ValidationGroup="btnAddDDC" ToolTip="Add Schedule Details, Alt+R" AccessKey="R" />
                                                   
                                                </td>
                                            </tr>
                                           
                                            <tr width="100%">
                                                <td class="styleFieldLabel" colspan="4" align="center">
                                                    <asp:GridView ID="grvsubschedule" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        
                                                        Width="100%">
                                                        <Columns>
                                                            
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <%-- <ItemStyle Width="6%" HorizontalAlign="Center" />--%>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Schedule ID" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblscheduleId" runat="server" Text='<%#Eval("Schedule_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Sub Schedule ID" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSubscheduleId" runat="server" Text='<%#Eval("Sub_Schedule_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                       
                                                            <asp:TemplateField HeaderText="Serial Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblserialNumber" runat="server" Text='<%#Eval("Serial_Number") %> '></asp:Label>
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
                                                <td>&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="btnAddDDC" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="btnModifyDDC" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                                  <cc1:TabPanel runat="server" HeaderText="Sub Schedule Details" ID="TabPanel2" CssClass="tabpan"
                        BackColor="Red" >
                         <HeaderTemplate>
                            Account Schedule
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel2" runat="server" Width="100%" GroupingText="Schedule Details" CssClass="stylePanel">
                                        <table width="99%" cellpadding="0" cellspacing="0">
                                              <tr>
                                                       
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="Label1" runat="server" Text="Schedule ID" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:DropDownList ID="DropDownList1" runat="server" >
                                                               <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                           </asp:DropDownList>
                                                          
                                                          
                                                        </td>
                                                  <td class="styleFieldLabel">
                                                            <asp:Label ID="lblsubschdule3" runat="server" Text="Sub Schedule ID" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:DropDownList ID="DropDownList2" runat="server" >
                                                               <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                           </asp:DropDownList>
                                                          
                                                          
                                                        </td>

                                                            

                                                    </tr>
                                            <tr>
                                                 

                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblscheduledescription1" runat="server" Text="Schedule Description" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtScheduleDescription1" ReadOnly="true" runat="server" />
                                                          
                                                          
                                                        </td>
                                            </tr>
                                                
                                              <tr>
                                                 

                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblstartbranch" runat="server" Text="Start Branch" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtStartBranch" runat="server" />
                                                          
                                                          
                                                        </td>

                                                  
                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblEndBranch" runat="server" Text="End Branch" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtEndBranch" runat="server" />
                                                          
                                                          
                                                        </td>
                                            </tr>
                                            <tr>
                                                  <td class="styleFieldLabel">
                                                            <asp:Label ID="lblStartActivity" runat="server" Text="Start Activity" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtstartactivity" runat="server" />
                                                          
                                                          
                                                        </td>

                                                  
                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblEndactivity" runat="server" Text="End Activity" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtEndactivity" runat="server" />
                                                          
                                                          
                                                        </td>
                                            </tr>

                                                    <tr>
                                                  <td class="styleFieldLabel">
                                                            <asp:Label ID="lblglcode" runat="server" Text="Start GLAccount" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtstartGlcode" runat="server" />
                                                          
                                                          
                                                        </td>

                                                  
                                                             <td class="styleFieldLabel">
                                                            <asp:Label ID="lblendglcode" runat="server" Text="End SLAccount" />
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                           <asp:TextBox ID="txtEndGLcode" runat="server" />
                                                          
                                                          
                                                        </td>
                                            </tr>
                                                
                                            <tr align="center">
                                                <td align="center" colspan="4" width="100%" valign="top" height="30px">
                                                    <asp:Button ID="Button1" runat="server" CssClass="styleSubmitShortButton" Text="Add"
                                                        ValidationGroup="btnAddDDC" ToolTip="Add Schedule Details, Alt+R" AccessKey="R" />
                                                   
                                                </td>
                                            </tr>
                                           
                                            <tr width="100%">
                                                <td class="styleFieldLabel" colspan="4" align="center">
                                                    <asp:GridView ID="grvaccount" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        
                                                        Width="100%">
                                                        <Columns>
                                                            
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <%-- <ItemStyle Width="6%" HorizontalAlign="Center" />--%>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Schedule ID" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblscheduleId" runat="server" Text='<%#Eval("Schedule_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="Sub Schedule ID" >
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSubscheduleId" runat="server" Text='<%#Eval("Sub_Schedule_ID") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                       
                                                            <asp:TemplateField HeaderText="Start Branch">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblstartbranch" runat="server" Text='<%#Eval("Start_Branch") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="End Branch">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEndbranch" runat="server" Text='<%#Eval("End_Branch") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                             <asp:TemplateField HeaderText="Start Activity">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblstartActivity" runat="server" Text='<%#Eval("Start_activity") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="End Activity">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEndactivity" runat="server" Text='<%#Eval("End_activity") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            
                                                             <asp:TemplateField HeaderText="Start GLAccount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblstartglaccount" runat="server" Text='<%#Eval("Start_GL") %> '></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="End GLAccount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEndglaccount" runat="server" Text='<%#Eval("End_GL") %> '></asp:Label>
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
                                                <td>&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="btnAddDDC" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                    <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="btnModifyDDC" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
              
                </cc1:TabContainer>

                           

                            
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



