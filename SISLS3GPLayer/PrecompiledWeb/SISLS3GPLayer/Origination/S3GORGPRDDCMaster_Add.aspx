<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GORGPRDDCMaster_Add, App_Web_w304vrwx" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                    <%--                 <div class="col" align="right">
                        <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" OnSelectedIndexChanged="ddlLOB_OnSelectedIndexChanged" CssClass="md-form-control form-control"
                                        AutoPostBack="true" runat="server" onchange="ddl_itemchanged(this);" ToolTip="Line of Business">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLOB" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddlLOB" InitialValue="0" ValidationGroup="PRDDC" ErrorMessage="Select the Line of Business"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProductCode" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlProductCode_SelectedIndexChanged" ToolTip="Scheme" onchange="ddl_itemchanged(this);" CssClass="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Scheme" ID="lblProduct">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox runat="server" Style="display: none" TabIndex="-1" ToolTip="Scan location path" ID="txtScanPath" MaxLength="350">
                                    </asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Style="display: none" Text="Scan location path" ID="lblScanPath">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" display="none">
                                <div class="md-input">
                                    <asp:HiddenField ID="hvOccGrdFlag" runat="server" />
                                    <asp:DropDownList ID="ddlConstitution" Visible="false" runat="server" AutoPostBack="True" ToolTip="Constitution"
                                        OnSelectedIndexChanged="ddlConstitution_SelectedIndexChanged" onchange="ddl_itemchanged(this);">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvConstitution" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddlConstitution" InitialValue="0" ErrorMessage="Select the Constitution"
                                            ValidationGroup="PRDDC" Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Visible="false" Text="Constitution" ID="lblConstitution" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Constitution/Occupation Details/Contract Type Details" ToolTip="Constitution/Occupation Details/Contract Type Details">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlConstitution" ScrollBars="Vertical" runat="server" CssClass="stylePanel">
                                        <asp:GridView ID="GrvConstitution" runat="server" OnRowDataBound="GrvConstitution_RowDataBound" ShowFooter="false" AutoGenerateColumns="False" class="gird_details">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" ItemStyle-Width="2%" HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNo" runat="server" Text='<%#Container.DataItemIndex + 1%>' ToolTip="S.No"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" ItemStyle-Width="94%" HeaderText="Constitution">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblConstitution" runat="server" Text='<%#Eval("CONSTITUTIONNAME")%>' ToolTip="Constitution"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" ItemStyle-Width="94%" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFlag" runat="server" Text='<%#Eval("FLAG")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" Visible="false" HeaderText="Constitution_ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblConstitution_Id" runat="server" Visible="false" Text='<%#Eval("CONSTITUTION_ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelect" OnCheckedChanged="chkSelect_CheckedChanged" ToolTip="Select" runat="server" AutoPostBack="true" />
                                                        <asp:Label ID="lblChked" runat="server" Visible="false" Text='<%#Eval("Checked")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlOcupation" ScrollBars="Vertical" runat="server" CssClass="stylePanel">
                                        <asp:GridView ID="grvOcupation" runat="server" OnRowDataBound="grvOcupation_RowDataBound" class="gird_details" ShowFooter="false" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" ItemStyle-Width="2%" HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNo" runat="server" Text='<%#Container.DataItemIndex + 1%>' ToolTip="S.No"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Occupation">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOcupation" runat="server" Text='<%#Eval("DESCRIPTION")%>' ToolTip="Occupation"></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" Visible="false" HeaderText="Ocupation_Id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOcupation_Id" runat="server" Visible="false" Text='<%#Eval("LOOKUP_CODE")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectOc" runat="server" AutoPostBack="true" ToolTip="Select" OnCheckedChanged="chkSelectOc_CheckedChanged" />
                                                        <asp:Label ID="lblChkedOc" runat="server" Visible="false" Text='<%#Eval("Checked")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>

                                    </asp:Panel>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                    <%--<asp:Panel ID="Panel4" ScrollBars="None" runat="server" CssClass="stylePanel" GroupingText="Contract Type">--%>
                                    <asp:Panel ID="pnlContractType" runat="server" CssClass="stylePanel">
                                        <asp:GridView ID="grvContractType" runat="server" class="gird_details" AutoGenerateColumns="False" OnRowDataBound="grvContractType_RowDataBound" ShowFooter="false">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNo" runat="server" Text="<%#Container.DataItemIndex + 1%>" ToolTip="S.No"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contract Type" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContractType" runat="server" Text='<%#Eval("Contract_Type")%>' ToolTip="Contract Type"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ContractTypeId" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblContract_Type_Id" runat="server" Text='<%#Eval("Contract_Type_Id")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectCT" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectCT_CheckedChanged" ToolTip="Select" />
                                                        <asp:Label ID="lblChkedCT" runat="server" Text='<%#Eval("Checked")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </asp:Panel>
                                    <%--</asp:Panel>--%>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div align="right">
                    <button class="css_btn_enabled" id="btnGo" title="Go[Alt+G]" accesskey="G" runat="server"
                        onserverclick="btnGo_Click" validationgroup="PRDDC" type="button">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button id="lnkCopyProfile" runat="server" title="Copy Profile,Alt+C" onclick="return fnCopyProfile();" class="css_btn_enabled" causesvalidation="false"
                        type="button" accesskey="C">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>opy Profile
                    </button>
                    <button id="lnkHideCopyProfile" runat="server" class="css_btn_enabled" title="Hide Copy Profile,Alt+H" style="display: none;" onclick="return fnHideCopyProfile();" causesvalidation="false"
                        type="button" accesskey="H">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>H</u>ide Copy Profile
                    </button>
                    <%--<asp:Button OnClientClick="return fnCopyProfile();" AccessKey="B" ToolTip="Alt+B" CssClass="save_btn fa fa-floppy-o"
                        Text="Copy Profile" ID="lnkCopyProfile" runat="server"></asp:Button>--%>
                    <%--<button id="lnkCopyProfile" onclick="if(fnCopyProfile())" causesvalidation="false" accesskey="B" title="Copy Profile[Alt+B]" class="css_btn_enabled"
                        runat="server" type="button">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>opy Profile
                    </button>--%>
                </div>
                <div class="row">
                    <div class="col">
                        <div id="divCopyProfile" style="display: none">
                            <div>
                                <div class="row" runat="server" id="trCopyProfileMessage" visible="false">
                                    <div class="col">
                                        <br />
                                        <asp:Label runat="server" ID="Label4" Text="No Records Found" Font-Size="Medium"
                                            class="styleMandatoryLabel"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div>
                                            <asp:GridView runat="server" ID="grvPRDDC" OnRowDataBound="grvPRDDC_RowDataBound" class="gird_details"
                                                AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSel" OnCheckedChanged="FunPriGetCopyProfileDetails" AutoPostBack="true" ToolTip="Select"
                                                                runat="server"></asp:CheckBox>
                                                            <asp:Label Visible="false" ID="lblPRDDCID" runat="server" Text='<%#Eval("PRDDC_ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:BoundField DataField="LOB_Code" ItemStyle-HorizontalAlign="Left" HeaderText="Line of Business" />--%>
                                                    <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLOBCode" runat="server" Text='<%#Eval("LOB_Code")%>' ToolTip="Line of Business"></asp:Label>
                                                            <asp:Label ID="lblLOBID" Visible="false" runat="server" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:BoundField DataField="Product_Code" ItemStyle-HorizontalAlign="Left" HeaderText="Product" />--%>
                                                    <asp:TemplateField HeaderText="Scheme" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProductCode" runat="server" Text='<%#Eval("Product_Code")%>' ToolTip="Scheme"></asp:Label>
                                                            <asp:Label ID="lblProductID" Visible="false" runat="server" Text='<%#Eval("Product_ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Constitution" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblConstitution" runat="server" Text='<%#Eval("Constitution_Code")%>' ToolTip="Constitution"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:BoundField DataField="Constitution_Code" ItemStyle-HorizontalAlign="Left" HeaderText="Constitution" />--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--   <div class="row">
                    <div class="gird">--%>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <div visible="false" id="divPRDDC"
                            runat="server">
                            <asp:GridView runat="server" ID="grvPRDDCDocuments" OnRowDataBound="grvPRDDCDocuments_RowDataBound" class="gird_details"
                                AutoGenerateColumns="False" ShowFooter="True">
                                <Columns>
                                    <%-- <asp:BoundField DataField="PRDDCType" ItemStyle-HorizontalAlign="Left" HeaderText="PRDDC Type" />--%>
                                    <%--<asp:BoundField DataField="PRDDCDesc" ItemStyle-HorizontalAlign="Left" HeaderText="Description" />--%>

                                    <asp:TemplateField HeaderText="Priority Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPriorityType" runat="server" Text='<%#Eval("DESCRIPTION")%>' ToolTip="Priority Type" Width="74px" CssClass="md-form-control form-control login_form_content_input"></asp:Label>
                                            <asp:Label ID="lblPriorityTypeCode" runat="server" Text='<%#Eval("LOOKUP_CODE")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlPriorityType" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input" ToolTip="Priority Type"
                                                    runat="server" Width="74px">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Doc Category">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPriorityTypeVal" runat="server" Text='<%#Eval("doc_category_desc")%>' ToolTip="Doc Category" Width="74px" CssClass="md-form-control form-control login_form_content_input"></asp:Label>
                                            <asp:Label ID="lblPriorityTypeId" runat="server" Text='<%#Eval("DOC_CATEGORY")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlDocCategory"  CssClass="md-form-control form-control login_form_content_input" ToolTip="Doc Category"
                                                    runat="server" Width="74px">
                                                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Customer Based" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Dealer based" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Display Order">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDisplayOrder" runat="server" Text='<%#Eval("DISPLAY_ORDER")%>' ToolTip="Display Order"
                                                CssClass="md-form-control form-control login_form_content_input"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input">
                                                <asp:TextBox runat="server" ID="txtFooterDispOrdr" Wrap="true" ToolTip="Display Order" onkeyup="maxlengthfortxt(3);"
                                                    CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <cc1:FilteredTextBoxExtender ID="FTEFooterDispOrdr" runat="server" TargetControlID="txtFooterDispOrdr"
                                                    FilterType="Numbers" Enabled="true">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PRDDC Type" FooterStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPRDDCType" runat="server" Text='<%#Eval("PRDDCType")%>' ToolTip="PRDDC Type" CssClass="md-form-control form-control login_form_content_input"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:Label ID="lblPRDDCTypeF" runat="server" Text="Others" CssClass="md-form-control form-control login_form_content_input" Visible="false"></asp:Label>
                                                <asp:DropDownList ID="ddlPRDDCType" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input" OnSelectedIndexChanged="ddlPRDDCType_OnSelectedIndexChanged" ToolTip="PRDDC Type"
                                                    runat="server">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" FooterStyle-HorizontalAlign="Center"
                                        ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label Visible="false" ID="lblDocCatID" runat="server" Text='<%#Eval("Doc_Cat_ID")%>'></asp:Label>
                                            <asp:Label ID="lblPRDDCDesc" runat="server" Text='<%#Eval("PRDDCDesc")%>' ToolTip="Description"></asp:Label>
                                            <asp:Label Visible="false" ID="lblOptMan" runat="server" Text='<%#Eval("Doc_Cat_OptMan")%>'></asp:Label>
                                            <asp:Label Visible="false" ID="lblCheckList" runat="server" Text='<%#Eval("Doc_Cat_CheckList")%>'></asp:Label>
                                            <asp:Label Visible="false" ID="lblDocCatIDAssigned" runat="server" Text='<%#Eval("Doc_Cat_IDAssigned")%>'></asp:Label>
                                            <asp:Label Visible="false" ID="lblImageCopy" runat="server" Text='<%#Eval("Doc_Cat_ImageCopy")%>'></asp:Label>
                                            <asp:Label Visible="false" ID="lblPgmID" runat="server" Text='<%#Eval("Program_ID")%>'></asp:Label>
                                            <asp:Label Visible="false" ID="lblPRDDC_Documents_ID" runat="server" Text='<%#Eval("PRDDC_Documents_ID")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlPRDDCDesc" runat="server" Visible="false" CssClass="md-form-control form-control login_form_content_input" ToolTip="Description">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtPRDDCDesc" runat="server" Text="--Select--" MaxLength="50" ToolTip="Description"
                                                        AutoPostBack="true" OnTextChanged="txtPRDDCDesc_TextChanged" Enabled="False"></asp:TextBox>
                                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtenderDemo" runat="server" TargetControlID="txtPRDDCDesc"
                                                        ServiceMethod="getPRDDCDescription" MinimumPrefixLength="1" CompletionSetCount="20"
                                                        DelimiterCharacters="" Enabled="True" ServicePath="">
                                                    </cc1:AutoCompleteExtender>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Wrap="true" HeaderText="Mandatory">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkOptMan" runat="server" ToolTip="Mandatory" AutoPostBack="true" OnCheckedChanged="chkOptMan_CheckedChanged"></asp:CheckBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:CheckBox ID="chkFootOptMan" runat="server" ToolTip="Mandatory"></asp:CheckBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Scan">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkImageCopy" runat="server" ToolTip="Scan" AutoPostBack="true" OnCheckedChanged="chkImageCopy_CheckedChanged"></asp:CheckBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:CheckBox ID="chkScan" runat="server" ToolTip="Scan"></asp:CheckBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CheckList">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkCheckList" runat="server" ToolTip="CheckList" AutoPostBack="true" OnCheckedChanged="chkCheckList_CheckedChanged"></asp:CheckBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:CheckBox ID="chkCheckListF" runat="server" ToolTip="CheckList"></asp:CheckBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Program ID">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlPgmID" runat="server" CssClass="md-form-control form-control login_form_content_input" ToolTip="Last Program ID" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlPgmID_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlFooterPgmID" runat="server" ToolTip="Last Program ID" CssClass="md-form-control form-control login_form_content_input">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="txtRemarks" Wrap="true" Text='<%#Eval("Remarks")%>' MaxLength="50"
                                                onkeyup="maxlengthfortxt(50);" Columns="25" Rows="2" ToolTip="Remarks" TextMode="MultiLine"
                                                CssClass="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true" OnTextChanged="txtRemarks_TextChanged"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <FooterTemplate>
                                            <div class="md-input">
                                                <asp:TextBox runat="server" ID="txtFooterRemarks" Wrap="true" ToolTip="Remarks" onkeyup="maxlengthfortxt(50);" MaxLength="50"
                                                    CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            </div>
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Wrap="false" FooterStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>

                                            <asp:CheckBox ID="chkAll" runat="server" Visible="false"></asp:CheckBox>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSel" runat="server" Visible="false"></asp:CheckBox>
                                            <asp:Button ID="lnkRemovePRDDC" runat="server" Text="Remove" ToolTip="Remove [Alt+R]" OnClientClick="return confirm('Do you want to Remove Line Item?');" AccessKey="R" OnClick="lnkRemovePRDDC_Click"
                                                CausesValidation="false" CssClass="grid_btn_delete"></asp:Button>
                                        </ItemTemplate>
                                        <ItemStyle Width="8%" />
                                        <FooterTemplate>
                                            <%--<button ID="addPRDDC" runat="server" accesskey="T" title="Add[Alt+T]" class="css_btn_enabled"  type="button"
                                                onserverclick="lnkAAdd_Click" CausesValidation="false">
                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                            </button>--%>
                                            <asp:Button ID="addPRDDC" runat="server" Text="Add" AccessKey="T" ToolTip="Add,Alt+T" CssClass="grid_btn"
                                                OnClick="lnkAAdd_Click" CausesValidation="false"></asp:Button>
                                        </FooterTemplate>
                                        <FooterStyle Width="8%" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="styleGridHeader" />
                                <RowStyle HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server" Visible="false"></uc1:PageNavigator>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <span runat="server" id="lblGErrorMessage" class="styleMandatoryLabel"></span>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button runat="server" id="btnSave" accesskey="S" title="Save[Alt+S]" onclick="if(fnCheckPageValidation('PRDDC'))"
                        class="css_btn_enabled" validationgroup="PRDDC" onserverclick="btnSave_Click" type="submit">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                    <button runat="server" id="btnClear" accesskey="L" title="Clear[Alt+L]" causesvalidation="false" class="css_btn_enabled"
                        validationgroup="PRDDC" onclick="if(fnConfirmClear())" type="submit"
                        onserverclick="btnClear_Click">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <button runat="server" id="btnCancel" accesskey="X" title="Exit[Alt+X]" text="Exit" onclick="if(fnConfirmExit())"
                        validationgroup="PRDDC" causesvalidation="false" class="css_btn_enabled" onserverclick="btnCancel_Click" type="submit">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row">
                    <div id="divTooltip" runat="server" style="border: 1px solid #000000; background-color: #FFFFCE; position: absolute; display: none;">
                    </div>
                    <%-- <div id="divReam" runat="server" style="display: inline; width: 10px">
                    </div>--%>
                </div>

                <div class="row">
                    <div class="col">
                        <input type="hidden" value="0" runat="server" id="hdnPRDDC" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <%--<asp:ValidationSummary runat="server" ID="ValidationSummary1" ValidationGroup="PRDDC"
                            HeaderText="Correct the following validation(s):" CssClass="styleSummaryStyle"
                            Width="500px" ShowMessageBox="false" ShowSummary="true" />--%>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

        var bResult;

        function fnTextAlign(objRemarks) {
            //       var intDiv= parseFloat(objRemarks.value.length)/parseFloat(10);
            //       var intRem= parseFloat(objRemarks.value.length)%parseFloat(10);
            //       var strRemarks="";
            //       for(var i=0;i<intDiv;i++)
            //       {       
            //          strRemarks = strRemarks + objRemarks.value.substring(i*10,((i+1)*10))+"</br>";
            //       }       
            //       divReam.innerHTML=strRemarks;       
            //       objRemarks.value =  divReam.innerHTML;

        }

        function fnCheckMan(objChkSel, objMan, objScan, objProgram, objRemarks) {
            if (document.getElementById(objChkSel).checked) {
                document.getElementById(objMan).checked = true;
            }
            else {
                document.getElementById(objMan).checked = false;
                document.getElementById(objScan).checked = false;
                document.getElementById(objProgram).value = "0";
                document.getElementById(objRemarks).value = "";
            }
        }

        function fnDisplayDocType() {

        }

        <%--function fnCopyProfile() {
            if (document.getElementById('<%=lnkCopyProfile.ClientID%>').value == 'Hide Copy Profile') {
                document.getElementById('<%=lnkCopyProfile.ClientID%>').value = 'Copy Profile';
                document.getElementById('divCopyProfile').style.display = 'none';
                document.getElementById('<%=divPRDDC.ClientID%>').style.display = 'inline';
                document.getElementById('<%=btnSave.ClientID%>').disabled = false;
                document.getElementById('<%=btnClear.ClientID%>').disabled = false;
            }
            else {
                document.getElementById('<%=lnkCopyProfile.ClientID%>').value = 'Hide Copy Profile';
                document.getElementById('divCopyProfile').style.display = 'Block';
                document.getElementById('<%=divPRDDC.ClientID%>').style.display = 'none';
                document.getElementById('<%=btnSave.ClientID%>').disabled = true;
                document.getElementById('<%=btnClear.ClientID%>').disabled = true;
            }
            return false;
        }--%>


        function fnHideCopyProfile() {
            document.getElementById('<%=lnkCopyProfile.ClientID%>').style.display = 'block';
            document.getElementById('<%=lnkHideCopyProfile.ClientID%>').style.display = 'none';
            document.getElementById('<%=lnkCopyProfile.ClientID%>').value = 'Copy Profile';
            document.getElementById('divCopyProfile').style.display = 'none';
            document.getElementById('<%=divPRDDC.ClientID%>').style.display = 'inline';
            document.getElementById('<%=btnSave.ClientID%>').disabled = false;
            document.getElementById('<%=btnClear.ClientID%>').disabled = false;
            return false;
        }

        function fnCopyProfile() {
            document.getElementById('<%=lnkCopyProfile.ClientID%>').style.display = 'none';
            document.getElementById('<%=lnkHideCopyProfile.ClientID%>').style.display = 'block';
            document.getElementById('<%=lnkCopyProfile.ClientID%>').value = 'Hide Copy Profile';
            document.getElementById('divCopyProfile').style.display = 'Block';
            document.getElementById('<%=divPRDDC.ClientID%>').style.display = 'none';
            document.getElementById('<%=btnSave.ClientID%>').disabled = true;
            document.getElementById('<%=btnClear.ClientID%>').disabled = true;
            return false;
        }

        function fnCheckPageValidation(grpName) {
            if ((!fnCheckPageValidators(grpName, 'false')) && (Page_ClientValidate(grpName) == false)) {
                Page_BlockSubmit = false;
                return false;
            }

            if (Page_ClientValidate(grpName)) {

                bResult = fnIsCheckboxCheckedDoc('<%=grvPRDDCDocuments.ClientID%>', 'chkSel', 'document from PRDDC documents');
                if (bResult) {
                    if (confirm('Are you sure want to save?')) {
                        return true;
                    }
                    else {
                        //Added by Thangam M on 17/Oct/2012 to avoid double save click
                        var a = event.srcElement;
                        //a.style.display = 'block';
                        a.style.removeAttribute('display');
                        //End here
                        return false;
                    }
                }
                else {
                    //Added by Thangam M on 17/Oct/2012 to avoid double save click
                    var a = event.srcElement;
                    //a.style.display = 'block';
                    a.style.removeAttribute('display');
                    //End here
                }
                return bResult;

            }

            function fnIsCheckboxCheckedDoc(grdid, objid, msg) {

                var chkbox;
                var objRemarksID;
                var objTxtRemarks;
                var reqRemarks;
                var txtRemarks;
                var bChecked = false;
                var bRemarks = true;
                var i = 2;
                //var gridId = 'ctl00_ContentPlaceHolder1_' + grdid ;
                var gridId = grdid;
                //objRemarksID='rfvRemarks';
                objTxtRemarks = 'ddlPgmID';

                chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);
                //reqRemarks=document.getElementById(gridId + '_ctl0' + i + '_' + objRemarksID);
                txtRemarks = document.getElementById(gridId + '_ctl0' + i + '_' + objTxtRemarks);

                //while ((chkbox != null)) 
                while ((txtRemarks != null)) {
                    txtRemarks.className = "styleReqFieldDefalut";
                    //        if (chkbox.checked) 
                    //        {
                    //       
                    bChecked = true;

                    //if(txtRemarks.value!='')
                    //  {
                    //reqRemarks.enabled=false;      
                    //}
                    if (txtRemarks.options.value == 0) {
                        bRemarks = false;
                        txtRemarks.className = "styleReqFieldFocus";
                        //reqRemarks.enabled=true;      
                    }
                    //break;
                    //}
                    i = i + 1;
                    if (i <= 9) {
                        chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);
                        //reqRemarks = document.getElementById(gridId + '_ctl0' + i + '_' + objRemarksID);
                        txtRemarks = document.getElementById(gridId + '_ctl0' + i + '_' + objTxtRemarks);
                    }
                    else {
                        chkbox = document.getElementById(gridId + '_ctl' + i + '_' + objid);
                        //reqRemarks = document.getElementById(gridId + '_ctl' + i + '_' + objRemarksID);
                        txtRemarks = document.getElementById(gridId + '_ctl' + i + '_' + objTxtRemarks);
                    }
                }

                if ((bChecked) && (bRemarks))
                    return true;
                if (!bChecked) {
                    alert('Select atleast one ' + msg);
                    return false;
                }

                if (!bRemarks) {
                    alert('Select the Last Program ID for the selected document(s)');
                    return false;
                }

            }



        }

    </script>

</asp:Content>
