<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GCln_Marketing_SlabMaster, App_Web_ru52obyl" %>

<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading"></asp:Label>
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlHeader" runat="server" ToolTip="Details" GroupingText="Header"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" onmouseover="ddl_itemchanged(this)">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblOption" runat="server" Text="Branch" CssClass="styleReqFieldLabel" />
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch"
                                                    ValidationGroup="Save" ErrorMessage="Select Branch" InitialValue="0"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" class="md-form-control form-control" onmouseover="ddl_itemchanged(this)"></asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Line of Business" ID="lbllOB" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" ControlToValidate="ddlLOB"
                                                    ValidationGroup="Save" ErrorMessage="Please select at least one Line of Business" InitialValue="0"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn" />
                                            </div>
                                        </div>
                                    </div>
                                    <%--<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtGroup" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblGroup" runat="server" Text="Group" CssClass="styleReqFieldLabel" />
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvGroup" runat="server" ControlToValidate="txtGroup"
                                                    ValidationGroup="Save" ErrorMessage="Enter Group" Display="Dynamic" />
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label ID="lblActive" runat="server" Text="Active" CssClass="styleReqFieldLabel" />
                                            <asp:CheckBox Checked="true" ID="chkActive" Enabled="false" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <asp:Button AccessKey="C" CssClass="save_btn fa fa-floppy-o"
                                            Text="Copy Profile" ID="lnkCopyProfile" runat="server" ToolTip="Copy Profile,Alt+C" OnClick="lnkCopyProfile_Click"></asp:Button>
                                        <%--OnClientClick="return fnCopyProfile();"--%>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div id="divCopyProfile" runat="server" style="display: none">
                                <asp:Panel ID="pnlCopyProfile" runat="server" ToolTip="Details" GroupingText="Copy Profile"
                                    CssClass="stylePanel">
                                    <div class="gird">
                                        <asp:GridView ID="grvCopyProfile" runat="server" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkCopyItem" runat="server" AutoPostBack="true" OnCheckedChanged="chkCopyItem_CheckedChanged" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCopySlabMasterID" runat="server" Text='<%#Eval("Slab_Master_ID") %> ' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Branch" DataField="Location" />
                                                <asp:BoundField HeaderText="Line of Business" DataField="LOB" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlDetails" runat="server" ToolTip="Details" GroupingText="Details"
                                CssClass="stylePanel">
                                <div class="row">

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSlabCode" runat="server" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblSlabCode" runat="server" Text="Slab Code" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSlab" runat="server" onkeydown="maxlengthfortxt(60);" class="md-form-control form-control login_form_content_input requires_true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvAgentCode" runat="server" ControlToValidate="txtSlab"
                                                    ValidationGroup="btnAdd" SetFocusOnError="true" ErrorMessage="Enter Slab Name"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                <%-- <asp:RequiredFieldValidator ID="rfvslabEdit" runat="server" ControlToValidate="txtSlab"
                                                    ValidationGroup="Edit" SetFocusOnError="true" ErrorMessage="Enter Slab Name"
                                                    Display="Dynamic" />--%>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblSlab" runat="server" Text="Slab Name" CssClass="styleReqFieldLabel" />
                                            </label>
                                            <asp:HiddenField ID="hid" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlPaytype" onmouseover="ddl_itemchanged(this)" runat="server" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvpaytype" runat="server" ControlToValidate="ddlPaytype"
                                                    ValidationGroup="btnAdd" SetFocusOnError="true" ErrorMessage="Select Paytype" InitialValue="0"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                <%-- <asp:RequiredFieldValidator ID="Rfveditpaytype" runat="server" ControlToValidate="ddlPaytype"
                                                    ValidationGroup="Edit" SetFocusOnError="true" ErrorMessage="Select Paytype" InitialValue="0"
                                                    Display="Dynamic" />--%>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblpaytype" runat="server" Text="Pay Type" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPercentage" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true" />
                                            <cc1:FilteredTextBoxExtender ID="ftxtPercentage" TargetControlID="txtPercentage" FilterType="Custom,Numbers"
                                                ValidChars="." runat="server" Enabled="True" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvpercentage" runat="server" ControlToValidate="txtPercentage"
                                                    ValidationGroup="btnAdd" SetFocusOnError="true" ErrorMessage="Enter Percentage/Amount"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                <%--<asp:RequiredFieldValidator ID="rfveditpercentage" runat="server" ControlToValidate="txtPercentage"
                                                    ValidationGroup="Edit" SetFocusOnError="true" ErrorMessage="Enter Percentage/Amount"
                                                    Display="Dynamic" />--%>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblpercentage" runat="server" Text="Percentage" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <%--<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSlabTarget" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true" />
                                            <cc1:FilteredTextBoxExtender ID="fteslabtarget" TargetControlID="txtSlabTarget" FilterType="Custom,Numbers"
                                                ValidChars="." runat="server" Enabled="True" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVslabtarget1" runat="server" ControlToValidate="txtSlabTarget"
                                                    ValidationGroup="btnAdd" SetFocusOnError="true" ErrorMessage="Enter Slab Target"
                                                    Display="Dynamic" />
                                                <asp:RequiredFieldValidator ID="RFVslabtarget2" runat="server" ControlToValidate="txtSlabTarget"
                                                    ValidationGroup="Edit" SetFocusOnError="true" ErrorMessage="Enter Slab Target"
                                                    Display="Dynamic" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblSlabTarget" runat="server" Text="Slab Target" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>--%>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                AutoPostBack="true" OnTextChanged="txtStartDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceFromDate" runat="server" Enabled="True" PopupButtonID="imgFromDate"
                                                TargetControlID="txtStartDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtStartDate" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Select Start Date"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnAdd"></asp:RequiredFieldValidator>
                                                <%-- <asp:RequiredFieldValidator ID="rfvedittxtStartDate" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Select Start Date"
                                                    CssClass="styleMandatoryLabel" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Edit"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblStartDate" runat="server" Text="Effective Start Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEndDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                AutoPostBack="true" OnTextChanged="txtEndDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceToDate" runat="server" Enabled="True" PopupButtonID="imgToDate"
                                                TargetControlID="txtEndDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtEndDate" runat="server" ControlToValidate="txtEndDate" ErrorMessage="Select End Date"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnAdd"></asp:RequiredFieldValidator>
                                                <%--<asp:RequiredFieldValidator ID="rfvedittxtEndDate" runat="server" ControlToValidate="txtEndDate" ErrorMessage="Select End Date"
                                                    CssClass="styleMandatoryLabel" Display="Dynamic" SetFocusOnError="true" ValidationGroup="Edit"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblEndDate" runat="server" Text="Effective End Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label runat="server" Text="Active" ID="lblSlabActive"></asp:Label>
                                            <asp:CheckBox Checked="true" ID="chkActive1" Enabled="false" runat="server" />
                                            <asp:Label ID="lblSlNo" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                                <div align="right">
                                    <button class="css_btn_enabled" id="btnAdd" title="Add,Alt+A" onclick="if(fnConfirmAdd('btnAdd'))" causesvalidation="false" onserverclick="btnAdd_Click" runat="server"
                                        type="button" accesskey="A">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                    </button>
                                    <button class="css_btn_enabled" id="btnModify" title="Edit,Alt+M" onclick="if(fnCheckPageValidators('btnAdd'))" causesvalidation="false" onserverclick="btnModify_Click" runat="server"
                                        type="button" accesskey="M">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                    </button>
                                    <button class="css_btn_enabled" id="btnCleargrid" title="Clear,Alt+R" causesvalidation="false" onserverclick="btnCleargrid_Click" runat="server"
                                        type="button" accesskey="R">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                                    </button>
                                </div>
                            </asp:Panel>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvDetails" runat="server" AutoGenerateColumns="False"
                                    OnRowDeleting="grvDetails_RowDeleting" OnRowDataBound="grvDetails_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBSelect_CheckedChanged"
                                                    AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="15px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Eval("slno") %> '></asp:Label>
                                            </ItemTemplate>
                                            <%-- <ItemStyle Width="6%" HorizontalAlign="Center" />--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Slab Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSlabId" runat="server" Text='<%#Eval("slab_detail_id") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField HeaderText="Slab Code" DataField="SLAB_CODE" />

                                        <asp:TemplateField HeaderText="Slab Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvslab" runat="server" Text='<%#Eval("Slab") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Pay Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvPaytype" runat="server" Text='<%#Eval("Pay_Type") %> '></asp:Label>
                                                <asp:Label ID="lblgvPayty" runat="server" Visible="false" Text='<%#Eval("Pay_Type_Id") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Percentage / Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpercent" runat="server" Text='<%#Eval("Percentage") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>

                                        <%--<asp:TemplateField HeaderText="Slab Target">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSlabTarget" runat="server" Text='<%#Eval("Slab_Target") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>--%>

                                        <asp:BoundField HeaderText="Effective Start Date" DataField="EFFECTIVE_START_DATE" />
                                        <asp:BoundField HeaderText="Effective End Date" DataField="EFFECTIVE_END_DATE" />
                                        <asp:TemplateField HeaderText="Active">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkgvactive" runat="server" Enabled="false" Checked='<%# Eval("Is_Active").ToString().ToUpper() == "TRUE" ?  true:false %>'></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                    CausesValidation="false" CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Delete this record?');">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="10px" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click"
                            runat="server" type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnclear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnclear_Click"
                            runat="server" type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btncancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btncancel_Click"
                            runat="server" type="button" accesskey="X">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
                            <asp:ValidationSummary ID="vsSave" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="Save" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="VSbtnAdd" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="btnAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="VSbtnModify" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="Edit" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        </div>
                    </div>

                    <asp:HiddenField ID="hdnCopyProfileID" runat="server" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function fnConfirmSave() {
            if (confirm('Are you sure want to save?')) {
                return true;
            }
            else {
                return false;
            }
        }

        function fnCopyProfile() {
            if (document.getElementById('<%=lnkCopyProfile.ClientID%>').value == 'Hide Copy Profile') {
                document.getElementById('<%=lnkCopyProfile.ClientID%>').value = 'Copy Profile';
                document.getElementById('ctl00_ContentPlaceHolder1_divCopyProfile').style.display = 'none';
            }
            else {
                document.getElementById('<%=lnkCopyProfile.ClientID%>').value = 'Hide Copy Profile';
                document.getElementById('ctl00_ContentPlaceHolder1_divCopyProfile').style.display = 'Block';
            }
            document.getElementById('<%=lnkCopyProfile.ClientID%>').title = document.getElementById('<%=lnkCopyProfile.ClientID%>').value;
        }
    </script>
</asp:Content>
