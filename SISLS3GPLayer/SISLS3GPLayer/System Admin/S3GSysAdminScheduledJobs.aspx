<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysAdminScheduledJobs.aspx.cs" Inherits="S3GSysAdminScheduledJobs" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
            <div>
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
                        <asp:Panel ID="pnlScheduleDetails" Width="100%" GroupingText="Schedule Details" CssClass="stylePanel"
                            runat="server">
                            <div class="row" style="float: right; margin-top: 5px;">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation" runat="server" class="md-form-control form-control" ToolTip="Branch">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Branch" ID="lblLocation" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtJobDescription" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            MaxLength="60" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Job Description" ID="lblJobDescription" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                SetFocusOnError="true" ValidationGroup="btnSave" ErrorMessage="Enter Job Description"
                                                ControlToValidate="txtJobDescription"></asp:RequiredFieldValidator>
                                            <cc1:FilteredTextBoxExtender ID="ftxtJobDescription" runat="server" Enabled="True"
                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtJobDescription"
                                                ValidChars="/-&+ ">
                                            </cc1:FilteredTextBoxExtender>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlJob" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlJob_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Job" ID="Label1" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvJob" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                ValidationGroup="btnSave" ErrorMessage="Select a Job" ControlToValidate="ddlJob"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlJobNature" runat="server" class="md-form-control form-control" OnSelectedIndexChanged="ddlJobNature_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Job Nature" ID="lblJobNature" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvddlJobDesc" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                ValidationGroup="btnSave" ErrorMessage="Select a Job Nature" ControlToValidate="ddlJobNature"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDate" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblStartDate" runat="server" Text="Start Date" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <cc1:FilteredTextBoxExtender ID="ftxtDocDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtStartDate" ValidChars="/-">
                                        </cc1:FilteredTextBoxExtender>
                                        <cc1:CalendarExtender ID="calDocDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                            PopupButtonID="imgDocdate" TargetControlID="txtStartDate">
                                        </cc1:CalendarExtender>
                                        <%--   <asp:Image ID="imgDocdate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvDocDate" runat="server" ControlToValidate="txtStartDate" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" ErrorMessage="Enter Start Date"
                                                SetFocusOnError="True" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartTime" runat="server" class="md-form-control form-control login_form_content_input requires_true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Start Time" ID="lblStartTime" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RegularExpressionValidator ID="REVScheduleTime" runat="server" ValidationGroup="btnSave"
                                                ErrorMessage="Start Time Should be HH:MM Fomat(24 Hours)" ControlToValidate="txtStartTime" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" SetFocusOnError="True" ValidationExpression="^(20|21|22|23|[01]\d|\d)(([:][0-5]\d){1,2})$"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartTime" runat="server" Display="Dynamic" ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"
                                                ErrorMessage="Enter Start Time" ControlToValidate="txtStartTime" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFrequency" runat="server" AutoPostBack="true" class="md-form-control form-control"
                                            OnSelectedIndexChanged="ddlFrequency_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Frequency" ID="lblFrequency" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvFrequency" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                ValidationGroup="btnSave" ErrorMessage="Select a Frequency" ControlToValidate="ddlFrequency"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divfreq" runat="server" visible="false">
                                    <div class="md-input">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFrqText" runat="server" Text="FrqText"></asp:Label>
                                        </label>
                                        <asp:TextBox ID="txtFrqText" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                            onmouseover="txt_MouseoverTooltip(this)" MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="ftxtMinutes" runat="server" Enabled="True" FilterType="Numbers"
                                            TargetControlID="txtFrqText" ValidChars="">
                                        </cc1:FilteredTextBoxExtender>
                                        <cc1:FilteredTextBoxExtender ID="ftbeFrqText" runat="server" TargetControlID="txtFrqText" FilterType="Numbers" Enabled="True"></cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvFrequencyTxt" runat="server" ControlToValidate="txtFrqText" Display="Dynamic" ErrorMessage="Enter the Day of Month"
                                                CssClass="validation_msg_box_sapn" Enabled="true" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divchkfrq" runat="server" visible="false">
                                    <div class="md-input md-check-list">
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblchkfrq" runat="server" Text="FrqText"></asp:Label>
                                        </label>
                                        <asp:CheckBoxList ID="chklstFrquency" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Text="S" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="M" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="T" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="W" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="T" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="F" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="S" Value="7"></asp:ListItem>
                                        </asp:CheckBoxList>

                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvChkfrq" runat="server" ControlToValidate="txtFrqText" Display="Dynamic" ErrorMessage="Enter the Day of Month"
                                                CssClass="validation_msg_box_sapn" Enabled="true" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkHoliday" runat="server" />
                                        <asp:Label runat="server" Text="Holiday" ID="lblHoliday"></asp:Label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" onkeyup="maxlengthfortxt(200);"
                                            class="md-form-control form-control login_form_content_input requires_true" MaxLength="200" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Remarks" ID="lblRemarks" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" runat="server" id="dvFileType" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFileType" runat="server" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="File Type" ID="lblFileType" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvFileType" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                ValidationGroup="btnSave" ErrorMessage="Select a File Type" ControlToValidate="ddlFileType"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkActive" runat="server" Checked="true" Enabled="false" />
                                        <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleReqFieldLabel"></asp:Label>
                                    </div>
                                </div>
                                <div id="divOcbReportType" runat="server" class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlOcbReportType" runat="server" class="md-form-control form-control" ToolTip="OCB Report Type">
                                            <asp:ListItem Value="0" Text="--Select--" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Contract Data"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Individual Data"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Company Data"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Collatral Data"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Subject Role"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Subject Relation"></asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="OCB Report Type" ID="lblOcbReporType" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <button class="css_btn_enabled" id="btnStartStopTimer" title="Start/Stop Refresh Timer[Alt+X]" causesvalidation="false" onserverclick="btnStartStopTimer_ServerClick" runat="server"
                                            type="button" accesskey="X">
                                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u></u>Stop Timer
                                        </button>
                                        <button class="css_btn_enabled" id="btnDownloadOcbExcpetion" title="DownLoad OCB Exception" causesvalidation="false" onserverclick="btnDownloadOcbExcpetion_ServerClick" runat="server"
                                            type="button">
                                            <i class="fa fa-download" aria-hidden="true"></i>&emsp;<u></u>DownLoad OCB Exception
                                        </button>
                                    </div>

                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divmailto" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtmailTo" runat="server" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Mail To" ID="Mail_To"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divMailCC" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMailcc" runat="server" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Mail CC" ID="Mail_CC"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divMailBcc" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMailBcc" runat="server" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Mail BCC" ID="Mail_BCC"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-md-12">
                        <div class="row">

                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 gird">
                                <asp:Panel GroupingText="Mail To" ToolTip="Mail TO" Width="100%"
                                    ID="pnlUsers" runat="server" CssClass="stylePanel">
                                    <asp:HiddenField ID="hdnFuncitonID" runat="server" />
                                    <asp:GridView runat="server" ShowFooter="true"
                                        OnRowCommand="grvFunctions_RowCommand"
                                        ID="grvFunctions" Width="99%" OnRowDeleting="grvFunctions_RowDeleting"
                                        AutoGenerateColumns="False" OnRowDataBound="grvFunctions_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("Sno")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Mail To">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblFUNCTION_NAME" Text='<%#Eval("FUNCTION_NAME")%>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblFUNCTION_ID" Text='<%#Eval("FUNCTION_ID")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <uc2:Suggest ID="txtFFunctionName" AutoPostBack="true" runat="server" ServiceMethod="GetMailList"
                                                            CssClass="md-form-control form-control login_form_content_input" IsMandatory="false" class="md-form-control form-control" />
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="2%" HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                        CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Remove this record?');"
                                                        ToolTip="Remove the Details, Alt+R" AccessKey="R"></asp:Button>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:Button ID="btnAdd" Width="50px" runat="server" CommandName="AddNew"
                                                            CssClass="grid_btn" Text="Add" ToolTip="Add the Details, Alt+A" AccessKey="T"></asp:Button>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MasterID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHMasterID" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <RowStyle HorizontalAlign="left" />
                                    </asp:GridView>


                                </asp:Panel>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 gird">
                                <asp:Panel GroupingText="Mail CC" ToolTip="Mail CC" Width="100%"
                                    ID="pnlMailCC" runat="server" CssClass="stylePanel">
                                    <asp:HiddenField ID="hdnMailCC" runat="server" />
                                    <asp:GridView runat="server" ShowFooter="true"
                                        OnRowCommand="grvMailCC_RowCommand" OnRowDataBound="grvMailCC_RowDataBound"
                                        ID="grvMailCC" Width="99%" OnRowDeleting="grvMailCC_RowDeleting"
                                        AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("Sno")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Mail CC">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblFUNCTION_NAME" Text='<%#Eval("FUNCTION_NAME")%>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblFUNCTION_ID" Text='<%#Eval("FUNCTION_ID")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <uc2:Suggest ID="txtFFunctionName" AutoPostBack="true" runat="server" ServiceMethod="GetMailList"
                                                            CssClass="md-form-control form-control login_form_content_input" IsMandatory="false" class="md-form-control form-control" />
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="2%" HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                        CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Remove this record?');"
                                                        ToolTip="Remove the Details, Alt+E" AccessKey="E"></asp:Button>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:Button ID="btnAdd" Width="50px" runat="server" CommandName="AddNew"
                                                            CssClass="grid_btn" Text="Add" ToolTip="Add the Details, Alt+T" AccessKey="T"></asp:Button>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MasterID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHMasterID" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <RowStyle HorizontalAlign="left" />
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 gird">
                                <asp:Panel GroupingText="Mail BCC" ToolTip="Mail BCC" Width="100%"
                                    ID="pnlBCC" runat="server" CssClass="stylePanel">
                                    <asp:HiddenField ID="hdnMailBCC" runat="server" />
                                    <asp:GridView runat="server" ShowFooter="true"
                                        OnRowCommand="grvMailBCC_RowCommand" OnRowDataBound="grvMailBCC_RowDataBound"
                                        ID="grvMailBCC" Width="99%" OnRowDeleting="grvMailBCC_RowDeleting"
                                        AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("Sno")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Mail BCC">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblFUNCTION_NAME" Text='<%#Eval("FUNCTION_NAME")%>'></asp:Label>
                                                    <asp:Label runat="server" ID="lblFUNCTION_ID" Text='<%#Eval("FUNCTION_ID")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <uc2:Suggest ID="txtFFunctionName" AutoPostBack="true" runat="server" ServiceMethod="GetMailList"
                                                            CssClass="md-form-control form-control login_form_content_input" IsMandatory="false" class="md-form-control form-control" />
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="2%" HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                        CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Remove this record?');"
                                                        ToolTip="Remove the Details, Alt+M" AccessKey="M"></asp:Button>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:Button ID="btnAdd" Width="50px" runat="server" CommandName="AddNew"
                                                            CssClass="grid_btn" Text="Add" ToolTip="Add the Details, Alt+O" AccessKey="O"></asp:Button>
                                                    </div>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MasterID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHMasterID" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <RowStyle HorizontalAlign="left" />
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlGridExeceptionDetails" Width="100%" GroupingText="Schedule Job Details" CssClass="stylePanel"
                            runat="server">
                            <div class="gird">
                                <asp:Timer ID="tmRefereshData" Enabled="false" runat="server" Interval="10000" OnTick="tmRefereshData_Tick">
                                </asp:Timer>
                                <asp:GridView ID="gvJobDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                                    OnRowDataBound="gvJobDetails_RowDataBound" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNo.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerialno" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Schedule Job Status ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSchedulejob_Status_Id" runat="server" Text='<%# Bind("SCHEDULEJOB_STATUS_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Schedule Job ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblScheduleJobID" runat="server" Text='<%# Bind("SCHEDULE_JOB_ID") %>'></asp:Label>
                                                <asp:Label ID="lblScheduleJobType" runat="server" Text='<%# Bind("SCHEDULE_JOB") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Job Description" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblScheduleJobDesc" runat="server" Text='<%# Bind("SCHEDULE_JOB_DESC") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocationDesc" runat="server" Text='<%# Bind("LOCATION_DESC") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--  <asp:TemplateField HeaderText="Job" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblJob" runat="server" Text='<%# Bind("Job") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="Schedule DateTime">
                                            <ItemTemplate>
                                                <asp:Label ID="lblScheduleDateTime" runat="server" Text='<%# Bind("SCHEDULEDATETIME") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Start Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStartDateTime" runat="server" Text='<%# Bind("STARTDATETIME") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="End Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("ENDDATETIME") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status Code" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatusCode" runat="server" Text='<%# Bind("STATUS_CODE") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatusDesc" runat="server" Text='<%# Bind("STATUS_DESC") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:UpdatePanel ID="up1" runat="server">
                                                    <ContentTemplate>
                                                        <%--<asp:Button ID="btnViewExeption" runat="server" CausesValidation="false" Text="View Exception" AccessKey="V" ToolTip="Alt+V" OnClick="btnViewExeption_Click" CssClass="grid_btn" />--%>


                                                        <div class="text-center">
                                                            <button class="btn btn-danger" visible='<%# Eval("SCHEDULE_JOB").ToString() == "37" ? false : true %>' id="btnViewExeption" title="View" causesvalidation="false" onserverclick="btnViewExeption_Click" runat="server"
                                                                type="button">
                                                                <i class="fa fa-search-plus" aria-hidden="true"></i>&emsp;<u></u>
                                                            </button>
                                                            <button id="btnAccountMis" visible='<%# Eval("SCHEDULE_JOB").ToString() == "37" ? true : false %>' width="100px" runat="server" onserverclick="btnViewMIS_Click" causesvalidation="false"
                                                                class="grid_btn">
                                                                <i class="fa fa-download" aria-hidden="true"></i>&nbsp; Account MIS</button>

                                                            <button id="btnFactoringMis" visible='<%# Eval("SCHEDULE_JOB").ToString() == "37" ? true : false %>' width="100px" runat="server" onserverclick="btnViewFactoringMIS_Click" causesvalidation="false"
                                                                class="grid_btn">
                                                                <i class="fa fa-download" aria-hidden="true"></i>&nbsp; Factoring MIS</button>
                                                        </div>


                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnViewExeption" />
                                                    </Triggers>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnAccountMis" />
                                                    </Triggers>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnFactoringMis" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField Visible="false" HeaderText="Post Interest Details" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <button class="btn btn-danger" id="btnPostInterestDetails" title="Post Interest Details" causesvalidation="false" onserverclick="btnPostInterestDetails_Click" runat="server"
                                                    type="button">
                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u></u>
                                                </button>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Resume" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%-- <asp:Button ID="btnResume" runat="server" CausesValidation="false" Text="Resume" OnClick="btnResume_Click" AccessKey="R" ToolTip="Alt+R" CssClass="grid_btn"
                                                    OnClientClick="return confirm('Are you sure want to resume?');" />--%>
                                                <button class="btn btn-danger" id="btnResume" title="Resume" causesvalidation="false" onserverclick="btnResume_Click" runat="server"
                                                    type="button">
                                                    <i class="fa fa-repeat" aria-hidden="true"></i>&emsp;<u></u>
                                                </button>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Re-Run" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <button class="btn btn-danger" id="btnReRun" title="Resume" causesvalidation="false" onserverclick="btnReRun_Click" runat="server"
                                                    type="button">
                                                    <i class="fa fa-repeat" aria-hidden="true"></i>&emsp;<u></u>
                                                </button>
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
                        <asp:Panel ID="pnlExportToExcel" runat="server" Visible="false">
                            <div class="gird">
                                <asp:GridView ID="gvExceptionDetToExcel" runat="server" AutoGenerateColumns="true" Width="100%"
                                    class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNo.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerialno" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Process Month">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProcessMonth" runat="server" Text='<%# Bind("Process_Month") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="GL Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("GL_CODE") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SL Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSLCode" runat="server" Text='<%# Bind("SL_CODE") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Exception Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblException_Desc" runat="server" Text='<%# Bind("Exception_Desc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                        <asp:CustomValidator ID="cvScheduledJobs" runat="server" CssClass="styleReqFieldLabel"
                            Enabled="true" />
                        <%--    <asp:ValidationSummary ID="lblsErrorMessage" runat="server" CssClass="styleMandatoryLabel"
                        HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" />--%>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="tmRefereshData" EventName="Tick" />
            <asp:PostBackTrigger ControlID="btnDownloadOcbExcpetion" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
