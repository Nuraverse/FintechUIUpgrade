<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnMemorandumBooking, App_Web_3jwyxbhk" enableeventvalidation="false" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%--<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <div class="row">
                            <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" Width="99%" GroupingText="Booking Header">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none;">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDocDate" runat="server" ToolTip="Document Date" Visible="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtDocDate"
                                                OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                ID="CEDocDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <asp:HiddenField ID="hdndefaultdate" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDocDate" runat="server" Text="Document Date" CssClass="styleReqFieldLabel"
                                                    Visible="false"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" class="md-form-control form-control" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                ToolTip="Line of Business">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box" style="top: 28px !important;">
                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ErrorMessage="Select a Line of Business"
                                                    ValidationGroup="Submit" Display="Dynamic" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                    ControlToValidate="ddlLOB"></asp:RequiredFieldValidator>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"></asp:DropDownList>
                                            <%-- <uc:Suggest ID="ddlBranch" ToolTip="Branch Code" runat="server" AutoPostBack="True" OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                                ServiceMethod="GetBranchList" IsMandatory="true" ValidationGroup="Submit" ErrorMessage="Select a Branch Code" WatermarkText="--Select--" />--%>
                                            <asp:Label runat="server" ID="lblOpnYear" Style="display: none" />
                                            <asp:Label runat="server" ID="lblOpnMnth" Style="display: none" />
                                            <asp:HiddenField ID="hdnApplicationAppDate" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box" style="top: 28px !important;">
                                                <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ErrorMessage="Select a Branch"
                                                    ValidationGroup="Submit" Display="Dynamic" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                    ControlToValidate="ddlBranch"></asp:RequiredFieldValidator>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" Text="Branch" ToolTip="Branch" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:Panel ID="disp" runat="server" Height="300px" ScrollBars="Vertical" Style="display: none" />
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" IsMandatory="true" AutoPostBack="true" DispalyContent="Both" class="md-form-control form-control"
                                                strLOV_Code="CUS_COM_MEMO" ServiceMethod="GetCustomerList"   OnItem_Selected="ucCustomerCodeLov_Item_Selected"/>
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" />
                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                            <asp:Button ID="btncust" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btncust_Click"
                                                Style="display: none" />
                                            <%--<uc2:LOV ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" runat="server" DispalyContent="Code"
                                                strLOV_Code="CMB" TabIndex="-1" />
                                            <a href="#" onclick="window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromApplication=Yes&NewCustomerID=0', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=no,scrollbars=yes,top=150,left=100');return false;">
                                                <asp:TextBox ID="cmbCustomerCode" runat="server" MaxLength="50" AutoPostBack="true"
                                                    Style="display: none" CssClass="styleSearchBox" ToolTip="Customer Code" 
                                                    OnTextChanged="cmbCustomerCode_TextChanged"></asp:TextBox>
                                                <cc1:AutoCompleteExtender ID="AutoCompleteExtenderCust" runat="server" TargetControlID="cmbCustomerCode"
                                                    ServiceMethod="GetCustomerList" MinimumPrefixLength="1" CompletionSetCount="5"
                                                    CompletionInterval="1" DelimiterCharacters="" Enabled="True" ServicePath="" FirstRowSelected="true"
                                                    CompletionListElementID="disp">
                                                </cc1:AutoCompleteExtender>--%>
                                            <%--<div class="validation_msg_box" style="top: 28px !important;">
                                                <asp:RequiredFieldValidator ID="rfvCustomerCode" runat="server" ErrorMessage="Select a Customer Code"
                                                    ValidationGroup="Submit" Display="Dynamic" SetFocusOnError="True" ControlToValidate="cmbCustomerCode"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                                strLOV_Code="ACC_ACCA" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" OnItem_Selected="ucAccountLov_Item_Selected"/>
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />
                                            <asp:Button ID="btnAccount" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnAccount_Click"
                                                Style="display: none" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblMLA" runat="server" ToolTip="Account Number" CssClass="styleReqFieldLabel"
                                                    Text="Account Number"></asp:Label>
                                            </label>
                                            <%--<asp:DropDownList ID="ddlPANum" runat="server" AutoPostBack="True" ToolTip="Prime Account Number"
                                                OnSelectedIndexChanged="ddlMLA_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box" style="top: 28px !important;">
                                                <asp:RequiredFieldValidator ID="rfvMLA" runat="server" ErrorMessage="Select a Prime Account Number"
                                                    ValidationGroup="Submit" Display="None" SetFocusOnError="True" InitialValue="0"
                                                    ControlToValidate="ddlPANum">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box" style="top: 28px !important;">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select a Prime Account Number"
                                                    ValidationGroup="Submit" Display="Dynamic" SetFocusOnError="True" ControlToValidate="ddlPANum">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblPANum" runat="server" Text="Prime Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none;">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlSANum" runat="server" ToolTip="Sub Account Number" AutoPostBack="True" class="md-form-control form-control"
                                                OnSelectedIndexChanged="ddlSANum_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box" style="top: 28px !important;">
                                                <asp:RequiredFieldValidator ID="rfvSANum" runat="server" ErrorMessage="Sub Account is required when Prime Account is base "
                                                    ValidationGroup="Submit" Display="Dynamic" InitialValue="0" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                    ControlToValidate="ddlSANum" Enabled="false">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblSANum" runat="server" Text="Sub Account Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <%--<td valign="top" width="50%" align="left">
                                    <asp:Panel ID="pnlCustomerInfo" runat="server" CssClass="stylePanel" GroupingText="Customer Information">
                                        <table cellspacing="0" width="100%">
                                            <tr width="100%">
                                                <td>
                                                    <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" ShowCustomerCode="false"
                                                        FirstColumnStyle="styleFieldLabel" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>--%>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <div class="row">

                            <asp:Panel ID="pnlgrvSummary" ScrollBars="None" runat="server" CssClass="stylePanel" GroupingText="Summary" HorizontalAlign="Center" Visible="false">
                                <div class="gird">
                                    <asp:GridView ID="grvSummary" runat="server" AutoGenerateColumns="False" ShowFooter="false" Width="100%" class="gird_details">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNo0" runat="server" Text="<%#Container.DataItemIndex + 1%>" ToolTip="S.No"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cashflow Desc" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblConstitution" runat="server" Text='<%#Eval("CashflowDesc")%>' ToolTip="CashflowDesc"></asp:Label>
                                                    <asp:Label ID="lblmemotype" runat="server" Text='<%#Eval("MEMO_TYPE")%>' ToolTip="CashflowDesc" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Debit" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Credit" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Current Transaction" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCurrent_Transaction" runat="server" Text='<%#Eval("Current_Transaction")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Balance" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <RowStyle HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                            </asp:Panel>

                        </div>
                    </div>
                </div>
                <asp:Panel ID="panMemorandumAmount" runat="server" Visible="false" GroupingText="">

                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblDueAmt" runat="server" CssClass="styleDisplayLabel" Text="Due Amount" Style="padding-left: 10px"></asp:Label>
                        </div>
                        <div class="col">
                            :
                                            <asp:Label ID="lblDueAmount" runat="server" Style="padding-left: 5px" ToolTip="Due Amount"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblReceivedAmt" runat="server" CssClass="styleDisplayLabel" Text="Received Amount"></asp:Label>
                        </div>
                        <div class="col">
                            :
                                            <asp:Label ID="lblReceivedAmount" runat="server" Style="padding-left: 5px" ToolTip="Received Amount "></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="panMemorandumDetails" Visible="false" runat="server" GroupingText="Memorandum Details"
                    CssClass="stylePanel" Width="99%">
                    <asp:Panel ID="pnlMemoType" runat="server" CssClass="stylePanel" Visible="false"
                        Width="99%" GroupingText="">
                        <div>
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblMemoType" runat="server" Text="Charge Type" Style="padding-left: 10px"></asp:Label>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblMemoTypeVal" Style="padding-left: 5px" runat="server" ToolTip="Charge Type"
                                        CssClass="styleDisplayLabel"></asp:Label>
                                </div>
                                <div class="col">
                                    <asp:Label ID="Label1" runat="server" Text="Cash Basis Account JV"></asp:Label>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblGLAccountVal" Style="padding-left: 5px" runat="server" ToolTip="Cash Basis Account JV"
                                        CssClass="styleDisplayLabel"></asp:Label>
                                </div>
                                <div class="col">
                                    <asp:Label ID="Label2" runat="server" Text="Cash Basis Sub Account JV"></asp:Label>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblSLAccountVal" runat="server" Style="padding-left: 5px" ToolTip="Cash Basis Sub Account JV"
                                        CssClass="styleDisplayLabel"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="Label3" runat="server" Text="Due Amount" Style="padding-left: 10px"></asp:Label>
                                </div>
                                <div class="col">
                                    :
                                            <asp:Label ID="lblDueAmount1" runat="server" Style="padding-left: 5px" ToolTip="Due Amount"
                                                CssClass="styleDisplayLabel"></asp:Label>
                                </div>
                                <div class="col">
                                    <asp:Label ID="Label5" runat="server" Text="Received Amount"></asp:Label>
                                </div>
                                <div class="col">
                                    :
                                            <asp:Label ID="lblReceivedAmount1" runat="server" Style="padding-left: 5px" ToolTip="Received Amount "
                                                CssClass="styleDisplayLabel"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                </asp:Panel>
                <%--<div class="row">--%>
                <div class="gird">
                    <asp:Panel runat="server" ID="Panel7" CssClass="stylePanel" GroupingText="Memorandum Details" ScrollBars="Auto" Width="100%">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:GridView ID="grvMemorandumDetails" runat="server" AutoGenerateColumns="False" Width="100%"
                                DataKeyNames="Sno" EditRowStyle-CssClass="styleFooterInfo" ShowFooter="True"
                                OnRowDataBound="grvMemorandumDetails_RowDataBound" OnRowEditing="grvMemorandumDetails_RowEditing"
                                OnRowDeleting="grvMemorandumDetails_DeleteClick" OnRowCancelingEdit="grvMemorandumDetails_RowCancelingEdit"
                                OnRowUpdating="grvMemorandumDetails_RowUpdating" class="gird_details">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsno" runat="server" Text='<%#Container.DataItemIndex+1  %>' ToolTip="Sl.No."></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="1%" HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAccountNo" runat="server" Text='<%# Bind("Panum") %>' ToolTip="Account No"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Memo No." Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDoc_Ref_No" runat="server" Text='<%# Bind("Doc_Ref_No") %>' ToolTip="Memo Number"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Memo Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemoDesc" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <%--<ItemStyle Width="10%" HorizontalAlign="Center" />--%>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlMemoDesc" runat="server" Width="120px" ToolTip="Memo Description" AutoPostBack="true" OnSelectedIndexChanged="ddlMemoDesc_SelectedIndexChanged" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvMemoDesc" runat="server" CssClass="validation_msg_box_sapn" InitialValue="0" ControlToValidate="ddlMemoDesc"
                                                        Display="Dynamic" ErrorMessage="Select a Memo Description" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlMemoDesc"
                                                        Display="Dynamic" ErrorMessage="Select a Memo Description" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlMemoDesc" runat="server" Width="120px" ToolTip="Memo Description" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvMemoDesc1" runat="server" CssClass="validation_msg_box_sapn" InitialValue="0" ControlToValidate="ddlMemoDesc"
                                                        Display="Dynamic" ErrorMessage="Select a Memo Description" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RFVMemoDesc" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="ddlMemoDesc"
                                                        Display="Dynamic" ErrorMessage="Select a Memo Description" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <%--<ItemStyle Width="10%" HorizontalAlign="Center" />--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="GL Account">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGL_Account_Desc" runat="server" Text='<%# Bind("GL_Account_Desc") %>' ToolTip="GL Account"></asp:Label>
                                            <asp:Label ID="lblGLAC" runat="server" Text='<%# Bind("GL_Account") %>' Visible="false" ToolTip="GL Account"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblGLACF" Width="120px" runat="server" Text='<%# Bind("GL_Account") %>' ToolTip="GL Account"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SL Account" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSL_Account_Desc" runat="server" Text='<%# Bind("SL_Account_Desc") %>' ToolTip="GL Account"></asp:Label>
                                            <asp:Label ID="lblSLAC" runat="server" Text='<%# Bind("SL_Account") %>' Visible="false" ToolTip="SL Account"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>

                                            <asp:Label ID="lblSLACF" Width="120px" runat="server" Text='<%# Bind("GL_Account") %>' ToolTip="SL Account"></asp:Label>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Doc. Date" Visible="true">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemo_Booking_Date" Width="100px" runat="server" Text='<%# Bind("Memo_Booking_Date") %>'
                                                ToolTip="Doc. Date"></asp:Label>
                                        </ItemTemplate>
                                        <%--<ItemStyle Width="15%" HorizontalAlign="Center" />--%>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtFDocDate" runat="server" Width="100px" ToolTip="Doc. Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:CalendarExtender runat="server" TargetControlID="txtFDocDate"
                                                    ID="FCEDocDate" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="FrfvDocDate" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Document Date"
                                                        ValidationGroup="Add" Display="Dynamic" SetFocusOnError="false" ControlToValidate="txtFDocDate"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtEDocDate" runat="server" Width="100px" ToolTip="Doc. Date" Text='<%# Bind("Memo_Booking_Date") %>'
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:CalendarExtender runat="server" TargetControlID="txtEDocDate"
                                                    ID="ECEDocDate" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="ErfvDocDate" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Doc.Date"
                                                        ValidationGroup="Add" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEDocDate"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <%--<ItemStyle Width="20%" HorizontalAlign="Center" />--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValueDate" Width="100px" runat="server" Text='<%# Bind("ValueDate") %>' ToolTip="Voucher Date"></asp:Label>
                                        </ItemTemplate>
                                        <%--<ItemStyle Width="15%" HorizontalAlign="Center" />--%>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtFValueDate" runat="server" ToolTip="Value Date" Width="100px" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                <cc1:CalendarExtender runat="server" TargetControlID="txtFValueDate" ID="FCEValueDate"
                                                    Enabled="True">
                                                </cc1:CalendarExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="FrfvValueDate" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Voucher Date"
                                                        ValidationGroup="Add" Display="Dynamic" SetFocusOnError="false" ControlToValidate="txtFValueDate"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtEValueDate" runat="server" ToolTip="Voucher Date" Width="100px" Text='<%# Bind("ValueDate") %>'
                                                    class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                <cc1:CalendarExtender runat="server" TargetControlID="txtEValueDate" ID="ECEValueDate"
                                                    Enabled="True">
                                                </cc1:CalendarExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="ErfvValueDate" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Voucher Date"
                                                        ValidationGroup="Add" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEValueDate"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <%--<ItemStyle Width="10%" HorizontalAlign="Center" />--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocVoucherType" runat="server" Text='<%# Bind("DOC_Voucher_Type_Desc") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlDocVoucherTypeF" runat="server" Width="130px" ToolTip="Voucher Type" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <%-- <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvDocVoucherTypeF" runat="server" CssClass="validation_msg_box_sapn" InitialValue="0" ControlToValidate="ddlDocVoucherTypeF"
                                                        Display="Dynamic" ErrorMessage="Select a Doc Voucher Type" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                </div>--%>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlDocVoucherTypeE" runat="server" Width="130px" ToolTip="Voucher Type" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <%--<div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvddlDocVoucherTypeE" runat="server" CssClass="validation_msg_box_sapn" InitialValue="0" ControlToValidate="ddlDocVoucherTypeE"
                                                        Display="Dynamic" ErrorMessage="Select a Doc Voucher Type" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                </div>--%>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Voucher No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocVoucherNo" runat="server" Text='<%# Bind("DOC_Voucher_No") %>' ToolTip="Voucher No"
                                                Style="padding-left: 5px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtDocVoucherNoF" runat="server" MaxLength="50" Width="150px"
                                                    ToolTip='<%# Bind("DOC_Voucher_No") %>' CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtDocVoucherNoE" runat="server" MaxLength="50" Width="150px" CssClass="md-form-control form-control login_form_content_input"
                                                    ToolTip='<%# Bind("DOC_Voucher_No") %>' Text='<%# Bind("DOC_Voucher_No") %>'></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Memo Booking/Waiver">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemoFlag" runat="server" Text='<%# Bind("Memo_Flag_Desc") %>' Width="100px"></asp:Label>
                                        </ItemTemplate>
                                        <%--<ItemStyle Width="20%" HorizontalAlign="Center" />--%>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlMemoFlag" runat="server" ToolTip="Memo Flag" Width="100px" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvMemoFlag1" runat="server" CssClass="validation_msg_box_sapn" InitialValue="0" ControlToValidate="ddlMemoFlag"
                                                        Display="Dynamic" ErrorMessage="Select a Memo Flag" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlMemoFlag" runat="server" ToolTip="Memo Flag" Width="70px" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <%--<div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvMemoFlag1" runat="server" InitialValue="0" CssClass="validation_msg_box_sapn" ControlToValidate="ddlMemoFlag"
                                                        Display="Dynamic" ErrorMessage="Select a Memo Flag" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                </div>--%>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Left" />
                                        <%--<ItemStyle Width="10%" HorizontalAlign="Center" />--%>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Due_Amount") %>' ToolTip="Amount"
                                                Style="padding-right: 5px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <%--<ItemStyle Width="15%" HorizontalAlign="Center" />--%>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtAmount" runat="server" Width="125px" ToolTip="Amount" onkeypress="fnAllowNumbersOnly(true,false,this)" OnTextChanged="txtAmount_TextChanged" AutoPostBack="true"
                                                    Style="text-align: right" MaxLength="14" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" TargetControlID="txtAmount"
                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="txtAmount" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" ErrorMessage="Enter the Amount" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                                <%--<div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="frvamtf" runat="server" ControlToValidate="txtAmount" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" ErrorMessage="Amount Cannot be Zero" ValidationGroup="Add" InitialValue="0">
                                                    </asp:RequiredFieldValidator>
                                                </div>--%>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="etxtAmount" runat="server" Width="125px" ToolTip="Amount" onkeypress="fnAllowNumbersOnly(true,false,this)" OnTextChanged="txtAmount_TextChanged1" AutoPostBack="true"
                                                    Style="text-align: right" MaxLength="14" Text='<%# Bind("Due_Amount") %>' class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" TargetControlID="etxtAmount"
                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="rfvAmounte" runat="server" ControlToValidate="etxtAmount" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" ErrorMessage="Enter the Amount" ValidationGroup="Add">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                                <%-- <div class="validation_msg_box" style="top: 28px !important;">
                                                    <asp:RequiredFieldValidator ID="frvamte" runat="server" ControlToValidate="etxtAmount" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" ErrorMessage="Amount Cannot be Zero" ValidationGroup="Add" InitialValue="0">
                                                    </asp:RequiredFieldValidator>
                                                </div>--%>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <%--<ItemStyle Width="10%" HorizontalAlign="Center" />--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Balance">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbCurrentBalanceAmount" runat="server" Text='<%# Bind("BALANCE") %>' ToolTip="Balance"
                                                Style="padding-right: 5px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Received Amount" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReceived_Amount" runat="server" Text='<%# Bind("Received_Amount") %>'
                                                ToolTip="Received Amount"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ActualAmount" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblActAmount1" runat="server" Text='<%# Bind("ActualAmount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Received_Actualamount" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReceived_Actualamount" runat="server" Text='<%# Bind("Received_Actualamount") %>'></asp:Label>
                                            <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                            <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Memo_Type" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemoTypeIDc" runat="server" Text='<%# Bind("Memo_Type") %>'></asp:Label>
                                            <asp:Label ID="lblMEMO_DOCUMENT_TYPE" runat="server" Text='<%# Bind("MEMO_DOCUMENT_TYPE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Remarks">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>' ToolTip="Remarks"
                                                Style="padding-left: 5px"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtRemarks" runat="server" onkeyup="maxlengthfortxt(50)" TextMode="MultiLine" Width="150px"
                                                    ToolTip='<%# Bind("Remarks") %>' CssClass="md-form-control form-control login_form_content_input lowercase"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtRemarks" runat="server" onkeyup="maxlengthfortxt(50)" Width="150px" TextMode="MultiLine" CssClass="md-form-control form-control login_form_content_input lowercase"
                                                    ToolTip='<%# Bind("Remarks") %>' Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <%--<ItemStyle Width="10%" HorizontalAlign="Left" />--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("USER_NAME") %>' ToolTip="User Name"></asp:Label>
                                            <asp:Label ID="lblpanumacc" runat="server" Text='<%# Bind("Panum") %>' ToolTip="Panum" Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="1%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" HeaderStyle-HorizontalAlign="Left">
                                        <EditItemTemplate>
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="lnkUpdate" ValidationGroup="Add" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn"
                                                                AccessKey="U" ToolTip="Update, Alt+U"></asp:LinkButton>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn"
                                                                CausesValidation="false" AccessKey="V" ToolTip="Cancel, Alt+V"></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <%-- <div class="md-input" style="margin: 0px;">
                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn" AccessKey="G"
                                                    ValidationGroup="Add" ToolTip="Update,Alt+G"></asp:LinkButton>
                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="grid_btn" CommandName="Cancel"
                                                    CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>--%>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CssClass="grid_btn" CommandName="Edit" CausesValidation="false" AccessKey="N"
                                                                ToolTip="Edit,Alt+N">
                                                            </asp:LinkButton>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="grid_btn_delete" CausesValidation="false" AccessKey="T" Text="Delete"
                                                                OnClientClick="return confirm('Do you want Delete this record?');" ToolTip="Delete,Alt+T">
                                                            </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>

                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <%--<div class="md-input" style="margin: 0px;">--%>

                                            <asp:Button ID="btnAdd" runat="server" CommandName="Add" CssClass="grid_btn"
                                                OnClick="btnAdd_Click" Text="Add" ValidationGroup="Add" ToolTip="Add,Alt+G" AccessKey="G" />
                                            <%--</div>--%>
                                            <%--<button class="css_btn_enabled" id="btnAdd" title="Add,Alt+A" onserverclick="btnAdd_Click" runat="server"
                                                    type="button" accesskey="A" validationgroup="Add">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                </button>--%>
                                        </FooterTemplate>
                                        <%--<ItemStyle Width="30%"  HorizontalAlign="Right" />
                                        <FooterStyle Width="30%" HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="Center" />--%>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                </div>
                <%--</div>--%>
                <div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Submit'))" causesvalidation="false" validationgroup="Submit" runat="server" onserverclick="btnSave_Click"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                            onserverclick="btnClear_Click"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <asp:Button ID="btnLoadCustomer" runat="server" Style="display: none" Text="Load Customer"
                            OnClick="btnLoadCustomer_OnClick" AccessKey="C" ToolTip="Load Customer,Alt+C" />
                    </div>
                    <%-- <tr>
                        <td align="center">
                            <br />
                            <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" OnClick="btnSave_Click" AccessKey="S"
                                OnClientClick="return fnCheckPageValidators('Submit');" Text="Save" ValidationGroup="Submit"
                                meta:resourcekey="btnSaveResource1" ToolTip="Save,Alt+S" />
                            <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                                ToolTip="Clear,Alt+L" AccessKey="L" meta:resourcekey="btnClearResource1" />
                            <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                Text="Exit" OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" OnClientClick="return fnConfirmExit();"
                                ToolTip="Exit,Alt+X" AccessKey="X" />
                           
                        </td>
                    </tr>--%>
                    <div class="row">
                        <asp:ValidationSummary ID="vsEntityMaster" runat="server" CssClass="styleMandatoryLabel" Enabled="false" Visible="false"
                            HeaderText="Correct the following validation(s):" ValidationGroup="Add" meta:resourcekey="vsEntityMasterResource1" />
                        <asp:ValidationSummary ID="vsEntityMaster_bank" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" meta:resourcekey="vsEntityMaster_bankResource1" Enabled="false" Visible="false" />
                    </div>
                    <div class="row">
                        <asp:CustomValidator ID="cvMemorandumBooking" runat="server" CssClass="styleMandatoryLabel" Enabled="false" Visible="false"
                            Width="98%" Display="None" />
                        <span id="lblErrorMessage" runat="server" style="font-size: medium"></span>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="hdnCustomerID" runat="server" />
    <input type="hidden" id="hdnAccountID" runat="server" />
    <input type="hidden" id="hdnDueAmount" runat="server" />
    <input type="hidden" id="hdnReceivedAmount" runat="server" />
    <input type="hidden" id="hdnCalAmount" runat="server" />

    <script language="javascript" type="text/javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();

        prm.add_initializeRequest(initializeRequest);
        prm.add_endRequest(endRequest);

        function initializeRequest(sender, args) {
            document.body.style.cursor = "wait";

            if (prm.get_isInAsyncPostBack()) {
                args.set_cancel(true);
            }
        }

        function endRequest(sender, args) {
            document.body.style.cursor = "default";
        }

        // function fnLoadCustomer() {
        //  document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
        //}

        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }


        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById("<%= btncust.ClientID %>").click();
            }
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                //alert('test1');
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";

            }
            if (document.getElementById(e + '_TxtName').value == "") {
                //alert('test2');
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                //alert('test3');
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    //alert('test4');
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + 'ucCustomerCodeLov').value = "0";
                    document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
                }
            }
        }

        function fnTrashCommonAccSuggest(e) {

            //Sathish R--13-11-2018
            //alert('acctest1');
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById("<%= btnAccount.ClientID %>").click();
            }
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                //alert('test1');
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=ucAccountLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                //alert('test2');
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucAccountLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                //alert('test3');
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    //alert('test4');
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + 'ucAccountLov').value = "0";
                }
            }
        }

        function fnTrashSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }

    </script>

</asp:Content>
