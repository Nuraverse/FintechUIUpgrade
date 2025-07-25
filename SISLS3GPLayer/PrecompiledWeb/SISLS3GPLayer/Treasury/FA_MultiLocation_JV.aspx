<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_MultiLocation_JV, App_Web_ezlcepmc" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td class="stylePageHeading">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:TabContainer ID="tcJV" runat="server" CssClass="styleTabPanel" Width="99%" TabStripPlacement="top"
                                        ActiveTabIndex="0">
                                        <cc1:TabPanel runat="server" HeaderText="MJV Details" ID="tpJV" CssClass="tabpan"
                                            BackColor="Red" TabIndex="0">
                                            <HeaderTemplate>
                                                MLJV Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <table width="100%">
                                                <tr>
                                                        <td>
                                                            <asp:Panel ID="pnlHeader" runat="server" CssClass="stylePanel">
                                                                <table width="100%">
                                                                    <tr>
                                                                        
                                                                        <td class="styleFieldLabel" width="15%">
                                                                            <asp:Label ID="lblMJVNO" runat="server" Text="MJV Number"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign" width="30%">
                                                                            <asp:TextBox ID="txtMJVNo" Width="165px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                ToolTip="MJV Number" runat="server"></asp:TextBox>
                                                                                <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblMJVDate" runat="server" CssClass="styleReqFieldLabel" Text="MJV Date"></asp:Label>
                                                                        </td>               
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtMJVDate" ToolTip="MJV Date" runat="server" 
                                                                                onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtMJVDate_TextChanged"
                                                                                Width="165px"></asp:TextBox>
                                                                             <asp:RequiredFieldValidator ErrorMessage="Select MJV Date" ValidationGroup="Header"
                                                                                ID="rfvMJVDate" runat="server" ControlToValidate="txtMJVDate" CssClass="styleMandatoryLabel"
                                                                                Display="None"></asp:RequiredFieldValidator>
                                                                                <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                               PopupButtonID="imgDate" TargetControlID="txtMJVDate">
                                                                            </cc1:CalendarExtender>
                                                                        </td>
                                                                      
                                                                    </tr>
                                                                    <tr>
                                                                      
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblMJVValueDate" runat="server" CssClass="styleReqFieldLabel" 
                                                                                Text="MJV Value Date"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtMJVValueDate" runat="server" 
                                                                                onmouseover="txt_MouseoverTooltip(this)" 
                                                                                OnTextChanged="txtMJVValueDate_TextChanged" ToolTip="MJV Value Date" 
                                                                                Width="165px"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvMJVValueDate" runat="server" 
                                                                                ControlToValidate="txtMJVValueDate" CssClass="styleMandatoryLabel" 
                                                                                Display="None" ErrorMessage="Select MJV Value Date" ValidationGroup="Header"></asp:RequiredFieldValidator>
                                                                            <asp:Image ID="imgMJVValueDate" runat="server" 
                                                                                ImageUrl="~/Images/calendaer.gif" />
                                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" 
                                                                                OnClientDateSelectionChanged="checkDate_NextSystemDate1" 
                                                                                PopupButtonID="imgMJVValueDate" TargetControlID="txtMJVValueDate">
                                                                            </cc1:CalendarExtender>
                                                                            <asp:CustomValidator ID="rfvCompareMJVDate" runat="server" 
                                                                                CssClass="styleMandatoryLabel" Display="None" 
                                                                                ErrorMessage="Difference between MJV Date and MJV Value Date must be 30 days" 
                                                                                ValidationGroup="Header"></asp:CustomValidator>
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="Label3" runat="server" Text="MJV Status"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtMJVStatus" runat="server" 
                                                                                onmouseover="txt_MouseoverTooltip(this)" ToolTip="MJV Status" Width="165px"></asp:TextBox>
                                                                        </td>
                                                               
                                                                    </tr>
                                                                     <tr>
                                                                      
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="Lblinvoiceamount" runat="server" CssClass="styleReqFieldLabel" 
                                                                                Text="Invoice Amount"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtinvoiceamount" Style="text-align: right" runat="server" 
                                                                                onmouseover="txt_MouseoverTooltip(this)" 
                                                                                 ToolTip="Invoice Amount" 
                                                                                Width="165px"></asp:TextBox>
                                                                          
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblinvoicedate" runat="server" Text="Invoice Date"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtinvoicedate" runat="server" 
                                                                                onmouseover="txt_MouseoverTooltip(this)" ToolTip="Invoice Date" Width="165px"></asp:TextBox>
                                                                       <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" 
                                                                               PopupButtonID="Image1" TargetControlID="txtinvoicedate">
                                                                            </cc1:CalendarExtender>
                                                                        </td>
                                                                 
                                                                    </tr>
                                                                     <tr>
                                                                      
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblinvoicenumber" runat="server" CssClass="styleReqFieldLabel" 
                                                                                Text="Invoice Number"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtinvoicenumber" runat="server" 
                                                                                onmouseover="txt_MouseoverTooltip(this)" 
                                                                                 ToolTip="Invoice Number" 
                                                                                Width="165px"></asp:TextBox>
                                                                          
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblinvoiceimage" runat="server" Text="Invoice Image"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                          
                                                                      
                                                                         <cc1:AsyncFileUpload ID="asyFileUpload" runat="server" Width="175px" OnUploadedComplete="asyncFileUpload_UploadedComplete"
                                                        onmouseover="FunShowPath(this);" FailedValidation="False" />
                                                    <asp:Label runat="server" ID="myThrobber"></asp:Label>
                                                    <asp:HiddenField runat="server" ID="hidThrobber" />
                                                                   </td>   
                                                                        
                                                                    </tr>
                                                                     <tr>
                                                                      
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lbltaxnumber" runat="server" CssClass="styleReqFieldLabel" 
                                                                                Text="Tax Reg. Number"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txttaxregnumber" runat="server" 
                                                                                onmouseover="txt_MouseoverTooltip(this)" 
                                                                                 ToolTip="Tax Registration Number" 
                                                                                Width="165px"></asp:TextBox>
                                                                          
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblcurrency" runat="server" Text="Currency Code"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                           <asp:DropDownList ID="ddlcurrency" runat="server" ></asp:DropDownList>
                                                                        </td>
                                                                 
                                                                    </tr>
                                                                     <tr>
                                                                     
                                                                      <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblLocation" runat="server" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                           <UC:Suggest ID="ddlLocation" runat="server" AutoPostBack="true" ServiceMethod="GetBranchList" OnItem_Selected="ddlLocation_SelectedIndexChanged" ItemToValidate ="Value"  IsMandatory="true" ErrorMessage="Select Location" />
                                                                        </td>  
                                                                       
                                                                          
                                                                   
                                                                          <td class="styleFieldLabel">
                                                                <asp:Label runat="server" Text="Account Based" ToolTip="Pay to" ID="lblPayTo" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </td>
                                                            <td align="left" class="styleFieldAlign">
                                                                <asp:DropDownList ID="ddlPayTo" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                    OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged" AutoPostBack="True">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVddlPayTo" CssClass="styleMandatoryLabel"
                                                                    runat="server" SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlPayTo"
                                                                    ErrorMessage="Select Pay To" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVddlPayTo2" CssClass="styleMandatoryLabel"
                                                                    runat="server" SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlPayTo"
                                                                    ErrorMessage="Select Pay To" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                                            </td>
                                                                        
                                                                        
                                                                      
                                                                        
                                                                    </tr>
                                                                     <tr>
                                                                      
                                                                       
                                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ToolTip="Entity" Text="Entity/Funder" ID="lblCode" CssClass="styleMandatoryLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="28%">
                                                                <asp:TextBox ID="txtCode" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                    Style="display: none;" MaxLength="50" Width="65%" ContentEditable="false"></asp:TextBox>
                                                                <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server" DispalyContent="Code"
                                                                    TextWidth="65%" />
                                                                <asp:Button ID="btnCreateCustomer" runat="server" Text="Create"
                                                                    Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                                    CausesValidation="False" />
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtCode" CssClass="styleMandatoryLabel"
                                                                    runat="server" SetFocusOnError="True" ControlToValidate="txtCode" ErrorMessage="Select Entity/Funder"
                                                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                            </td>
                                                                        
                                                                      
                                                                        
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td >
                                                            <asp:Panel ID="PnlEntityInformation" Height="100%" runat="server" ToolTip="Entity Information"
                                                    GroupingText="Entity/Funder Information" CssClass="stylePanel" Width="98%">
                                                    <table width="100%">
                                                        <tr style="width: 100%;">
                                                            <td >
                                                                <uc1:FAAddressDetail ActiveViewIndex="1" ID="ucFAAddressDetail" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                        </td>
                                                 
                                                      
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Panel ID="pnlJV" runat="server" CssClass="stylePanel" Width="100%" GroupingText="Manual Journal Details"
                                                                HorizontalAlign="Center">
                                                                <center>
                                                                    <asp:Panel ID="pnlScroll" runat="server" Width="100%" HorizontalAlign="Center">
                                                                        <asp:GridView runat="server" ShowFooter="True" ID="gvManualJournal" OnRowDataBound="gvManualJournal_RowDataBound"
                                                                            OnRowCommand="gvManualJournal_RowCommand" OnRowEditing="gvManualJournal_RowEditing"
                                                                            OnRowDeleting="gvManualJournal_RowDeleting" OnRowCancelingEdit="gvManualJournal_RowCancelingEdit"
                                                                            OnRowUpdating="gvManualJournal_RowUpdating" Width="100%" AutoGenerateColumns="False"
                                                                            HorizontalAlign="Center">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Sl No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblSNO" Text='<%#Container.DataItemIndex+1%>' ToolTip="Sl No"></asp:Label>
                                                                                        <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Tran_Details_ID") %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="2%" />
                                                                                </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Location">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" Text='<%#Eval("Location_desc")%>' ID="lbllocation" ToolTip="Location"></asp:Label>
                                                                                       <asp:HiddenField ID="hdn_AccountLocation" runat="server" Value='<%#Eval("Location") %>' />
                                                                                       <asp:HiddenField ID="hdn_AccountLocationName" runat="server" Value='<%#Eval("Location_Desc") %>' />
                                                                                        <%--  <asp:HiddenField ID="hdn_GLCode" runat="server" Value='<%#Eval("GL_Code") %>' />--%>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <center>
                                                                                            <br>
                                                                                            </br>
                                                                                           <%-- <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                                              Width ="130px"   AutoPostBack="true"  AppendDataBoundItems="true" OnSelectedIndexChanged="location_Edit"
                                                                                                CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                                            </cc1:ComboBox>--%>
                                                                                            <UC:Suggest ID="ddlLocationFoot" runat="server" AutoPostBack="true"  ServiceMethod="GetBranchList" OnItem_Selected="location_Edit" ItemToValidate ="Value"  IsMandatory="true"  ValidationGroup="VgAdd" ErrorMessage="Select Location"/>
                                                                                             <asp:HiddenField ID="hdn_AccountLocation" runat="server" Value='<%#Eval("Location") %>' />
                                                                                             <asp:HiddenField ID="hdn_AccountLocationName" runat="server" Value='<%#Eval("Location_Desc") %>' />
                                                                                            <%--   <asp:DropDownList ID="ddlGLCode" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit"
                                                                                                runat="server">
                                                                                            </asp:DropDownList>--%>
                                                                                           <%-- <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvLocation" CssClass="styleMandatoryLabel"
                                                                                                runat="server" ControlToValidate="ddlLocation"  InitialValue="--Select--" ErrorMessage="Select Location"
                                                                                                ValidationGroup="VgAdd" Display="None">
                                                                                            </asp:RequiredFieldValidator>--%>
                                                                                        </center>
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                         <UC:Suggest ID="ddlLocationFoot" runat="server" AutoPostBack="true"  ServiceMethod="GetBranchList" OnItem_Selected="location_Edit" ItemToValidate ="Value"  IsMandatory="true"  ValidationGroup="VgUpdate" ErrorMessage="Select Location"/>
                                                                                         <asp:HiddenField ID="hdn_AccountLocation" runat="server" Value='<%#Eval("Location") %>' />
                                                                                         <asp:HiddenField ID="hdn_AccountLocationName" runat="server" Value='<%#Eval("Location_Desc") %>' />
                                                                                        <%-- <asp:DropDownList ID="ddlGLCode" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit"
                                                                                            runat="server">--%>
                                                                                        <%-- </asp:DropDownList>--%>
                                                                                   
                                                                                      <%--  <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvLocationHdr" CssClass="styleMandatoryLabel"
                                                                                            runat="server" ControlToValidate="ddlLocation" InitialValue="--Select--" ErrorMessage="Select Location"
                                                                                            ValidationGroup="VgUpdate" Display="None">
                                                                                        </asp:RequiredFieldValidator>--%>
                                                                                    </EditItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="20%" Wrap="False" />
                                                                                    <FooterStyle HorizontalAlign="Left" Width="20%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Account">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" Text='<%#Eval("GL_Desc")%>' ID="lblGLAcc" ToolTip="Account"></asp:Label>
                                                                                        <asp:HiddenField ID="hdn_AccountLeg" runat="server" Value='<%#Eval("Acc_Leg") %>' />
                                                                                        <asp:HiddenField ID="hdn_AccNature" runat="server" Value='<%#Eval("Acc_Nature") %>' />
                                                                                        <%--  <asp:HiddenField ID="hdn_GLCode" runat="server" Value='<%#Eval("GL_Code") %>' />--%>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <center>
                                                                                            <br>
                                                                                            </br>
                                                                                            <cc1:ComboBox ID="ddlGLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                                              Width ="130px"   AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit" AppendDataBoundItems="true"
                                                                                                CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                                            </cc1:ComboBox>
                                                                                            <%--   <asp:DropDownList ID="ddlGLCode" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit"
                                                                                                runat="server">
                                                                                            </asp:DropDownList>--%>
                                                                                            <asp:HiddenField ID="hdn_AccountLeg" runat="server" />
                                                                                            <asp:HiddenField ID="hdn_AccNature" runat="server" />
                                                                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvGLAcc" CssClass="styleMandatoryLabel"
                                                                                                runat="server" ControlToValidate="ddlGLCode" InitialValue="--Select--" ErrorMessage="Select Account"
                                                                                                ValidationGroup="VgAdd" Display="None">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </center>
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <cc1:ComboBox ID="ddlGLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                                           Width ="130px"  AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit" AppendDataBoundItems="true"
                                                                                            CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                                        </cc1:ComboBox>
                                                                                        <%-- <asp:DropDownList ID="ddlGLCode" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit"
                                                                                            runat="server">--%>
                                                                                        <%-- </asp:DropDownList>--%>
                                                                                        <asp:HiddenField ID="hdn_AccountLeg" runat="server" Value='<%#Eval("Acc_Leg") %>' />
                                                                                        <asp:HiddenField ID="hdn_AccNature" runat="server" Value='<%#Eval("Acc_Nature") %>' />
                                                                                        <asp:HiddenField ID="hdn_GLCode" runat="server" Value='<%#Eval("GL_Code") %>' />
                                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvGLAccHdr" CssClass="styleMandatoryLabel"
                                                                                            runat="server" ControlToValidate="ddlGLCode" InitialValue="--Select--" ErrorMessage="Select Account"
                                                                                            ValidationGroup="VgUpdate" Display="None">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </EditItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="20%" Wrap="False" />
                                                                                    <FooterStyle HorizontalAlign="Left" Width="20%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Sub Account">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" Text='<%#Eval("SL_Desc")%>' ID="lblSLAcc" ToolTip="Sub Account"></asp:Label>
                                                                                        <%--<asp:HiddenField ID="hdn_SLCode" runat="server" Value='<%#Eval("SL_Code") %>' />--%>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTot" runat="server" Text="Total   " />
                                                                                        <br></br>
                                                                                        <center>
                                                                                            <cc1:ComboBox ID="ddlSLCode" runat="server" CssClass="WindowsStyle" ValidationGroup="VgAdd"
                                                                                             Width ="130px"    DropDownStyle="DropDownList" AppendDataBoundItems="true" CaseSensitive="false"
                                                                                                AutoCompleteMode="SuggestAppend">
                                                                                            </cc1:ComboBox>
                                                                                            <%-- <asp:DropDownList ID="ddlSLCode" Width="130px" runat="server" ValidationGroup="VgAdd">
                                                                                            </asp:DropDownList>--%>
                                                                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvSLCode" CssClass="styleMandatoryLabel"
                                                                                                Enabled="false" runat="server" ControlToValidate="ddlSLCode" InitialValue="--Select--"
                                                                                                ErrorMessage="Select Sub Account" ValidationGroup="VgAdd" Display="None">
                                                                                            </asp:RequiredFieldValidator></center>
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <cc1:ComboBox ID="ddlSLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                                           Width ="130px"  AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                                        </cc1:ComboBox>
                                                                                        <%-- <asp:DropDownList ID="ddlSLCode" Width="130px" runat="server">
                                                                                        </asp:DropDownList>--%>
                                                                                        <asp:HiddenField ID="hdn_SLCode" runat="server" Value='<%#Eval("SL_Code") %>' />
                                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvSLCode" CssClass="styleMandatoryLabel"
                                                                                            Enabled="false" runat="server" ControlToValidate="ddlSLCode" InitialValue="--Select--"
                                                                                            ErrorMessage="Select Sub Account" ValidationGroup="VgUpdate" Display="None">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </EditItemTemplate>
                                                                                    <HeaderStyle Wrap="False" />
                                                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Debit">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" Text='<%#Eval("Debit")%>' ID="lblDebit" ToolTip="Debit"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTotDebit" runat="server" Text='<%#Eval("TotDebit")%>' ToolTip="Total Debit" />
                                                                                        <br></br>
                                                                                        <center>
                                                                                            <asp:TextBox MaxLength="15" Width="80px" runat="server" ID="txtDebit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" ToolTip="Debit"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtDebit"
                                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="None" Enabled="false"
                                                                                                CssClass="styleMandatoryLabel" ControlToValidate="txtDebit" ValidationGroup="VgAdd"
                                                                                                runat="server" ID="rfvDebit">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </center>
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox MaxLength="15" Width="80px" Text='<%#Eval("Debit")%>' runat="server"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" ToolTip="Debit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                            Style="text-align: right;" ID="txtDebit"></asp:TextBox>
                                                                                        <asp:HiddenField ID="hdn_Debit" runat="server" Value='<%#Eval("Debit") %>' />
                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1Hdr" runat="server" TargetControlID="txtDebit"
                                                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="None" Enabled="false"
                                                                                            CssClass="styleMandatoryLabel" ControlToValidate="txtDebit" ValidationGroup="VgUpdate"
                                                                                            runat="server" ID="rfvDebit">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </EditItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Credit">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" Text='<%#Eval("Credit")%>' ID="lblCredit" ToolTip="Credit"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Label ID="lblTotCredit" runat="server" Text='<%#Eval("TotCredit")%>' ToolTip="Total Credit" />
                                                                                        <br></br>
                                                                                        <center>
                                                                                            <asp:TextBox MaxLength="15" Width="80px" runat="server" ID="txtCredit" ToolTip="Credit"
                                                                                                onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                                Style="text-align: right;"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator SetFocusOnError="true" Display="None" Enabled="false"
                                                                                                CssClass="styleMandatoryLabel" ControlToValidate="txtCredit" ValidationGroup="VgAdd"
                                                                                                runat="server" ID="rfvCredit" ErrorMessage="Enter Debit or Credit Value">
                                                                                            </asp:RequiredFieldValidator>
                                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtCredit"
                                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                        </center>
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox MaxLength="15" Width="80px" runat="server" Text='<%#Eval("Credit")%>'
                                                                                            onmouseover="txt_MouseoverTooltip(this)" ToolTip="Credit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                            Style="text-align: right;" ID="txtCredit"></asp:TextBox>
                                                                                        <asp:HiddenField ID="hdn_Credit" runat="server" Value='<%#Eval("Credit") %>' />
                                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="None" Enabled="false"
                                                                                            CssClass="styleMandatoryLabel" ControlToValidate="txtCredit" ValidationGroup="VgUpdate"
                                                                                            runat="server" ID="rfvCredit" ErrorMessage="Enter Debit or Credit Value">
                                                                                        </asp:RequiredFieldValidator>
                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2Hdr" runat="server" TargetControlID="txtCredit"
                                                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                    </EditItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="DIM1" Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("DIM1") %>' />
                                                                                        <asp:Label runat="server" Text='<%#Eval("DIM1_Desc")%>' ID="lblDDIM1" ToolTip="DIM1"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:DropDownList ID="TddlDim1" Width="130px" runat="server" AutoPostBack="true"
                                                                                            OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged" />
                                                                                        <asp:HiddenField ID="hdn_Dim1" runat="server" Value="" />
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                       <%-- <asp:DropDownList ID="TddlDim1" Width="130px" runat="server" AutoPostBack="true"
                                                                                            OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged" />--%>
                                                                                          <asp:Label runat="server" Text='<%#Eval("DIM1_Desc")%>' ID="lblDDIM1" ToolTip="DIM1"></asp:Label>    
                                                                                        <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("DIM1") %>' />
                                                                                    </EditItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="DIM2" Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("DIM2") %>' />
                                                                                        <asp:Label runat="server" Text='<%#Eval("DIM2_Desc")%>' ID="lblDDIM2" ToolTip="DIM2"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:HiddenField ID="hdn_Dim2" runat="server" Value="" />
                                                                                        <asp:DropDownList ID="TddlDim2" Width="130px" runat="server" AutoPostBack="true"
                                                                                            OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("DIM2") %>' />
                                                                                        <%--<asp:DropDownList ID="TddlDim2" Width="130px" runat="server" AutoPostBack="true"
                                                                                            OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />--%>
                                                                                              <asp:Label runat="server" Text='<%#Eval("DIM2_Desc")%>' ID="lblDDIM2" ToolTip="DIM2"></asp:Label>
                                                                                    </EditItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <HeaderTemplate>
                                                                                        <asp:Label ID="lblDIM" runat="server" Text="DIM" />
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show"
                                                                                            ToolTip="Show DIM" />
                                                                                        <%--<asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                            OnClick="Show" ToolTip="Hide DIM" />--%>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show"
                                                                                            ToolTip="Show DIM" />
                                                                                       <%-- <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                            OnClick="Show" ToolTip="Hide DIM" />--%>
                                                                                    </EditItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show"
                                                                                            ToolTip="Show DIM" />
                                                                                        <%--<asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                            OnClick="Show" ToolTip="Hide DIM" />--%>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Dimension" Visible="False">
                                                                                    <ItemTemplate>
                                                                                        <center>
                                                                                            <asp:ImageButton ID="imgbtn" src="../Images/Dimm2.JPG" runat="server" 
                                                                                                ToolTip="Show DIM" />
                                                                                            <%--  <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("DIM1") %>' />
                                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("DIM2") %>' />--%>
                                                                                            <table>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <b>
                                                                                                            <asp:Label ID="lbldim1" Text="DIM1" runat="server" Visible="false" />
                                                                                                        </b>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <b>
                                                                                                            <asp:Label ID="lbldim2" Text="DIM2" runat="server" Visible="false" />
                                                                                                        </b>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <asp:DropDownList ID="ddlDim1" Width="130px" runat="server" Visible="false" />
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <asp:DropDownList ID="ddlDim2" Width="130px" runat="server" Visible="false" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                            <asp:ImageButton ID="img" src="../Images/uparrow_03.png" Visible="false" runat="server"
                                                                                                 ToolTip="Hide DIM" />
                                                                                            <asp:LinkButton ID="lnk" Text="OK" runat="server" Visible="false" />
                                                                                        </center>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <center>
                                                                                            <asp:ImageButton ID="imgbtn" src="../Images/Dimm2.JPG" runat="server" 
                                                                                                ToolTip="Show DIM" />
                                                                                            <%-- <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("DIM1") %>' />
                                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("DIM2") %>' />--%>
                                                                                            <table>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <b>
                                                                                                            <asp:Label ID="lbldim1" Text="DIM1" runat="server" Visible="false" />
                                                                                                        </b>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <b>
                                                                                                            <asp:Label ID="lbldim2" Text="DIM2" runat="server" Visible="false" />
                                                                                                        </b>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <asp:DropDownList ID="ddlDim1" Width="130px" runat="server" Visible="false" AutoPostBack="true"
                                                                                                            OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged" />
                                                                                                        <%--<asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim1" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlDim1" InitialValue="0" ErrorMessage="Select DIM1"
                                                            ValidationGroup="VgUpdate" Display="None">
                                                        </asp:RequiredFieldValidator>--%>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <asp:DropDownList ID="ddlDim2" Width="130px" runat="server" Visible="false" AutoPostBack="true"
                                                                                                            OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                                                        <%--<asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim2" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlDim2" InitialValue="0" ErrorMessage="Select DIM2"
                                                            ValidationGroup="VgUpdate" Display="None">
                                                        </asp:RequiredFieldValidator>--%>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                            <asp:ImageButton ID="img" src="../Images/uparrow_03.png" Visible="false" runat="server"
                                                                                                 ToolTip="Hide DIM" />
                                                                                            <asp:LinkButton ID="lnk" Text="OK" runat="server" Visible="false" />
                                                                                        </center>
                                                                                    </EditItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <br />
                                                                                        <center>
                                                                                            <%-- <asp:HiddenField ID="hdn_Dim1" runat="server" />
                                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" />--%>
                                                                                            <asp:ImageButton ID="imgbtn" src="../Images/Dimm2.JPG" runat="server" 
                                                                                                ToolTip="Show DIM" />
                                                                                            <table>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <b>
                                                                                                            <asp:Label ID="lbldim1" Text="DIM1" runat="server" Visible="false" />
                                                                                                        </b>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <b>
                                                                                                            <asp:Label ID="lbldim2" Text="DIM2" runat="server" Visible="false" />
                                                                                                        </b>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <asp:DropDownList ID="ddlDim1" runat="server" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged"
                                                                                                            Visible="false" />
                                                                                                        <%--<asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim1" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlDim1" InitialValue="0" ErrorMessage="Select DIM1"
                                                            ValidationGroup="VgAdd" Display="None">
                                                        </asp:RequiredFieldValidator>--%>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <asp:DropDownList ID="ddlDim2" runat="server" Width="130px" Visible="false" AutoPostBack="true"
                                                                                                            OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                                                        <%-- <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim2" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlDim2" InitialValue="0" ErrorMessage="Select DIM2"
                                                            ValidationGroup="VgAdd" Display="None"></asp:RequiredFieldValidator> --%>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                            <asp:ImageButton ID="img" src="../Images/uparrow_03.png" Visible="false" runat="server"
                                                                                                  ToolTip="Hide DIM" />
                                                                                            <asp:LinkButton ID="lnk" Text="OK" runat="server"   Visible="false" />
                                                                                        </center>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Remarks">
                                                                                    <ItemTemplate>
                                                                                        <%--<asp:Label runat="server" Text='<%#Eval("Remarks")%>' ID="lblRemarks" ToolTip="Remarks"></asp:Label>--%>
                                                                                        <center>
                                                                                            <asp:TextBox runat="server" Width="120px" TextMode="MultiLine" Text='<%#Eval("Remarks")%>'
                                                                                                ReadOnly="true" ToolTip="Remarks" ID="txtRemarks"></asp:TextBox>
                                                                                        </center>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <center>
                                                                                            <br>
                                                                                            </br>
                                                                                            <asp:TextBox runat="server" TextMode="MultiLine" ValidationGroup="Footer" MaxLength="100"
                                                                                                ToolTip="Remarks" Width="120px" onkeyup="maxlengthfortxt(100);" ID="txtRemarks"></asp:TextBox>
                                                                                        </center>
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <center>
                                                                                            <asp:TextBox runat="server" Width="120px" TextMode="MultiLine" Text='<%#Eval("Remarks")%>'
                                                                                                ToolTip="Remarks" ValidationGroup="Footer" MaxLength="100" onkeyup="maxlengthfortxt(100);"
                                                                                                ID="txtRemarks"></asp:TextBox>
                                                                                        </center>
                                                                                    </EditItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                                    <FooterStyle HorizontalAlign="Left" Width="15%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                                                            ToolTip="Edit">
                                                                                        </asp:LinkButton>&nbsp;|
                                                                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete"
                                                                                            OnClientClick="return confirm('Are you sure you want to Delete this record?');"
                                                                                            ToolTip="Delete">
                                                                                        </asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <%--  <asp:Button ID="btnAdd" Width="50px" runat="server" CommandName="Add" ValidationGroup="VgAdd"
                                                        CssClass="styleSubmitShortButton" Text="Add"></asp:Button>--%>
                                                                                        <br>
                                                                                        </br>
                                                                                        <asp:LinkButton ID="lnkAdd" runat="server" CommandName="Add" ValidationGroup="VgAdd"
                                                                                            ToolTip="Add" CssClass="styleSubmitShortButton" Text="Add"></asp:LinkButton>
                                                                                    </FooterTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                            ValidationGroup="VgUpdate" ToolTip="Update"></asp:LinkButton>&nbsp;|
                                                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                            CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                                                    </EditItemTemplate>
                                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                </center>
                                                                 <asp:HiddenField ID="hdn_DIM1_Type" runat="server" />
                                                    <asp:HiddenField ID="hdn_DIM2_Type" runat="server" />
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleButtonArea" align="center">
                                                            <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators('Header');"
                                                                ToolTip="Save" CssClass="styleSubmitButton" ValidationGroup="Header" Text="Save"
                                                                OnClick="btnSave_Click" />
                                                            &nbsp;<asp:Button runat="server" ID="btnClear" CausesValidation="False" CssClass="styleSubmitButton"
                                                                ToolTip="Clear_FA" Text="Clear_FA" OnClientClick="return fnConfirmClear();" 
                                                                OnClick="btnClear_Click" />
                                                            &nbsp;<asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="False"
                                                                ToolTip="Cancel" CssClass="styleSubmitButton" OnClick="btnCancel_Click" />
                                                                 <asp:Button runat="server" ID="btnPrint" Text="Print" Enabled="False" CausesValidation="False"
                                                                ToolTip="Print" CssClass="styleSubmitButton" OnClick="btnPrint_Click" />
                                                            <asp:Button runat="server" ID="btnCancelMJV" OnClick="btnCancelMJV_Click" Text="Cancel MJV"
                                                                ToolTip="Cancel MJV" Enabled="False" CausesValidation="False" CssClass="styleSubmitButton"
                                                                OnClientClick="return fnCancelClick();" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Button runat="server" ID="btnpop" CssClass="styleSubmitButton" Text="Ok" Style="display: none" />
                                                            <cc1:ModalPopupExtender ID="popup" runat="server" TargetControlID="btnpop" PopupControlID="pnlpop"
                                                                BackgroundCssClass="styleModalBackground" DynamicServicePath="" 
                                                                Enabled="True">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Panel ID="pnlpop" runat="server" Style="display: none" BackColor="White"
                                                                BorderStyle="Solid">
                                                                <asp:DropDownList ID="ddl" runat="server" />
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                      
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                            <tr class="styleButtonArea">
                                <td>
                                    <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="Header" Width="500px"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <asp:ValidationSummary runat="server" ID="VSAdd" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgAdd" Width="500px"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <asp:ValidationSummary runat="server" ID="VSUpdate" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgUpdate" Width="500px"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <input type="hidden" runat="server" value="0" id="hdnRowID" />
                                    <input type="hidden" runat="server" value="1" id="hdnAccValid" />
                                    <input type="hidden" runat="server" value="0" id="hdnStatus" />
                                    <asp:CustomValidator ID="cvManualJournal" runat="server" CssClass="styleMandatoryLabel"
                                        Enabled="true" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <%--<tr>
            <td style="display: none">
                <asp:Button runat="server" ID="btnPrintNew" BackColor="White" Height="0px" CausesValidation="false"
                    OnClick="btnPrint_Click" />
            </td>
        </tr>--%>
    </table>

    <script language="javascript" type="text/javascript">
        function FunShowPath(input) {
            if (input != null) {
                var objID = input.id;
                var myThrobber = document.getElementById((input.id).replace('asyFileUpload', 'myThrobber'));
                if (myThrobber != null) {
                    if (myThrobber.innerText != "")
                        input.setAttribute('title', myThrobber.innerText);
                }
            }
        }
 
    
    function fnDateChange(sender,dt) 
        { 
        if (sender.value > dt) {
       
        //alert('You cannot select a date greater than system date');
        alert('hi');
       // sender._textbox.set_Value(today.format(sender._format));

    }
        
      
        } 
        

