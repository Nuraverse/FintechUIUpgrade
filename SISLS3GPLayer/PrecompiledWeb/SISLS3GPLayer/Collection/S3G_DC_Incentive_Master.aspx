<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_FA_DC_Incentive_Master, App_Web_la20gqab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                                <asp:DropDownList ID="ddlCollectionType" TabIndex="0" runat="server" onmouseover="ddl_itemchanged(this);"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlCollectionType_SelectedIndexChanged" ToolTip="Collection Type"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvCollectionType" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlCollectionType" ValidationGroup="Add" InitialValue="0" ErrorMessage="Select a Collection Type"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Collection Type" ID="lblCollectionType" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlBranch" ToolTip="Branch" class="md-form-control form-control" runat="server">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlBranch" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlBranch" ValidationGroup="Add" InitialValue="0" ErrorMessage="Select a Branch"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblLocationCode" runat="server" CssClass="styleReqFieldLabel" Text="Branch"> </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:CheckBox ID="chkActive" runat="server" Checked="true" ToolTip="Active" />
                                <span class="highlight"></span>
                                <span class="bar"></span>

                                <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active"></asp:Label>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="gvIncentive" runat="server" AutoGenerateColumns="False" EditRowStyle-CssClass="styleFooterInfo"
                                    ShowFooter="True" OnRowDataBound="gvIncentive_RowDataBound" OnRowDeleting="gvIncentive_Deleting"
                                    DataKeyNames="Sno" CssClass="gird_details">
                                    <RowStyle HorizontalAlign="Left" Width="100%" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl.No." ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                <asp:Label ID="lblSerialNo" runat="server" Visible="false" Text='<%# Bind("Sno") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProduct" runat="server" Text='<%# Bind("Product") %>'></asp:Label>
                                                <asp:Label ID="lblProduct_ID" runat="server" Text='<%# Bind("PRODUCT_ID") %>'
                                                    Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlProduct" AutoPostBack="true" OnSelectedIndexChanged="DropDownCashflow_SelectedIndexChanged" runat="server" ToolTip="Cash Inflow"
                                                        CssClass="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlProduct" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="ddlProduct" ValidationGroup="Grid" InitialValue="0" ErrorMessage="Select a Product"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contract Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblchargetype" Text='<%# Bind("ContractType") %> ' runat="server"></asp:Label>
                                                <asp:Label ID="lblchargetypevalue" Text='<%# Bind("CONTRACT_TYPE_ID") %>' Visible="false"
                                                    runat="server">
                                                </asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlContractType" AutoPostBack="true" OnSelectedIndexChanged="DropDownchargetype_SelectedIndexChanged" runat="server"
                                                        CssClass="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlContractType" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="ddlContractType" ValidationGroup="Grid" InitialValue="0" ErrorMessage="Select a Contract Type"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bucket From">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtBucketFrom" ContentEditable="false" MaxLength="4" EnableViewState="true" Text='<%# Bind("BucketFrom")%>'
                                                    Width="70px" Style="text-align: right" runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="fteBucketFrom" runat="server" TargetControlID="txtBucketFrom"
                                                    FilterType="Numbers" Enabled="true">
                                                </cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAddBucketFrom" MaxLength="4" EnableViewState="true" runat="server" Style="text-align: right"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvAddBucketFrom" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="txtAddBucketFrom" ValidationGroup="Grid" InitialValue="" ErrorMessage="Enter the Bucket From"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="fteAddBucketFrom" runat="server" TargetControlID="txtAddBucketFrom"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bucket To">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtBucketTo" MaxLength="4" ContentEditable="false" EnableViewState="true" Width="70px" Style="text-align: right"
                                                    Text='<%# Bind("BucketTo")%>' runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="fteBucketTo" runat="server" TargetControlID="txtBucketTo"
                                                    FilterType="Numbers" Enabled="true">
                                                </cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAddBucketTo" MaxLength="4" EnableViewState="true" runat="server" Style="text-align: right"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtAddBucketTo" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="txtAddBucketTo" ValidationGroup="Grid" InitialValue="" ErrorMessage="Enter the Bucket To"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="fteAddBucketTo" runat="server" TargetControlID="txtAddBucketTo"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Start Date">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtStartDate" EnableViewState="true" ContentEditable="true" Text='<%# Bind("StartDate")%>'
                                                    Width="90px" Style="text-align: left" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAddStartDate" ContentEditable="true" EnableViewState="true" Text=""
                                                        Style="text-align: left" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtAddStartDate" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="txtAddStartDate" ValidationGroup="Grid" InitialValue="" ErrorMessage="Enter the Start Date"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtAddStartDate"
                                                        PopupButtonID="imgStartDate" ID="calStartDate"
                                                        Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="End Date">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtEndDate" ContentEditable="true" EnableViewState="true" Text='<%# Bind("EndDate")%>'
                                                    Width="90px" Style="text-align: left" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAddEndDate" ContentEditable="true" EnableViewState="true" Text=""
                                                        Style="text-align: left" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtAddEndDate" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="txtAddEndDate" ValidationGroup="Grid" InitialValue="" ErrorMessage="Enter the End Date"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtAddEndDate"
                                                        PopupButtonID="imgEndDate" ID="calEndDate"
                                                        Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Value" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Button ID="btnAssignIValue" runat="server" CssClass="grid_btn"
                                                    CausesValidation="false" OnClick="btnIAssignValue_Click" ToolTip="Assign Value"
                                                    Text="Assign" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnAssignFValue" runat="server" CausesValidation="false" CssClass="grid_btn"
                                                    OnClick="btnFAssignValue_Click" ToolTip="Assign Value,Alt+A" AccessKey="A" Text="Assign" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkActive" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "Is_Active").ToString().ToUpper() == "TRUE"%>' />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:CheckBox ID="chkActiveF" runat="server" ToolTip="Active" Checked="true" Enabled="false"></asp:CheckBox>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete"
                                                    OnClientClick="return confirm('Are you sure want to Delete this record?');" ToolTip="Delete">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CommandName="Add" CssClass="grid_btn"
                                                    OnClick="btnAdd_Click" Text="Add" ValidationGroup="Grid" ToolTip="Add,Alt+T" AccessKey="T" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Center" Width="10%" />
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle CssClass="styleFooterInfo" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" causesvalidation="true" title="Save[Alt+S]" validationgroup="Add">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                        </button>
                        <%--<cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure want to clear?"
                            TargetControlID="btnClear">
                        </cc1:ConfirmButtonExtender>--%>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                        </button>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="ProductDetailsAdd" runat="server" HeaderText="Correct the following validation(s):"
                                CssClass="styleMandatoryLabel" ShowSummary="true" ValidationGroup="Add" />
                            <asp:ValidationSummary ID="ProductDetailsValue" runat="server" HeaderText="Correct the following validation(s):"
                                CssClass="styleMandatoryLabel" ShowSummary="true" ValidationGroup="Grid" />
                        </div>
                    </div>
                    <%-- Added by Anbuvel for grid model popup--%>
                </div>
            </div>
            <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="ModalPopupExtenderShow" runat="server" TargetControlID="btnModal"
                PopupControlID="PnlAssignAmount" BackgroundCssClass="styleModalBackground" Enabled="true">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="PnlAssignAmount" Style="display: none; vertical-align: middle" runat="server"
                BorderStyle="Solid" BackColor="White" Width="850px">
                <asp:UpdatePanel ID="upPass" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <div id="divTransaction" class="container" runat="server" style="height: 200px; width: 100%;">
                                        <asp:GridView ID="grvAssignValue" runat="server" ShowFooter="true" AutoGenerateColumns="false"
                                            Width="99%" Height="50px" OnRowCommand="grvassign_rowcommand" OnRowDeleting="grv_RowDeleting" 
                                            OnRowDataBound="grvAssignValue_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SNo" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNo" Text='<% #Bind("SNo")%>' Visible="false" runat="server"></asp:Label>
                                                        <asp:Label ID="Label1" Style="text-align: right" Text='<%#Container.DataItemIndex+1%>'
                                                            Visible="true" runat="server"> </asp:Label>
                                                        <asp:Label ID="Productid" runat="server" Text='<% #Bind("Productid")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="5%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Target From">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTargetFrom" ToolTip="Target from" Style="text-align: right"
                                                            Text='<% #Bind("TargetFrom")%>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtTargetFrom" runat="server" MaxLength="12" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fteTargetFromPer" runat="server" TargetControlID="txtTargetFrom"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="21%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Target To">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTargetTo" Visible="true" Style="text-align: right" Text='<% #Bind("TargetTo")%>'
                                                            runat="server">
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtTargetTo" runat="server" MaxLength="6" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fteTargetTo" runat="server" TargetControlID="txtTargetTo"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="21%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Collection % from">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFromPercentage" ToolTip="Slab from" Style="text-align: right"
                                                            Text='<% #Bind("FromPercentage")%>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtFromPercentage" runat="server" MaxLength="6" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fteFromPer" runat="server" TargetControlID="txtFromPercentage"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <asp:RangeValidator ID="RegxFromPercentage" runat="server" Type="Double" Display="None" ValidationGroup="PopUpAdd"
                                                                ControlToValidate="txtFromPercentage" Visible="false" MaximumValue="100"
                                                                MinimumValue="0" ErrorMessage="Collection % from should not exceed 100%"></asp:RangeValidator>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="12%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection % to">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblToPercentage" Visible="true" Style="text-align: right" Text='<% #Bind("ToPercentage")%>'
                                                            runat="server">
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtToPercentage" runat="server" MaxLength="6" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fteToPer" runat="server" TargetControlID="txtToPercentage"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <asp:RangeValidator ID="RegxToPercentage" runat="server" Type="Double" Display="None" ValidationGroup="PopUpAdd"
                                                                ControlToValidate="txtToPercentage" Visible="false" MaximumValue="100"
                                                                MinimumValue="0" ErrorMessage="Collection % to should not exceed 100%"></asp:RangeValidator>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="12%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Incentive %">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDCIncentiveamount" Style="text-align: right" Visible="true" Text='<% #Bind("DCincentiveAmount")%>'
                                                            runat="server">
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtAddDCIncentiveamount" MaxLength="7" Style="text-align: right" runat="server"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilterAddDCIncentiveamount" runat="server" TargetControlID="txtAddDCIncentiveamount"
                                                                FilterType="Numbers" Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="12%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Supervisor %">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSUPIncentiveamount" Style="text-align: right" Visible="true" Text='<% #Bind("SUPincentiveAmount")%>'
                                                            runat="server">
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtAddSUPIncentiveamount" MaxLength="7" Style="text-align: right" runat="server"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilterAddSUPIncentiveamount" runat="server" TargetControlID="txtAddSUPIncentiveamount"
                                                                FilterType="Numbers" Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="12%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                            Style="text-align: right" Text="Delete" OnClientClick="return confirm('Are you sure want to Delete this record?');"
                                                            ToolTip="Delete">
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Button ID="btnAddd" runat="server" CausesValidation="true" CommandName="Add"
                                                            CssClass="grid_btn" Text="Add" ValidationGroup="PopUpAdd" ToolTip="Add,Alt+A" AccessKey="A" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Center" Width="5%" />
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div align="center">
                            <button class="css_btn_enabled" id="btnModalAdd" onserverclick="btnModalAdd_Click" runat="server" visible="false"
                                type="button" accesskey="V" causesvalidation="false" title="Save[Alt+V]">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Sa<u>v</u>e
                            </button>
                            <button class="css_btn_enabled" id="btnModalCancel" title="Exit[Alt+E]" causesvalidation="false" onserverclick="btnModalCancel_Click" runat="server"
                                type="button" accesskey="E">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                            </button>
                        </div>

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                    HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
            <asp:Button ID="btnModal" Style="display: none" runat="server" />
        </div>
    </div>
</asp:Content>

