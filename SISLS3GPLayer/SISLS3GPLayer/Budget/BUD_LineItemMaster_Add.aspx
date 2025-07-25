<%@ Page Title="" Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="BUD_LineItemMaster_Add.aspx.cs" Inherits="Budget_BUD_LineItemMaster_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Scripts/Common.js"></script>

    <head>

        <style type="text/css">
            .switch {
                position: relative;
                display: inline-block;
                width: 40px;
                height: 20px;
                margin-top: 9px;
            }

                .switch input {
                    display: none;
                }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
            }

                .slider:before {
                    position: absolute;
                    content: "";
                    height: 13px;
                    width: 13px;
                    left: 3px;
                    bottom: 4px;
                    background-color: white;
                    transition: .4s;
                }

                .slider:after {
                    left: 3px;
                }


            /* include generated hidden field here */
            input[type="checkbox"]:checked + input[type="hidden"] + .slider,
            input[type="checkbox"]:checked + .slider {
                background-color: #336699;
            }

            /* include generated hidden field here */
            input[type="checkbox"]:focus + input[type="hidden"] + .slider,
            input[type="checkbox"]:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            /* include generated hidden field here */
            input[type="checkbox"]:checked + input[type="hidden"] + .slider:before,
            input[type="checkbox"]:checked + .slider:before {
                transform: translateX(20px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

                .slider.round:before {
                    border-radius: 50%;
                }
        </style>
    </head>
    <script type="text/javascript" language="javascript">
        function fnConfirmExit() {
            if (confirm('Do you want to Exit?'))
                return true;
            else
                return false;
        }
        function fnConfirmClear() {
            if (confirm('Do you want to Clear?'))
                return true;
            else
                return false;
        }
        function fnConfirmSave() {
            if (confirm('Do you want to Save?'))
                return true;
            else
                return false;
        }
    </script>
    <asp:UpdatePanel ID="PnlLineItemMaster" runat="server">
        <ContentTemplate>
            <div>

                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel" ForeColor="Black">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Panel ID="pnlAddLineItem" runat="server" GroupingText="Line Item Master" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlItemHeader" runat="server" ToolTip="Item Header"
                                            ValidationGroup="Save" class="md-form-control form-control">
                                            <%-- <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem>Assumptions</asp:ListItem>
                                                <asp:ListItem>Cashflow Statement</asp:ListItem>
                                                <asp:ListItem>Debtors</asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVItemHeader" ValidationGroup="Save" ErrorMessage="Select Item Header"
                                                InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlItemHeader"
                                                SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Item Header" ID="lblItemHeader" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAccountNature" runat="server" ToolTip="Account Nature" ValidationGroup="Save" class="md-form-control form-control">
                                            <%--<asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem>P & L Items</asp:ListItem>
                                                <asp:ListItem>Balance Sheet</asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVAccountNature" ValidationGroup="Save" ErrorMessage="Select Account Nature"
                                                InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlAccountNature"
                                                SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Account Nature" ID="lblAccountNature" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-2 styleFieldLabel">
                                    <div class="md-value">
                                        <label>
                                            <asp:Label runat="server" Text="Active" ID="Label4"></asp:Label>
                                        </label>
                                    </div>

                                    <label class="switch ">
                                        <input type="checkbox" disabled="disabled" class="md-form-control form-control" runat="server" id="ChkbxStatus" checked="checked" />
                                        <span class="slider round"></span>
                                    </label>
                                    <span class="highlight"></span>

                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="gird">
                            <asp:Panel ID="pnlLineItem" runat="server" GroupingText="Line Item" CssClass="stylePanel">
                                <asp:GridView runat="server" ID="grvLineItem" Width="80%" ShowFooter="true" AutoGenerateColumns="false"
                                    HeaderStyle-CssClass="styleGridHeader" class="gird_details" OnRowCommand="grvLineItem_RowCommand"
                                    RowStyle-HorizontalAlign="Left" OnRowDataBound="grvLineItem_RowDataBound"
                                    OnRowEditing="grvLineItem_RowEditing">
                                    <%-- OnRowUpdating="grvLineItem_RowUpdating"
                                                    OnRowCancelingEdit="grvLineItem_RowCancelingEdit"--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNO">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("SNO") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label runat="server" ID="lblESNO" Text='<%#Eval("SNO") %>'></asp:Label>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account Group">
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:DropDownList runat="server" ID="ddlLineItem" ToolTip="Line Item">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVFlineItem" ValidationGroup="FooterAdd" ErrorMessage="Select line Item"
                                                            InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlLineItem"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblLineItem" Text='<%#Eval("LineItem") %>'></asp:Label>
                                                <asp:Label runat="server" ID="lblLineItemId" Text='<%#Eval("LineItemId") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input">
                                                    <asp:DropDownList runat="server" ID="ddlELineItem" ToolTip="Line Item">
                                                    </asp:DropDownList>
                                                    <asp:Label runat="server" ID="lblELineItemId" Text='<%#Eval("LineItemId") %>' Visible="false"></asp:Label>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVElineItem" ValidationGroup="Modify" ErrorMessage="Select line Item"
                                                            InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlELineItem"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SubLine Item" ItemStyle-HorizontalAlign="Center">
                                            <FooterTemplate>
                                                <p style="text-align: center;">
                                                    <asp:CheckBox runat="server" ID="chkbxFSLItem" ToolTip="Subline Item Enable" />
                                                </p>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblIsEnabled" Text='<%#Eval("SubLineEnable") %>' Visible="false"></asp:Label>
                                                <asp:CheckBox runat="server" ID="chkbxISLItem" Enabled="false" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:CheckBox runat="server" ID="chkbxESLItem" ToolTip="Subline Item Enable" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Effective From">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblEffFrom" Text='<%#Eval("EffectiveFrom") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtEEffFrom" runat="server" autocomplete="off" Text='<%#Eval("EffectiveFrom") %>'
                                                        class="md-form-control form-control login_form_content_input requires_true" ToolTip="Effective From"></asp:TextBox>
                                                    <asp:Image ID="imgEEffFrom" runat="server"
                                                        ImageUrl="~/Images/calendaer.gif" ToolTip="Effective From" Visible="false" />
                                                    <cc1:CalendarExtender ID="CEEEffFrom" runat="server" Enabled="True"
                                                        PopupButtonID="imgEEffFrom" TargetControlID="txtEEffFrom">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVEEffFrom" ValidationGroup="Modify" ErrorMessage="Select Effective from date"
                                                            InitialValue="" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtEEffFrom"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFEffFrom" runat="server" autocomplete="off" ToolTip="Effective From"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgFEffFrom" runat="server"
                                                        ImageUrl="~/Images/calendaer.gif" ToolTip="Effective From" Visible="false" />
                                                    <cc1:CalendarExtender ID="CEFEffFrom" runat="server" Enabled="True"
                                                        PopupButtonID="imgFEffFrom" TargetControlID="txtFEffFrom">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVFEffFrom" ValidationGroup="FooterAdd" ErrorMessage="Select Effective from date"
                                                            InitialValue="" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtFEffFrom"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Effective To">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblEffTo" Text='<%#Eval("EffectiveTo") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtEEffTo" runat="server" autocomplete="off" Text='<%#Eval("EffectiveTo") %>'
                                                        class="md-form-control form-control login_form_content_input requires_true" ToolTip="Effective To"></asp:TextBox>
                                                    <asp:Image ID="imgEEffTo" runat="server"
                                                        ImageUrl="~/Images/calendaer.gif" ToolTip="Effective To" Visible="false" />
                                                    <cc1:CalendarExtender ID="CEEEffTo" runat="server" Enabled="True"
                                                        PopupButtonID="imgEEffTo" TargetControlID="txtEEffTo">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVEEffTo" ValidationGroup="Modify" ErrorMessage="Select Effective to date"
                                                            InitialValue="" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtEEffTo"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFEffTo" runat="server" autocomplete="off" ToolTip="Effective To"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgFEffTo" runat="server"
                                                        ImageUrl="~/Images/calendaer.gif" ToolTip="Effective To" Visible="false" />
                                                    <cc1:CalendarExtender ID="CEFEffTo" runat="server" Enabled="True"
                                                        PopupButtonID="imgFEffTo" TargetControlID="txtFEffTo">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVFEffTo" ValidationGroup="FooterAdd" ErrorMessage="Select Effective to date"
                                                            InitialValue="" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtFEffTo"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Modify">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" ID="imgbtnModify" CssClass="styleGridEdit"
                                                    ImageUrl="~/Images/spacer.gif" CommandName="Edit" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <%--<asp:Button runat="server" ID="btnAdd" Text="Add" ToolTip="Add Line Item"
                                                                    CssClass="grid_btn" CommandName="Add" CausesValidation="true" ValidationGroup="FooterAdd" />--%>
                                                <button class="css_btn_enabled" id="btnAdd" title="Add,Alt+A" onserverclick="btnAdd_ServerClick" runat="server"
                                                    type="button" accesskey="A" validationgroup="Add">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd</button>

                                            </FooterTemplate>
                                            <EditItemTemplate>
                                                <%--<asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="grid_btn" ToolTip="Edit" CommandName="Update" />
                                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn" ToolTip="Cancel" />--%>
                                                <button class="css_btn_enabled" id="btnUpdate" title="Add,Alt+U" onserverclick="btnUpdate_ServerClick" runat="server"
                                                    type="button" accesskey="U" validationgroup="Add">
                                                    <i class="fa fa-edit" aria-hidden="true"></i>&emsp;<u>U</u>pdate</button>

                                                <button class="css_btn_enabled" id="btnCancel" title="Add,Alt+C" onserverclick="btnCancel_ServerClick" runat="server"
                                                    type="button" accesskey="C">
                                                    <i class="fa-backward" aria-hidden="true"></i>&emsp;<u>C</u>ancel</button>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onserverclick="btnSave_Click"
                            runat="server" validationgroup="Save"  onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <%-- <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnConfirmSave())"
                                            causesvalidation="true" onserverclick="btnSave_Click" runat="server" validationgroup="Save"
                                            type="button" accesskey="S">  
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave      
                                        </button>--%>
                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_ServerClick" causesvalidation="false" runat="server"
                            type="button" accesskey="L" title="Clear, Alt+L" onclick="if(fnConfirmClear())">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnExit" onserverclick="btnExit_ServerClick" causesvalidation="false" runat="server"
                            type="button" accesskey="X" title="Exit, Alt+X" onclick="if(fnConfirmExit())">
                            <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

