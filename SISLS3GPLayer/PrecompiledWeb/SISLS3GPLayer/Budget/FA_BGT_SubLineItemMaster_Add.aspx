<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Budget_FA_BGT_SubLineItemMaster_Add, App_Web_rj0nx3uf" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="PnlLineItemMaster" runat="server">
        <ContentTemplate>
            <div class="tab-pane fade in active show" id="tab1">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading"  CssClass="styleInfoLabel"   ForeColor="Black"  Text = "Budget Line Item Master - Create">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlAddSubLineItem" runat="server" GroupingText="Sub Line Item Master" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlItemHeader" runat="server" ToolTip="Item Header" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlItemHeader_SelectedIndexChanged"
                                                ValidationGroup="Save" class="md-form-control form-control">
                                                <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem>Assumptions</asp:ListItem>
                                                <asp:ListItem>Cashflow Statement</asp:ListItem>
                                                <asp:ListItem>Debtors</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVItemHeader" ValidationGroup="Save" ErrorMessage="Select Item Header"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlItemHeader"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Item Header" ID="lblItemHeader" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlAccountNature" runat="server" ToolTip="Account Nature" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlAccountNature_SelectedIndexChanged" ValidationGroup="Save" class="md-form-control form-control">
                                                <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem>P & L Items</asp:ListItem>
                                                <asp:ListItem>Balance Sheet</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVAccountNature" ValidationGroup="Save" ErrorMessage="Select Account Nature"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlItemHeader"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Account Nature" ID="lblAccountNature" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox runat="server" ID="ChkbxStatus" Checked="true" Enabled="false" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Active" ID="lblStatus" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                  <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLineItem" runat="server" ToolTip="Line Item" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlLineItem_SelectedIndexChanged"
                                                ValidationGroup="Save" class="md-form-control form-control">
                                                <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVLineItem" ValidationGroup="Save" ErrorMessage="Select Line Item"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlLineItem"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Line Item" ID="lblLineItem" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlSubTotal" runat="server" ToolTip="Sub Total Applicable"                                                 
                                                ValidationGroup="Save" class="md-form-control form-control">
                                                <asp:ListItem Selected="True" Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVSubTotal" ValidationGroup="Save" ErrorMessage="Select SubTotal Applicable"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlSubTotal"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Sub Total Applicable" ID="lblSubTotal" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtSubTotName" 
                                                class="md-form-control form-control login_form_content_input requires_true"
                                                MaxLength="100"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Sub Total Name" ID="lblSubTotName" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                      </div>



                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:Panel ID="pnlSubLineItem" runat="server" GroupingText="Sub Line Item" CssClass="stylePanel">
                                                <asp:GridView runat="server" ID="grvLineItem" Width="80%" ShowFooter="true" AutoGenerateColumns="false"
                                                    HeaderStyle-CssClass="styleGridHeader" class="gird_details" OnRowCommand="grvLineItem_RowCommand"
                                                    RowStyle-HorizontalAlign="Left" OnRowDataBound="grvLineItem_RowDataBound"
                                                    OnRowEditing="grvLineItem_RowEditing" OnRowUpdating="grvLineItem_RowUpdating"
                                                    OnRowCancelingEdit="grvLineItem_RowCancelingEdit" >
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
                                                                <asp:DropDownList runat="server" ID="ddlAccGroup">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </FooterTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblAccGroup" Text='<%#Eval("AccGroup") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:DropDownList runat="server" ID="ddlEAccGroup">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Line Item">
                                                            <FooterTemplate>
                                                               <asp:DropDownList runat="server" ID="ddlFLineItem">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </FooterTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblILineItem" Text='<%#Eval("LineItem") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                 <asp:DropDownList runat="server" ID="ddlELineItem">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Type">
                                                            <FooterTemplate>
                                                               <asp:DropDownList runat="server" ID="ddlFItemType">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </FooterTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblIItemType" Text='<%#Eval("SubLineType") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                 <asp:DropDownList runat="server" ID="ddlEItemType">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Effective From">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblEffFrom" Text='<%#Eval("EffectiveFrom") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                               <asp:TextBox ID="txtEEffFrom" runat="server" autocomplete="off" Text='<%#Eval("EffectiveFrom") %>'
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgEEffFrom" runat="server"
                                                                    ImageUrl="~/Images/calendaer.gif" ToolTip="Effective From" Visible="false" />
                                                                <cc1:CalendarExtender ID="CEEEffFrom" runat="server" Enabled="True"
                                                                    PopupButtonID="imgEEffFrom" TargetControlID="txtEEffFrom">
                                                                </cc1:CalendarExtender>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                               <asp:TextBox ID="txtFEffFrom" runat="server" autocomplete="off" 
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgFEffFrom" runat="server"
                                                                    ImageUrl="~/Images/calendaer.gif" ToolTip="Effective From" Visible="false" />
                                                                <cc1:CalendarExtender ID="CEFEffFrom" runat="server" Enabled="True"
                                                                    PopupButtonID="imgFEffFrom" TargetControlID="txtFEffFrom">
                                                                </cc1:CalendarExtender>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Effective To">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblEffTo" Text='<%#Eval("EffectiveTo") %>' ></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                               <asp:TextBox ID="txtEEffTo" runat="server" autocomplete="off"  Text='<%#Eval("EffectiveTo") %>'
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgEEffTo" runat="server"
                                                                    ImageUrl="~/Images/calendaer.gif" ToolTip="Effective To" Visible="false" />
                                                                <cc1:CalendarExtender ID="CEEEffTo" runat="server" Enabled="True"
                                                                    PopupButtonID="imgEEffTo" TargetControlID="txtEEffTo">
                                                                </cc1:CalendarExtender>
                                                            </EditItemTemplate>
                                                            <FooterTemplate>
                                                               <asp:TextBox ID="txtFEffTo" runat="server" autocomplete="off"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgFEffTo" runat="server"
                                                                    ImageUrl="~/Images/calendaer.gif" ToolTip="Effective To" Visible="false" />
                                                                <cc1:CalendarExtender ID="CEFEffTo" runat="server" Enabled="True"
                                                                    PopupButtonID="imgFEffTo" TargetControlID="txtFEffTo">
                                                                </cc1:CalendarExtender>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Modify">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ID="imgbtnModify" CssClass="styleGridEdit"
                                                                    ImageUrl="~/Images/spacer.gif" CommandName="Edit" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Button runat="server" ID="btnAdd" Text="Add" ToolTip="Add Line Item"
                                                                    CssClass="grid_btn" CommandName="Add" />
                                                            </FooterTemplate>
                                                            <EditItemTemplate>
                                                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="grid_btn" ToolTip="Edit" CommandName="Update" />
                                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn" ToolTip="Cancel" />
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </div>
                                    </div>

                                    <div align="right" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <button class="css_btn_enabled" id="btnSave"
                                            onserverclick="btnSave_ServerClick" validationgroup="Save" runat="server"
                                            type="button" causesvalidation="false" accesskey="S" title="Go,Alt+S">
                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                        </button>
                                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_ServerClick" causesvalidation="false" runat="server"
                                            type="button" accesskey="L" title="Clear, Alt+L">
                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                        </button>
                                        <button class="css_btn_enabled" id="btnExit" onserverclick="btnExit_ServerClick" causesvalidation="false" runat="server"
                                            type="button" accesskey="X" title="Exit, Alt+X">
                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                        </button>
                                        <%--onclick="if(fnConfirmClear())"--%>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

