<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAPriorPeriodJV, App_Web_sravfnz4" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Prior Period Journal" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div style="display: none" class="col">

                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                        </div>
                    </div>
                    <div class="row">
                        <cc1:TabContainer ID="tcJV" runat="server" CssClass="styleTabPanel" Width="99%" TabStripPlacement="top"
                            ActiveTabIndex="0">
                            <cc1:TabPanel runat="server" HeaderText="Prior Period JV Details" ID="tpJV" CssClass="tabpan"
                                BackColor="Red" TabIndex="0">
                                <HeaderTemplate>
                                    Prior Period JV Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="pnlHeader" runat="server" CssClass="stylePanel" GroupingText="Header details">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlActivity" ValidationGroup="Header" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvAvtivity" SetFocusOnError="True" runat="server"
                                                                                ValidationGroup="Header" ControlToValidate="ddlActivity" CssClass="validation_msg_box_sapn"
                                                                                ErrorMessage="Select Activity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblActivity" runat="server" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>

                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMJVNo" class="md-form-control form-control login_form_content_input requires_true" onmouseover="txt_MouseoverTooltip(this)"
                                                                            ToolTip="MJV Number" runat="server" AutoPostBack="true"></asp:TextBox>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblMJVNO" runat="server" Text="Prior Period JV Number"></asp:Label>

                                                                        </label>
                                                                    </div>
                                                                </div>


                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="True" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">

                                                                            <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server" CssClass="validation_msg_box_sapn"
                                                                                ValidationGroup="Header" ControlToValidate="ddlLocation"
                                                                                ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblLocation" runat="server" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>

                                                                        </label>
                                                                    </div>

                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMJVDate" ToolTip="Prior Period JV Date" runat="server" AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"
                                                                            onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtMJVDate_TextChanged" ReadOnly="true"></asp:TextBox>

                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ErrorMessage="Select MJV Date" ValidationGroup="Header"
                                                                                ID="rfvMJVDate" runat="server" ControlToValidate="txtMJVDate" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <asp:Image ID="imgDate" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="false"
                                                                            PopupButtonID="imgDate" TargetControlID="txtMJVDate">
                                                                        </cc1:CalendarExtender>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblMJVDate" runat="server" CssClass="styleReqFieldLabel" Text="Prior Period JV Date"></asp:Label>

                                                                        </label>
                                                                    </div>

                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMJVValueDate" AutoPostBack="True" OnTextChanged="txtMJVValueDate_TextChanged" ReadOnly="true"
                                                                            onmouseover="txt_MouseoverTooltip(this)" ToolTip="MJV Value Date" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ErrorMessage="Select MJV Value Date" ValidationGroup="Header"
                                                                                ID="rfvMJVValueDate" runat="server" ControlToValidate="txtMJVValueDate" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <asp:Image ID="imgMJVValueDate" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="false"
                                                                            PopupButtonID="imgMJVValueDate"
                                                                            TargetControlID="txtMJVValueDate">
                                                                        </cc1:CalendarExtender>
                                                                        <asp:CustomValidator ID="rfvCompareMJVDate" runat="server" Display="None" CssClass="styleMandatoryLabel"
                                                                            ValidationGroup="Header" ErrorMessage="Difference between MJV Date and MJV Value Date must be 30 days"></asp:CustomValidator>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblMJVValueDate" runat="server" CssClass="styleReqFieldLabel" Text="Prior Period JV Value Date"></asp:Label>

                                                                        </label>
                                                                    </div>

                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMJVStatus" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                            ToolTip="MJV Status" runat="server" AutoPostBack="true"></asp:TextBox>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label3" runat="server" Text="Prior Period JV Status"></asp:Label>

                                                                        </label>
                                                                    </div>

                                                                </div>

                                                                <div class="col-lg-6 col-md- col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox runat="server" MaxLength="100" class="md-form-control form-control login_form_content_input requires_true lowercase"
                                                                            ToolTip="Remarks" onkeyup="maxlengthfortxt(100);" ID="txtRemarks" TextMode="MultiLine"></asp:TextBox>

                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ErrorMessage="Enter Remarks" ValidationGroup="Header"
                                                                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRemarks" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label1" runat="server" Text="Remarks" CssClass="styleReqFieldLabel"></asp:Label>

                                                                        </label>
                                                                    </div>

                                                                </div>


                                                            </div>
                                                        </asp:Panel>

                                                        <asp:HiddenField ID="hdngvAccRowIndex" runat="server" />
                                                        <asp:Panel ID="pnlJV" runat="server" CssClass="stylePanel" Width="100%" GroupingText="Prior Period Journal Details"
                                                            HorizontalAlign="Center">
                                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                                            <div class="gird"  style="max-height: 450px; overflow-y: scroll;">
                                                                <asp:GridView runat="server" ShowFooter="True" ID="gvManualJournal" OnRowDataBound="gvManualJournal_RowDataBound"
                                                                    OnRowCommand="gvManualJournal_RowCommand" OnRowEditing="gvManualJournal_RowEditing"
                                                                    OnRowDeleting="gvManualJournal_RowDeleting" OnRowCancelingEdit="gvManualJournal_RowCancelingEdit"
                                                                    OnRowUpdating="gvManualJournal_RowUpdating" Width="100%" AutoGenerateColumns="False"
                                                                    HorizontalAlign="Center" class="gird_details">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" ID="lblSNO" Text='<%#Container.DataItemIndex+1%>' ToolTip="Sl No"></asp:Label>
                                                                                <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Tran_Details_ID") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="2%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Branch">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" Text='<%#Eval("Location")%>' ID="lblLocation" ToolTip="Branch"></asp:Label>
                                                                                <asp:HiddenField ID="hdnLocationId" runat="server" Value='<%#Eval("Location_Id") %>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>

                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <%--<UC:Suggest ID="ddlLocationF" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChangedF" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="VgAdd" ErrorMessage="Select Location" />--%>
                                                                                    <asp:DropDownList ID="ddlLocationF" Width="90px" OnSelectedIndexChanged="ddlLocation_SelectedIndexChangedF"
                                                                                        CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="grid_validation_msg_box">

                                                                                        <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                                            ValidationGroup="VgAdd" ControlToValidate="ddlLocationF" CssClass="validation_msg_box_sapn"
                                                                                            ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>

                                                                                <%--<asp:HiddenField ID="hdnLocationF" runat="server" />--%>
                                                                            </FooterTemplate>
                                                                            <EditItemTemplate>
                                                                                <%-- <UC:Suggest ID="ddlLocationE" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChanged" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="VgAdd" ErrorMessage="Select Location" />--%>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlLocationE" runat="server" Width="90px" CssClass="WindowsStyle" DropDownStyle="DropDownList" OnSelectedIndexChanged="ddlLocationE_SelectedIndexChanged"
                                                                                        AutoPostBack="True"
                                                                                        AppendDataBoundItems="True" AutoCompleteMode="SuggestAppend" MaxLength="0">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvLocationE" SetFocusOnError="True" runat="server" CssClass="validation_msg_box_sapn"
                                                                                            ControlToValidate="ddlLocationE" ValidationGroup="VgUpdate"
                                                                                            ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <asp:HiddenField ID="hdnLocationE" Value='<%#Eval("Location_Id") %>' runat="server" />
                                                                                    <asp:TextBox ID="txtLocationE" runat="server" Visible="false" Text='<%#Eval("Location")%>'></asp:TextBox>
                                                                                </div>
                                                                            </EditItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="20%" Wrap="False" />
                                                                            <FooterStyle HorizontalAlign="Left" Width="20%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Activity">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" Text='<%#Eval("Activity")%>' ID="lblActivity" ToolTip="Location"></asp:Label>
                                                                                <asp:HiddenField ID="hdnActivityId" runat="server" Value='<%#Eval("Activity_ID") %>' />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <%--<UC:Suggest ID="ddlLocationF" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChangedF" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="VgAdd" ErrorMessage="Select Location" />--%>
                                                                                    <asp:DropDownList ID="ddlActivityE" Width="120px"
                                                                                        CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="grid_validation_msg_box">

                                                                                        <asp:RequiredFieldValidator ID="rfvActivityE" SetFocusOnError="True" runat="server"
                                                                                            ValidationGroup="VgUpdate" ControlToValidate="ddlActivityE" CssClass="validation_msg_box_sapn"
                                                                                            ErrorMessage="Select Activity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                                                                                    </div>
                                                                                    <asp:HiddenField ID="hdnActivityE" Value='<%#Eval("Activity_ID") %>' runat="server" />
                                                                                </div>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>

                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <%--<UC:Suggest ID="ddlLocationF" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChangedF" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="VgAdd" ErrorMessage="Select Location" />--%>
                                                                                    <asp:DropDownList ID="ddlActivityF" Width="120px"
                                                                                        CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="grid_validation_msg_box">

                                                                                        <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                                            ValidationGroup="VgAdd" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                                            ErrorMessage="Select Activity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>

                                                                                <%--<asp:HiddenField ID="hdnLocationF" runat="server" />--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Account">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" Text='<%#Eval("GL_Desc")%>' ID="lblGLAcc" ToolTip="Account"></asp:Label>
                                                                                <asp:HiddenField ID="hdn_AccountLeg" runat="server" Value='<%#Eval("Acc_Leg") %>' />
                                                                                <asp:HiddenField ID="hdn_AccNature" runat="server" Value='<%#Eval("Acc_Nature") %>' />
                                                                                <asp:HiddenField ID="hdn_GLCode" runat="server" Value='<%#Eval("GL_Code") %>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>

                                                                                <%-- <asp:DropDownList ID="ddlGLCode" Width="130px" AutoPostBack="true" CssClass="WindowsStyle" OnSelectedIndexChanged="ddlGLCode_Edit"
                                                                                                runat="server">
                                                                                            </asp:DropDownList>--%>

                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <UC:Suggest ID="ddlGLCode" runat="server" IsMandatory="true" AutoPostBack="true" Width="160px"
                                                                                        ServiceMethod="GetGlCodeList" OnItem_Selected="ddlGLCode_Item_Selected" ErrorMessage="Select Account" ValidationGroup="VgAdd" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <asp:HiddenField ID="hdn_AccountLeg" runat="server" />
                                                                                    <asp:HiddenField ID="hdn_AccNature" runat="server" />

                                                                                </div>

                                                                                <%--<asp:Label ID="lblTotGl" runat="server" Text="GL"  />--%>
                                                                            </FooterTemplate>
                                                                            <EditItemTemplate>
                                                                                <%-- <asp:DropDownList ID="ddlGLCode" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_Edit"
                                                                                            runat="server">
                                                                                        </asp:DropDownList>--%>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <UC:Suggest ID="ddlGLCode" runat="server" Width="160px" IsMandatory="true" AutoPostBack="true"
                                                                                        ServiceMethod="GetGLCodeEditList" OnItem_Selected="ddlGLCode_Edit" ErrorMessage="Select Account" ValidationGroup="VgUpdate" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>

                                                                                <asp:HiddenField ID="hdn_AccountLeg" runat="server" Value='<%#Eval("Acc_Leg") %>' />
                                                                                <asp:HiddenField ID="hdn_AccNature" runat="server" Value='<%#Eval("Acc_Nature") %>' />
                                                                                <asp:HiddenField ID="hdn_GLCode" runat="server" Value='<%#Eval("GL_Code") %>' />
                                                                                <asp:HiddenField ID="hdn_GLDesc" runat="server" Value='<%#Eval("GL_Desc") %>' />

                                                                            </EditItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                            <FooterStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sub Account">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" Text='<%#Eval("SL_Desc")%>' ID="lblSLAcc" ToolTip="Sub Account"></asp:Label>
                                                                                <asp:HiddenField ID="hdn_SLCode" runat="server" Value='<%#Eval("SL_Code") %>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>


                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <UC:Suggest ID="ddlSLCode" Width="110px" runat="server" class="md-form-control form-control" IsMandatory="false" ServiceMethod="GetSLCodeList"
                                                                                        ErrorMessage="Select Sub Account" AutoPostBack="true" ValidationGroup="VgAdd" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>

                                                                                <asp:Label ID="lblTot" runat="server" Text="Total" Visible="false" />
                                                                            </FooterTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <UC:Suggest ID="ddlSLCode" runat="server" Width="110px" class="md-form-control form-control" IsMandatory="false" ServiceMethod="GetEditSLCodeList" AutoPostBack="true"
                                                                                        ErrorMessage="Select Sub Account" ItemToValidate="Value" ValidationGroup="VgUpdate" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <%-- <asp:DropDownList ID="ddlSLCode" Width="130px" runat="server">
                                                                                        </asp:DropDownList>--%>
                                                                                    <asp:HiddenField ID="hdn_SLCode" runat="server" Value='<%#Eval("SL_Code") %>' />
                                                                                    <asp:HiddenField ID="hdn_SLDesc" runat="server" Value='<%#Eval("SL_Desc") %>' />
                                                                                </div>
                                                                            </EditItemTemplate>
                                                                            <HeaderStyle Wrap="False" />                                                                            
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Debit">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" Text='<%#Eval("Debit")%>' ID="lblDebit" ToolTip="Debit"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>

                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox MaxLength="15" runat="server" ID="txtDebit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" Width="120px" ToolTip="Debit" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtDebit"
                                                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" Enabled="false"
                                                                                            CssClass="validation_msg_box_sapn" ControlToValidate="txtDebit" ValidationGroup="VgAdd"
                                                                                            runat="server" ID="rfvDebit">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>

                                                                                <asp:Label ID="lblTotDebit" runat="server" Text='<%#Eval("TotDebit")%>' ToolTip="Total Debit" Visible="false" />

                                                                            </FooterTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox MaxLength="15" Text='<%#Eval("Debit")%>' runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                        onmouseover="txt_MouseoverTooltip(this)" ToolTip="Debit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                        Style="text-align: right;" ID="txtDebit"></asp:TextBox>
                                                                                    <asp:HiddenField ID="hdn_Debit" runat="server" Value='<%#Eval("Debit") %>' />
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1Hdr" runat="server" TargetControlID="txtDebit"
                                                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>

                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" Enabled="false"
                                                                                            CssClass="validation_msg_box_sapn" ControlToValidate="txtDebit" ValidationGroup="VgUpdate"
                                                                                            runat="server" ID="rfvDebit" ErrorMessage="Enter Debit or Credit Value">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>

                                                                            </EditItemTemplate>

                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Credit">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" Text='<%#Eval("Credit")%>' ID="lblCredit" ToolTip="Credit"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>


                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox MaxLength="15" runat="server" ID="txtCredit" ToolTip="Credit" class="md-form-control form-control login_form_content_input requires_true"
                                                                                        onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly(true,false,this)" Width="120px"
                                                                                        Style="text-align: right;"></asp:TextBox>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" Enabled="false"
                                                                                            CssClass="validation_msg_box_sapn" ControlToValidate="txtCredit" ValidationGroup="VgAdd"
                                                                                            runat="server" ID="rfvCredit" ErrorMessage="Enter Debit or Credit Value">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtCredit"
                                                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </div>

                                                                                <asp:Label ID="lblTotCredit" runat="server" Text='<%#Eval("TotCredit")%>' ToolTip="Total Credit" Visible="false" />
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox MaxLength="15" runat="server" Text='<%#Eval("Credit")%>' class="md-form-control form-control login_form_content_input requires_true"
                                                                                        onmouseover="txt_MouseoverTooltip(this)" ToolTip="Credit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                        Style="text-align: right;" ID="txtCredit"></asp:TextBox>
                                                                                    <asp:HiddenField ID="hdn_Credit" runat="server" Value='<%#Eval("Credit") %>' />
                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" Enabled="false"
                                                                                            CssClass="validation_msg_box_sapn" ControlToValidate="txtCredit" ValidationGroup="VgUpdate"
                                                                                            runat="server" ID="rfvCredit" ErrorMessage="Enter Debit or Credit Value">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>

                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2Hdr" runat="server" TargetControlID="txtCredit"
                                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>

                                                                            </EditItemTemplate>

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
                                                                        <asp:TemplateField Visible="false">
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
                                                                                    <asp:LinkButton ID="lnk" Text="OK" runat="server" Visible="false" />
                                                                                </center>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderStyle-Width="5%" Visible="false" FooterStyle-Width="5%" ItemStyle-Width="5%">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblDIMe" runat="server" Text="DIM" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblTran_det_Id" Visible="false" runat="server" Text='<%#Eval("Tran_Details_ID")%>' />
                                                                                <asp:ImageButton ID="imgbtn2" src="../Images/Dimm2.JPG" runat="server" OnClick="Show1"
                                                                                    ToolTip="Show DIM" />

                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:ImageButton ID="imgbtn2" src="../Images/Dimm2.JPG" runat="server" OnClick="Show1"
                                                                                    ToolTip="Show DIM" />

                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:ImageButton ID="imgbtn2" src="../Images/Dimm2.JPG" runat="server" OnClick="Show1F"
                                                                                    ToolTip="Show DIM" />

                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Remarks">
                                                                            <ItemTemplate>
                                                                                <%--<asp:Label runat="server" Text='<%#Eval("Remarks")%>' ID="lblRemarks" ToolTip="Remarks"></asp:Label>--%>

                                                                                <asp:TextBox runat="server" TextMode="MultiLine" Text='<%#Eval("Remarks")%>'
                                                                                    ReadOnly="true" ToolTip="Remarks" ID="txtRemarks"></asp:TextBox>

                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox runat="server" ValidationGroup="Footer" MaxLength="100" class="md-form-control form-control login_form_content_input requires_true lowercase"
                                                                                        ToolTip="Remarks" onkeyup="maxlengthfortxt(100);" ID="txtRemarks" Width="250px" Height="150px"  Wrap="true" TextMode="MultiLine"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>

                                                                                <asp:Label ID="lblTotRemarks" runat="server" Text="" ToolTip="Total Credit" />
                                                                            </FooterTemplate>
                                                                            <EditItemTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox runat="server" Text='<%#Eval("Remarks")%>' class="md-form-control form-control login_form_content_input requires_true"
                                                                                        ToolTip="Remarks" ValidationGroup="Footer" MaxLength="100" onkeyup="maxlengthfortxt(100);"  Width="250px" Height="150px"  Wrap="true"
                                                                                        ID="txtRemarks"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </EditItemTemplate>

                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false" class="grid_btn"
                                                                                    AccessKey="J" title="Edit[Alt+J]"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <%--  <asp:Button ID="btnAdd" Width="50px" runat="server" CommandName="Add" ValidationGroup="VgAdd"
                                                        CssClass="styleSubmitShortButton" Text="Add"></asp:Button>--%>
                                                                                <button class="css_btn_enabled" id="lnkAdd" validationgroup="VgAdd" title="Alt+A" accesskey="A" runat="server" onserverclick="lnkAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                                                <%-- <asp:LinkButton ID="lnkAdd" runat="server" CommandName="Add" ValidationGroup="VgAdd"
                                                                            ToolTip="Add,Alt+A" CssClass="grid_btn" Text="Add" AccessKey="A" ></asp:LinkButton>--%>
                                                                            </FooterTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn"
                                                                                    ValidationGroup="VgUpdate" AccessKey="U" title="Update[Alt+U]"></asp:LinkButton>

                                                                            </EditItemTemplate>
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" AccessKey="R"
                                                                                    OnClientClick="return confirm('Are you sure you want to Delete this record?');"
                                                                                    ToolTip="Delete,Alt+R" CssClass="grid_btn_delete">
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                            </FooterTemplate>
                                                                            <EditItemTemplate>
                                                                                |
                                                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn_delete"
                                                                                            CausesValidation="false" ToolTip="Cancel" AccessKey="G" title="Cancel[Alt+G]"></asp:LinkButton>
                                                                            </EditItemTemplate>
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                </asp:GridView>
                                                            </div>
                                                            <br>
                                                            <br />
                                                            <div align="right">
                                                                <div>
                                                                    <asp:Label ID="lblFinaldebit" runat="server" CssClass="styleDisplayLabel" Text="Total Debits:"></asp:Label>
                                                                    <asp:Label ID="txtTotalDebitamt" runat="server" Text="0"></asp:Label>

                                                                    <asp:Label ID="lblFinalCredit" runat="server" CssClass="styleDisplayLabel" Text="Total Credits:"></asp:Label>
                                                                    <asp:Label ID="txtTotalCreditamt" runat="server" Text="0"></asp:Label>
                                                                </div>

                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>

                                                <div class="btn_height"></div>
                                                <div align="right" class="fixed_btn">
                                                    <asp:HiddenField ID="hdndocexists" runat="server" />
                                                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Header'))" causesvalidation="false" validationgroup="Header" onserverclick="btnSave_Click" runat="server"
                                                        type="button" accesskey="S">
                                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                                    </button>

                                                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                                        type="button" accesskey="L">
                                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                                    </button>

                                                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                                        type="button" accesskey="X">
                                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                                    </button>

                                                    <%--<asp:Button ID="btnPrint" OnClick="btnPrint_Click" runat="server" />--%>
                                                    <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+i]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                                                        type="button" accesskey="i">
                                                        <i class="fa fa-print" aria-hidden="true"></i>&emsp;Pr<u>i</u>nt
                                                    </button>

                                                    <button class="css_btn_enabled" visible="false" id="btnCancelMJV" title="MJV Cancel[Alt+C]" onclick="if(fnCancelClick())" causesvalidation="false" onserverclick="btnCancelMJV_Click" runat="server"
                                                        type="button" accesskey="C">
                                                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;MJV <u>C</u>ancel
                                                    </button>
                                                </div>

                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btnPrint" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                    <div>
                                        <asp:Button runat="server" ID="btnpop" CssClass="styleSubmitButton" Text="Ok" ToolTip="Ok" Style="display: none" />
                                        <cc1:ModalPopupExtender ID="popup" runat="server" TargetControlID="btnpop" PopupControlID="pnlpop"
                                            BackgroundCssClass="styleModalBackground" DynamicServicePath=""
                                            Enabled="True">
                                        </cc1:ModalPopupExtender>
                                        <asp:Panel ID="pnlpop" runat="server" Style="display: none" BackColor="White"
                                            BorderStyle="Solid">
                                            <asp:DropDownList ID="ddl" runat="server" />
                                        </asp:Panel>
                                    </div>

                                </ContentTemplate>

                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Dimension" ID="tpDIM" CssClass="tabpan" Visible="false"
                                BackColor="Red">
                                <ContentTemplate>

                                    <asp:Panel ID="PnlDimension" runat="server" GroupingText="Dimension" Visible="false" CssClass="stylePanel">
                                        <table width="100%">
                                            <tr>
                                                <td class="styleReqFieldLabel" width="15%">
                                                    <%--<span class="styleReqFieldLabel">Dimension1</span>--%>
                                                    <asp:Label ID="lblHDIM1" runat="server" Text="Dimension1" />
                                                </td>
                                                <td class="styleFieldAlign" width="30%">
                                                    <asp:DropDownList ID="ddlHeadDim1" runat="server" Width="170px" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:HiddenField ID="hdn_HDIM1" runat="server" />
                                                    <%--  <asp:Button ID="btn_HDIM1" Text="" runat="server" Style="display: none" OnClick="btnLocationChange_Click" />--%>
                                                    <asp:RequiredFieldValidator ID="rfvHDIM1" runat="server" ControlToValidate="ddlHeadDim1"
                                                        InitialValue="0" Enabled="false" ErrorMessage="Select Dimension1" Display="None"
                                                        SetFocusOnError="True" ValidationGroup="Main" />
                                                </td>
                                                <td class="styleReqFieldLabel" width="15%">
                                                    <%-- <span class="styleReqFieldLabel">Dimension2</span>--%>
                                                    <asp:Label ID="lblHDIM2" runat="server" Text="Dimension2" />
                                                </td>
                                                <td class="styleFieldAlign" width="30%">
                                                    <asp:DropDownList ID="ddlHeadDim2" Width="170px" runat="server" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlHeadDim2_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:HiddenField ID="hdn_HDIM2" Value="" runat="server" />
                                                    <asp:RequiredFieldValidator ID="rfvHDIM2" runat="server" ControlToValidate="ddlHeadDim2"
                                                        InitialValue="0" Enabled="false" ErrorMessage="Select Dimension2" Display="None"
                                                        SetFocusOnError="True" ValidationGroup="Main" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:HiddenField ID="hdn_DIM1_Type" runat="server" />
                                        <asp:HiddenField ID="hdn_DIM2_Type" runat="server" />
                                    </asp:Panel>
                                    <%-- </ContentTemplate>
                                                </asp:UpdatePanel>--%>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TPOthers" CssClass="tabpan" BackColor="Red" Visible="false">
                                <HeaderTemplate>
                                    Others
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                        <asp:Panel ID="PnlOthers" runat="server" GroupingText="Funder Information" CssClass="stylePanel"
                                                            Width="99%">
                                                            <asp:GridView runat="server" ToolTip="Funder Details" ShowFooter="true" ID="grvFunder"
                                                                Width="100%" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                                                FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCommand="grvFunder_RowCommand"
                                                                OnRowDeleting="grvFunder_RowDeleting" OnRowDataBound="grvFunder_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Transaction" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbldrcr" ToolTip="Transaction" Text='<%#Eval("Transaction")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                            <asp:Label ID="lblcrdrInvisible" ToolTip="Transaction" Visible="false" Text='<%#Eval("Tran_Val")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddldrcr" runat="server" onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control login_form_content_input">
                                                                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                                                    <asp:ListItem Value="0">Debit</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="FunderName" Visible="false" ItemStyle-HorizontalAlign="Left" FooterStyle-Width="25%" ItemStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderNameSelect" ToolTip="Funder Name" Text='<%#Eval("FunderName")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                            <asp:Label ID="lblFunderId" Visible="false" Text='<%#Eval("FunderId")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFunderName" onmouseover="ddl_itemchanged(this)" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFunderName_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">

                                                                                    <asp:RequiredFieldValidator ID="rfvddlFunderName" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="ddlFunderName" InitialValue="0" ValidationGroup="FunderAdd" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Funder" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Funder Ref No.">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderRefNo" ToolTip="Funder Ref. Number" Text='<%#Eval("FunderRefNo")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFunderRefNo" onmouseover="ddl_itemchanged(this)" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFunderRefNo_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlFunderRefNo" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="ddlFunderRefNo" InitialValue="0" ValidationGroup="FunderAdd"
                                                                                        ErrorMessage="Select Funder Ref No" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Fund Type" Visible="false" ItemStyle-HorizontalAlign="Left" FooterStyle-Width="25%"
                                                                        ItemStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderType" ToolTip="FundType" Text='<%#Eval("FUND_TYPE")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>

                                                                            <asp:Label ID="lblFunderTypeF" ToolTip="Fund Type"
                                                                                Width="100%" runat="server"></asp:Label>

                                                                        </FooterTemplate>

                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="20%" FooterStyle-Width="20%"
                                                                        FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlDueDate" runat="server" onmouseover="ddl_itemchanged(this)" AutoPostBack="true" OnSelectedIndexChanged="ddlDueDate_SelectedIndexChanged" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>

                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlduedate" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="ddlDueDate" InitialValue="0" ValidationGroup="FunderAdd"
                                                                                        ErrorMessage="Select Due Date" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("Due_Date") %>' ToolTip="Due Date"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks" Visible="false" ItemStyle-Width="20%" FooterStyle-Width="20%"
                                                                        ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtRemarks" TextMode="MultiLine" ToolTip="Remarks" ReadOnly="true" Text='<%# Bind("Deal_Remarks") %>' runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtRemarksF" TextMode="MultiLine" Width="95%"
                                                                                    runat="server" ReadOnly="true"></asp:TextBox>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Funder Name" Visible="false" ItemStyle-HorizontalAlign="Left" FooterStyle-Width="25%"
                                                                        ItemStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderName" ToolTip="Funder Name" Text='<%#Eval("Name")%>' Width="100%"
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFunderName" Width="95%" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" ReadOnly="true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVtxtFunderName" runat="server" Display="Dynamic" ControlToValidate="txtFunderName"
                                                                                        ValidationGroup="FunderAdd" ErrorMessage="Enter Funder Name" CssClass="validation_msg_box_sapn"
                                                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Funder Repayment" ItemStyle-HorizontalAlign="Left"
                                                                        FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderRepayment" ToolTip="Funder Repayment" Text='<%#Eval("Repayment")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFunderRepayment" onmouseover="ddl_itemchanged(this)" runat="server">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                    <asp:ListItem Value="1">Loan</asp:ListItem>
                                                                                    <%--<asp:ListItem Value="2">Interest</asp:ListItem>
                                                                                <asp:ListItem Value="3">Others</asp:ListItem>--%>
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlFunderRepayment" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="ddlFunderRepayment" InitialValue="0" ValidationGroup="FunderAdd"
                                                                                        ErrorMessage="Select Funder Repayment" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount" FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderAmount" Style="text-align: right" ToolTip="Amount" Width="100%"
                                                                                runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFunderAmount" Style="text-align: right" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    MaxLength="12" runat="server" ReadOnly="true"></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVtxtFunderAmount" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="txtFunderAmount" ValidationGroup="FunderAdd" ErrorMessage="Enter Funder Amount"
                                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="lnkFunderRemove" ToolTip="Remove from the grid,Alt+N" AccessKey="N" runat="server" CommandName="Delete"
                                                                                CausesValidation="false" Text="Remove" CssClass="grid_btn_delete"></asp:Button>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="lnkFunderAdd" ToolTip="Add to the grid,Alt+T" AccessKey="T" runat="server" ValidationGroup="FunderAdd"
                                                                                Text="Add" CommandName="Add" CssClass="grid_btn"></asp:Button>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>

    <div>
        <%-- <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                    Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="Header" Width="500px"
                    ShowMessageBox="false" ShowSummary="true" />
                <asp:ValidationSummary runat="server" ID="VSAdd" HeaderText="Correct the following validation(s):"
                    Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgAdd" Width="500px"
                    ShowMessageBox="false" ShowSummary="true" />
                <asp:ValidationSummary runat="server" ID="VSUpdate" HeaderText="Correct the following validation(s):"
                    Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgUpdate" Width="500px"
                    ShowMessageBox="false" ShowSummary="true" />--%>
        <input type="hidden" runat="server" value="0" id="hdnRowID" />
        <input type="hidden" runat="server" value="1" id="hdnAccValid" />
        <input type="hidden" runat="server" value="0" id="hdnStatus" />
        <asp:HiddenField ID="hdnIB" runat="server" />
        <asp:CustomValidator ID="cvManualJournal" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" />
    </div>



    <div>
        <div class="row">
            <asp:Button ID="BtnHide" runat="server" Style="display: none;" />
            <cc1:ModalPopupExtender ID="mpeDimension" runat="server" TargetControlID="BtnHide"
                PopupControlID="pnlDimension1" BackgroundCssClass="styleModalBackground" DropShadow="false" />
            <asp:Panel ID="pnlDimension1" runat="server" Width="40%" CssClass="stylePanel"
                GroupingText="Dimension Details" Style="display: none; overflow: hidden;" BackColor="White"
                BorderColor="WhiteSmoke">
                <asp:UpdatePanel ID="pnlDim" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:GridView ID="grvDimGrid" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                        HeaderStyle-CssClass="styleGridHeader"
                                        FooterStyle-HorizontalAlign="Center" OnRowCommand="grvDimGrid_RowCommand"
                                        OnRowDeleting="grvDimGrid_RowDeleting" OnRowDataBound="grvDimGrid_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Tran_Det_Id" Visible="false" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%"
                                                FooterStyle-Width="20%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTran_Det_Id" ToolTip="Dim1" Text='<%#Eval("Tran_Det_Id")%>' Width="100%"
                                                        runat="server" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Dim_Id" Visible="false" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%"
                                                FooterStyle-Width="20%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDim_Id" ToolTip="Dim_Id" Text='<%#Eval("Dim_Id")%>' Width="100%"
                                                        runat="server" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Dim1" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%"
                                                FooterStyle-Width="20%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDim1" ToolTip="Dim1" Text='<%#Eval("Dim1")%>' Width="100%"
                                                        runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="lblDim1Desc" ToolTip="Dim1 Desc" Text='<%#Eval("Dim1_Desc")%>' Width="100%"
                                                        runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:DropDownList ID="ddlDim1" runat="server"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvddlDim1" runat="server" Display="None" ControlToValidate="ddlDim1"
                                                        InitialValue="0" ValidationGroup="btnDimAdd" ErrorMessage="Select Dimension1"
                                                        CssClass="styleMandatoryLabel" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Dim2" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%"
                                                FooterStyle-Width="20%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDim2" ToolTip="Dim2" Text='<%#Eval("Dim2")%>' Width="100%"
                                                        runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="lblDim2Desc" ToolTip="Dim2 Desc" Text='<%#Eval("Dim2_Desc")%>' Width="100%"
                                                        runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:DropDownList ID="ddlDim2" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvddlDim2" runat="server" Display="None" ControlToValidate="ddlDim2"
                                                        InitialValue="0" ValidationGroup="btnDimAdd" ErrorMessage="Select Dimension2"
                                                        CssClass="styleMandatoryLabel" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" ToolTip="Amount" Text='<%#Eval("Dim_Amount")%>' Width="100%"
                                                        runat="server" Style="text-align: right;"></asp:Label>
                                                    <%-- <asp:TextBox ID="txtAmount" onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right"
                                                            MaxLength="15" runat="server" Text='<%#Eval("Amount")%>' OnTextChanged="Amount_TextChanged"
                                                            AutoPostBack="true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtAmount" runat="server" TargetControlID="txtAmount"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <%--<asp:Label ID="lblSLodeF" ToolTip="Pay Type ID" runat="server"></asp:Label>--%>
                                                    <asp:TextBox ID="txtFooterAmount" runat="server"
                                                        MaxLength="15" Style="text-align: right"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtFooterAmount" runat="server" TargetControlID="txtFooterAmount"
                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="RFVtxtFooterAmount" runat="server" ControlToValidate="txtFooterAmount"
                                                        SetFocusOnError="True" ValidationGroup="btnDimAdd" CssClass="styleMandatoryLabel"
                                                        Display="None" ErrorMessage="Enter Amount"></asp:RequiredFieldValidator>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action" FooterStyle-Width="10%" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Button ID="lnkDimRemove" ToolTip="Remove from the grid" runat="server"
                                                        CommandName="Delete" CausesValidation="false" Text="Remove" CssClass="styleGridShortButton"></asp:Button>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="lnkDimAdd" ToolTip="Add to the grid" runat="server" ValidationGroup="btnDimAdd"
                                                        Text="Add" CommandName="Add" CssClass="styleGridShortButton"></asp:Button>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">

                                    <asp:LinkButton ID="btnDimClose" runat="server" Text="Close" CausesValidation="false"
                                        CssClass="styleGridShortButton" OnClick="btnDimClose_Click" />
                                    <asp:ValidationSummary ValidationGroup="btnDimAdd" ID="ValidationSummary8" runat="server"
                                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CustomValidator ID="CVDim" runat="server" CssClass="styleMandatoryLabel"
                                        Enabled="true" /></td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>


    <script language="javascript" type="text/javascript">

        function pageLoad() {


            tab = $find('ctl00_ContentPlaceHolder1_tcJV');

            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            PageLoadTabContSetFocus();
        }


        function PageLoadTabContSetFocus() {
            var TC = $find("<%=tcJV.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlActivity.ClientID %>").focus();
            }
        }
        //code added to set tab focus
        function on_Change(sender, e) {

            fnMoveNextTab('Tab');
        }

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcJV');


            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            <%--var Valgrp = document.getElementById('<%=vsPricing.ClientID %>')--%>
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            //btnSave.disabled=true;
            //    Valgrp.validationGroup = strValgrp;

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;
                if (tab._tabs[btnActive_index + 1].disabled = 'true') {
                    newindex = btnActive_index + 2;
                }

            }
            else if (Source_Invoker == 'btnPrevTab') {

                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }

            //if (newindex == tab._tabs.length - 1)
            //    btnSave.disabled = false;
            //else
            //    btnSave.disabled = true;
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                }
                else {


                    switch (index) {

                        case 0:

                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            //if (tab._tabs[index].disabled = 'true')
                            //{
                            //    tab.set_activeTabIndex(btnActive_index + 1);
                            //    index = tab.get_activeTabIndex(index);
                            //}
                            btnActive_index = index;
                            break;
                        case 1:

                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 2:

                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                    }
                }
            }
            else {

                tab.set_activeTabIndex(newindex);
                index = tab.get_activeTabIndex(newindex);

            }
        }

        function fnDateChange(sender, dt) {
            if (sender.value > dt) {


                //alert('You cannot select a date greater than system date');
                //alert('hi');
                // sender._textbox.set_Value(today.format(sender._format));

            }


        }

        var btnActive_index = 0;
        var index = 0;





        function checkDate_NextSystemDate1(sender, args) {

            var today = new Date();
            if (sender._selectedDate > today) {

                //alert('You cannot select a date greater than system date');
                alert('MJV Value Date cannot be greater than system date');
                sender._textbox.set_Value(today.format(sender._format));

            }
            document.getElementById(sender._textbox._element.id).focus();

        }
        function fnClearGrid() {



        }



        function FnValidate(txtDebit, txtCredit, idReqCredit, idReqDebit) {

            //alert(idReqDebit);
            //document.getElementById(idReqDebit).enabled=false;
            if ((document.getElementById(txtDebit).value == '') && (document.getElementById(txtCredit).value == '')) {
                document.getElementById(idReqCredit).enabled = true;
                document.getElementById(idReqDebit).enabled = true;
                //document.getElementById(idReqCredit).className = 'styleReqFieldFocus';
                //document.getElementById(idReqDebit).className = 'styleReqFieldFocus';
            }
            else {
                document.getElementById(idReqCredit).enabled = false;
                document.getElementById(idReqDebit).enabled = false;

            }
            //if (!fnCheckPageValidators('Footer', false))
            //    return false;

            return true;
        }

        function fnDiableCredit(idDebit, idCredit, ctrlId) {


            var txtDebit = document.getElementById(idDebit);
            var txtCredit = document.getElementById(idCredit);

            //var txtDebit=document.getElementById('ctl00_ContentPlaceHolder1_gvManualJournal_ctl03_txtDebit');
            //var txtCredit=document.getElementById('ctl00_ContentPlaceHolder1_gvManualJournal_ctl03_txtCredit');
            if (txtCredit.enabled == true)
                txtCredit.disabled = false;
            if (txtDebit.enabled == true)
                txtDebit.disabled = false;
            //alert(txtDebit.value);
            if ((txtDebit.value == "") && (txtCredit.value == "")) {
                txtDebit.value = "";
                txtCredit.value = "";
                return;
            }

            if ((txtDebit.value != "") && (ctrlId == 'C')) {
                txtCredit.value = "";
                return;
            }
            if ((txtCredit.value != "") && (ctrlId == 'D')) {
                txtDebit.value = "";
                return;
            }

        }



        function fnCancelClick() {

            if (confirm('Do you want to cancel MJV?')) {
                return true;
            }
            else {
                return false;
            }
        }

    </script>

</asp:Content>
