<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAApprovals_Add, App_Web_4hds5vgj" title="Approval" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UPApprovals" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Approval" ID="lblHeading" CssClass="styleInfoLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel GroupingText="Approval Details" ID="pnlApprovalDetails" runat="server"
                            CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                    <div class="md-input">
                                        <asp:RadioButtonList ID="RBLApproved" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                            OnSelectedIndexChanged="RBLApproved_SelectedIndexChanged" Visible="false">
                                            <%--<asp:ListItem Value="0" Text="UnApproved" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="All"></asp:ListItem>--%>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlActivity" runat="server"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvactivity" runat="server" ControlToValidate="ddlActivity"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Activity" ValidationGroup="btnGo"
                                                InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblActivity" ToolTip="Activity" runat="server" Text="Activity" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <%--  <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                            OnItem_Selected="ddlLocation_SelectedIndexChanged" />--%>
                                        <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Branch"></asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvlocation" runat="server" ControlToValidate="ddlLocation"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Branch" ValidationGroup="btnGo"
                                                InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLocation" ToolTip="Branch" runat="server" Text="Branch" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAppStatus" runat="server" AutoPostBack="true"
                                            class="md-form-control form-control" OnSelectedIndexChanged="ddlAppStatus_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Un Approved"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Approved"></asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RfvStatus" runat="server" ControlToValidate="ddlAppStatus"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Filter By" ValidationGroup="btnGo"
                                                InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                        <input type="hidden" value="0" runat="server" id="hdnID" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblstatus" runat="server" CssClass="styleReqFieldLabel" Text="Filter By"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDocumentType" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlDocumentType_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvdocumenttype" runat="server" ControlToValidate="ddlDocumentType"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Document Type" ValidationGroup="btnGo"
                                                InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDocumentType" runat="server" CssClass="styleReqFieldLabel" Text="Document Type"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <%--<asp:DropDownList ID="ddlDocument_No" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlDocument_No_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>--%>

                                        <UC:Suggest ID="ddlDocument_No" runat="server" ServiceMethod="GetDocumentList" OnItem_Selected="ddlDocument_No_SelectedIndexChanged"
                                            ErrorMessage="Select Document Number" AutoPostBack="true" ToolTip="Document Number" />
                                        <%--<div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvdocumentno" runat="server" ControlToValidate="ddlDocument_No"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Document No." ValidationGroup="btnGo"
                                                InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDocument_No" runat="server" CssClass="styleReqFieldLabel" Text="Document Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDocumentDate" runat="server" ReadOnly="true"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDocumentDate" runat="server" CssClass="styleFieldLabel" Text="Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" runat="server" validationgroup="btnGo"
                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                </button>

                                <button class="css_btn_enabled" id="ReqID" onserverclick="ReqID_serverclick" runat="server"
                                    type="button" causesvalidation="false" accesskey="V" title="View Details,Alt+V" visible="false">
                                    <u>V</u>iew Details
                                </button>


                                <%--<asp:LinkButton Text="View Details" CausesValidation="false" runat="server" ID="ReqID" CssClass="styleDisplayLabel"
                                    ToolTip="View Document details" OnClick="ReqID_serverclick" Visible="false">
                                </asp:LinkButton>--%>
                                <%--  --%>
                                <asp:HiddenField ID="hdnTotalNoApproval" runat="server" />

                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel GroupingText="Approver Details" ID="pnlAppDetails" runat="server" CssClass="stylePanel" Visible="false">
                            <div class="row">

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtApprovalDate" runat="server" ToolTip="Approval Date"
                                            class="md-form-control form-control login_form_content_input requires_true"
                                            OnTextChanged="txtApprovalDate_TextChanged" AutoPostBack="true" ReadOnly="true"></asp:TextBox>

                                        <cc1:CalendarExtender ID="calApprovalDate" runat="server" Enabled="false" TargetControlID="txtApprovalDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvApprovalDate" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtApprovalDate"
                                                ValidationGroup="btnSave" Display="Dynamic" ErrorMessage="Select Approval Date"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblApprovalDate" runat="server" Text="Approval Date" ToolTip="Approval Date" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:Label ID="lblApproverName" runat="server" ToolTip="Approver Name"></asp:Label>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblhdrApproverName" runat="server" ToolTip="Approver Name" Text="Approver Name" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAction" runat="server" class="md-form-control form-control" ToolTip="Action"></asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvddlAction" runat="server" ControlToValidate="ddlAction" ValidationGroup="btnSave"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Action"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblAction" runat="server" ToolTip="Action" Text="Action" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" autocomplete="off" TextMode="Password" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Password"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="ftxtPassword" runat="server" TargetControlID="txtPassword"
                                            FilterType="Custom" FilterMode="InvalidChars" InvalidChars=" ">
                                        </cc1:FilteredTextBoxExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblPassword" runat="server" ToolTip="Password" Text="Password" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="btnSave"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Password"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>



                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <asp:Panel ID="pnltransaction" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Transaction Details">
                            <div id="divTransaction" runat="server" class="gird">
                                <asp:GridView ID="gvTransaction" runat="server" AutoGenerateColumns="false"
                                    ShowFooter="true" Width="100%" OnRowDataBound="gvTransaction_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvSlno" runat="server" Text="<%#Container.DataItemIndex+1%>" ToolTip="Sl No"></asp:Label>
                                                <asp:Label ID="lblgvApprovalSNO" Text='<%# Bind("Approval_Serial_Number")%>' runat="server" Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Document Number" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:LinkButton Text='<%# Bind("Document_No") %>' CausesValidation="false" Style="color: red; text-underline-position: below;" runat="server" ID="Docid" OnClick="PaymentReqID_serverclick"></asp:LinkButton>
                                                <asp:Label ID="lblgvDocument_No" runat="server" Text='<%# Bind("Document_No") %>'
                                                    ToolTip="Document No" Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approver" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvApprover" runat="server" Text='<%# Bind("Approver") %>'
                                                    ToolTip="Approver Name"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approval Date" ItemStyle-HorizontalAlign="Left" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvApprovalDate" runat="server" Text='<%# Bind("Approval_Date") %>'
                                                    ToolTip="Approver Name"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Created By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvCreatedeby" runat="server" Text='<%# Bind("CREATED_BY") %>'
                                                    ToolTip="Created By"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Document Date" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvCreatedDate" runat="server" Text='<%# Bind("CREATED_DATE") %>'
                                                    ToolTip="Created Date"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Document Amount" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvDocAmount" runat="server" Text='<%# Bind("DOC_AMOUNT") %>'
                                                    ToolTip="Docuement Amount"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvstatus" runat="server" Text='<%# Bind("Approval_status") %>'
                                                    ToolTip="Status"></asp:Label>
                                                <asp:DropDownList ID="ddlStatus" runat="server" Visible="false" AutoPostBack="true" ToolTip="Status"></asp:DropDownList>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged"
                                                    Text="Select All" ToolTip="Include" />
                                            </HeaderTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" OnCheckedChanged="chkSelect_CheckedChanged" AutoPostBack="true" ToolTip="Select" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtgvRemarks" runat="server" TextMode="MultiLine" onkeyup="maxlengthfortxt(200)"
                                                    MaxLength="200" Width="300px" Text='<%# Bind("remarks") %>' CssClass="lowercase" ToolTip="Remarks"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftegvRemarks" runat="server" TargetControlID="txtgvRemarks"
                                                    FilterType="Numbers, LowercaseLetters,UppercaseLetters, Custom" ValidChars="!@#$%&*/|{}[]():;,. " Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="UserId" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvuser_id" runat="server" Text='<%# Bind("user_id") %>'
                                                    ToolTip="Document No"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvid" runat="server" Text='<%# Bind("ID") %>'
                                                    ToolTip="Document No"></asp:Label>

                                                <asp:Label ID="lblgv_ApprovalID" runat="server" Text='<%# Bind("APPROVAL_ID") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div align="right">
                    <%--<button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]"  onserverclick="btnSave_Click" runat="server"--%>
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnRevoke" onserverclick="btnRevoke_ServerClick" causesvalidation="false" runat="server" onclick="if(fnCancelClick())"
                        type="button" accesskey="R" title="Revoke[Alt+R]" enabled="false">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>R</u>evoke
                    </button>

                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="VSApproval" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" />
                        <asp:HiddenField ID="hdnrow" runat="server" />
                        <asp:CustomValidator ID="CVApproval" runat="server" CssClass="styleMandatoryLabel"
                            Height="50px">                                    
                        </asp:CustomValidator>
                    </div>
                </div>
            </div>
        </ContentTemplate>

        <%--<Triggers>
        <asp:PostBackTrigger ControlID="ReqID" />
    </Triggers>--%>
    </asp:UpdatePanel>



    <script>
        function fnCancelClick() {

            if (confirm('Do you want to Revoke?')) {
                return true;
            }
            else {
                return false;
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


    <%--<div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <asp:Label ID="lblfile" runat="server" Style="display: none;"></asp:Label>
            <cc1:ModalPopupExtender ID="MPUploadFiles" runat="server" PopupControlID="plUploadfiles" TargetControlID="lblfile"
                BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
            <asp:Panel ID="plUploadfiles" GroupingText="" Height="150px" Width="300px" runat="server" Style="padding: 8px; text-wrap: normal; display: none;"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                <table width="100%">
                    <tr>
                        <td colspan="2" align="center" class="stylePageHeading">
                            <asp:Label ID="Label2" runat="server" Text="Upload Files"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblUploadFile" runat="server" Text="Upload File"></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload ID="fuOtherFiles" runat="server" Width="200px" />

                        </td>
                    </tr>
                    <%--<tr>
                <td colspan="2">
                    <asp:RequiredFieldValidator ID="rfvInteracttxtDateE2" runat="server" ControlToValidate="fuOtherFiles" ErrorMessage="Upload file for other documents"
                         ValidationGroup="OthersFile"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>
    <%-- <tr>
                        <td align="center" colspan="2">
                            <button class="css_btn_enabled" id="btnOk" onserverclick="btnOk_Click" runat="server"
                                type="button" causesvalidation="false" title="Ok,[Alt+O]" accesskey="O">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>O</u>k
                            </button>

                            <button class="css_btn_enabled" id="btnUploadCancel" onserverclick="btnUploadCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>--%>
</asp:Content>
