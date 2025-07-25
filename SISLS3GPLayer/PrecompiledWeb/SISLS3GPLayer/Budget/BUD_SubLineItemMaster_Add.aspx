<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Budget_BUD_SubLineItemMaster_Add, App_Web_rj0nx3uf" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="../Scripts/Alert.min.js"></script>

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
                        <asp:Panel ID="pnlAddLineItem" runat="server" GroupingText="Sub Line Item Master" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlItemHeader" runat="server" ToolTip="Item Header" AutoPostBack="true" OnSelectedIndexChanged="ddlItemHeader_SelectedIndexChanged"
                                            ValidationGroup="Save" class="md-form-control form-control">
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
                                        <asp:DropDownList ID="ddlAccountNature" runat="server" ToolTip="Account Nature"
                                            ValidationGroup="Save" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAccountNature_SelectedIndexChanged">
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
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLineItem" runat="server" ToolTip="Line Item" ValidationGroup="Save"
                                            class="md-form-control form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLineItem_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVLineItem" ValidationGroup="Save" ErrorMessage="Select Line Item"
                                                InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlLineItem"
                                                SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Line Item" ID="lblLineItem" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlSubTotal" runat="server" ToolTip="Sub Total Applicable"
                                            OnSelectedIndexChanged="ddlSubTotal_SelectedIndexChanged" AutoPostBack="true"
                                            ValidationGroup="Save" class="md-form-control form-control">
                                            <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="2">No</asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVSubTotal" ValidationGroup="Save" ErrorMessage="Select Sub Total APplicable"
                                                InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlSubTotal"
                                                SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Sub Total Applicable" ID="lblSubTotal" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtSubTotalName" MaxLength="200" ToolTip="Sub Total Name"
                                            class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Sub Total Name" ID="lblSubTotalName" CssClass="styleDisplayLabel" />
                                        </label>

                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">

                    <div class="col">
                        <div class="gird">
                            <asp:Panel ID="pnlSubLineItem" runat="server" GroupingText="Sub Line Item" CssClass="stylePanel">
                                <asp:GridView runat="server" ID="grvSubLineItem" Width="80%" ShowFooter="true" AutoGenerateColumns="false"
                                    HeaderStyle-CssClass="styleGridHeader" class="gird_details" OnRowCommand="grvSubLineItem_RowCommand"
                                    RowStyle-HorizontalAlign="Left" OnRowDataBound="grvSubLineItem_RowDataBound"
                                    OnRowEditing="grvSubLineItem_RowEditing">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNO">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("SNO") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label runat="server" ID="lblESNO" Text='<%#Eval("SNO") %>'></asp:Label>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub line Item">
                                            <FooterTemplate>
                                                <%--<div class="md-input">
                                                                    <asp:DropDownList runat="server" ID="ddlSubLineItem">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RFVFSublineItem" ValidationGroup="FooterAdd" ErrorMessage="Select sub line Item"
                                                                            InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlSubLineItem"
                                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>--%>
                                                <div class="md-input">
                                                    <uc:Suggest ID="ddlFSubLineItem" runat="server" class="md-form-control form-control" ToolTip="Sub line item" ServiceMethod="GetSublineItems"
                                                        ErrorMessage="Select Sub line item"
                                                        ValidationGroup="FooterAdd" IsMandatory="true" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblSubLineItem" Text='<%#Eval("SubLineItem") %>'></asp:Label>
                                                <asp:Label runat="server" ID="lblSubLineItemId" Text='<%#Eval("SubLineItemId") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input">
                                                    <uc:Suggest ID="ddlESubLineItem" runat="server" class="md-form-control form-control" ToolTip="Sub line item"
                                                        ServiceMethod="GetSublineItems"
                                                        ErrorMessage="Select Sub line item"
                                                        ValidationGroup="Modify" IsMandatory="true" />
                                                    <asp:Label runat="server" ID="lblESubLineItemId" Text='<%#Eval("SubLineItemId") %>' Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="lblESubLineItem" Text='<%#Eval("SubLineItem") %>' Visible="false"></asp:Label>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                </div>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type">
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:DropDownList runat="server" ID="ddlType" ToolTip="Subline Item type">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVFType" ValidationGroup="FooterAdd" ErrorMessage="Select Type"
                                                            InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlType"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblType" Text='<%#Eval("Type") %>'></asp:Label>
                                                <asp:Label runat="server" ID="lblTypeId" Text='<%#Eval("TypeId") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input">
                                                    <asp:DropDownList runat="server" ID="ddlEType" ToolTip="Subline Item type">
                                                    </asp:DropDownList>
                                                    <asp:Label runat="server" ID="lblETypeId" Text='<%#Eval("TypeId") %>' Visible="false"></asp:Label>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVEType" ValidationGroup="Modify" ErrorMessage="Select Type"
                                                            InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlEType"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Effective From">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblEffFrom" Text='<%#Eval("EffectiveFrom") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtEEffFrom" runat="server" autocomplete="off" Text='<%#Eval("EffectiveFrom") %>'
                                                        class="md-form-control form-control login_form_content_input requires_true" ToolTip="Effective from"></asp:TextBox>
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
                                                    <asp:TextBox ID="txtFEffFrom" runat="server" autocomplete="off" ToolTip="Effective from" ValidationGroup="FooterAdd"
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
                                                    <asp:TextBox ID="txtEEffTo" runat="server" autocomplete="off" Text='<%#Eval("EffectiveTo") %>' ToolTip="Effective to"
                                                        class="md-form-control form-control login_form_content_input requires_true" ValidationGroup="FooterAdd"></asp:TextBox>
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
                                                    <asp:TextBox ID="txtFEffTo" runat="server" autocomplete="off" ToolTip="Effective to"
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
                                                    type="button" accesskey="A" validationgroup="FooterAdd">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd</button>
                                            </FooterTemplate>
                                            <EditItemTemplate>
                                                <%-- <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="grid_btn" ToolTip="Edit" CommandName="Update" />
                                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn" ToolTip="Cancel" />--%>
                                                <button class="css_btn_enabled" id="btnUpdate" title="Add,Alt+U" onserverclick="btnUpdate_ServerClick" runat="server"
                                                    type="button" accesskey="U" validationgroup="Modify">
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
                            runat="server" validationgroup="Save"   onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <%-- <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnConfirmSave())"
                                            causesvalidation="true" onserverclick="btnSave_Click" runat="server" validationgroup="Save"
                                            type="button" accesskey="S">
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave   onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false"
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


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

