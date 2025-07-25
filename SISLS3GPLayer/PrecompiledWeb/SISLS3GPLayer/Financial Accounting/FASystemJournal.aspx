<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FASystemJournal, App_Web_hqzzel3u" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="System Journal" ID="lblHeading" CssClass="styleInfoLabel">
                                </asp:Label>
                        </div>
                    </div>

                      <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Header details">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlActivity"  runat="server" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                               
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblActivity" runat="server" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMJVNo" class="md-form-control form-control login_form_content_input requires_true" onmouseover="txt_MouseoverTooltip(this)"
                                                                    ToolTip="MJV Number" runat="server"></asp:TextBox>
                                                            
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblMJVNO" runat="server" Text="SJV Number"></asp:Label>

                                                            </label>
                                                                </div>
                                                        </div>

                                                          <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLocation"  runat="server" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                               
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                   <asp:Label ID="lblLocatio" runat="server" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>

                                                                  <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMJVDate" ToolTip="SJV Date" runat="server" AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ></asp:TextBox>

                                                               

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label2" runat="server" CssClass="styleReqFieldLabel" Text="SJV Date"></asp:Label>

                                                                </label>
                                                            </div>

                                                        </div>

                                                     
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                          </div>

                    <div class="row">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel"  GroupingText="System Journal Details">
                               <div class="gird">
                                        <asp:GridView runat="server" ShowFooter="true" ID="gvManualJournal" 
                                             Width="100%" AutoGenerateColumns="False" CssClass="gird_details">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblSNO" Text='<%#Container.DataItemIndex+1%>' ToolTip ="Serial No"></asp:Label>
                                                        <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Tran_Details_ID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                    <%--  Activity --%>
                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Activity">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("Activity")%>' ID="lblactivity" ToolTip ="Activity"></asp:Label>
                                                        
                                                    </ItemTemplate>
                                                 
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    <FooterStyle HorizontalAlign="Left" Width="20%" />
                                                </asp:TemplateField>
                                                    <%--  Branch --%>
                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Branch">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("Branch")%>' ID="lblBranch" ToolTip ="Account"></asp:Label>
                                                      
                                                    </ItemTemplate>
                                                  
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    <FooterStyle HorizontalAlign="Left" Width="20%" />
                                                </asp:TemplateField>
                                                <%--  GL Code --%>
                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("GL_Desc")%>' ID="lblGLAcc" ToolTip ="Account"></asp:Label>
                                                        <asp:HiddenField ID="hdn_GLCode" runat="server" Value='<%#Eval("GL_Code") %>' />
                                                    </ItemTemplate>
                                                  <%--  <FooterTemplate>
                                                        <center>
                                                            </br>
                                                            <asp:DropDownList ID="ddlGLCode" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit"
                                                                runat="server">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvGLAcc" CssClass="styleMandatoryLabel"
                                                                runat="server" ControlToValidate="ddlGLCode" InitialValue="0" ErrorMessage="Select Account"
                                                                ValidationGroup="VgAdd" Display="None">
                                                            </asp:RequiredFieldValidator>
                                                        </center>
                                                    </FooterTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlGLCode" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit"
                                                            runat="server">
                                                        </asp:DropDownList>
                                                        <asp:HiddenField ID="hdn_GLCode" runat="server" Value='<%#Eval("GL_Code") %>' />
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvGLAccHdr" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlGLCode" InitialValue="0" ErrorMessage="Select Account"
                                                            ValidationGroup="VgUpdate" Display="None">
                                                        </asp:RequiredFieldValidator>
                                                    </EditItemTemplate>--%>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    <FooterStyle HorizontalAlign="Left" Width="20%" />
                                                </asp:TemplateField>
                                                <%--    <!-- SL Code-->--%>
                                                <asp:TemplateField HeaderStyle-Wrap="false" HeaderText="Sub Account">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("SL_Desc")%>' ID="lblSLAcc" ToolTip ="Sub Account"></asp:Label>
                                                        <asp:HiddenField ID="hdn_SLCode" runat="server" Value='<%#Eval("SL_Code") %>' />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTot" runat="server" Text="Total   " /></br>
                                                        <%--<center>
                                                            <asp:DropDownList ID="ddlSLCode" Width="130px" runat="server" ValidationGroup="VgAdd">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvSLCode" CssClass="styleMandatoryLabel"
                                                                Enabled="false" runat="server" ControlToValidate="ddlSLCode" InitialValue="0"
                                                                ErrorMessage="Select Sub Account" ValidationGroup="VgAdd" Display="None">
                                                            </asp:RequiredFieldValidator></center>--%>
                                                    </FooterTemplate>
                                                    <%--<EditItemTemplate>
                                                        <asp:DropDownList ID="ddlSLCode" Width="130px" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:HiddenField ID="hdn_SLCode" runat="server" Value='<%#Eval("SL_Code") %>' />
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvSLCode" CssClass="styleMandatoryLabel"
                                                            Enabled="false" runat="server" ControlToValidate="ddlSLCode" InitialValue="0"
                                                            ErrorMessage="Select Sub Account" ValidationGroup="VgUpdate" Display="None">
                                                        </asp:RequiredFieldValidator>
                                                    </EditItemTemplate>--%>
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                </asp:TemplateField>
                                                <%--  <!-- Debit -->--%>
                                                <asp:TemplateField HeaderText="Debit">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("Debit")%>' ID="lblDebit" ToolTip ="Debit"></asp:Label>
                                                    </ItemTemplate>
                                                   <FooterTemplate>
                                                        <asp:Label ID="lblTotDebit" runat="server" Text='<%#Eval("TotDebit")%>'  ToolTip ="Total of Debit"/></br>
                                                      <%--  <center>
                                                            <asp:TextBox MaxLength="11" Width="80px" runat="server" ID="txtDebit"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtDebit"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="None" Enabled="false"
                                                                CssClass="styleMandatoryLabel" ControlToValidate="txtDebit" ValidationGroup="VgAdd"
                                                                runat="server" ID="rfvDebit">
                                                            </asp:RequiredFieldValidator>
                                                        </center>--%>
                                                    </FooterTemplate>
                                                    <%-- <EditItemTemplate>
                                                        <asp:TextBox MaxLength="11" Width="80px" Text='<%#Eval("Debit")%>' runat="server"
                                                            ID="txtDebit"></asp:TextBox>
                                                        <asp:HiddenField ID="hdn_Debit" runat="server" Value='<%#Eval("Debit") %>' />
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1Hdr" runat="server" TargetControlID="txtDebit"
                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="None" Enabled="false"
                                                            CssClass="styleMandatoryLabel" ControlToValidate="txtDebit" ValidationGroup="VgUpdate"
                                                            runat="server" ID="rfvDebit">
                                                        </asp:RequiredFieldValidator>
                                                    </EditItemTemplate>--%>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                </asp:TemplateField>
                                                <%--    <!-- Credit -->--%>
                                                <asp:TemplateField HeaderText="Credit">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("Credit")%>' ID="lblCredit" ToolTip ="Credit"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotCredit" runat="server" Text='<%#Eval("TotCredit")%>'  ToolTip ="Total of Credit"/></br>
                                                       <%-- <center>
                                                            <asp:TextBox MaxLength="11" Width="80px" runat="server" ID="txtCredit"></asp:TextBox>
                                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="None" Enabled="false"
                                                                CssClass="styleMandatoryLabel" ControlToValidate="txtCredit" ValidationGroup="VgAdd"
                                                                runat="server" ID="rfvCredit" ErrorMessage="Enter Debit or Credit Value">
                                                            </asp:RequiredFieldValidator>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtCredit"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </center>--%>
                                                    </FooterTemplate>
                                                 <%--   <EditItemTemplate>
                                                        <asp:TextBox MaxLength="11" Width="80px" runat="server" Text='<%#Eval("Credit")%>'
                                                            ID="txtCredit"></asp:TextBox>
                                                        <asp:HiddenField ID="hdn_Credit" runat="server" Value='<%#Eval("Credit") %>' />
                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="None" Enabled="false"
                                                            CssClass="styleMandatoryLabel" ControlToValidate="txtCredit" ValidationGroup="VgUpdate"
                                                            runat="server" ID="rfvCredit" ErrorMessage="Enter Debit or Credit Value">
                                                        </asp:RequiredFieldValidator>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2Hdr" runat="server" TargetControlID="txtCredit"
                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </EditItemTemplate>--%>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                </asp:TemplateField>
                                              
                                    
                                             
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                        </asp:GridView>
                                   </div>
                                    </asp:Panel>
                              </div>
                    </div>

                   
                                <div class="btn_height"></div>
                                        <div align="right" class="fixed_btn">
                                          
                                             <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                                type="button" accesskey="X">
                                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                            </button>

                                         
                                        </div>

                    <div>

                    </div>
                        <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="Header"  Visible="false"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <asp:ValidationSummary runat="server" ID="VSAdd" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgAdd" Visible="false"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <asp:ValidationSummary runat="server" ID="VSUpdate" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgUpdate"  Visible="false"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <input type="hidden" runat="server" value="0" id="hdnRowID" />
                                    <input type="hidden" runat="server" value="1" id="hdnAccValid" />
                                    <input type="hidden" runat="server" value="0" id="hdnStatus" />
                                    <asp:CustomValidator ID="cvManualJournal" runat="server" CssClass="styleMandatoryLabel"
                                        Enabled="true" />    
                    
                    </div>
                </div>
    
                               
                               
                          
                          
                            
                          
                               
                              
                    </ContentTemplate>
                </asp:UpdatePanel>
        
    

</asp:Content>
