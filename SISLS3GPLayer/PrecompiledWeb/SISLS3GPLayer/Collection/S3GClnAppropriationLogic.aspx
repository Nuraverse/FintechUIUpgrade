<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnAppropriationLogic, App_Web_wom33hv0" title="Appropriation Logic" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading"> </asp:Label>
                            <input id="HidConfirm" type="hidden" runat="server" />
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row" style="padding: 0px !important;">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" CssClass="md-form-control form-control">
                                    </asp:DropDownList>
                                    <%-- <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" Display="None"
                         InitialValue="0" ValidationGroup="btnSave" ErrorMessage="Select Line of Business from the List."
                        ControlToValidate="ddlLob" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlType" runat="server" ToolTip="Type" CssClass="md-form-control form-control">
                                        <%--<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Horizontal" Value="H"></asp:ListItem>
                            <asp:ListItem Text="Vertical" Value="V"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlType" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                            InitialValue="0" ValidationGroup="btnSave" ErrorMessage="Select Type"
                                            ControlToValidate="ddlType" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Type" ID="lblType" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkTotalDue" runat="server" ToolTip="Full Due" />
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Full Due" ID="isTotalDue" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkActive" runat="server" ToolTip="Active Indicator" />
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Active" ID="lblActive" />
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--  For grid--%>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="md-input">
                        <asp:UpdatePanel ID="UpdatePanel_ApprLogic" runat="server">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="pnlAppropriationLogic" CssClass="stylePanel" GroupingText="Appropriation Logic Details">
                                    <div class="gird">
                                        <%--<div id="divreference" style="height: 250px; overflow: auto">--%>
                                        <asp:GridView ID="gvAppropriationLogic" runat="server" AutoGenerateColumns="false"
                                            ShowFooter="true" OnRowDataBound="gvAppropriationLogic_RowDataBound" class="gird_details"
                                            OnRowCommand="gvAppropriationLogic_RowCommand" OnRowDeleting="gvAppropriationLogic_RowDeleting"
                                            OnRowEditing="gvAppropriationLogic_RowEditing" OnRowCancelingEdit="gvAppropriationLogic_RowCancelingEdit"
                                            OnRowUpdating="gvAppropriationLogic_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="S.No." HeaderStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Type of Dues" HeaderStyle-Width="25%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLookupCode" Visible="false" runat="server" Text='<%#Eval("CashFlow_Flag_ID") %>' />
                                                        <asp:Label ID="lblReceiptType" runat="server" Text='<%#Eval("CashFlowFlag_Desc") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:DropDownList ID="ddlReceiptTypeEdit" runat="server" ToolTip="Type of Dues" CssClass="md-form-control form-control login_form_content_input" />
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtReceiptType" runat="server" Display="Dynamic" CssClass="grid_validation_msg_box"
                                                                    ErrorMessage="Please Select the Type of Dues." ControlToValidate="ddlReceiptTypeEdit" InitialValue="0"
                                                                    SetFocusOnError="true" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <asp:HiddenField ID="hdnLookupcode" runat="server" Value='<%#Eval("CashFlow_Flag_ID") %>' />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:DropDownList ID="ddlReceiptType" runat="server" ToolTip="Type of Dues" CssClass="md-form-control form-control login_form_content_input" />
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtReceiptType" runat="server" Display="Dynamic" CssClass="grid_validation_msg_box"
                                                                    ErrorMessage="Please Select the Type of Dues." ControlToValidate="ddlReceiptType" InitialValue="0"
                                                                    SetFocusOnError="true" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <%-- <asp:DropDownList ID="ddlLookupcode" runat ="server" />--%>
                                                    <%--    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />                                                        
                                                        <FooterStyle HorizontalAlign="Left" VerticalAlign="Middle" />--%>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Percentage" HeaderStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPercent" runat="server" Text='<%#Eval("Percentage") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtpercent" MaxLength="6" ToolTip="Percentage" runat="server" Text='<%#Bind("Percentage") %>'
                                                                onblur="ChkIsZero(this,'Percentage');" class="md-form-control form-control login_form_content_input"
                                                                AutoPostBack="true" OnTextChanged="txtPercentE_TextChanged"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtpercent" runat="server" TargetControlID="txtpercent"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars="." FilterMode="ValidChars">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtPercent" runat="server" Display="Dynamic" ValidationGroup="vgUpdate" class="grid_validation_msg_box"
                                                                    ErrorMessage="Please enter the Percentage." ControlToValidate="txtPercent" SetFocusOnError="True" InitialValue=""></asp:RequiredFieldValidator>
                                                            </div>
                                                            <%--<asp:RangeValidator runat="server" ID="rvtxtpercent" ControlToValidate="txtPercent"
                                                                    SetFocusOnError="True" ErrorMessage="Percentage should be in the range 0.1 To 99.99" Type="Double"
                                                                    MinimumValue="0.1" MaximumValue="100.00" Display="Dynamic" ValidationGroup="vgUpdate"
                                                                    class="grid_validation_msg_box"></asp:RangeValidator>
                                                                <cc1:MaskedEditExtender ID="MEEtxtPercentage" runat="server" InputDirection="RightToLeft"
                                                            Mask="99.99" MaskType="Number" TargetControlID="txtPercent">
                                                        </cc1:MaskedEditExtender>--%>
                                                        </div>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtPercent" runat="server" MaxLength="6" ToolTip="Percentage" class="md-form-control form-control login_form_content_input"
                                                                AutoPostBack="true" OnTextChanged="txtPercent_TextChanged"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtPercent" runat="server" TargetControlID="txtPercent"
                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars="." FilterMode="ValidChars">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtPercent" runat="server" Display="Dynamic" ValidationGroup="vgAdd" class="grid_validation_msg_box"
                                                                    ErrorMessage="Please enter the Percentage." ControlToValidate="txtPercent" SetFocusOnError="True" InitialValue=""></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <%--<asp:RangeValidator ID="rvtxtpercent" runat="server" ControlToValidate="txtPercent" class="grid_validation_msg_box"
                                                                    SetFocusOnError="True" ErrorMessage="Percentage should be in the range 0.1 To 99.99" Type="Double"
                                                                    MinimumValue="0.1" MaximumValue="100.00" Display="Dynamic" ValidationGroup="vgAdd"></asp:RangeValidator>                                                        
                                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />                                            
                                            <FooterStyle HorizontalAlign="right" />--%>
                                                    <%--onblur="funChkDecimial(this,3,2,'Percentage');ChkIsZero(this,'Percentage');" ></asp:TextBox>--%>
                                                    <%-- onblur="funChkDecimial(this,6,4);ChkIsZero(this);"--%>
                                                    <%--<cc1:MaskedEditExtender ID="MEEtxtPercentage" runat="server" InputDirection="RightToLeft"
                                                            Mask="99.99" MaskType="Number" TargetControlID="txtPercent">
                                                        </cc1:MaskedEditExtender>--%>
                                                    <ItemStyle HorizontalAlign="right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                            CommandName="Edit" CausesValidation="false" CssClass="grid_btn" AccessKey="I" ToolTip="Edit,Alt+I"></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="grid_btn_delete"
                                                            OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false" AccessKey="T" ToolTip="Delete,Alt+T"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn"
                                                            CausesValidation="true" AccessKey="U" ToolTip="Update,Alt+U" ValidationGroup="vgUpdate"></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn"
                                                            CausesValidation="false" AccessKey="N" ToolTip="Cancel,Alt+N"></asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <%--<asp:Button ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgAdd" class="grid_btn"
                                                            CausesValidation="true" AccessKey="A" ToolTip="Add,Alt+A">
                                                        </asp:Button>--%>
                                                        <button id="btnAdd" runat="server" type="button" validationgroup="vgAdd" class="grid_btn"
                                                            causesvalidation="true" accesskey="A" title="Add[Alt+A]" onserverclick="btnGVAdd_Click">
                                                            <i class="fa fa-plus" aria-hidden="true"></i><u>A</u>dd
                                                        </button>
                                                    </FooterTemplate>
                                                    <ItemStyle Font-Bold="true" HorizontalAlign="Center" />
                                                    <FooterStyle Font-Bold="true" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <%-- </div>--%>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
                <div align="right">
                    <button id="btnSave" runat="server" onclick="if(fnCheckPageValidators('btnSave'))" type="button" causesvalidation="false"
                        accesskey="S" title="Save[Alt+S]" class="css_btn_enabled" onserverclick="btnSave_Click" validationgroup="btnSave">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                    <button id="btnClear" runat="server" causesvalidation="false" class="css_btn_enabled" type="button"
                        accesskey="L" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" text="Clear" onserverclick="btnClear_Click">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <button id="btnCancel" runat="server" causesvalidation="False" class="css_btn_enabled" type="button"
                        accesskey="X" title="Exit[Alt+X]" onserverclick="btnCancel_Click" text="Exit" onclick="if(fnConfirmExit())">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%--   <asp:ValidationSummary ID="vgAdd" runat="server" ValidationGroup="vgAdd" CssClass="styleMandatoryLabel"
                HeaderText="Correct the following validation(s):" ShowSummary="true" />
            <asp:CustomValidator ID="cvAppropriationLogic" runat="server" CssClass="styleMandatoryLabel"
                Enabled="true" Width="98%" />--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
