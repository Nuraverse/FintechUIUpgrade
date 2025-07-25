<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" enableeventvalidation="false" autoeventwireup="true" inherits="S3GLoanAdManualJournal_Add, App_Web_yy0xp33b" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />--%>

    <script type="text/javascript">
        function Common_ItemSelected(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = e.get_value();
        }
        function Common_ItemPopulated(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = '';

        }
        function calendarShown(sender, args) {
            sender._popupBehavior._element.style.zIndex = 10005;
        }
        function calendarShown(sender, args) {
            sender._popupBehavior._element.style.zIndex = 99999999;
        }
    </script>
   
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLOB" ValidationGroup="Header" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                    runat="server" AutoPostBack="True"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" ControlToValidate="ddlLOB" ValidationGroup="Submit"
                                        ErrorMessage="Select a Line of Business" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                        InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtMJVNo" Enabled="false" runat="server"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblMJVNO" runat="server" Text="MJV Number"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <%--<uc3:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" ErrorMessage="Select a Location"
                                    ValidationGroup="Header" IsMandatory="true" />--%>
                                <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ControlToValidate="ddlBranch" ValidationGroup="Submit"
                                        ErrorMessage="Select Branch" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                        InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtMJVDate" runat="server" AutoComplete="off"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <asp:Image ID="imgMJVDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvDocDate" SetFocusOnError="true" runat="server" ValidationGroup="Submit"
                                        ControlToValidate="txtMJVDate" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                        ErrorMessage="Select Document Date"></asp:RequiredFieldValidator>
                                </div>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                    Format="dd/MM/yyyy" PopupButtonID="imgMJVDate" TargetControlID="txtMJVDate">
                                </cc1:CalendarExtender>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblMJVDate" runat="server" CssClass="styleReqFieldLabel" Text="Document Date"></asp:Label>
                                </label>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtMJVStatus" Enabled="false" runat="server"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="Label3" runat="server" Text="MJV Status"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:Label ID="Label4" runat="server" CssClass="styleReqFieldLabel" Text="MJV Value Date" Visible="false"></asp:Label>

                                <asp:TextBox ID="txtMJVValueDate" Width="100px" runat="server" Visible="false"></asp:TextBox>
                                <asp:Image ID="imgInvoiceDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <asp:RequiredFieldValidator ErrorMessage="Enter the MJV Value Date" ValidationGroup="Header"
                                    ID="rfvMJVValueDate" runat="server" ControlToValidate="txtMJVValueDate" CssClass="styleMandatoryLabel"
                                    Display="None" Enabled="false"></asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                    PopupButtonID="imgInvoiceDate" TargetControlID="txtMJVValueDate">
                                </cc1:CalendarExtender>
                                <asp:CustomValidator ID="rfvCompareMJVDate" runat="server" Display="None" CssClass="styleMandatoryLabel"
                                    ValidationGroup="Header" ErrorMessage="Difference between MJV Date and MJV Value Date must be 30 days"></asp:CustomValidator>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:HiddenField ID="hdnCommonID" runat="server" />
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird" style="overflow-x: scroll;">
                                                <asp:GridView runat="server" ShowFooter="true" DataKeyNames="MJVRow_ID" OnRowDataBound="grvManualJournal_RowDataBound"
                                                    OnRowCommand="grvManualJournal_RowCommand" OnRowEditing="grvManualJournal_RowEditing"
                                                    OnRowDeleting="grvManualJournal_RowDeleting" OnRowCancelingEdit="grvManualJournal_RowCancelingEdit"
                                                    OnRowUpdating="grvManualJournal_RowUpdating" ID="grvManualJournal" Width="99%"
                                                    AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblSNO" ToolTip="Sl.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--<asp:TemplateField ItemStyle-Wrap="false" HeaderText="Location">
                                                                                <ItemTemplate>
                                                                                    <asp:Label runat="server" Text='<%#Eval("Location_Name")%>' ID="lbLocationName"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <uc3:Suggest ID="txtLocationSearch" runat="server" ServiceMethod="GetLocationList" AutoPostBack="true"
                                                                                        OnItem_Selected="txtLocationSearch_OnTextChanged" />
                                                                                </FooterTemplate>
                                                                                <EditItemTemplate>
                                                                                    <uc3:Suggest ID="txtLocationSearchhdr" runat="server" ServiceMethod="GetLocationList" AutoPostBack="true"
                                                                                        OnItem_Selected="txtLocationSearchhdr_OnTextChanged" />
                                                                                </EditItemTemplate>
                                                                            </asp:TemplateField>--%>
                                                        <%--<asp:TemplateField ItemStyle-Width="2%" HeaderText="Detail ID">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblDetailID" Text='<%#Eval("Detail_ID")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Ref Type" ItemStyle-Width="3%" HeaderStyle-Width="9%">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("EntityType")%>' ID="lblEntityType" ToolTip="Ref Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlEntityType" AutoPostBack="true" ValidationGroup="Footer" Width="90px"
                                                                        OnSelectedIndexChanged="ddlEntityType_SelectedIndexChanged" runat="server" ToolTip="Ref Type"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlEntityType" runat="server" ControlToValidate="ddlEntityType"
                                                                            ValidationGroup="Footer" ErrorMessage="Select Ref Type" CssClass="validation_msg_box_sapn"
                                                                            Display="Dynamic" InitialValue="0" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlEntityTypeHdr" AutoPostBack="true" ValidationGroup="Footer" Width="90px"
                                                                        OnSelectedIndexChanged="ddlEntityTypeHdr_SelectedIndexChanged" runat="server" ToolTip="Ref Type"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvEntityTypeHdr" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="ddlEntityTypeHdr" InitialValue="0" ErrorMessage="Select Ref Type"
                                                                            ValidationGroup="Footer" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Line of Business" ItemStyle-Width="3%" HeaderStyle-Width="9%">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Visible="false" Text='<%#Eval("LOB_ID")%>' ID="lblFLOBID"></asp:Label>
                                                                <asp:Label runat="server" Text='<%#Eval("LOB")%>' ID="lblFLOB" ToolTip="Line of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlFLOB" AutoPostBack="true" ValidationGroup="Footer" runat="server" Width="120px"
                                                                        CssClass="md-form-control form-control login_form_content_input" ToolTip="Line of Business"
                                                                        OnSelectedIndexChanged="ddlFLOB_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvFLOB" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="ddlFLOB" InitialValue="0" ErrorMessage="Select LOB"
                                                                            ValidationGroup="Footer" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlELOB" AutoPostBack="true" ValidationGroup="Footer" runat="server" Width="120px"
                                                                        CssClass="md-form-control form-control login_form_content_input" ToolTip="Line of Business"
                                                                        OnSelectedIndexChanged="ddlELOB_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvELOB" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="ddlELOB" InitialValue="0" ErrorMessage="Select LOB"
                                                                            ValidationGroup="Footer" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Branch" ItemStyle-Width="3%" HeaderStyle-Width="9%">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Visible="false" Text='<%#Eval("Location_ID")%>' ID="lblFLocationID"></asp:Label>
                                                                <asp:Label runat="server" Text='<%#Eval("Location")%>' ID="lblFLocation" ToolTip="Branch"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlFLocation" AutoPostBack="true" ValidationGroup="Footer" runat="server"
                                                                        CssClass="md-form-control form-control login_form_content_input" ToolTip="Branch" Width="100px"
                                                                        OnSelectedIndexChanged="ddlFLocation_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvFLocation" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="ddlFLocation" InitialValue="0" ErrorMessage="Select Branch"
                                                                            ValidationGroup="Footer" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlELocation" AutoPostBack="true" ValidationGroup="Footer" runat="server"
                                                                        OnSelectedIndexChanged="ddlELocation_SelectedIndexChanged" ToolTip="Branch" Width="100px"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvELocation" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="ddlELocation" InitialValue="0" ErrorMessage="Select Branch"
                                                                            ValidationGroup="Footer" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderStyle-Width="160px" HeaderText="Refer. Number">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("MLA_Desc")%>' ID="lblMLA" ToolTip="Refer. Number"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input">
                                                                    <uc3:Suggest ID="txtMLASearch"  runat="server" ServiceMethod="GetMLAList" ToolTip="Refer. Number" AutoPostBack="true" IsMandatory="true"
                                                                        ErrorMessage="Select Ref Num" ValidationGroup="Footer" Width="160px" OnItem_Selected="txtMLASearch_OnTextChanged" />
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <div class="md-input">
                                                                    <uc3:Suggest ID="txtMLASearchhdr"  runat="server" ServiceMethod="GetMLAList" IsMandatory="true"
                                                                        AutoPostBack="true" ErrorMessage="Select Ref Num" ValidationGroup="Footer" Width="160px"
                                                                        OnItem_Selected="txtMLASearchhdr_OnTextChanged" ToolTip="Refer. Number" />
                                                                </div>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sub A/c No." ItemStyle-Width="15%" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("SLA")%>' ID="lblSLA" ToolTip="Sub A/c No."></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:DropDownList ID="ddlSLA" AutoPostBack="true" OnSelectedIndexChanged="ddlSLA_SelectedIndexChanged"
                                                                    ValidationGroup="Footer" runat="server" ToolTip="Sub A/c No."
                                                                    CssClass="md-form-control form-control login_form_content_input">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvSLA" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                                        runat="server" ControlToValidate="ddlSLA" InitialValue="0" ErrorMessage="Select the Sub A/c No."
                                                                        ValidationGroup="Footer" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <asp:DropDownList ID="ddlSLAhdr" AutoPostBack="true" OnSelectedIndexChanged="ddlSLAhdr_SelectedIndexChanged"
                                                                    ValidationGroup="Footer" runat="server" ToolTip="Sub A/c No."
                                                                    CssClass="md-form-control form-control login_form_content_input">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="rfvSLAhdr" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                                    runat="server" ControlToValidate="ddlSLAhdr" InitialValue="0" ErrorMessage="Select the Sub A/c No."
                                                                    ValidationGroup="Footer" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Transaction Flag" HeaderStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("PostingFlagDesc")%>' ID="lblPostingFlag" ToolTip="Transaction Flag"></asp:Label>
                                                                <asp:Label runat="server" Visible="false" Text='<%#Eval("PostingFlag")%>' ID="lblPostingID"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPostingFlag" ValidationGroup="Footer" AutoPostBack="true" Width="110px"
                                                                        runat="server" OnSelectedIndexChanged="ddlPostingFlag_SelectedIndexChanged" ToolTip="Transaction Flag"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvPostingFlag" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="ddlPostingFlag" InitialValue="0" ErrorMessage="Select Tran Flag"
                                                                            ValidationGroup="Footer" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPostingFlagHdr" ValidationGroup="Footer" AutoPostBack="true" ToolTip="Transaction Flag"
                                                                        runat="server" OnSelectedIndexChanged="ddlPostingFlagHdr_SelectedIndexChanged" Width="110px"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvPostingFlagHdr" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="ddlPostingFlagHdr" InitialValue="0" ErrorMessage="Select Tran Flag"
                                                                            ValidationGroup="Footer" Display="Dynamic">
                                                                        </asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Ref.">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkViewInst" runat="server" Text="View" CausesValidation="false" CommandArgument='<%# Eval("Occurance_ID") %>'
                                                                    ToolTip="View" class="grid_btn" OnClick="lnkViewInst_Click"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Button ID="btnFtAdd" runat="server"
                                                                    CssClass="grid_btn" Text="Ref" ToolTip="Ref.[Alt+R]" AccessKey="R" OnClick="btnFtAdd_Click"></asp:Button>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Button ID="btnEtAdd" runat="server" CssClass="grid_btn"
                                                                    ToolTip="Ref.[Alt+R]" Text="Ref" OnClick="btnEtAdd_Click"></asp:Button>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Asset Number" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("Dim2")%>' ID="lblDim"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:DropDownList ID="ddlDim2" ValidationGroup="Footer" runat="server"
                                                                    CssClass="md-form-control form-control login_form_content_input">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim2" CssClass="validation_msg_box_sapn"
                                                                        runat="server" ControlToValidate="ddlDim2" InitialValue="0" ErrorMessage="Select Dim 2"
                                                                        ValidationGroup="Footer" Display="Dynamic">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <asp:DropDownList ID="ddlDim2Hdr" ValidationGroup="Footer" runat="server"
                                                                    CssClass="md-form-control form-control login_form_content_input">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim2Hdr" CssClass="validation_msg_box_sapn"
                                                                        runat="server" ControlToValidate="ddlDim2Hdr" InitialValue="0" ErrorMessage="Select Dim 2"
                                                                        ValidationGroup="Footer" Display="Dynamic">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GL A/c">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("GL_Description")%>' ID="lblGLAcc" ToolTip="GL A/c"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <%--  <asp:DropDownList ID="ddlGLAcc" AutoPostBack="true" ValidationGroup="Footer" OnSelectedIndexChanged="ddlGLAcc_SelectedIndexChanged"
                                                                                runat="server">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvGLAcc" CssClass="styleMandatoryLabel"
                                                                                runat="server" ControlToValidate="ddlGLAcc" InitialValue="0" ErrorMessage="Select the GL A/c"
                                                                                ValidationGroup="Footer" Display="None">
                                                                            </asp:RequiredFieldValidator>--%>
                                                                <div class="md-input">
                                                                    <uc3:Suggest ID="ddlGLAcc" runat="server" ServiceMethod="GetGLAccF" ErrorMessage="Select GL A/c" AutoPostBack="true"
                                                                        OnItem_Selected="ddlGLAcc_SelectedIndexChanged" ValidationGroup="Footer" ToolTip="GL A/c" Width="150px"
                                                                        IsMandatory="true" />
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <%--       <asp:DropDownList ID="ddlGLAccHdr" AutoPostBack="true" ValidationGroup="Footer" OnSelectedIndexChanged="ddlGLAccHdr_SelectedIndexChanged"
                                                                                        runat="server">
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvGLAccHdr" CssClass="styleMandatoryLabel"
                                                                                        runat="server" ControlToValidate="ddlGLAccHdr" InitialValue="0" ErrorMessage="Select the GL A/c"
                                                                                        ValidationGroup="Footer" Display="None">
                                                                                    </asp:RequiredFieldValidator>--%>
                                                                <div class="md-input">
                                                                    <uc3:Suggest ID="ddlGLAccHdr" runat="server" ServiceMethod="GetGLAccE" ErrorMessage="Select a GL A/c" AutoPostBack="true"
                                                                        OnItem_Selected="ddlGLAccHdr_SelectedIndexChanged" ValidationGroup="Footer" ToolTip="GL A/c" Width="150px"
                                                                        IsMandatory="true" />
                                                                </div>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderStyle-Wrap="false" HeaderStyle-Width="150px" HeaderText="SL A/c">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("SL_Description")%>' ID="lblSLAcc" ToolTip="SL A/c"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <uc3:Suggest ID="ddlSLAcc" runat="server" ServiceMethod="GetSLAccF" ErrorMessage="Select a SL A/c"
                                                                    ValidationGroup="Footer" IsMandatory="false" Width="150px" ToolTip="SL A/c" />
                                                                <%-- <asp:DropDownList ID="ddlSLAcc" AutoPostBack="true" OnSelectedIndexChanged="ddlSLAcc_SelectedIndexChanged"
                                                                                runat="server" ValidationGroup="Footer">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvSLAcc" CssClass="styleMandatoryLabel"
                                                                                runat="server" ControlToValidate="ddlSLAcc" InitialValue="0" ErrorMessage="Select the SL A/c"
                                                                                ValidationGroup="Footer" Display="None">
                                                                            </asp:RequiredFieldValidator>--%>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <%-- <asp:DropDownList ID="ddlSLAccHdr" AutoPostBack="true" OnSelectedIndexChanged="ddlSLAccHdr_SelectedIndexChanged"
                                                                                        runat="server" ValidationGroup="Footer">
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvSLAccHdr" CssClass="styleMandatoryLabel"
                                                                                        runat="server" ControlToValidate="ddlSLAccHdr" InitialValue="0" ErrorMessage="Select the SL A/c"
                                                                                        ValidationGroup="Footer" Display="None">
                                                                                    </asp:RequiredFieldValidator>--%>
                                                                <uc3:Suggest ID="ddlSLAccHdr" runat="server" ServiceMethod="GetSLAccE" ErrorMessage="Select a SL A/c"
                                                                    ValidationGroup="Footer" IsMandatory="false" Width="150px" ToolTip="SL A/c" />
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Wrap="false" Visible="false" FooterStyle-Font-Bold="false"
                                                            ItemStyle-Font-Size="Small" FooterStyle-Font-Size="Small" HeaderText="Description">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("Description")%>' ID="lblDesc"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("Description")%>' ID="lblDescF"></asp:Label>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("Description")%>' ID="lblDescHdr"></asp:Label>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Debit Amount" HeaderStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("Debit")%>' ID="lblDebit" ToolTip="Debit Amount"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox runat="server" ID="txtDebit" ToolTip="Debit Amount" Width="80px" AutoComplete="off"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtDebit"
                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--   <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" Enabled="false"
                                                                        CssClass="validation_msg_box_sapn" ControlToValidate="txtDebit" ValidationGroup="Footer"
                                                                        runat="server" ID="rfvDebit">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>--%>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox runat="server" ID="txtDebitHdr" ToolTip="Debit Amount" Width="80px" AutoComplete="off"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1Hdr" runat="server" TargetControlID="txtDebitHdr"
                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--   <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" Enabled="false"
                                                                        CssClass="validation_msg_box_sapn" ControlToValidate="txtDebitHdr" ValidationGroup="Footer"
                                                                        runat="server" ID="rfvDebitHdr">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>--%>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Credit Amount" HeaderStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("Credit")%>' ID="lblCredit" ToolTip="Credit Amount"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox runat="server" ID="txtCredit" ToolTip="Credit Amount" Width="80px" AutoComplete="off"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <%-- <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" Enabled="false"
                                                                        CssClass="validation_msg_box_sapn" ControlToValidate="txtCredit" ValidationGroup="Footer"
                                                                        runat="server" ID="rfvCredit" ErrorMessage="Enter Debit or Credit Value">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>--%>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtCredit"
                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox runat="server" ID="txtCreditHdr" ToolTip="Credit Amount" Width="80px" AutoComplete="off"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic" Enabled="false"
                                                                    CssClass="validation_msg_box_sapn" ControlToValidate="txtCreditHdr" ValidationGroup="Footer"
                                                                    runat="server" ID="rfvCreditHdr" ErrorMessage="Enter Debit or Credit Value">
                                                                </asp:RequiredFieldValidator>--%>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2Hdr" runat="server" TargetControlID="txtCreditHdr"
                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Narration" ItemStyle-Width="150px">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("Remarks")%>' ID="lblRemarks" ToolTip="Narration"
                                                                    Style="word-wrap: break-word;" Width="200px"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ValidationGroup="Footer" Style="word-wrap: break-word;"
                                                                        MaxLength="100" onkeyup="maxlengthfortxt(100);" ID="txtRemarks" Width="150px" AutoComplete="off"
                                                                        CssClass="md-form-control form-control login_form_content_input lowercase" ToolTip="Narration"></asp:TextBox>
                                                                </div>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox runat="server" TextMode="MultiLine" ValidationGroup="Footer" Style="word-wrap: break-word;"
                                                                        MaxLength="100" onkeyup="maxlengthfortxt(100);" ID="txtRemarksHdr" Width="150px" AutoComplete="off"
                                                                        CssClass="md-form-control form-control login_form_content_input lowercase" ToolTip="Narration"></asp:TextBox>
                                                                </div>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="2px" Visible="false" HeaderText="EntityTypeValue">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("EntityTypeValue")%>' ID="lblEntityTypeValue"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkViewInstallment" runat="server" Text="View" CausesValidation="false" CommandArgument='<%# Eval("Occurance_ID") %>'
                                                                    ToolTip="View" class="grid_btn" OnClick="lnkViewInstallment_Click"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Button ID="btnFtInsAdd" runat="server"
                                                                    CssClass="grid_btn" Text="+" ToolTip="Installment [Alt+N]" AccessKey="N" OnClick="btnFtInsAdd_Click"></asp:Button>
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Button ID="btnEtInsAdd" runat="server" ToolTip="Installment [Alt+N]" AccessKey="N"
                                                                    CssClass="grid_btn" Text="+" OnClick="btnEtInsAdd_Click"></asp:Button>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="200px" HeaderStyle-Width="200px">
                                                            <ItemTemplate>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                                                ToolTip="Edit[Alt+J]" class="grid_btn" AccessKey="J" title="Edit[Alt+J]">
                                                                            </asp:LinkButton>&nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="grid_btn_delete"
                                                                                OnClientClick="return confirm('Are you sure you want to Delete this record?');" AccessKey="K"
                                                                                ToolTip="Delete[Alt+K]">
                                                                            </asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <%--<asp:Button ID="btnAdd" runat="server" CommandName="AddNew" ValidationGroup="Footer"
                                                                    CssClass="grid_btn" Text="Add" onclick="if(fnConfirmAdd('Footer'))"></asp:Button>--%>

                                                                <div class="md-input">
                                                                    <asp:Button ID="btnAdd" runat="server" CssClass="grid_btn" Text="Add" CommandName="AddNew"
                                                                        ValidationGroup="Footer" ToolTip="Add[Alt+A]" AccessKey="A"></asp:Button>
                                                                </div>

                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn"
                                                                                AccessKey="U" title="Edit[Alt+U]" ValidationGroup="Footer" ToolTip="Edit[Alt+U]"></asp:LinkButton>&nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn_delete"
                                                                                CausesValidation="false" ToolTip="Edit[Alt+V]" AccessKey="V" title="Edit[Alt+V]"></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="2%" HeaderText="Occurance_ID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblOccurance_ID" Text='<%#Eval("Occurance_ID")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-Width="2%" HeaderText="Is_Inst" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblIs_Inst" Text='<%#Eval("Is_Inst")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                    </Columns>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <RowStyle HorizontalAlign="left" />
                                                </asp:GridView>
                                                <asp:HiddenField ID="HdnTranType" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>

                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <%--  <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:GridView runat="server" CellPadding="4" ShowFooter="false" AllowPaging="false"
                                ID="grvPrintManualJournal" Width="730px" Height="300px" AutoGenerateColumns="true">
                                <Columns>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>--%>
                    <div class="row">
                        <div style="display: none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:TextBox ID="txtTotDebit" Style="border: none; font-family: Calibri; font-size: 13px"
                                CssClass="styleTxtRightAlign" ReadOnly="true" Width="80px" runat="server" Visible="false">
                            </asp:TextBox>
                            <asp:TextBox ID="txtTotCredit" Style="border: none; font-family: Calibri; font-size: 13px"
                                CssClass="styleTxtRightAlign" ReadOnly="true" Width="80px" runat="server" Visible="false">
                            </asp:TextBox>
                            <asp:TextBox ID="txtTally" Width="60px" Visible="false" ReadOnly="true" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" enabled="false" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="Submit"
                            onclick="if(fnCheckPageValidators('Submit'))">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclientclick="return confirm( )"
                            onserverclick="btnClear_Click" type="button" accesskey="L" title="Clear[Alt+L]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>

                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">

                            <%--<button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" onclick="if(fnConfirmExit())"
                            type="button" accesskey="X" title="Exit[Alt+X]">--%>
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <%-- <i class="fa fa-file-pdf-o btn_i" aria-hidden="true" style="top: 26px !important;"></i>
                        <asp:Button ID="btnPrint" AccessKey="P" ToolTip="Alt+P" CausesValidation="false" CssClass="save_btn fa-file-pdf-o" OnClick="btnPrint_Click" Text="Print" runat="server"
                            Enabled="false" />--%>
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server" enabled="false"
                            type="button" causesvalidation="false" accesskey="P" title="Print[Alt+P]">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>

                        <button class="css_btn_enabled" id="btnCancelMJV" onserverclick="btnCancelMJV_Click" causesvalidation="false" runat="server" onclick="if(fnCancelClick())"
                            type="button" accesskey="C" title="Cancel[Alt+C]" enabled="false">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel MJV
                        </button>

                    </div>
                    <tr class="styleButtonArea">
                        <td>

                            <%--<asp:ValidationSummary runat="server" ID="vsPDCEntry" HeaderText="Correct the following validation(s):"
                                CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="false" ValidationGroup="Submit" />--%>

                            <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                                Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="Header" Width="500px"
                                ShowMessageBox="false" ShowSummary="true" />
                            <%--  <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                                Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="Footer" Width="500px"
                                ShowMessageBox="false" ShowSummary="true" />--%>
                            <input type="hidden" runat="server" value="0" id="hdnRowID" />
                            <input type="hidden" runat="server" value="1" id="hdnAccValid" />
                            <input type="hidden" runat="server" value="0" id="hdnStatus" />
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        </td>
                    </tr>
                    </table>
                    </td>
                </tr>
            <%--    <tr>
                    <td style="display: none">
                        <asp:Button runat="server" ID="btnPrintNew" BackColor="White" Height="0px" CausesValidation="false"
                            OnClick="btnPrint_Click" />
                    </td>
                </tr>--%>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="mpeInvestView" runat="server" PopupControlID="dvInvestView" TargetControlID="lblInvestView"
                BackgroundCssClass="modalBackground" Enabled="true" />
            <div runat="server" id="dvInvestView" style="display: none; width: 55%; height: 50%;">
                <%--<div id="dvInvImgs" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
                    <asp:ImageButton ID="imgInvestView" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                        OnClick="imgInvestView_Click" />
                </div>--%>
                <div>
                    <asp:Panel ID="pnlInvestView" GroupingText="Reference" CssClass="stylePanel" runat="server"
                        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                        <asp:UpdatePanel ID="updFI" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_RefValueDate" runat="server" ToolTip="Value Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgRefValueDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="calRefValueDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                PopupButtonID="imgRefValueDate" TargetControlID="txt_RefValueDate" OnClientShown="calendarShown">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label2" runat="server" CssClass="styleDisplayLabel" Text="Value Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_RefVoucherNumber" runat="server" ToolTip="Ref. Voucher Number" MaxLength="15" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="fteRefVoucherNumber" runat="server" TargetControlID="txt_RefVoucherNumber"
                                                FilterType="Numbers">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbl_RefVoucherNumber" runat="server" Text="Ref. Voucher Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_ReferenceDate" runat="server" ToolTip="Reference Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgReferenceDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="calReferenceDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                PopupButtonID="imgReferenceDate" TargetControlID="txt_ReferenceDate" OnClientShown="calendarShown">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label1" runat="server" Text="Reference Date" ToolTip="Reference Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_ChequeNumber" runat="server" ToolTip="Cheque Number" MaxLength="15" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="fteChequeNumber" runat="server" TargetControlID="txt_ChequeNumber"
                                                FilterType="Numbers">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbl_ChequeNumber" runat="server" Text="Cheque Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_ChequeDate" runat="server" ToolTip="Cheque Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgChequeDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="calChequeDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                PopupButtonID="imgChequeDate" TargetControlID="txt_ChequeDate" OnClientShown="calendarShown">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbl_ChequeDate" runat="server" Text="Cheque Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_RefCustomerName" runat="server" ToolTip="Customer Name" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbl_RefCustomerName" runat="server" Text="Customer / Entity Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_RefBranch" runat="server" ToolTip="Branch" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbl_RefBranch" runat="server" Text="Branch" ToolTip="Branch"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div align="right">

                                    <button class="css_btn_enabled" id="btnInsOk" causesvalidation="false" onserverclick="btnInsOk_Click" runat="server"
                                        type="button" accesskey="G" title="Ok[Alt+G]">
                                        <i class="fa fa-arrow-down" aria-hidden="true"></i>&emsp;<u>O</u>K
                                    </button>
                                    <button class="css_btn_enabled" id="btnInsCancel" title="Exit[Alt+T]" onclick="if(fnConfirmExit())" onserverclick="btnInsCancel_Click" runat="server"
                                        type="button" accesskey="T">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exi<u>t</u>
                                    </button>

                                </div>















                                </table>
                                
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnInsOk" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <asp:Label ID="lblInvestView" runat="server" Style="display: none;"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="mpeInstallmentPop" runat="server" PopupControlID="dvInstallmentPop" TargetControlID="lblInstallmentPop"
                BackgroundCssClass="modalBackground" Enabled="true" />
            <div runat="server" id="dvInstallmentPop" style="display: none; width: 55%; height: 85%;">
                <%--  <div id="Div2" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
                    <asp:ImageButton ID="imgInstallmentPop" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                        OnClick="imgInstallmentPop_Click" />
                </div>--%>
                <div>
                    <asp:Panel ID="pnlInstallmentPop" GroupingText="Installment Details" CssClass="stylePanel" runat="server"
                        BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                        <asp:UpdatePanel ID="updInstView" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtInstAccountNumber" runat="server" ToolTip="Account No." ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbl_InstAccountNumber" runat="server" CssClass="styleReqFieldLabel" Text="Account No."></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_InstTxnType" runat="server" ToolTip="Txn Type" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbl_InstTxnType" runat="server" CssClass="styleReqFieldLabel" Text="Txn Type"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_InstTranAmount" runat="server" ToolTip="Transaction Amount" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbl_InstTranAmount" runat="server" CssClass="styleReqFieldLabel" Text="Transaction Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="overflow-y: scroll; height: 320px;">
                                        <div class="md-input">
                                            <asp:GridView ID="grvRepayDetails" runat="server" Width="100%" OnRowDataBound="grvRepayDetails_RowDataBound" AutoGenerateColumns="false"
                                                RowStyle-HorizontalAlign="Center" ShowFooter="false" Style="overflow: scroll;">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="2%" Visible="false" HeaderText="Seq. No.">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblSeqNo" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-Width="2%" Visible="false" HeaderText="PA_SA_REF_ID">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblPASAREFID" Text='<%# Bind("PA_SA_REF_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Installment No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallmentNo" runat="server" Text='<%# Bind("INSTALLMENT_NO") %>' ToolTip="Installment No"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Inst. Date" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallmentDate" runat="server" Text='<%# Bind("InstallmentDate") %>' ToolTip="Installment Date"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Installment Amt." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallmentAmt" runat="server" Text='<%# Bind("InstallmentAmount") %>' ToolTip="Installment Amount"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Received Amt." ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReceivedAmt" runat="server" Text='<%# Bind("ReceivedAmount") %>' ToolTip="Received Amount"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="O/S Amount" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOutstandingAmount" runat="server" Text='<%# Bind("OutstandingAmount") %>' ToolTip="O/S Amount"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect" runat="server" Text='' ToolTip="Select"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="JV Amount" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="lblJVAmount" runat="server" AutoComplete="off" Text='<%# Bind("MJV_AMOUNT") %>' ToolTip="JV Amount"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fteJVAmount" runat="server" TargetControlID="lblJVAmount"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <%--       </td>
                                        </tr>
                                    <tr>
                                        <td colspan="6"></td>
                                    </tr>--%>

                                    <%--</table>--%>
                                </div>
                                <%--  <tr class="styleButtonArea" align="center" style="padding-left: 4px">
                                            <td colspan="6">--%>
                                <div align="right">
                                    <button class="css_btn_enabled" id="Button1" causesvalidation="false" onserverclick="btnInsrtOk_Click" runat="server"
                                        type="button" accesskey="O" title="Ok[Alt+O]">
                                        <i class="fa fa-arrow-down" aria-hidden="true"></i>&emsp;<u>O</u>K
                                    </button>



                                    <button class="css_btn_enabled" id="Button2" title="Exit[Alt+I]" onclick="if(fnConfirmExit())" onserverclick="btnInsrtCancel_Click" runat="server"
                                        type="button" accesskey="I">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Ex<u>i</u>t
                                    </button>
                                </div>
                                <%-- </td>--%>

                                <%-- </tr>--%>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="Button1" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <asp:Label ID="lblInstallmentPop" runat="server" Style="display: none;"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">

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
            if (!fnCheckPageValidators('Footer', false))
                return false;

            return true;
        }

        function fnDiableCredit(idDebit, idCredit, ctrlId) {

            var txtDebit = document.getElementById(idDebit);
            var txtCredit = document.getElementById(idCredit);

            //var txtDebit=document.getElementById('ctl00_ContentPlaceHolder1_grvManualJournal_ctl03_txtDebit');
            //var txtCredit=document.getElementById('ctl00_ContentPlaceHolder1_grvManualJournal_ctl03_txtCredit');
            txtCredit.disabled = false;
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

        // function fnClick() {

        //    document.getElementById('').click();
        //    return true;
        // }

        function fnCancelClick() {
            if (confirm('Are you sure you want to cancel?')) {
                return true;
            }
            else {
                return false;
            }
        }

        function fnChkValidate(lblJVAmount, lblOutstandingAmount, lblReceivedAmt) {
            debugger;
            var varjvamt = document.getElementById(lblJVAmount).value;
            var varOutstandingAmt = document.getElementById(lblOutstandingAmount).innerHTML;
            var varReceivedAmt = document.getElementById(lblReceivedAmt).innerHTML;
            var varv = document.getElementById('<%=HdnTranType.ClientID%>').value;

            if (varv == "1") {
                if (parseFloat(varjvamt) > parseFloat(varOutstandingAmt)) {
                    alert('JV Amount should not be greater than O/S Amount');
                    document.getElementById(lblJVAmount).value = "";
                    document.getElementById(lblJVAmount).focus();
                }
            }
            else {
                if (parseFloat(varjvamt) > parseFloat(varReceivedAmt)) {
                    alert('JV Amount should not be greater than received Amount');
                    document.getElementById(lblJVAmount).value = "";
                    document.getElementById(lblJVAmount).focus();
                }
            }
        }

    </script>

</asp:Content>