function checkDate_NextSystemDate1(sender, args) {
    var today = new Date();
    if (sender._selectedDate > today) {
       
        //alert('You cannot select a date greater than system date');
        alert('MJV Value Date cannot be greater than system date');
        sender._textbox.set_Value(today.format(sender._format));
    
    }
    document.getElementById(sender._textbox._element.id).focus();
    
}    
   

    

    function FnValidate(txtDebit,txtCredit,idReqCredit,idReqDebit)
    {
       //alert(idReqDebit);
         //document.getElementById(idReqDebit).enabled=false;
         if((document.getElementById(txtDebit).value=='')&&(document.getElementById(txtCredit).value==''))
         {
             document.getElementById(idReqCredit).enabled=true;
             document.getElementById(idReqDebit).enabled=true;
            //document.getElementById(idReqCredit).className = 'styleReqFieldFocus';
            //document.getElementById(idReqDebit).className = 'styleReqFieldFocus';
         }
         else
          {
            document.getElementById(idReqCredit).enabled=false;
            document.getElementById(idReqDebit).enabled=false;
            
          }  
        if(!fnCheckPageValidators('Footer',false))
            return false;
        
        return true;
    }
    
        function fnDiableCredit(idDebit,idCredit,ctrlId)
      {
    
      var txtDebit=document.getElementById(idDebit);
      var txtCredit=document.getElementById(idCredit);
      
        //var txtDebit=document.getElementById('ctl00_ContentPlaceHolder1_gvManualJournal_ctl03_txtDebit');
        //var txtCredit=document.getElementById('ctl00_ContentPlaceHolder1_gvManualJournal_ctl03_txtCredit');
        if(txtCredit.enabled==true )
        txtCredit.disabled=false;
        if(txtDebit.enabled==true )
        txtDebit.disabled=false;
        //alert(txtDebit.value);
        if ((txtDebit.value=="")&&(txtCredit.value==""))
        
        {
            txtDebit.value="";
            txtCredit.value="";
            return;
        }
        
       if ((txtDebit.value!="")&&(ctrlId=='C'))
            {
            txtCredit.value="";
            return;
            }
        if ((txtCredit.value!="")&&(ctrlId=='D'))
            {
                txtDebit.value="";
                return;
            }
            
      }

      function fnLoadEntity() {
          document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
      }
      
      function fnCancelClick()
      {
        if(confirm('Are you sure you want to cancel?'))
         {
           return true;
         }
        else
         {
           return false;
         }
      }
      
    </script>

</asp:Content>

