<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    EnableEventValidation="false" CodeFile="S3G_SysAdminDocumentNumberControl_Add.aspx.cs"
    Inherits="System_Admin_S3G_SysAdminDocumentNumberControl_Add" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function Trim(strInput) {
            var FieldValue = document.getElementById(strInput).value;
            document.getElementById(strInput).value = FieldValue.trim();
        }


        function fnConfirmSave() {

            if (confirm('Do you want to Save?')) {
                Page_BlockSubmit = false;
                var a = event.srcElement;
                if (a.type == "button") {
                    a.style.display = 'none';
                }
                return true;
            }
            else
                return false;

        }

        function fnCheckPageValidation() {
            debugger;
            if ((!fnCheckPageValidators('Add', 'false'))) {
                if (Page_ClientValidate() == false) {
                    Page_BlockSubmit = false;
                    return false;
                }
            }
            if (Page_ClientValidate('Add')) {
                //Starting


                if (confirm('Do you want to Add?')) {
                    return true;
                }
                else
                    return false;
            }
            return true;
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFinYear" runat="server" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Financial Year" ID="lblFinYear"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <%-- <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="None" ErrorMessage="Select the Line of Business or Branch"
                                  ControlToValidate="ddlLOB" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business " ID="lbllOB"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlBranch" runat="server" onmouseover="ddl_itemchanged(this);" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <%-- <asp:RequiredFieldValidator ID="rfvBranch" runat="server" Display="None" ErrorMessage="Select the Line of Business or Branch"
                                  ControlToValidate="ddlBranch" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Location" ID="lblBranch"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <uc1:Suggest ID="ddlDocType" runat="server" ServiceMethod="GetDocumentType" ToolTip="Document Type" IsMandatory="true" AutoPostBack="true"  OnItem_Selected="ddlDocType_Item_Selected" ErrorMessage="Select Document Type" ItemToValidate="Value" class="md-form-control form-control" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Document Type" ID="lblDocType"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtTotalWidth" runat="server" ToolTip="Total Width"  MaxLength="5" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fttxtTotalWidth" runat="server" FilterType="Numbers"
                                        TargetControlID="txtTotalWidth">
                                    </cc1:FilteredTextBoxExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtTotalWidth" runat="server" Display="Dynamic" ErrorMessage="Enter Total Width" ValidationGroup="Add"
                                            ControlToValidate="txtTotalWidth" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Total Width" ID="lblTotalWidth"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:CheckBox ID="cbIncludeCharSet" AutoPostBack="true" OnCheckedChanged="cbIncludeCharSet_CheckedChanged" runat="server" />
                                    <asp:Label runat="server" Text="Include Char Set" ID="lblIncludeCharSet"></asp:Label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtBatch" runat="server" MaxLength="5" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:DropDownList ID="ddlBatch" runat="server" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged" class="md-form-control form-control"
                                        AutoPostBack="true">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvBatch" runat="server" Display="Dynamic" ErrorMessage="Enter the Batch"
                                            ControlToValidate="txtBatch" SetFocusOnError="true" ValidationGroup="Add" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvddlBatch" runat="server" Display="None" ErrorMessage="Select the Batch" ValidationGroup="Add"
                                        ControlToValidate="ddlBatch" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtBatch"
                                        FilterType="Custom,LowercaseLetters,Numbers,UppercaseLetters" InvalidChars=""
                                        Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="Batch" ID="Batch"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <%--<cc2:NumericTextBox ID="txtFromNo" runat="server" MaxLength="12" class="md-form-control form-control login_form_content_input requires_true"></cc2:NumericTextBox>--%>

                                    <asp:TextBox ID="txtFromNo" MaxLength="12" Style="text-align: right" ToolTip="From Number" class="md-form-control form-control login_form_content_input requires_true"
                                        runat="server"></asp:TextBox>

                                    <cc1:FilteredTextBoxExtender ID="fttxtFromNo" runat="server" FilterType="Numbers"
                                        TargetControlID="txtFromNo">
                                    </cc1:FilteredTextBoxExtender>

                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvFromNos" runat="server" Display="Dynamic" ErrorMessage="Enter the From Number" ValidationGroup="Add"
                                            ControlToValidate="txtFromNo" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="From Number" ID="lblFromNo"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">

                                    <asp:TextBox ID="txtToNo" MaxLength="12" ToolTip="To Number" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"
                                        runat="server"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fttxtToNo" runat="server" FilterType="Numbers"
                                        TargetControlID="txtToNo">
                                    </cc1:FilteredTextBoxExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvToNo" runat="server" Display="Dynamic" ErrorMessage="Enter the To Number" ValidationGroup="Add"
                                            ControlToValidate="txtToNo" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" CssClass="styleReqFieldLabel" Text="To Number" ID="lblToNo"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">

                                    <asp:TextBox ID="txtLastNo" MaxLength="12" ToolTip="Last Number" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"
                                        runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Last Used Number" ID="lblLastNo"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">

                                    <asp:TextBox ID="txtEffectiveFrom" runat="server" ToolTip="Effective From" 
                                        AutoPostBack="false"  class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceFromDate" runat="server" Enabled="True"
                                        TargetControlID="txtEffectiveFrom"  >
                                    </cc1:CalendarExtender>
                                    
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtEffectiveFrom" runat="server" ControlToValidate="txtEffectiveFrom" ErrorMessage="Select Effective From" ValidationGroup="Add"
                                            SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEffectiveFrom" CssClass="styleReqFieldLabel" runat="server" Text="Effective From"></asp:Label>
                                    </label>
                                </div>
                            </div>


                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEffectiveTo" runat="server" AutoPostBack="false"   ToolTip="Effective To" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceToDate"   runat="server" Enabled="True"
                                        TargetControlID="txtEffectiveTo" >
                                    </cc1:CalendarExtender>
                                    
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtEffectiveTo" runat="server" ControlToValidate="txtEffectiveTo" ErrorMessage="Select Effective To"
                                            ValidationGroup="Add" Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEffectiveTo" CssClass="styleReqFieldLabel" runat="server" Text="Effective To"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:CheckBox ID="cbModDoc" runat="server" />
                                    <asp:Label runat="server" Text="Modify Document Date" ID="lblModifyDocDate"></asp:Label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:CheckBox ID="CbxActive" runat="server" />
                                    <asp:Label runat="server" Text="Active" ID="lblActive"></asp:Label>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

                <%--<div class="row" align="right" style="margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnAdd" runat="server" CssClass="save_btn fa fa-floppy-o"
                            OnClick="btnAdd_Click" Text="Add" ValidationGroup="Add" ToolTip="Add, Alt+A" AccessKey="A" />

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnModify" runat="server" CssClass="save_btn fa fa-floppy-o" OnClick="btnModify_Click"
                            OnClientClick="return fnCheckPageValidators('Add',false);" Text="Modify" ValidationGroup="Add" />

                        <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnBnkClear" runat="server" CausesValidation="False" CssClass="save_btn fa fa-floppy-o"
                            Text="Clear" OnClick="btnBnkClear_Click" Visible="False" />
                        <input id="hdnBankId" runat="server" type="hidden"></input>

                    </div>
                </div>--%>


                <div class="row" align="right" style="margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <button class="css_btn_enabled" id="btnAdd" onserverclick="btnAdd_Click" runat="server"
                            type="button" accesskey="A" title="Add[Alt+A]" onclick="if(fnCheckPageValidation('Add'))" causesvalidation="false">
                            <i class="fa fa-plus-square"></i>&emsp;<u>A</u>dd
                        </button>

                        <button class="css_btn_enabled" id="btnModify" onserverclick="btnModify_Click" runat="server"
                            type="button" accesskey="M" title="Modify[Alt+M]" onclick="if(fnCheckPageValidators('Add',false))" causesvalidation="false">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                        </button>

                    </div>
                </div>

                <div class="row">
                    <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlDocumentDetails" runat="server" ScrollBars="Horizontal" CssClass="stylePanel">

                            <asp:GridView ID="gvDocDetails" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvDocDetails_RowDataBound" OnRowDeleting="gvDocDetails_RowDeleting" OnSelectedIndexChanged="gvDocDetails_SelectedIndexChanged" class="gird_details">
                                <Columns>
                                    <asp:TemplateField HeaderText="Doc_Number_Seq_ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDoc_Number_Seq_ID" Text='<%#Eval("Doc_Number_Seq_ID")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Fin_Year" HeaderText="Financial Year">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>


                                    <asp:TemplateField HeaderText="LOB_ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLOB_ID" Text='<%#Eval("LOB_ID")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LOB">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLOB" Text='<%#Eval("LOB")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%--      <asp:BoundField DataField="Lob" HeaderText="Line of Business">
                                    <ItemStyle Width="10%" Wrap="true" />
                                </asp:BoundField>--%>
                                    <asp:TemplateField HeaderText="Location_ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLocation_ID" Text='<%#Eval("Location_ID")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Location" HeaderText="Location">
                                        <ItemStyle Width="10%" Wrap="true" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Doc_Level" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocLevel" Text='<%#Eval("Doc_Level")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Document_Type_ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocTypeID" Text='<%#Eval("Document_Type_ID")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Document_Type_Desc" HeaderText="Document Type">
                                        <ItemStyle Width="10%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TotalWidth" HeaderText="Total Width">
                                        <ItemStyle Width="5%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="IncludeCharSet" HeaderText="Include Char Set">
                                        <ItemStyle Width="8%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Batch" HeaderText="Batch">
                                        <ItemStyle Width="5%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="From_Number" HeaderText="From Number">
                                        <ItemStyle Width="5%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="To_Number" HeaderText="To Number">
                                        <ItemStyle Width="5%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Last_Used_Number" HeaderText="Last Used Number">
                                        <ItemStyle Width="5%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Effective From Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEffectiveFrom" Text='<%#Eval("EffectiveFrom")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Effective To Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEffectiveTo" Text='<%#Eval("EffectiveTo")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" />
                                    </asp:TemplateField>
                                    <%--   <asp:BoundField DataField="EffectiveFrom" HeaderText="Effective From">
                                    <ItemStyle Width="8%" Wrap="true" />
                                </asp:BoundField>
                                <asp:BoundField DataField="EffectiveTo" HeaderText="Effective To">
                                    <ItemStyle Width="8%" Wrap="true" />
                                </asp:BoundField>--%>
                                    <asp:BoundField DataField="ModifyDoc" HeaderText="Modify Doc" Visible="false">
                                        <ItemStyle Width="8%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Active" HeaderText="Active">
                                        <ItemStyle Width="8%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkbtnDelete" runat="server" Text="Delete" CausesValidation="false"
                                                CommandName="Delete" ToolTip="Delete,Alt+R" AccessKey="R" CssClass="grid_btn_delete"></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>

                <%--   <div class="row" align="right" style="margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnSave" CssClass="save_btn fa fa-floppy-o" Text="Save" ToolTip="Save, Alt+S" AccessKey="S" CausesValidation="False"
                            OnClick="btnSave_Click" />


                        <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnClear" CssClass="save_btn fa fa-floppy-o" Text="Clear" ToolTip="Clear, Alt+L" AccessKey="L"
                            CausesValidation="False" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />

                        <i class="fa fa-share btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnCancel" CssClass="save_btn fa fa-floppy-o" Text="Exit" OnClientClick="return fnConfirmExit();"
                            CausesValidation="False" OnClick="btnCancel_Click" ToolTip="Exit, Alt+X" AccessKey="X" />

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnDelete" CssClass="save_btn fa fa-floppy-o" Text="Delete"
                            CausesValidation="False" OnClick="btnDelete_Click" ToolTip="Delete, Alt+I" AccessKey="I" Visible="false" />
                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure want to delete?"
                            Enabled="True" TargetControlID="btnDelete">
                        </cc1:ConfirmButtonExtender>
                    </div>
                </div>--%>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnConfirmSave())"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>

                </div>


                <div class="row" style="display: none;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" Style="color: Red; font-size: medium"></asp:Label>

                        <asp:ValidationSummary ID="vsDocTypeSummary" runat="server" Height="30px" Width="716px" ValidationGroup="Add"
                            CssClass="styleMandatoryLabel" ShowSummary="true" HeaderText="Please correct the following validation(s):  " />

                        <asp:CustomValidator ID="cvDNC" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                    </div>
                </div>

            </div>
            <input type="hidden" id="hdnDocID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
