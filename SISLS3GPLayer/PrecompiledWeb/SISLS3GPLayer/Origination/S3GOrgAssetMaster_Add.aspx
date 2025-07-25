<%@ page title="S3G - Asset Master" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3G_OrgAssetMaster_Add, App_Web_w304vrwx" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <link href="../Content/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Content/css/style.css" rel="stylesheet" type="text/css" />
    <link href="../Content/css/style_sheet.css" rel="stylesheet" type="text/css" />
    <link href="../Content/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="../Content/css/custom.css" rel="stylesheet" type="text/css" />--%>
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="Asset Master" ID="lblHeading" ToolTip="Asset Master"> </asp:Label>
                    </h6>
                </div>

            </div>
            <div class="row">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="panAssetType" GroupingText="Asset Category" CssClass="stylePanel">

                            <div class="row" style="padding: 0px !important;">
                                <div class="col-md-12 col-sm-6 col-xs-12">
                                    <br />
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAssetType" ToolTip="Asset Category" runat="server" ValidationGroup="CategoryGroup"
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlAssetType_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Asset Category" ToolTip="Asset Category" ID="lblAssetType" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlAssetType"
                                                ErrorMessage="Select the Asset Category" SetFocusOnError="True" InitialValue="0" ValidationGroup="AssetCode"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding: 0px !important;">
                                <div class="col-md-12 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <label style="top: -5px;">
                                            <asp:Label runat="server" Text="Line of Business" Visible="false" ToolTip="Line of Business" ID="lblLineofBusiness" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                        <br />
                                        <div class="gird">
                                            <asp:GridView runat="server" ID="grvLOB" Width="100%"
                                                OnRowDataBound="grvLOB_RowDataBound" AutoGenerateColumns="False" class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Line of Business"
                                                        HeaderStyle-Width="70%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLOB" runat="server" ToolTip='<%#Eval("LOB_Name")%>' Text='<%#Eval("LOB_Name")%>'></asp:Label>
                                                            <asp:Label ID="lblLOBID" runat="server" Visible="false" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                            <%--<asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-Width="30%">
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkSelectAllLOB" runat="server" Enabled="false" Checked="true"></asp:CheckBox>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelectLOB" runat="server" Enabled="false" Checked="true"></asp:CheckBox>
                                                            <asp:Label ID="lblMapLob" Visible="false" Text='<%#Eval("CAT_LOB_ID")%>' runat="server"  ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <%--  <HeaderStyle CssClass="styleGridHeader" />--%>
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Panel Visible="true" runat="server" ID="panCategoryCode" ToolTip="Category Code" GroupingText="Category Code"
                        CssClass="stylePanel">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <label>
                                            <asp:Label ID="lblLastCode" ToolTip="Last Generated Code" runat="server" Text="Last Generated Code" CssClass="styleInfoLabel"></asp:Label></label>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <label>
                                            <asp:Label ID="lblLastGenCode" ToolTip="Last Generated Code" runat="server" CssClass="styleInfoLabel"></asp:Label></label>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel Visible="false" runat="server" ToolTip="Category Type" ID="panCategoryType" GroupingText="Category Type"
                                            CssClass="stylePanel">
                                            <asp:RadioButtonList ID="chkCategoryType" ToolTip="Category Type" runat="server" RepeatDirection="Horizontal"
                                                ValidationGroup="CategoryGroup" OnSelectedIndexChanged="chkCategoryType_SelectedIndexChanged"
                                                AutoPostBack="True">
                                                <asp:ListItem Value="Class">Class</asp:ListItem>
                                                <asp:ListItem Value="Make">Make</asp:ListItem>
                                                <asp:ListItem Value="Type">Type</asp:ListItem>
                                                <asp:ListItem Value="Model">Model</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </asp:Panel>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCode" AutoCompleteType="Disabled" runat="server" ToolTip="Asset Class Code" ValidationGroup="CategoryGroup"
                                                class="md-form-control form-control login_form_content_input requires_true" MaxLength="3"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender
                                                ID="ftexCategoryCode" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                TargetControlID="txtCode" runat="server" Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblCode" runat="server" ToolTip="Asset Class Code" Text="Asset Class Code" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCode" ValidationGroup="CategoryGroup"
                                                    runat="server" ErrorMessage="Enter the Asset Category Code" SetFocusOnError="True"
                                                    ControlToValidate="txtCode" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCodeDescription" AutoCompleteType="Disabled" ToolTip="Asset Class Description" runat="server" ValidationGroup="CategoryGroup"
                                                class="md-form-control form-control login_form_content_input requires_true"
                                                MaxLength="50"></asp:TextBox>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            
                                            <label class="tess">
                                                <asp:Label ID="lblCodeDesc" runat="server" ToolTip="Asset Class Description" Text="Asset Class Description" CssClass="styleReqFieldLabel"></asp:Label>

                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCodeDescription"
                                                    ValidationGroup="CategoryGroup" runat="server" ErrorMessage="Enter the Asset Category Description"
                                                    SetFocusOnError="True" ControlToValidate="txtCodeDescription" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                             <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="CategoryGroup"
                                                    ErrorMessage="Enter a valid Asset Category Description" ControlToValidate="txtCodeDescription"
                                                    ValidationExpression="^[a-zA-Z_0-9](\w|\W)*" Display="None" Enabled="false"></asp:RegularExpressionValidator>--%>

                                            </div>
                                        </div>
                                    </div>
                                    <%-- </div>
                            <div class="row">--%>
                                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                        <%--   <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                        <asp:Button ID="btnCategoryGo" Text="Go" runat="server" ToolTip="Go,Alt+G" ValidationGroup="CategoryGroup" AccessKey="G"
                                            CssClass="save_btn fa fa-floppy-o" OnClick="btnCategoryGo_Click" OnClientClick="return fnCheckPageValidators('CategoryGroup','f')"></asp:Button>--%>

                                        <button class="css_btn_enabled" id="btnCategoryGo" title="Go,Alt+G" causesvalidation="false" onclick="if(fnCheckPageValidators('CategoryGroup','f'))" onserverclick="btnCategoryGo_Click" runat="server"
                                            type="button" accesskey="G">
                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                        </button>



                                        <asp:Button ID="btnGetCatdegoryDetails" ToolTip="Get" Text="Get" runat="server" CausesValidation="False"
                                            Style="display: none" CssClass="styleSubmitButton" OnClick="btnGetCatdegoryDetails_Click" />
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12"></div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabContainer ID="tcCode" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                            Width="100%" ScrollBars="Auto">
                                            <cc1:TabPanel runat="server" HeaderText="Class Code" ID="tpClassCode" CssClass="tabpan"
                                                BackColor="Red">
                                                <HeaderTemplate>
                                                    Class Codes
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <div class="gird">
                                                        <asp:GridView ID="grvAssetClass" ToolTip="AssetClass" runat="server" Width="100%" OnRowDeleting="grvAsset_RowDeleting"
                                                            AutoGenerateColumns="False" EmptyDataText="No Records found" class="gird_details">
                                                            <Columns>
                                                                <asp:BoundField DataField="Code" HeaderText="Code" />
                                                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                                                <asp:TemplateField HeaderText="Remove">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton Text="Remove" runat="server" ID="lnkbtnDelete" AccessKey="R" ToolTip="Remove,Alt+R" CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Remove this record?');" CommandName="Delete"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel runat="server" HeaderText="Make Code" ID="tpMakeCode" CssClass="tabpan"
                                                BackColor="Red">
                                                <HeaderTemplate>
                                                    Make Codes
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <div class="gird">
                                                        <asp:GridView ID="grvAssetMake" ToolTip="Make Code" runat="server" OnRowDeleting="grvAsset_RowDeleting"
                                                            Width="100%" AutoGenerateColumns="False" EmptyDataText="No Records found" class="gird_details">
                                                            <Columns>
                                                                <asp:BoundField DataField="Code" HeaderText="Code" />
                                                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                                                <asp:TemplateField HeaderText="Remove">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton Text="Remove" runat="server" AccessKey="R" ToolTip="Remove,Alt+R" CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Remove this record?');" ID="lnkbtnDelete" CommandName="Delete"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel runat="server" HeaderText="Type Code" ID="tpTypeCode" CssClass="tabpan"
                                                BackColor="Red">
                                                <HeaderTemplate>
                                                    Type Codes
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <div class="gird">
                                                        <asp:GridView ID="grvAssetType" ToolTip="Type Code" runat="server" OnRowDeleting="grvAsset_RowDeleting"
                                                            Width="100%" AutoGenerateColumns="False" EmptyDataText="No Records found" class="gird_details">
                                                            <Columns>
                                                                <asp:BoundField DataField="Code" HeaderText="Code" />
                                                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                                                <asp:TemplateField HeaderText="Remove">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton Text="Remove" runat="server" ID="lnkbtnDelete" AccessKey="R" ToolTip="Remove,Alt+R" CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Remove this record?');" CommandName="Delete"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel runat="server" HeaderText="Model Code" ID="tpModelCode" CssClass="tabpan"
                                                BackColor="Red">
                                                <HeaderTemplate>
                                                    Model Codes
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <div class="gird">
                                                        <asp:GridView ID="grvAssetModel" ToolTip="Model Code" runat="server" OnRowDeleting="grvAsset_RowDeleting"
                                                            Width="100%" AutoGenerateColumns="False" EmptyDataText="No Records found" class="gird_details">
                                                            <Columns>
                                                                <asp:BoundField DataField="Code" HeaderText="Code" />
                                                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                                                <asp:TemplateField HeaderText="Remove">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton Text="Remove" runat="server" ID="lnkbtnDelete" AccessKey="R" ToolTip="Remove,Alt+R" CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Remove this record?');" CommandName="Delete"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                        </cc1:TabContainer>
                                    </div>
                                </div>

                                <div class="btn_height"></div>
                                <div align="right" class="fixed_btn">
                                    <button class="css_btn_enabled" id="btnCategorySubmit" title="Save[Alt+S]" causesvalidation="false" onclick="if(fnSaveValidation())" onserverclick="btnCategorySubmit_Click" runat="server"
                                        type="submit" accesskey="S">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                    </button>
                                    <button class="css_btn_enabled" id="btnAssetCategoryClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnAssetCategoryClear_ServerClick" runat="server"
                                        type="button" accesskey="L">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                    </button>
                                    <button class="css_btn_enabled" id="btnCategoryCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                        type="button" accesskey="X">
                                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                    </button>
                                </div>

                                <%-- <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row" style="float: right; margin-top: 5px;">
                                            <div class="btn_height"></div>
                                            <div align="right" class="fixed_btn">
                                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12" align="right">
                                                    <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                    <asp:Button ID="btnCategorySubmit" Text="Save" AccessKey="S" runat="server" ToolTip="Save,Alt+S" OnClientClick="return confirm('Do you want to Save?');" CssClass="css_btn_enabled fa fa-floppy-o"
                                                        OnClick="btnCategorySubmit_Click" />&nbsp;
                                                </div>
                                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12" align="right">
                                                    <i class="fa fa-times btn_i" aria-hidden="true"></i>
                                                    <asp:Button ID="btnCategoryCancel" ToolTip="Exit,Alt+X" Text="Exit" runat="server" OnClientClick="return fnConfirmExit();" AccessKey="X" CausesValidation="False"
                                                        CssClass="css_btn_enabled fa fa-times" OnClick="btnCancel_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">

                                        <asp:ValidationSummary ID="vsCategoryGroup" runat="server" ValidationGroup="CategoryGroup"
                                            CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </div>
            </div>
            <br />
            <div>
                <asp:Panel Visible="true" runat="server" ID="panAssetCode">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="divAssetcode" runat="server">
                                    <cc1:TabContainer ID="tcAssetcode" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                        ScrollBars="Auto" Height="250px">
                                        <cc1:TabPanel runat="server" HeaderText="Class Code" ID="tpAssetclass" CssClass="tabpan"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                Class Codes
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <br />
                                                        <br />
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlClassSearchby" ToolTip="Search by" runat="server" class="md-form-control form-control">
                                                                        <asp:ListItem Text="Code" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Description" Value="1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label runat="server" ID="label122" Text="Search by" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <%--<div>--%>
                                                                    <asp:TextBox ID="txtClassSearchValue" ToolTip="Search Value" AutoPostBack="false" runat="server" onchange="FunClassSearch()"
                                                                        class="md-form-control form-control login_form_content_input float_left" Width="85%" Style="background-image: url('');"></asp:TextBox>
                                                                    <%--<div style="width:15%;" class="float-left">--%>
                                                                    <asp:ImageButton ID="imgbtnClassSearch" ToolTip="SearchValue" CssClass="input_image_bnt" Style="display: block;" ImageUrl="~/Images/search_blue.gif"
                                                                        runat="server" OnClick="imgbtnClassSearch_Click" />
                                                                    <%-- </div>
                                                                        </div>--%>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="label4" Text="Search Value" />
                                                                    </label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvAssetClassCodes" runat="server" AutoGenerateColumns="False"
                                                                        ToolTip="Asset Class Codes View" EmptyDataText="No Records found" class="gird_details">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Class Id" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblClassId" runat="server" Text='<%# Bind("Asset_Category_ID") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Class Code">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkCategoryCode" runat="server" AutoPostBack="true" OnCheckedChanged="chkCategoryCode_CheckedChanged"
                                                                                        Text='<%# Bind("Category") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Class Code" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCategoryCode" runat="server" Text='<%# Bind("Category_Code") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Description" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblClassDesc" runat="server" Text='<%# Bind("Category_Description") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br></br>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" HeaderText="Class Code" ID="tpAssetMake" CssClass="tabpan"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                Make Codes
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <br />
                                                        <br />
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlMakeSearchby" ToolTip="Search by" runat="server" class="md-form-control form-control">
                                                                        <asp:ListItem Text="Code" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Description" Value="1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>Search by</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtMakeSearchValue" ToolTip="Search Value" AutoPostBack="false" runat="server" onchange="FunMakeSearch()"
                                                                        class="md-form-control form-control login_form_content_input requires_true" Style="background-image: url('');"></asp:TextBox><!--OnTextChanged="txtSearchValue_TextChanged"!-->
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>Search Value :</label>
                                                                    <asp:ImageButton ID="imgbtnMakeSearch" Style="display: none" ImageUrl="~/Images/search_blue.gif"
                                                                        runat="server" OnClick="imgbtnMakeSearch_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvAssetMakeCodes" runat="server" AutoGenerateColumns="False" ToolTip="Asset Make Codes View"
                                                                        Width="100%" EmptyDataText="No Records found" class="gird_details">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Make Id" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblMakeId" runat="server" Text='<%# Bind("Asset_Category_ID") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Make Code">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkCategoryCode" runat="server" Text='<%# Bind("Category") %>'
                                                                                        AutoPostBack="True" OnCheckedChanged="chkCategoryCode_CheckedChanged" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Make Code" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCategoryCode" runat="server" Text='<%# Bind("Category_Code") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Description" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblMakeDesc" runat="server" Text='<%# Bind("Category_Description") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br></br>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" HeaderText="Class Code" ID="tpAssetType" CssClass="tabpan"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                Type Codes
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                        <br />
                                                        <br />
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlTypeSearchby" ToolTip="Search by" runat="server" class="md-form-control form-control">
                                                                        <asp:ListItem Text="Code" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Description" Value="1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>Search by</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTypeSearchValue" ToolTip="Search Value" AutoPostBack="false" runat="server" onchange="FunTypeSearch()"
                                                                        class="md-form-control form-control login_form_content_input requires_true" Style="background-image: url('');"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>Search Value :</label>

                                                                    <asp:ImageButton ID="imgbtnTypeSearch" Style="display: none" ImageUrl="~/Images/search_blue.gif"
                                                                        runat="server" OnClick="imgbtnTypeSearch_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvAssetTypeCodes" runat="server" AutoGenerateColumns="False" ToolTip="Asset Type Codes View"
                                                                        Width="100%" EmptyDataText="No Records found" class="gird_details">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Type Id" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblTypeId" runat="server" Text='<%# Bind("Asset_Category_ID") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Type Code">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkCategoryCode" runat="server" Text='<%# Bind("Category") %>'
                                                                                        AutoPostBack="True" OnCheckedChanged="chkCategoryCode_CheckedChanged" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Type Code" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCategoryCode" runat="server" Text='<%# Bind("Category_Code") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Description" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblTypeDesc" runat="server" Text='<%# Bind("Category_Description") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br></br>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" HeaderText="Class Code" ID="tpAssetModel" CssClass="tabpan"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                Model Codes
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                    <ContentTemplate>
                                                        <br />
                                                        <br />
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlModelSearchby" ToolTip="Search by" runat="server" class="md-form-control form-control">
                                                                        <asp:ListItem Text="Code" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Description" Value="1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>Search by</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtModelSearchValue" ToolTip="Search Value" AutoPostBack="false" runat="server" onchange="FunModelSearch()"
                                                                        class="md-form-control form-control login_form_content_input requires_true" Style="background-image: url('');"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>Search Value :</label>
                                                                    <asp:ImageButton ID="imgbtnModelSearch" Style="display: none" ImageUrl="~/Images/search_blue.gif"
                                                                        runat="server" OnClick="imgbtnModelSearch_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvAssetModelCodes" runat="server" AutoGenerateColumns="False" class="gird_details"
                                                                        ToolTip="Asset Model Codes View" Width="100%" EmptyDataText="No Records found">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Model Id" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblModelId" runat="server" Text='<%# Bind("Asset_Category_ID") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Model Code">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkCategoryCode" runat="server" Text='<%# Bind("Category") %>'
                                                                                        AutoPostBack="True" OnCheckedChanged="chkCategoryCode_CheckedChanged" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Model Code" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCategoryCode" runat="server" Text='<%# Bind("Category_Code") %>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Description" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblModelDesc" runat="server" Text='<%# Bind("Category_Description") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br></br>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </div>
                                <div id="divAssetDetails" runat="server" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <asp:Panel GroupingText="Asset Details" ScrollBars="Auto" runat="server" ID="panAssetDetails" CssClass="stylePanel">
                                        <div class="row" style="margin-top: 10px;">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAssetCode" runat="server" MaxLength="12" ToolTip="Will be generated automatically based on category choosen"
                                                        ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true" Style="background-image: url('');"></asp:TextBox><cc1:TextBoxWatermarkExtender ID="txtWaterMarkerAssetCode"
                                                            TargetControlID="txtAssetCode" WatermarkText="Will be generated automatically based on category choosen"
                                                            runat="server" Enabled="True">
                                                        </cc1:TextBoxWatermarkExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label runat="server" ToolTip="Asset Code" Text="Asset Code" ID="lblAssetCode" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                    <asp:Button ID="btnAssetGo" runat="server" ToolTip="Get asset code" Text="Get asset code" ValidationGroup="AssetCode"
                                                        CssClass="styleSubmitButton" CausesValidation="False" Visible="false" Width="80px" />
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter the Asset Code" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic" ControlToValidate="txtAssetCode" SetFocusOnError="True" ValidationGroup="AssetCode"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAssetCodeDesc" runat="server" ToolTip="Enter the Asset Description" Height="50px" onkeyup="maxlengthfortxt(50)"
                                                        TextMode="MultiLine" Rows="1"
                                                        ValidationGroup="AssetCode"
                                                        class="md-form-control form-control login_form_content_input requires_true" Style="background-image: url('');">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Asset Description" ToolTip="Asset Description" ID="lblAssetCodeDesc" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator
                                                            ID="rfvAssetCodeDesc" runat="server" ErrorMessage="Enter the Asset Description" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtAssetCodeDesc" ValidationGroup="AssetCode"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>


                                            <div style="display: none" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <cc1:ComboBox ID="cmbDepreciationCategory" Visible="false" runat="server" ToolTip="Book Depreciation Category"
                                                        AutoCompleteMode="SuggestAppend"
                                                        onkeyup="maxlengthfortxt('50')" DropDownStyle="DropDownList" MaxLength="0"
                                                        CssClass="WindowsStyle" AutoPostBack="True" OnSelectedIndexChanged="cmbDepreciationCategory_SelectedIndexChanged"
                                                        RenderMode="Block" OnItemInserted="cmbDepreciationCategory_ItemInserted">
                                                    </cc1:ComboBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="Label2" runat="server" ToolTip="Book Depreciation Category" Text="Book Depreciation Category"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDepreciationRate" runat="server" ToolTip="Book Depreciation Rate %"
                                                        MaxLength="8" Style="text-align: right"
                                                        onkeypress="fnAllowNumbersOnly(true,false,this)" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <%--<asp:RequiredFieldValidator ID="rfvBookDep" runat="server" ControlToValidate="txtDepreciationRate"
                                                        ErrorMessage="Enter Book Depreciation Rate %" ValidationGroup="AssetCode" Display="None"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                    <%-- <asp:RangeValidator ID="rngvDepreciationRate" runat="server" ErrorMessage="The maximum and minimum Book Depreciation Rate  % should be 100 and 0 respectively"
                                                        ControlToValidate="txtDepreciationRate" MaximumValue="100" MinimumValue="0" ValidationGroup="AssetCode"
                                                        Display="None" Type="Double" SetFocusOnError="True"></asp:RangeValidator>--%>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblDepreciationRate" runat="server" ToolTip="Book Depreciation Rate %" Text="Book Depreciation Rate %"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>

                                            <div style="margin-top: 10px; display: none;" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <cc1:ComboBox ID="cmbBlockDepreciationCategory" Visible="false" runat="server" AutoCompleteMode="SuggestAppend"
                                                        Width="210px" onkeyup="maxlengthfortxt('50')" DropDownStyle="Simple" MaxLength="0"
                                                        CssClass="WindowsStyle" AutoPostBack="True" OnSelectedIndexChanged="cmbBlockDepreciationCategory_SelectedIndexChanged"
                                                        OnItemInserted="cmbBlockDepreciationCategory_ItemInserted">
                                                    </cc1:ComboBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label style="top: -17px;">
                                                        <asp:Label ID="lblBlockDepreciationCategory" Visible="false" runat="server" Text="Block Depreciation Category"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div style="margin-top: 10px; display: none;" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtBlockDepreciationRate" Visible="false" runat="server" MaxLength="8" Width="66px"
                                                        Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvBlockDep" runat="server" ControlToValidate="txtBlockDepreciationRate"
                                                        ErrorMessage="Enter Block Depreciation Rate %" ValidationGroup="AssetCode" Display="None"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RangeValidator ID="rngvBlockDepreciationRate"
                                                            runat="server" ControlToValidate="txtBlockDepreciationRate" Display="None" ErrorMessage="The maximum and minimum Block Depreciation Rate  % should be 100 and 0 respectively"
                                                            MaximumValue="100" MinimumValue="0" Type="Double" ValidationGroup="AssetCode"
                                                            SetFocusOnError="True"></asp:RangeValidator>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblBlockDepreciationRate" Visible="false" runat="server" Text="Block Depreciation Rate %"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlPurpose" AutoPostBack="true" ToolTip="Purpose" OnSelectedIndexChanged="ddlPurpose_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblPurpose" runat="server" ToolTip="Purpose" CssClass="styleReqFieldLabel" Text="Purpose"></asp:Label>
                                                    </label>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlPurpose" runat="server" ControlToValidate="ddlPurpose" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Select the Purpose" ValidationGroup="AssetCode" InitialValue="0" Display="Dynamic"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtGuideLineValue" ToolTip="Guideline limit" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtGuideLineValue" runat="server" TargetControlID="txtGuideLineValue"
                                                        FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblGuideLine" runat="server" ToolTip="Guideline limit" Text="Guideline limit"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtValidFrom" ToolTip="Enter the Valid From"
                                                        class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="false"   runat="server"></asp:TextBox>
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtValidFrom" ID="CalendarValidFrom" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <%-- <asp:Image ID="imgtxtValidFrom" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                    <input id="hidDate" type="hidden" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblValidFrom" CssClass="styleReqFieldLabel" ToolTip="Valid From" runat="server" Text="Valid From"></asp:Label>
                                                    </label>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvValidFrom" runat="server" ControlToValidate="txtValidFrom" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter the Valid From" ValidationGroup="AssetCode" Display="Dynamic"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtValidTo" AutoPostBack="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"  runat="server"></asp:TextBox>
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtValidTo" ID="CalendarValidTo" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblValidTO" ToolTip="Enter the Valid To" runat="server" CssClass="styleReqFieldLabel" Text="Valid To"></asp:Label>
                                                    </label>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvValidTO" runat="server" ControlToValidate="txtValidTo" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter the Valid To" ValidationGroup="AssetCode" Display="Dynamic"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <div class="md-input">


                                                    <asp:CheckBox ID="chkActive" ToolTip="Active" runat="server" Checked="True" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblActive" runat="server" ToolTip="Active" Text="Active Indicator"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>

                            </div>
                            <%-- <div>--%>
                            <div class="btn_height"></div>
                            <div class="btn_height"></div>
                            <div class="btn_height"></div>
                            <div class="btn_height"></div>
                            <div>
                                <div class="fixed_btn">
                                    <%--  <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                                    <asp:Panel GroupingText="Asset Hierarchy" Height="140px" runat="server" ToolTip="Asset Hierarchy" ID="panHierarchy" Width="100%" CssClass="stylePanel"
                                        ScrollBars="Auto">
                                        <%--style="background-color:aliceblue"--%>
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="md-input">


                                                        <asp:TextBox TextMode="MultiLine" ReadOnly="true" runat="server" ToolTip="Asset Class" Text="" Height="30px" ID="lblClassDesc"></asp:TextBox>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label runat="server" ToolTip="Asset Class" CssClass="styleDisplayLabel" Text="Asset Class:" ID="lblAssetClass"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>





                                                <div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="md-input">

                                                        <asp:TextBox TextMode="MultiLine" ReadOnly="true" runat="server" ToolTip="Asset Make" Height="30px" ID="lblAssetMakeDesc"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label runat="server" Text="Asset Make:" ToolTip="Asset Make" CssClass="styleDisplayLabel" ID="Label1"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>






                                                <div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox TextMode="MultiLine" ReadOnly="true" runat="server" ToolTip="Asset Type" Height="30px" ID="lblAssetTypDesc"></asp:TextBox>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label runat="server" Text="Asset Type:" ToolTip="Asset Type" CssClass="styleDisplayLabel" ID="Label3"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>







                                                <div class="col-lg-3 col-md-4  col-sm-12 col-xs-12">
                                                    <div class="md-input">

                                                        <asp:TextBox TextMode="MultiLine" ReadOnly="true" runat="server" ToolTip="Asset Model" Height="30px" ID="lblAssetModelDesc"></asp:TextBox>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label runat="server" Text="Asset Model:" CssClass="styleDisplayLabel" ToolTip="Asset Model" ID="Label5"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <%-- </div>
                                    </div>--%>
                                </div>
                            </div>

                            <%-- </div>--%>
                            <%--                      <div class="row" style="display: none" class="col">
                                <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                            </div>--%>
                            <%-- <div class="btn_height"></div>--%>

                            <div align="right" class="fixed_btn">
                                <button class="css_btn_enabled" id="btnAssetSubmit" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('AssetCode'))" causesvalidation="false" onserverclick="btnAssetSubmit_Click" runat="server"
                                    type="submit" accesskey="S">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                                <button class="css_btn_enabled" id="btnAssetClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnAssetClear_ServerClick" runat="server"
                                    type="button" accesskey="L">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnAssetCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnAssetCancel_ServerClick" runat="server"
                                    type="button" accesskey="X">
                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                            </div>

                            <%--<div class="row" style="float: right; margin-top: 5px;">
                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12" align="right">
                                    <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                    <asp:Button ID="btnAssetSubmit" AccessKey="S" ToolTip="Save" runat="server" CssClass="save_btn fa fa-floppy-o" OnClick="btnAssetSubmit_Click"
                                        OnClientClick="return fnCheckPageValidators('AssetCode')" Text="Save" ValidationGroup="AssetCode" />
                                </div>
                                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12" align="right">
                                    <i class="fa fa-times btn_i" aria-hidden="true"></i>
                                    <asp:Button ID="btnCancel" ToolTip="Exit,Alt+X" runat="server" AccessKey="X" CausesValidation="False" CssClass="save_btn fa fa-floppy-o"
                                        OnClick="btnCancel_Click" Text="Exit" OnClientClick="return fnConfirmExit();" />
                                </div>
                            </div>--%>
                            <div class="row" style="display: none;">
                                <%--validation_ctrl--%>
                                <asp:ValidationSummary ID="vsAssetCode" runat="server" CssClass="styleMandatoryLabel"
                                    HeaderText="Please correct the following validation(s):" ValidationGroup="AssetCode" />
                            </div>

                            <%--  <cc1:HoverMenuExtender ID="hvHirearchy" runat="server" HoverCssClass="popupHover"
                                PopupControlID="panHierarchy" PopupPosition="Top" TargetControlID="txtAssetCode"
                                PopDelay="25" Enabled="true">
                            </cc1:HoverMenuExtender>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:HiddenField ID="hdnID" runat="server" />
                </asp:Panel>
            </div>
        </div>
    </div>

    <%--    <script src="../Content/Scripts/UserScript.js"></script>--%>
    <script language="javascript" type="text/javascript">
        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {
            //debugger;
            tab = $find('__tab_ctl00_ContentPlaceHolder1_tcAsset_tbCategory');
            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                }
                else {

                    switch (index) {

                        case 0:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 1:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
            }
        }
        //Tab index code end
        var btnActive_index = 0;
        var index = 0;



        function pageLoad() {
            tab = $find('ctl00_ContentPlaceHolder1_tcCode');
            if (tab != null) {
                tab.add_activeTabChanged(funCheckDescription);
            }
        }
        function FunClassSearch() {
            document.getElementById('<%=imgbtnClassSearch.ClientID %>').click();
        }
        function FunMakeSearch() {
            document.getElementById('<%=imgbtnMakeSearch.ClientID %>').click();
        }
        function FunTypeSearch() {
            document.getElementById('<%=imgbtnTypeSearch.ClientID %>').click();
        }
        function FunModelSearch() {
            document.getElementById('<%=imgbtnModelSearch.ClientID %>').click();
        }
        function fnUnselectAllExpectSelected(SelectedChkboxid, Grid) {

            //Get target base & child control.
            var txtClass, txtMake, txtType, txtModel;
            var TargetBaseControl;
            switch (Grid) {
                case "class":
                    TargetBaseControl = document.getElementById('<%=grvAssetClassCodes.ClientID %>');
                    break;
                case "make":
                    TargetBaseControl = document.getElementById('<%=grvAssetMakeCodes.ClientID %>');
                    break;
                case "type":
                    TargetBaseControl = document.getElementById('<%=grvAssetTypeCodes.ClientID %>');
                    break;
                case "model":
                    TargetBaseControl = document.getElementById('<%=grvAssetModelCodes.ClientID %>');
                    break;
            }

            var TargetControl = SelectedChkboxid;

            //Get all the control of the type INPUT in the base control.
            var Inputs = TargetBaseControl.getElementsByTagName("input");

            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n) {
                if (Inputs[n].type == 'checkbox' && Inputs[n].uniqueID != TargetControl.uniqueID) {
                    Inputs[n].checked = false;
                }
            }
            //           if(SelectedChkboxid.checked)
            //            __doPostBack('chkCategoryCode_CheckedChanged','OnCheckedChanged',false);

        }
        var index = 0;
        function funCheckDescription() {
            var newindex = tab.get_activeTabIndex(index);

            if (document.getElementById('<%=txtCode.ClientID%>').value != '' || document.getElementById('<%=txtCodeDescription.ClientID%>').value != '') {
                if (newindex != index) {
                    if (!confirm('Please press the GO button!')) {
                        index = tab.get_activeTabIndex(index);
                        document.getElementById('<%=txtCode.ClientID%>').value = '';
                        document.getElementById('<%=txtCodeDescription.ClientID%>').value = '';
                        document.getElementById('<%=btnGetCatdegoryDetails.ClientID%>').click()
                    }
                    else {
                        tab.set_activeTabIndex(index);

                    }
                }

            }
            else {
                index = tab.get_activeTabIndex(index);
                var strValgrp = tab._tabs[index]._tab.outerText.trim();
                //                switch (strValgrp) {
                //                    case "Model Codes":
                //                        document.getElementById('<%=txtCode.ClientID%>').setAttribute("maxLength",2);
                //                        break;
                //                    default:
                //                        document.getElementById('<%=txtCode.ClientID%>').setAttribute("maxLength", 3);
                //                        break;
                //                }
                document.getElementById('<%=txtCode.ClientID%>').value = '';
                document.getElementById('<%=txtCodeDescription.ClientID%>').value = '';
                document.getElementById('<%=btnGetCatdegoryDetails.ClientID%>').click()
            }


        }
        function fnSaveValidation() {


            if (confirm('Do you want to save?')) {
                Page_BlockSubmit = false;
                var a = event.srcElement;

                if (a.type == "submit") {
                    a.style.display = 'none';
                }
                return true;
            }
            else {
                return false;
            }
        }


    </script>
</asp:Content>
