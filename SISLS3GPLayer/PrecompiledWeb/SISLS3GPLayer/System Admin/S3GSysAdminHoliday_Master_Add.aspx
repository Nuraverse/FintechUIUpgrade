<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_S3GSysAdminHoliday_Master_Add, App_Web_xht0hlsp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" ToolTip="Holiday Master">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlGen" runat="server" CssClass="stylePanel" GroupingText="Header Details">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlFinYear" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_OnSelectedIndexChanged">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Financial Year" ID="lblFinYear" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                        InitialValue="0" ValidationGroup="btnSave" ControlToValidate="ddlFinYear" ErrorMessage="Select Financial Year"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Branch" AutoPostBack="true" class="md-form-control form-control" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label ID="lblLocation" runat="server" Text="Branch" CssClass="styleDisplayLabel" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                        InitialValue="-1" ValidationGroup="btnSave" ControlToValidate="ddlLocation" ErrorMessage="Select Branch"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                            <div class="md-input">
                                <asp:TextBox ID="txtDate" runat="server" ToolTip="Date" ReadOnly="true"
                                    class="md-form-control form-control login_form_content_input requires_false" onmouseover="txt_MouseoverTooltip(this)" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label ID="lblDate" runat="server" Text="Entry Date" CssClass="styleReqFieldLabel" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvtxtDate" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="btnSave"
                                        ControlToValidate="txtDate" ErrorMessage="Enter Date" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                        PopupButtonID="txtDate" ID="CalReceivedDate" Enabled="false" OnClientDateSelectionChanged="checkDate_PrevSystemDate">
                                    </cc1:CalendarExtender>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlHoliday" runat="server" CssClass="stylePanel" GroupingText="Week End" Width="100%">
                            <div class="gird">
                                <asp:GridView ID="grvHolidayMaster" runat="server" AutoGenerateColumns="false" OnRowDataBound="grvHolidayMaster_RowDataBound"
                                    FooterStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center"
                                    ShowFooter="false" Width="100%" class="gird_details">
                                    <RowStyle HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Week Day">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldays" runat="server" Text='<%# Bind("Days") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="80%" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkCategory" Checked='<%#DataBinder.Eval(Container.DataItem, "STATUS").ToString() == "1" ?  true:false %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="5%" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <FooterTemplate>
                                                <asp:CheckBox ID="chkFCategory" Visible="false" runat="server" />
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MasterID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHMasterID" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="styleGridHeader" />
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnldetails" runat="server" CssClass="stylePanel" GroupingText="Holiday">
                    <div class="gird">
                        <asp:GridView ID="Grvdetails" runat="server" AutoGenerateColumns="false" FooterStyle-HorizontalAlign="Center"
                            RowStyle-HorizontalAlign="Center" Width="100%"
                            ShowFooter="true" OnRowCommand="Grvdetails_RowCommand" OnRowDataBound="Grvdetails_RowDataBound"
                            OnRowDeleting="Grvdetails_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No." Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTranID" runat="server" Text='<%# Bind("Tran_Details_ID") %>' Width="150px" Visible="false"></asp:Label>
                                        <asp:Label runat="server" ID="Label1" Width="70%" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblReceivedDate" runat="server" Text='<%#Eval("Date") %>' ToolTip="Due Date" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDate" Width="100px" Text='<%#Eval("Date") %>' runat="server" class="md-form-control form-control login_form_content_input"
                                                onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" ToolTip="Date" />
                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtDate"
                                                ID="CalReceivedDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <asp:RequiredFieldValidator ID="rfvReceivedDate" runat="server" ControlToValidate="txtDate"
                                                ErrorMessage="Enter Due Date" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                        </div>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:TextBox ID="txtReceivedDate" onmouseover="txt_MouseoverTooltip(this)"  class="md-form-control form-control login_form_content_input"
                                                runat="server" ToolTip="Due Date" />
                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivedDate"
                                                PopupButtonID="txtReceivedDate" ID="CalReceivedDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <%-- <asp:RequiredFieldValidator ID="rfvReceivedDate" runat="server" ControlToValidate="txtReceivedDate"
                                                                            ErrorMessage="Enter Due Date" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd" />--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Top" />
                                    <FooterStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="left" HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNarration" ToolTip="Narration" runat="server" Text='<%#Eval("days")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDescription"  onmouseover="txt_MouseoverTooltip(this)" Text='<%#Bind("days")%>' class="md-form-control form-control login_form_content_input"
                                                runat="server" MaxLength="15" Style="text-align: left;" ToolTip="Description"
                                                onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                            <span class="highlight"></span>
                                        </div>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:TextBox ID="txtFooterDescription" ToolTip="Narration" onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input" runat="server" MaxLength="100" Style="text-align: left"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="rfvtxtFooterNarration" runat="server" ControlToValidate="txtFooterDescription"
                                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd"
                                                                            ErrorMessage="Enter the Description"></asp:RequiredFieldValidator>--%>
                                            <cc1:FilteredTextBoxExtender
                                                ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtFooterDescription" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                ValidChars=" " Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle Width="15%" HorizontalAlign="Left" VerticalAlign="Top" />
                                    <FooterStyle Width="15%" HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Entry Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryDate" runat="server" Text='<%#Eval("EntryDate") %>' ToolTip="Due Date" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtIEntryDate" Width="100px" Text='<%#Eval("EntryDate") %>' runat="server" class="md-form-control form-control login_form_content_input"
                                            onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" ToolTip="Date" ReadOnly="true" />
                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtIEntryDate"
                                            OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtFEntryDate"
                                            ID="CalEntryDate" Enabled="false">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="rfvEntryDate" runat="server" ControlToValidate="txtFEntryDate" CssClass="validation_msg_box_sapn"
                                            ErrorMessage="Enter Entry Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:TextBox ID="txtFEntryDate" onmouseover="txt_MouseoverTooltip(this)" Width="100px" class="md-form-control form-control login_form_content_input"
                                                ReadOnly="true" runat="server" ToolTip="Entry Date" />
                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFEntryDate" OnClientDateSelectionChanged="checkDate_PrevSystemDate"
                                                PopupButtonID="txtFEntryDate" ID="CalEntryDate" Enabled="false">
                                            </cc1:CalendarExtender>
                                            <%--<asp:RequiredFieldValidator ID="rfvEntryDate" runat="server" ControlToValidate="txtFEntryDate"
                                                                            ErrorMessage="Enter Due Date" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd" />--%>
                                            <span class="highlight"></span>                                            
                                        </div>
                                    </FooterTemplate>
                                    <ItemStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Top" />
                                    <FooterStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action" Visible="false">
                                    <ItemTemplate>
                                        <asp:Button ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete the details,ALT+D" CommandName="Delete" Visible="false"
                                            CssClass="grid_btn" OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false" AccessKey="D"></asp:Button>
                                    </ItemTemplate>
                                    <HeaderStyle Width="10%" CssClass="styleGridHeader" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkIS_Active" runat="server" Enabled="true" OnCheckedChanged="chkIS_Active_CheckedChanged" AutoPostBack="true"
                                            Checked='<%#DataBinder.Eval(Container.DataItem, "Active").ToString() == "1" ?  true:false %>'></asp:CheckBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="lnkAdd" ToolTip="Add the details,ALT+A" CommandName="Add"
                                            ValidationGroup="vgAdd" runat="server" CssClass="grid_btn" Text="Add" AccessKey="A"></asp:Button>
                                    </FooterTemplate>
                                    <FooterStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Top" />
                                    <HeaderStyle CssClass="styleGridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MasterID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblHMasterID" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlWeekDay" runat="server" CssClass="stylePanel" GroupingText="Week End" Visible="false" Width="100%">
                    <div id="divTransaction" class="container" runat="server" style="height: 350px; width: 100%; align-content: left">
                        <asp:GridView ID="grvWeekEnd" runat="server" AutoGenerateColumns="false" FooterStyle-HorizontalAlign="Center" OnRowDataBound="grvWeekEnd_RowDataBound"
                            HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" Width="100%" EmptyDataText="No Record Found"
                            ShowFooter="true" CssClass="grid_details">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWeekID" runat="server" Text='<%# Bind("WEEK_ID") %>' Width="150px" Visible="false"></asp:Label>
                                        <asp:Label runat="server" ID="lblSno" Width="70%" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblReceivedDate" runat="server" Text='<%#Eval("Date") %>' ToolTip="Due Date" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="left" HeaderText="Description">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNarration" ToolTip="Narration" runat="server" Text='<%#Eval("days")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Entry Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryDate" runat="server" Text='<%#Eval("EntryDate") %>' ToolTip="Entry Date" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkActive" runat="server" OnCheckedChanged="chkActive_CheckedChanged" AutoPostBack="true"
                                            Checked='<%#DataBinder.Eval(Container.DataItem, "Active").ToString() == "1" ?  true:false %>'
                                            Enabled="true"></asp:CheckBox>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MasterID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMasterID" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="btn_height"></div>
        <div align="right" class="fixed_btn">
            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                type="button" accesskey="S">
                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
            </button>
            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                type="button" accesskey="L">
                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
            </button>
            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                type="button" accesskey="X">
                <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
            </button>
        </div>
        <%--   <div class="row" style="float: right; margin-top: 5px;">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="save_btn fa fa-floppy-o" ValidationGroup="BtnSave"
                    OnClientClick="return fnCheckPageValidators()" OnClick="btnSave_Click" ToolTip="Save,Alt+S" AccessKey="S" />
                <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="save_btn fa fa-eraser-o"
                    CausesValidation="false" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" ToolTip="Clear,Alt+L" AccessKey="L" />
                <i class="fa fa-share btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnCancel" runat="server" Text="Exit" CssClass="save_btn fa fa-share-o" OnClientClick="return fnConfirmExit();"
                    OnClick="btnCancel_Click" CausesValidation="false" ToolTip="Exit,Alt+X" AccessKey="X" />
            </div>
        </div>--%>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <%--    <asp:ValidationSummary CssClass="styleMandatoryLabel" runat="server" ID="vsholiday"
                    ValidationGroup="BtnSave" HeaderText="Correct the following validation(s):  "
                    ShowSummary="true" ShowMessageBox="false" />--%>
                <asp:CustomValidator ID="cvholiday" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true"></asp:CustomValidator>
            </div>
        </div>
    </div>
</asp:Content>

