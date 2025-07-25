<%@ page language="C#" autoeventwireup="true" inherits="S3GClnDebtCollectorRuleCard, App_Web_f2u5fcxj" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function Trim(strInput) {
            var FieldValue = document.getElementById(strInput).value;
            document.getElementById(strInput).value = FieldValue.trim();
        }

        function hideModalPopupViaClient() {
            var modalPopupBehavior = $find('programmaticModalPopupBehavior');
            modalPopupBehavior.hide();
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlbasedata" CssClass="stylePanel" GroupingText="Base Data" runat="server">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none;">
                                                        <asp:TextBox ID="txtPaymentRuleNumber" runat="server" ReadOnly="True"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblPaymentRuleNumber" runat="server" Text="Debt Collector RuleCard Number"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlLineofBusiness" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlBranch" ToolTip="Branch" runat="server" AutoPostBack="True"
                                                                OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" CssClass="md-form-control form-control" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblBranch" runat="server" Text="Branch"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEffectiveFrom" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <%--<asp:Image ID="imgCalRegNoValDate"
                                                                                        runat="server" imageUrl="~/Images/calendaer.gif" /><cc1:CalendarExtender ID="cexDate"
                                                                                            runat="server" OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtEffectiveFrom"
                                                                                            PopupButtonID="imgCalRegNoValDate" Enabled="false">
                                                                                        </cc1:CalendarExtender>--%>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label ID="lblEffectiveFrom" runat="server" Text="Effective From"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <asp:CheckBox ID="ChkActive" runat="server" Checked="True" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="Label1" runat="server" Text="Active"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <asp:Panel ID="pnlSequenceType" CssClass="stylePanel" GroupingText="Sequence Type" runat="server" Width="100%">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlSequenceType1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSequenceType1_SelectedIndexChanged"
                                                                            align="left" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblSequenceType1" runat="server" Text="Sequence Type 1"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvSeq1" runat="server" InitialValue="0" ControlToValidate="ddlSequenceType1"
                                                                                SetFocusOnError="true" ErrorMessage="Select at least one Sequence Type" Display="Dynamic" class="validation_msg_box_sapn"
                                                                                ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlSequenceType2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSequenceType2_SelectedIndexChanged"
                                                                            align="Left" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label2" runat="server" Text="Sequence Type 2"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlSequenceType3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSequenceType3_SelectedIndexChanged"
                                                                            align="left" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label3" runat="server" Text="Sequence Type 3"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlSequenceType4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSequenceType4_SelectedIndexChanged"
                                                                            align="left" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label4" runat="server" Text="Sequence Type 4"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlSequenceType5" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSequenceType5_SelectedIndexChanged"
                                                                            align="left" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label5" runat="server" Text="Sequence Type 5"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlSequenceType6" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSequenceType6_SelectedIndexChanged"
                                                                            align="left" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label6" runat="server" Text="Sequence Type 6"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <button id="btnNext" runat="server" accesskey="G" causesvalidation="false" class="css_btn_enabled" onserverclick="btnNext_Click" title="Go[Alt+G]" type="button">
                                                                            <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlMappingdtls" GroupingText="Mapping Details" runat="server" CssClass="stylePanel">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div class="gird">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                                                                <asp:Repeater ID="RptControls" runat="server" OnItemDataBound="RptControls_ItemDataBound">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="lblHeading" runat="server" Text="<%#Container.DataItem %>"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:DropDownList ID="row" runat="server" Visible="false" CssClass="md-form-control form-control">
                                                                                </asp:DropDownList>
                                                                                <cc1:ComboBox ID="rowTextbox" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                                    AutoPostBack="false" AppendDataBoundItems="false" CaseSensitive="false" AutoCompleteMode="Suggest">
                                                                                </cc1:ComboBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <tr>
                                                                            <td>&nbsp;&nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" AccessKey="A" CausesValidation="false" ToolTip="Add,Alt+A" CssClass="grid_btn" />
                                                                            </td>
                                                                        </tr>
                                                                    </FooterTemplate>
                                                                </asp:Repeater>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:GridView ID="gvAssetAcquisition" runat="server" AutoGenerateColumns="true" Width="100%"
                                                            OnRowDataBound="gvAssetAcquisition_RowDataBound" OnRowCommand="gvAssetAcquisition_RowCommand"
                                                            OnRowDeleting="gvAssetAcquisition_RowDeleting" ShowFooter="false">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Edit/Delete">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="lnkEdit" runat="server" ToolTip="Edit[Alt+I]" Text="Edit" AccessKey="I" OnClick="lnk_edit_Click"
                                                                            CausesValidation="false" CssClass="grid_btn_delete"></asp:Button>
                                                                        <asp:Button ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                            OnClientClick="return confirm('Are you sure want to delete?');" AccessKey="R" CausesValidation="false" CssClass="grid_btn_delete" ToolTip="Delete[Alt+R]"></asp:Button>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Button ID="lnkAdd" runat="server" Text="Add" AccessKey="T" ToolTip="Add,Alt+T" CssClass="grid_btn" OnClick="lnk_add_Click" CausesValidation="false"></asp:Button>
                                                                    </FooterTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnSave" runat="server" onclick="if(fnCheckPageValidators('btnSave'))" accesskey="S"
                        class="css_btn_enabled" type="button" onserverclick="btnSave_Click" title="Save[Alt+S]"
                        validationgroup="btnSave" causesvalidation="false">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                    <button id="btnClear" runat="server" causesvalidation="false" class="css_btn_enabled"
                        type="button" onclick="if(fnConfirmClear())" onserverclick="btnClear_Click"
                        title="Clear[Alt+L]" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <button id="btnCancel" runat="server" type="button"
                        causesvalidation="false" class="css_btn_enabled" onserverclick="btnCancel_Click"
                        title="Exit[Alt+X]" onclick="if(fnConfirmExit())" accesskey="X">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row">
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                </div>
                <div class="row" style="display: none;">
                    <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                        HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderPassword" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlPassword" BackgroundCssClass="styleModalBackground" Enabled="True">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="PnlPassword" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="50%">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="txtpincode" runat="server" Visible="false" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblpincode" Text="Postal" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProduct" runat="server" Visible="false" CssClass="md-form-control form-control login_form_content_input" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblProduct" Text="Scheme" />
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlPeriod" runat="server" Visible="false" CssClass="md-form-control form-control login_form_content_input" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblPeriod" Text="Period" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlcategory" runat="server" Visible="false" CssClass="md-form-control form-control login_form_content_input" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblcategory" Text="Category" />
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlvalue" runat="server" Visible="false" CssClass="md-form-control form-control login_form_content_input" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblvalue" Text="Value" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlsalesperson" runat="server" Visible="false" CssClass="md-form-control form-control login_form_content_input" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblsalesperson" Text="SalesPerson" />
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlDebtCollector" runat="server" CssClass="md-form-control form-control login_form_content_input" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblDebtCollector" Text="Debt Collector" />
                                </label>
                            </div>
                        </div>
                    </div>
                    <div align="right" class="row">
                        <button class="css_btn_enabled" id="btnModifyModal" onserverclick="btnModifyModal_Click" runat="server"
                            type="button" accesskey="M" title="Modify the Details[Alt+M]" causesvalidation="false">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                        </button>
                        <button class="css_btn_enabled" id="btnAddModal" onserverclick="btnAddModal_Click" runat="server"
                            type="button" accesskey="D" title="Add the Details[Alt+Shift+D]" causesvalidation="false">
                            <i class="fa fa-plus" aria-hidden="true"></i>&emsp;A<u>d</u>d
                        </button>
                        <button class="css_btn_enabled" id="btnCancelModal" onserverclick="btnCancelModal_Click" runat="server"
                            type="button" accesskey="E" title="Add the Details[Alt+Shift+E]" onclick="if(fnConfirmExit())" causesvalidation="false">
                            <i class="fa fa-share" aria-hidden="true"></i>&emsp;<u>E</u>xit
                        </button>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />
</asp:Content>
