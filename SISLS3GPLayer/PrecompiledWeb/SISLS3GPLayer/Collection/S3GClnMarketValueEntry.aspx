<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="CLN_S3GCLNMarketValueEntry, App_Web_x5tdsxrh" %>

<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control"
                                        AutoPostBack="True">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                    <%-- <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" ControlToValidate="ddlLOB"
                            ErrorMessage="Select a Line of Business" CssClass="styleMandatoryLabel" Display="None"
                            InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlBranch" ToolTip="Branch" runat="server" AutoPostBack="true" class="md-form-control form-control"
                                        OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" />
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" 
                                            ErrorMessage="Select a Branch" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                            InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lblBranch" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtMVDate" runat="server" OnTextChanged="txtMVDate_TextChangeEvent"
                                        AutoPostBack="true" Enabled="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtMvDate" runat="server" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic" ErrorMessage="Select Market Value Entry date" SetFocusOnError="true" InitialValue=""
                                            ControlToValidate="txtMvDate"></asp:RequiredFieldValidator>
                                    </div>
                                    <%--   <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtMVDate"
                                        PopupButtonID="Image1" ID="CalendarExtender2" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                    </cc1:CalendarExtender>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Market Value Entry Date" ID="lblMVDate" CssClass="styleReqFieldLabel"></asp:Label>
                                        <%--<span class="styleMandatory">*</span>--%>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkStatus" runat="server" Checked="true" Enabled="false" />
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Status" ID="lblStatus" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtMVNo" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        ReadOnly="true" Enabled="false"></asp:TextBox>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Market Value No" ID="lblMVNumber" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <asp:Panel Width="100%" ID="pnlOption1" runat="server" GroupingText="Option1" CssClass="stylePanel">
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:RadioButton ID="rdoOption1" runat="server" Enabled="false" Text="Option1" OnCheckedChanged="rdoOption1_CheckedChanged"
                                                        AutoPostBack="True" class="md-form-control form-control radio" />
                                                </div>
                                            </div>


                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <span class="highlight"></span>
                                                    <asp:TextBox ID="txtCustomerCodeLease" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                        Style="display: none;" MaxLength="100"></asp:TextBox>
                                                    <uc4:icm id="ucCustomerCodeLov" onblur="fnLoadCustomer()" tooltip="Customer Name" hovermenuextenderleft="true" runat="server" showhideaddressimagebutton="false"
                                                        autopostback="true" dispalycontent="Both" strlov_code="CUS_COM" servicemethod="GetCustomerList" onitem_selected="ucCustomerCodeLov_Item_Selected" />
                                                    <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                                        Style="display: none" />
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCustomer" runat="server" Text="Customer Name" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <%--<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <uc2:LOV ID="ucCustomerCode" onblur="fnLoadCustomer()" DispalyContent="Both" runat="server" TabIndex="-1"
                                                        strLOV_Code="CMB" class="md-form-control form-control" />
                                                    <asp:Button ID="btnLoadCustomer" CausesValidation="false" runat="server" Style="display: none" AccessKey="C" ToolTip="Load Customer,Alt+C"
                                                        Text="Load Customer" OnClick="btnLoadCustomer_OnClick" />
                                                    <asp:TextBox ID="cmbCustomerCode" runat="server" MaxLength="50" Style="display: none"
                                                        ReadOnly="true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCustomer" runat="server" ControlToValidate="cmbCustomerCode" CssClass="validation_msg_box_sapn"
                                                            InitialValue="0" Display="Dynamic" ErrorMessage="Select the Customer" SetFocusOnError="true"
                                                            ValidationGroup="vgOption1"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <label class="tess">
                                                        <asp:Label ID="lblCustomer" runat="server" Text="Customer Code" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>--%>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlMLA" AutoPostBack="true" runat="server" Enabled="False" class="md-form-control form-control"
                                                        OnSelectedIndexChanged="ddlMLA_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvMLA" runat="server" ControlToValidate="ddlMLA" CssClass="validation_msg_box_sapn"
                                                            InitialValue="0" Display="Dynamic" ErrorMessage="Select the Account No" SetFocusOnError="true"
                                                            ValidationGroup="vgOption1"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <label class="tess">
                                                        <asp:Label ID="lblMLA" runat="server" Text="Prime Account No" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div align="right" class="md-input">
                                                    <%--<asp:Button ID="btnOkOption1" Enabled="false" runat="server" Text="Ok" CausesValidation="true" AccessKey="O" ToolTip="Ok[Alt+O]"
                                                        OnClick="btnOkOption1_Click" class="css_btn_enabled" />--%>

                                                    <button class="css_btn_enabled" id="btnOkOption1" title="Go,[Alt+G]" onclick="if(fnCheckPageValidators('vgOption1','false'))" causesvalidation="false"
                                                        onserverclick="btnOkOption1_Click" runat="server" type="button" accesskey="G">
                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlSLA" Visible="false" OnSelectedIndexChanged="ddlSLA_SelectedIndexChanged"
                                                        AutoPostBack="true" runat="server" Enabled="False" class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvSLA" ControlToValidate="ddlSLA" runat="server" CssClass="validation_msg_box_sapn"
                                                            Enabled="false" InitialValue="0" Display="Dynamic" ErrorMessage="Select the Sub Account No"
                                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <label class="tess">
                                                        <asp:Label ID="lblSLA" runat="server" Visible="false" Text="Sub Account No" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <asp:Panel Width="100%" ID="pnlOption2" runat="server" GroupingText="Option2" CssClass="stylePanel">
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:RadioButton ID="rdoOption2" runat="server" Text="Option2" OnCheckedChanged="rdoOption2_CheckedChanged"
                                                        AutoPostBack="True" class="md-form-control form-control radio" />
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlAssetClass" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlAssetClass_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlAssetClass" ControlToValidate="ddlAssetClass" CssClass="validation_msg_box_sapn"
                                                            runat="server" InitialValue="0" SetFocusOnError="true" ErrorMessage="Select Asset Class"
                                                            Display="Dynamic" ValidationGroup="vgOption2"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <label class="tess">
                                                        <asp:Label ID="lblAssetClass" runat="server" Text="Asset Class" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlAssetMake" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlAssetMake_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlAssetMake" ControlToValidate="ddlAssetMake" CssClass="validation_msg_box_sapn"
                                                            runat="server" InitialValue="0" SetFocusOnError="true" ErrorMessage="Select Asset Make"
                                                            Display="Dynamic" ValidationGroup="vgOption2"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <label class="tess">
                                                        <asp:Label ID="lblAssetMake" runat="server" Text="Asset Make" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlAssetType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlAssetType_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlAssetType" runat="server" ControlToValidate="ddlAssetType" CssClass="validation_msg_box_sapn"
                                                            InitialValue="0" SetFocusOnError="true" ErrorMessage="Select Asset Type" Display="Dynamic" ValidationGroup="vgOption2"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <label class="tess">
                                                        <asp:Label ID="lblAssetType" runat="server" Text="Asset Type" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlAssetModel" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlAssetModel_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlAssetModel" runat="server" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                            ControlToValidate="ddlAssetModel" SetFocusOnError="true" ErrorMessage="Select Asset Model"
                                                            Display="Dynamic" ValidationGroup="vgOption2"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <label class="tess">
                                                        <asp:Label ID="lblAssetModel" runat="server" Text="Asset Model" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div align="right" class="md-input">

                                                    <button class="css_btn_enabled" id="btnOption2" title="Go,[Alt+K]" onclick="if(fnCheckPageValidators('vgOption2','false'))" causesvalidation="false"
                                                        onserverclick="btnOption2_Click" runat="server" type="button" accesskey="K">
                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;Go
                                                    </button>

                                                    <%--   <asp:Button ID="btnOption2" runat="server" Text="Ok" CausesValidation="true" OnClick="btnOption2_Click"
                                                        class="css_btn_enabled" AccessKey="K" ToolTip="Ok[Alt+K]" />--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="md-input">
                        <div class="gird">
                            <asp:GridView ID="grvMarket" runat="server" AutoGenerateColumns="false" OnRowDataBound="grvMarket_RowDataBound" class="gird_details">
                                <%--<RowStyle HorizontalAlign="Left" Width="100%" />--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="SI.No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSINO" runat="server" MaxLength="20" Text="<%#Container.DataItemIndex+1 %> "></asp:Label>
                                            <asp:Label ID="lblAssetID" runat="server" Text='<%#Eval("Asset_ID")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="LOB" HeaderText="Line of Business" />
                                    <asp:BoundField DataField="Location" HeaderText="Branch" />
                                    <asp:BoundField DataField="Customer_Name" HeaderText="Customer Name" />
                                    <asp:TemplateField HeaderText="Account No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPANum" runat="server" Text='<%#Eval("PANum")%>'></asp:Label>
                                            <asp:Label ID="lblgvActPASAREFID" runat="server" Text='<%#Eval("PA_SA_REF_ID")%>' Style="display: none;"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Account No " Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSANum" runat="server" Text='<%#Eval("SANum")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="Asset_Code" HeaderText="Asset Code" />--%>
                                    <asp:BoundField DataField="Asset_Description" HeaderText="Asset Description" />
                                    <%-- <asp:BoundField DataField="Book_Value" HeaderText="Book Value" ItemStyle-HorizontalAlign="Right" />--%>
                                    <asp:TemplateField HeaderText="Book Value" Visible="false" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBookValue" runat="server" Text='<%#Eval("Book_Value")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Entered Value" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurValue" runat="server" Text='<%#Eval("LastEnteredValue")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="LastEnteredValue" HeaderText="Last Entered Value" ItemStyle-HorizontalAlign="Right"
                                        Visible="false" />
                                    <asp:TemplateField HeaderText="Last Entered Date">
                                        <ItemTemplate>
                                            <%# FormatDate(Eval("LastEnteredDate").ToString())%>
                                            <asp:Label ID="lblLastDate" runat="server" Text='<%#Eval("LastEnteredDate")%>' Visible="false"
                                                Style="text-align: right"> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--  <asp:BoundField Dat
                                                <%--  <asp:BoundField DataField='<%#Eval("DateTime.Parse(LastEnteredDate, CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat)")%>' HeaderText="Last Entered Date" />--%>
                                    <asp:TemplateField HeaderText="Current Value" ItemStyle-HorizontalAlign="Center">

                                        <ItemTemplate>
                                            <div>
                                                <div style="width: 80%">
                                                    <asp:TextBox ID="txtCurValue" runat="server" Text='<%#Eval("CurValue") %>'
                                                        class="md-form-control form-control login_form_content_input requires_true" Width="120px" Style="text-align: right"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderCurValue" runat="server"
                                                        TargetControlID="txtCurValue" FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>
                                                <div style="width: 20%">
                                                    <asp:CheckBox ID="chkCopyAmount" runat="server" ToolTip="Copy Amount" AutoPostBack="true" OnCheckedChanged="chkCopyAmount_CheckedChanged" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="styleGridHeader" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <%-- <tr visible="false" class="styleRecordCount" runat="server" id="trNoRecord">
                                <td style="text-align: center">
                                    <asp:Label Visible="false" ID="lblNoRecord" runat="server" Text="No Record found"
                                        Font-Size="Medium"></asp:Label>
                                </td>
                            </tr>--%>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnSave" runat="server" class="css_btn_enabled" type="submit" accesskey="S" title="Save[Alt+S]"
                        causesvalidation="false" onclick="if(fnCheckPageValidators())" onserverclick="btnSave_Click">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                    <button id="btnClear" runat="server" causesvalidation="False" class="css_btn_enabled" type="submit" accesskey="L"
                        title="Clear[Alt+L]" onclick="if(fnConfirmClear())" onserverclick="btnClear_Click">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <button id="btnCancel" runat="server" causesvalidation="False" class="css_btn_enabled" type="submit" accesskey="X"
                        title="Exit[Alt+X]" onclick="if(fnConfirmExit())" onserverclick="btnCancel_Click">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <input type="hidden" id="hidCustId" runat="server" />
                </div>

                <%--<asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" ShowMessageBox="false" />
                        <asp:CustomValidator ID="cvMarketValueEntry" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>--%>
                <asp:Label ID="lblCustID" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                <%-- <asp:ValidationSummary ID="vsoption1" runat ="server" CssClass="styleMandatoryLabel" HeaderText ="Correct the following validation(s):" ShowSummary ="true" 
                             ValidationGroup ="Option1" ShowMessageBox ="false"  />--%>
                <%-- <asp:ValidationSummary ID="vsoption2" runat="server" CssClass ="styleMandatoryLabel" HeaderText ="Correct the following validation(s):" ShowSummary ="true" 
                              ValidationGroup ="option2" ShowMessageBox ="false" />--%>
                <div class="row">
                    <div class="col">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
        }
        function checkDate_ApplicationDate(sender, args) {
            document.getElementById('ctl00_ContentPlaceHolder1_txtMVDate').value = vartodayformat;

        }

        function fnChkValidZero() {
            //get reference of GridView control
            var grid = document.getElementById("<%= grvMarket.ClientID %>");
            //variable to contain the cell of the grid
            var cell;

            if (grid.rows.length > 0) {
                //loop starts from 1. rows[0] points to the header.
                for (i = 1; i < grid.rows.length; i++) {
                    //get the reference of first column
                    // cell = grid.rows[i].cells[0];
                    cell = document.getElementById(txtCurValue);
                    if ((cell.value != " ") && !(isNaN(cell.value))) {
                        var CurVal
                        CurVal = parseInt(cell.value, 10);
                        if (CurVal == "0") {
                            alert("Market Value cannot be Zero");
                            cell.focus();
                        }
                        else {
                            return;
                        }
                    }
                }
            }
        }

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";


                }
            }
        }

    </script>
</asp:Content>
