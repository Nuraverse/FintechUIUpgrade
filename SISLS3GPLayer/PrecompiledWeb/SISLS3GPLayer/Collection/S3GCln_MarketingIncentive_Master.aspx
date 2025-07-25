<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GCln_MarketingIncentive_Master, App_Web_4kkykzxm" %>

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
                                <asp:Label runat="server" ID="lblHeading"> </asp:Label>
                            </h6>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlIncentiveMaster" runat="server" ToolTip="Details" GroupingText="Incentive Master"
                                CssClass="stylePanel">
                                <div class="row">

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" onmouseover="ddl_itemchanged(this)" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch"
                                                    ValidationGroup="Save" ErrorMessage="Select Branch" InitialValue="0"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblOption" runat="server" Text="Branch" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" class="md-form-control form-control" onmouseover="ddl_itemchanged(this)"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                    ValidationGroup="Save" ErrorMessage="Select Line of Business" InitialValue="0"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label runat="server" Text="Line of Business " ID="lbllOB" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtGroupName" runat="server" class="md-form-control form-control login_form_content_input requires_true" onkeydown="maxlengthfortxt(100);"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvGroupName" runat="server" ControlToValidate="txtGroupName"
                                                    ValidationGroup="Save" ErrorMessage="Enter Group Name" Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblGroup" runat="server" Text="Group" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTarget" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"
                                                Visible="false"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftxtTarget" TargetControlID="txtTarget"
                                                FilterType="Custom,Numbers"
                                                ValidChars="." runat="server" Enabled="True" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTarget"
                                                    ValidationGroup="Save" ErrorMessage="Enter Target" CssClass="validation_msg_box_sapn"
                                                    Display="None" />
                                            </div>
                                            <label>
                                                <asp:Label ID="Label2" runat="server" Text="Group Target" CssClass="styleReqFieldLabel" Visible="false" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAddStartDate" AutoPostBack="true" OnTextChanged="txtAddStartDate_TextChanged"
                                                runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceFromDate" runat="server" Enabled="True" PopupButtonID="imgFromDate"
                                                TargetControlID="txtAddStartDate" >
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtAddStartDate"
                                                    ValidationGroup="Save" ErrorMessage="Enter Start Date" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblStartDate" runat="server" Text="Start Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAddEndDate" AutoPostBack="true" OnTextChanged="txtAddEndDate_TextChanged"
                                                runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceToDate" runat="server" Enabled="True" PopupButtonID="imgToDate"
                                                TargetControlID="txtAddEndDate" >
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtAddEndDate"
                                                    ValidationGroup="Save" ErrorMessage="Enter End Date" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblEndDate" runat="server" Text="End Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <img id="imgCustomer" runat="server" style="width: 30px; height: 30px; border-width: 1px; border-style: solid" />
                                            <asp:Label ID="lblExcelCurrentPath" runat="server" Visible="true" Text="" ForeColor="Red" />
                                            <asp:Button ID="btnBrowse" runat="server" CssClass="styleSubmitButton" OnClick="btnBrowse_Click" Style="display: none;"></asp:Button>
                                            <asp:FileUpload ID="fuupload" runat="server" />
                                            <asp:Button CssClass="styleSubmitButton" ID="btnDlg" runat="server" Text="Browse"
                                                Style="display: none" CausesValidation="false"></asp:Button>
                                            <asp:LinkButton ID="lnkRemoveGroupImage" runat="server" Text="Remove Image" OnClick="lnkRemoveGroupImage_Click"></asp:LinkButton>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtGroupCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblGroupCode" runat="server" Text="Group Code" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkActiveMaster" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <asp:HiddenField ID="hdnSelectedpath" runat="server" />
                                <asp:Label ID="lblCurrentPath" runat="server" Visible="false" Text="" />
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlExecutiveDetails" runat="server" ToolTip="Executive Details" GroupingText="Executive Details"
                                CssClass="stylePanel">
                                <div class="row">

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlExecutiveType" class="md-form-control form-control" onmouseover="ddl_itemchanged(this)" runat="server">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvAddExecutiveType" runat="server" ControlToValidate="ddlExecutiveType"
                                                    ErrorMessage="Select Executive Type" Display="Dynamic" ValidationGroup="btnExecutiveAdd"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblExecutiveType" runat="server" Text="Type" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlEmployeeName" runat="server" ServiceMethod="GetEmployeNameList" IsMandatory="true"
                                                ValidationGroup="btnExecutiveAdd" ErrorMessage="Select Executive Name" />
                                            <label>
                                                <asp:Label ID="lblExecutiveName" runat="server" Text="Executive Name" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlEligibility" runat="server" class="md-form-control form-control" onmouseover="ddl_itemchanged(this)">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvAddEligibility" runat="server" ControlToValidate="ddlEligibility"
                                                    ErrorMessage="Select Eligibility" Display="Dynamic" ValidationGroup="btnExecutiveAdd"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblEligibility" runat="server" Text="Eligibility" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtExeEffFromDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="ImgExeEffFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceExeEffFromDate" runat="server" Enabled="true" PopupButtonID="ImgExeEffFromDate"
                                                TargetControlID="txtExeEffFromDate" >
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvExeEffFromDate" runat="server" ControlToValidate="txtExeEffFromDate"
                                                    ValidationGroup="btnExecutiveAdd" ErrorMessage="Enter Start Date" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblExeEffFromDate" runat="server" Text="Start Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtExeEffToDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgExeEffToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceExeEffToDate" runat="server" Enabled="True" PopupButtonID="imgExeEffToDate"
                                                TargetControlID="txtExeEffToDate" >
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvExeEffToDate" runat="server" ControlToValidate="txtExeEffToDate"
                                                    ValidationGroup="btnExecutiveAdd" ErrorMessage="Enter End Date" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblExeEffToDate" runat="server" Text="End Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <%--                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTargetgrid" runat="server" Style="text-align: right;" />

                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtTargetgrid"
                                                FilterType="Custom,Numbers"
                                                ValidChars="." runat="server" Enabled="True" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTargetgrid"
                                                    ValidationGroup="btnAdd" SetFocusOnError="true" ErrorMessage="Enter Target"
                                                    Display="None" />
                                                <asp:RequiredFieldValidator ID="rfvedittarget" runat="server" ControlToValidate="txtTargetgrid"
                                                    ValidationGroup="Edit" SetFocusOnError="true" ErrorMessage="Enter Target"
                                                    Display="None" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblTarget" runat="server" Text="Target" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>--%>
                                    <asp:Label ID="lblExecutiveSlNo" runat="server" Visible="False"></asp:Label>
                                </div>

                                <div align="right">
                                    <button class="css_btn_enabled" id="btnAdd" title="Add" onclick="if(fnConfirmAdd('btnExecutiveAdd'))" causesvalidation="false" onserverclick="btnAdd_Click" runat="server"
                                        type="button">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;Add
                                    </button>
                                    <button class="css_btn_enabled" id="btnModify" title="Edit" onclick="if(fnConfirmAdd('btnExecutiveAdd'))" causesvalidation="false" onserverclick="btnModify_Click" runat="server"
                                        type="button">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Modify
                                    </button>
                                    <button class="css_btn_enabled" id="btnCleargrid" title="Clear" causesvalidation="false" onserverclick="btnCleargrid_Click" runat="server"
                                        type="button">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clear
                                    </button>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvDetails" runat="server" AutoGenerateColumns="False" OnRowDeleting="grvDetails_RowDeleting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBExecutiveSelect_CheckedChanged"
                                                                AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="15px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sl No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvexeSerialNo" runat="server" Text='<%#Eval("slno") %> '></asp:Label>
                                                            <asp:Label ID="lblgvexeIncentiveDtlID" runat="server" Text='<%#Eval("INC_DTL_ID") %> ' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Executive Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvexetype" runat="server" Text='<%#Eval("EXECUTIVE_TYPE_DESC") %> '></asp:Label>
                                                            <asp:Label ID="lbltypeid" runat="server" Visible="false" Text='<%#Eval("EXECUTIVE_TYPE_ID") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Executive Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvexeExecutive" runat="server" Text='<%#Eval("EXECUTIVE_NAME") %> '></asp:Label>
                                                            <asp:Label ID="lblgvexeExecutiveid" runat="server" Visible="false" Text='<%#Eval("EXECUTIVE_ID") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Eligibility">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvexeEligibility" runat="server" Text='<%#Eval("ELIGIBILITY") %> '></asp:Label>
                                                            <asp:Label ID="lblgvexeEligibilityid" runat="server" Visible="false" Text='<%#Eval("ELIGIBILITY_ID") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Start Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvexeEffStartDate" runat="server" Text='<%#Eval("START_DATE") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="End Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvexeEffToDate" runat="server" Text='<%#Eval("END_DATE") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Delete" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="grid_btn_delete"
                                                                CausesValidation="false"></asp:Button>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlSlanMapping" runat="server" ToolTip="Slab Mapping" GroupingText="Slab Mapping"
                                CssClass="stylePanel">
                                <div class="row">

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlSlabCode" runat="server" ServiceMethod="GetSlabCodeList" IsMandatory="true"
                                                ValidationGroup="AddSlabDetails" ErrorMessage="Enter Slab Code" AutoPostBack="true" OnItem_Selected="ddlSlabCode_Item_Selected" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblSlabCode" runat="server" Text="Slab Code" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSlabName" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblSlabName" runat="server" Text="Slab Name" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSlabTarget" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvSlabTarget" runat="server" ControlToValidate="txtSlabTarget"
                                                    ValidationGroup="AddSlabDetails" SetFocusOnError="true" ErrorMessage="Enter Target"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblSlabTarget" runat="server" Text="Slab Target" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="row">
                                            <div style="width: 80%;">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtHoldPercentage" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvHoldPercentage" runat="server" ControlToValidate="txtHoldPercentage"
                                                            ValidationGroup="AddSlabDetails" SetFocusOnError="true" ErrorMessage="Enter Hold Percentage"
                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"/>
                                                    </div>
                                                    <label>
                                                        <asp:Label ID="lblHoldPercentage" runat="server" Text="Hold Percentage" CssClass="styleReqFieldLabel" />
                                                    </label>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="md-input">
                                                    <button id="btnHoldDetailsAdd" class="grid_btn" title="Hold Info" causesvalidation="false" onserverclick="btnHoldDetailsAdd_ServerClick" runat="server"
                                                        type="button">
                                                        ...
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtReleaseEffectiveDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Image ID="imgReleaseEffectiveDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceReleaseEffectiveDate" runat="server" Enabled="true" PopupButtonID="imgReleaseEffectiveDate"
                                                TargetControlID="txtReleaseEffectiveDate" >
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvReleaseEffectiveDate" runat="server" ControlToValidate="txtReleaseEffectiveDate"
                                                    ValidationGroup="AddSlabDetails" ErrorMessage="Enter Release Effective Date" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblReleaseEffectiveDate" runat="server" Text="Release Effective Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSlabStartDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Image ID="imgSlabStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceSlabStartDate" runat="server" Enabled="true" PopupButtonID="imgSlabStartDate"
                                                TargetControlID="txtSlabStartDate" >
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvSlabStartDate" runat="server" ControlToValidate="txtSlabStartDate"
                                                    ValidationGroup="AddSlabDetails" ErrorMessage="Enter Slab Start Date" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblSlabStartDate" runat="server" Text="Slab Start Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSlabEndDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Image ID="imgSlabEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceSlabEndDate" runat="server" Enabled="True" PopupButtonID="imgSlabEndDate"
                                                TargetControlID="txtSlabEndDate" >
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvSlabEndDate" runat="server" ControlToValidate="txtSlabEndDate"
                                                    ValidationGroup="AddSlabDetails" ErrorMessage="Enter Slab End Date" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" />
                                            </div>
                                            <label>
                                                <asp:Label ID="lblSlabEndDate" runat="server" Text="Slab End Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <asp:Label ID="lblSlabSlNo" runat="server" Visible="false"></asp:Label>
                                </div>

                                <div align="right">
                                    <button class="css_btn_enabled" id="btnSlabAdd" title="Add" onclick="if(fnConfirmAdd('AddSlabDetails'))" causesvalidation="false" onserverclick="btnSlabAdd_ServerClick" runat="server"
                                        type="button">
                                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;Add
                                    </button>
                                    <button class="css_btn_enabled" id="btnSlabModify" title="Edit" onclick="if(fnCheckPageValidators('Edit'))" causesvalidation="false" onserverclick="btnSlabModify_ServerClick" runat="server"
                                        type="button">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Modify
                                    </button>
                                    <button class="css_btn_enabled" id="btnSlabClear" title="Clear" causesvalidation="false" onserverclick="btnSlabClear_ServerClick" runat="server"
                                        type="button">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clear
                                    </button>
                                </div>

                                <div class="row">
                                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvSlabMapping" runat="server" AutoGenerateColumns="false" OnRowDeleting="grvSlabMapping_RowDeleting" OnRowDataBound="grvSlabMapping_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:RadioButton ID="rdbtnSlabSelect" runat="server" Checked="false" OnCheckedChanged="rdbtnSlabSelect_CheckedChanged"
                                                                AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="15px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sl No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvSlabSlNo" runat="server" Text='<%#Eval("SlNo") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Slab Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvSlabCode" runat="server" Text='<%#Eval("Slab_Code") %> '></asp:Label>
                                                            <asp:Label ID="lblgvSlabDetailID" runat="server" Visible="false" Text='<%#Eval("Slab_Detail_ID") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField HeaderText="Slab Name" DataField="Slab_Name" />
                                                    <asp:BoundField HeaderText="Slab Target" DataField="Slab_Target" ItemStyle-HorizontalAlign="Right" />

                                                    <asp:TemplateField HeaderText="Hold %">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkbtngvSlabHoldPErcentage" runat="server" Text='<%#Eval("Hold_Percentage") %> ' ForeColor="Red" Font-Underline="true" Font-Bold="true" OnClick="lnkbtngvSlabHoldPErcentage_Click"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Release Effective Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvReleaseEffectiveDate" runat="server" Text='<%#Eval("Release_Effective_Date") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Slab Start Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvStartDate" runat="server" Text='<%#Eval("Start_Date") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Slab End Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvEndDate" runat="server" Text='<%#Eval("End_Date") %> '></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnSlabDelete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete" CssClass="grid_btn_delete"></asp:Button>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>

                    <div align="right">
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
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>

                    <div>

                        <asp:ValidationSummary ID="vsSave" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="Save" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="VSbtnAdd" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="btnExecutiveAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />

                        <asp:ValidationSummary ID="vsAddSlabDetails" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="AddSlabDetails" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                    </div>



                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnBrowse" />
            <asp:PostBackTrigger ControlID="btnDlg" />
        </Triggers>
    </asp:UpdatePanel>

    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="mpeHoldDetails" runat="server" TargetControlID="btnModal" PopupControlID="pnlHoldDetails"
                BackgroundCssClass="styleModalBackground" Enabled="true" />
            <asp:Panel ID="pnlHoldDetails" Style="display: none; vertical-align: middle;" runat="server"
                BorderStyle="Solid" BackColor="White" ScrollBars="Auto">
                <asp:UpdatePanel ID="updtPnlHoldDetails" runat="server">
                    <ContentTemplate>
                        <%-- <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                        <div class="gird">
                            <asp:GridView ID="grvHoldDetails" runat="server" AutoGenerateColumns="false" ShowFooter="true" OnRowCommand="grvHoldDetails_RowCommand"
                                OnRowDataBound="grvHoldDetails_RowDataBound" OnRowDeleting="grvHoldDetails_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sl No" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvhldSlno" runat="server" Text='<%#Eval("Sl_No") %> '></asp:Label>
                                            <asp:Label ID="lblgvhldParentSlno" runat="server" Text='<%#Eval("Slab_Sl_No") %> '></asp:Label>
                                            <asp:Label ID="lblgvhldSlabID" runat="server" Text='<%#Eval("Slab_ID") %> '></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Release Margin From">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvhldFromMargin" runat="server" Text='<%#Eval("Margin_From") %> '></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input">
                                                <asp:TextBox ID="txtgvhdlFromMargin" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftbexgvhdlFromMargin" TargetControlID="txtgvhdlFromMargin"
                                                    FilterType="Custom,Numbers"
                                                    ValidChars="." runat="server" Enabled="True" />
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvgvhdlFromMargin" runat="server" ControlToValidate="txtgvhdlFromMargin"
                                                        ValidationGroup="AddHoldInfoDetails" ErrorMessage="Enter Release Margin From" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" />
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Release Margin To">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvhldToMargin" runat="server" Text='<%#Eval("Margin_To") %> '></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input">
                                                <asp:TextBox ID="txtgvhdlToMargin" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftbexgvhdlToMargin" TargetControlID="txtgvhdlToMargin"
                                                    FilterType="Custom,Numbers"
                                                    ValidChars="." runat="server" Enabled="True" />
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvgvhdlToMargin" runat="server" ControlToValidate="txtgvhdlToMargin"
                                                        ValidationGroup="AddHoldInfoDetails" ErrorMessage="Enter Release Margin To" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" />
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Release Percentage">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvhldMarginPercentage" runat="server" Text='<%#Eval("Margin_Percentage") %> '></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input">
                                                <asp:TextBox ID="txtgvhdlMarginPercentage" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftbexgvhdlMarginPercentage" TargetControlID="txtgvhdlMarginPercentage"
                                                    FilterType="Custom,Numbers"
                                                    ValidChars="." runat="server" Enabled="True" />
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvgvhdlMarginPercentage" runat="server" ControlToValidate="txtgvhdlMarginPercentage"
                                                        ValidationGroup="AddHoldInfoDetails" ErrorMessage="Enter Release Percentage" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" />
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnHoldDelete" runat="server" Text="Delete" CommandName="Delete"
                                                CausesValidation="false" CssClass="grid_btn_delete"></asp:Button>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input">
                                                <asp:Button ID="btnHoldAdd" ToolTip="Add the details" runat="server" CssClass="grid_btn" Text="Add" CommandName="ADD" ValidationGroup="AddHoldInfoDetails"></asp:Button>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <%-- </div>
                                        </div>--%>
                        <div align="center">
                            <button class="css_btn_enabled" id="btnhldExit" title="Exit" causesvalidation="false" onserverclick="btnhldExit_ServerClick"
                                runat="server" type="button">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                            </button>
                            <asp:ValidationSummary ID="vsAddHoldInfoDetails" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                ValidationGroup="AddHoldInfoDetails" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
            <asp:Button ID="btnModal" Style="display: none" runat="server" />
        </div>
    </div>


    <script type="text/javascript">
        function fnConfirmSave() {
            if (confirm('Do you sure want to save?')) {
                return true;
            }
            else {
                return false;
            }
        }

        function FunClearToDate() {
            document.getElementById('<%=txtAddEndDate.ClientID %>').value = "";
        }

        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }
        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }
    </script>
</asp:Content>

