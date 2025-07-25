<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Insurance_S3GInsAssetInsuranceEntry, App_Web_q5jmkrdt" enableeventvalidation="false" enableviewstate="true" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="PnlInputCriteria" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                            Width="99%">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" class="md-form-control form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select Line of Business" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvPolicyLOB" runat="server" ControlToValidate="ddlLOB" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select Line of Business" ValidationGroup="Add"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select the Branch" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server" ToolTip="Branch" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="50"></asp:TextBox>
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                            strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" class="md-form-control form-control" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                            Style="display: none" />
                                        <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" CssClass="md-form-control form-control">  </asp:TextBox>
                                        <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtCustomerNameDummy" runat="server" ErrorMessage="Select the Customer" ValidationGroup="Submit"
                                                SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvrfvtxtCustomerNameDummy1" runat="server" ErrorMessage="Select the Customer" ValidationGroup="Add"
                                                SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name/Code"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" ToolTip="Account Number" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                            strLOV_Code="ACC_LIVE" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                            Style="display: none" />
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtAccountNoDummy" runat="server" ErrorMessage="Select the Account Number"
                                                SetFocusOnError="true" ControlToValidate="txtAccountNoDummy" CssClass="validation_msg_box_sapn" ValidationGroup="Submit"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtAccountNoDummy1" runat="server" ErrorMessage="Select the Account Number"
                                                SetFocusOnError="true" ControlToValidate="txtAccountNoDummy" CssClass="validation_msg_box_sapn" ValidationGroup="Add"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                        <asp:HiddenField ID="hdnPANum_Customer_ID" runat="server" />
                                        <asp:HiddenField ID="hdnAccount_ID" runat="server" />

                                        <asp:LinkButton ID="lnkViewAccountDetails" runat="server" Text="View Account" CssClass="styleDisplayLabel" AccessKey="V"
                                            ToolTip="View the account Details, ALT+V" OnClick="lnkViewAccountDetails_Click"></asp:LinkButton>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMLA" runat="server" ToolTip="Account Number" CssClass="styleReqFieldLabel"
                                                Text="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAINSENO" runat="server" ToolTip="AINSE No" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAINSENO" runat="server" ToolTip="AINSE No" CssClass="styleReqFieldLabel"
                                                Text="AINSE No"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAINSEDate" runat="server" ToolTip="AINSE Date" Enabled="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="ftxtAINSEDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtAINSEDate" ValidChars="/-">
                                        </cc1:FilteredTextBoxExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAINSEDate" runat="server" ToolTip="AINSE Date" CssClass="styleDisplayLabel"
                                                Text="AINSE Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>


                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlInsuranceDoneBy" runat="server" ToolTip="Insurance Done By" class="md-form-control form-control"
                                            OnSelectedIndexChanged="ddlInsuranceDoneBy_SelectedIndexChanged"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvInsuranceDoneBy" runat="server" ControlToValidate="ddlInsuranceDoneBy"
                                                SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                ErrorMessage="Select Insurance Done By" ValidationGroup="Submit" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInsuranceDoneBy" runat="server" ToolTip="Insurance Done By" Text="Insurance Done By"
                                                CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="DropDownListInsType" OnSelectedIndexChanged="DropDownListInsType_SelectedIndexChange" runat="server" ToolTip="Insurance Type"
                                            class="md-form-control form-control" AutoPostBack="false" Enabled="false">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorInsType" runat="server" ControlToValidate="DropDownListInsType"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select Insurance Type" ValidationGroup="Submit" SetFocusOnError="true" CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvDropDownListInsType" runat="server" ControlToValidate="DropDownListInsType"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select Insurance Type" ValidationGroup="Add" SetFocusOnError="true" CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="LabelInsType" runat="server" ToolTip="Insurance Type" Text="Insurance Type"
                                                CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>



                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divSubAccNumber" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlSLA" runat="server" ToolTip="Sub Account Number"
                                            OnSelectedIndexChanged="ddlSLA_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSubAccount" runat="server" ControlToValidate="ddlSLA"
                                            Enabled="false" Display="None" InitialValue="0" ErrorMessage="Select Sub Account Number"
                                            ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="rfvPolicySLA" runat="server" ControlToValidate="ddlSLA"
                                            Enabled="false" Display="None" InitialValue="0" ErrorMessage="Select Sub Account Number"
                                            ValidationGroup="Add"></asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblSLA" runat="server" ToolTip="Sub Account Number" CssClass="styleReqFieldLabel" Visible="false"
                                                Text="Sub Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divPayType" runat="server" visible="true">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlPayType" runat="server" ToolTip="Pay Type" OnTextChanged="ddlPayType_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvPayType" runat="server" ControlToValidate="ddlPayType" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select Pay Type" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblPayType" runat="server" ToolTip="Pay Type" CssClass="styleReqFieldLabel"
                                                Text="Pay Type"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divInstallmentFrom" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlInstallmentFrom" runat="server" ToolTip="Installment From">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvInstallmentfrom" runat="server" ControlToValidate="ddlInstallmentFrom" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select Installment From" ValidationGroup="Submit" Enabled="false"></asp:RequiredFieldValidator>
                                        </div>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblHeaderInstallmentFrom" runat="server" ToolTip="Installment From"
                                                Text="Installment From" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divInstallmentTo" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlInstallmentTo" runat="server" ToolTip="Installment To">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvInstallmentto" runat="server" ControlToValidate="ddlInstallmentTo" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select Installment To" ValidationGroup="Submit" Enabled="false"></asp:RequiredFieldValidator>
                                        </div>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblHeaderInstallmentTo" runat="server" ToolTip="Installment To" Text="Installment To" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="InsuranceCompanyDetails" runat="server" CssClass="stylePanel" GroupingText="Insurance Company Details"
                            Visible="True" Width="99%">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlPayTo" runat="server" ToolTip="Insurer Name" OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged"
                                            AutoPostBack="true" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvPayTo" runat="server" ControlToValidate="ddlPayTo"
                                                InitialValue="0" Display="Dynamic" ErrorMessage="Select the Insurer Name" SetFocusOnError="true" CssClass="validation_msg_box_sapn" ValidationGroup="Submit" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblPayTo" runat="server" ToolTip="Insurer Name" Text="Insurer Name"
                                                CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtBranchCodeDummy" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="50"></asp:TextBox>

                                        <uc4:ICM ID="ucBranchCodeLov" HoverMenuExtenderLeft="true" runat="server" ToolTip="Branch" AutoPostBack="true" DispalyContent="Both" ValidationGroup="Submit" ErrorMessage="Select Branch"
                                            strLOV_Code="" ServiceMethod="GetInsuranceBranch" OnItem_Selected="ucBranchCodeLov_Item_Selected" class="md-form-control form-control" />
                                        <asp:TextBox ID="txtBranchCodeName" runat="server" Style="display: none;" MaxLength="50" ToolTip="Branch Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtBranchCodeDummy" runat="server" ErrorMessage="Select the Branch"
                                                SetFocusOnError="true" ControlToValidate="txtBranchCodeDummy" CssClass="validation_msg_box_sapn" ValidationGroup="Submit"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:HiddenField ID="hdnBranchAddressId" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranchCodeName" runat="server" Text="Branch Name/Code" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc1:S3GCustomerAddress ID="S3GCompanyAddress" runat="server" FirstColumnStyle="styleFieldLabel"
                                            SecondColumnStyle="styleFieldAlign" ShowCustomerName="false" Caption="Company"
                                            ShowCustomerCode="false" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="pnlCurrentInsurance" runat="server" CssClass="stylePanel" GroupingText="Current Insurance policy"
                            Visible="true">
                            <%--<asp:Panel ID="pnlInner" runat="server" CssClass="stylePanel" Visible="True" ScrollBars="Horizontal">--%>
                            <div class="gird">
                                <asp:GridView ID="gvCurrentInsurance" runat="server" AutoGenerateColumns="false"
                                    OnRowCommand="gvCurrentInsurance_RowCommand" OnRowDataBound="gvCurrentInsurance_RowDataBound"
                                    OnRowDeleting="gvCurrentInsurance_RowDeleting" OnRowEditing="gvCurrentInsurance_RowEditing"
                                    OnRowCancelingEdit="gvCurrentInsurance_RowCancelingEdit" OnRowUpdating="gvCurrentInsurance_RowUpdating"
                                    ShowFooter="True" Width="100%" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No." Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Number" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAssetNo" Text='<%#Bind("AssetNumber") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Description">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblAssetDescriptionH" runat="server" Text="Asset Description" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%--  <asp:Label ID="lblAssetId" Text='<%#Bind("AssetID") %>' runat="server" ToolTip="Asset Description"
                                                    Visible="false" />--%>
                                                <asp:Label ID="lblAssetDesc" Text='<%#Bind("AssetDescription") %>' runat="server" />
                                                <%-- <asp:DropDownList ID="ddlAssetDescription" runat="server">
                                                                        </asp:DropDownList>--%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <%--      <asp:Label ID="lblAssetDesc" Text='<%#Bind("AssetID") %>' runat="server" ToolTip="Asset Description"
                                                        Visible="false" />--%>
                                                    <asp:DropDownList ID="ddlAssetDescription" runat="server" OnSelectedIndexChanged="ddlAssetDescription_SelectedIndexChanged" class="md-form-control form-control"
                                                        AutoPostBack="true" Width="150px">
                                                    </asp:DropDownList>
                                                    <%-- <asp:RequiredFieldValidator ID="rfvAssetDescription" runat="server" ControlToValidate="ddlAssetDescription"
                                                                            Display="None" ErrorMessage="Select Asset Description" InitialValue="0" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>--%>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlAssetDescription" runat="server" ToolTip="Asset Description" class="md-form-control form-control" Width="150px"
                                                        OnSelectedIndexChanged="ddlAssetDescription_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box" style="top: 25px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvAssetDescription" runat="server" ControlToValidate="ddlAssetDescription"
                                                            Display="Dynamic" SetFocusOnError="true" CssClass="validation_msg_box_sapn" ErrorMessage="Select Asset Description" InitialValue="0" ValidationGroup="Add">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Type">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblPolicyTypeH" runat="server" Text="Policy Type" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="lblPolicyType" Text='<%#Bind("PolicyTypeID") %>' runat="server" ToolTip="Policy Type" Width="100px"
                                                    Visible="false" />
                                                <asp:DropDownList ID="ddlPolicyType" runat="server" Width="100px" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                <%--<asp:RequiredFieldValidator ID="rfvPolicyType" runat="server" ControlToValidate="ddlPolicyType"
                                                                            Display="None" ErrorMessage="Select Policy Type" InitialValue="0" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>--%>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyTypeId" Text='<%#Bind("PolicyTypeID") %>' runat="server"
                                                    ToolTip="Policy Type" Visible="false" />
                                                <asp:Label ID="lblPolicyType" Text='<%#Bind("PolicyType") %>' runat="server" />
                                                <%--<asp:DropDownList ID="ddlPolicyType" runat="server">
                                                                        </asp:DropDownList>--%>
                                            </ItemTemplate>
                                            <FooterTemplate>

                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlPolicyType" runat="server" ToolTip="Policy Type" Width="100px" class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <%-- <asp:RequiredFieldValidator ID="rfvPolicyType" runat="server" ControlToValidate="ddlPolicyType"
                                                                            Display="None" ErrorMessage="Select Policy Type" InitialValue="0" ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>--%>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Regn/Serial/Engine/Chassis No">--%>
                                        <asp:TemplateField HeaderText="REGNNOORSERIALNO">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblRegnnoH" runat="server" Text="Regn/Serial/Engine/Chassis No" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblMachineNo" Text='<%#Bind("MachineNo") %>' runat="server" ToolTip="Regn No or Serial No" />
                                                <asp:Label ID="lblAssetNumber" Text='<%#Bind("AssetNumber") %>' runat="server" ToolTip="Regn No or Serial No"
                                                    Visible="false" />
                                                <%--  <asp:DropDownList ID="lblRegNo" runat="server" Style="padding-left: 5px" ToolTip="Reg No"
                                                                            Width="120px">
                                                                        </asp:DropDownList>--%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="lblMachineNo" Text='<%#Bind("AssetNumber") %>' runat="server" Visible="false" />
                                                <asp:DropDownList ID="ddlMachineNo" runat="server" Style="padding-left: 5px" ToolTip="Regn No or Serial No" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <%-- <asp:RequiredFieldValidator ID="rfvMachineNo" runat="server" ControlToValidate="ddlMachineNo"
                                                                            Display="None" ErrorMessage="Select Regn No. or Serial No." ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlMachineNo"
                                                                            Display="None" InitialValue="0" ErrorMessage="Select Regn No. or Serial No."
                                                                            ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>--%>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlMachineNo" runat="server" MaxLength="20" ToolTip="Regn No or Serial No" CssClass="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvMachineNo" runat="server" ControlToValidate="ddlMachineNo" InitialValue="0"
                                                            Display="Dynamic" ErrorMessage="Select Regn No. or Serial No." ValidationGroup="Add" SetFocusOnError="true" CssClass="validation_msg_box_sapn">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlMachineNo"
                                                                            Display="None" InitialValue="0" ErrorMessage="Select Regn No. or Serial No."
                                                                            ValidationGroup="Add">
                                                                        </asp:RequiredFieldValidator>--%>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nominee" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNominee" runat="server" Text='<%#Bind("Nominee") %>' ToolTip="Nominee"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtNominee" runat="server" Text='<%#Bind("Nominee") %>' MaxLength="50" Width="120px" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            </EditItemTemplate>

                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtNominee" runat="server" Text='<%#Bind("Nominee") %>' MaxLength="50" Width="120px" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="fttxtNominee" ValidChars=" .&" TargetControlID="txtNominee"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Insurance Plan" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsPlan" runat="server" Text='<%#Bind("Ins_Plan") %>' ToolTip="Insurance Plan"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtInsPlan" runat="server" Text='<%#Bind("Ins_Plan") %>' MaxLength="50" Width="120px" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            </EditItemTemplate>

                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtInsPlan" runat="server" Text='<%#Bind("Ins_Plan") %>' MaxLength="50" Width="120px"
                                                        CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Policy Number">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblPolicyNumberH" runat="server" Text="Policy Number" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyNumber" Text='<%#Bind("PolicyNo") %>' runat="server" />
                                                <%--<asp:TextBox ID="lblPolicyNumber" runat="server" Style="padding-left: 5px" Text='<%# Bind("PolicyNo") %>'
                                                                            ToolTip="PolicyNumber" Width="120px"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtPolicyNumber" runat="server" FilterType="Numbers,Custom,UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="lblPolicyNumber">
                                                                        </cc1:FilteredTextBoxExtender>--%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPolicyNumber" runat="server" ToolTip="Policy Number" MaxLength="16" CssClass="md-form-control form-control login_form_content_input requires_true" Width="120px"
                                                        Style="padding-left: 5px" Text='<%# Bind("PolicyNo") %>' onblur="FunCheckForZero(this,'Policy Number');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtPolicyNumber" runat="server" FilterType="Numbers,Custom,UppercaseLetters, LowercaseLetters"
                                                        TargetControlID="txtPolicyNumber">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPolicyNumber" runat="server" ControlToValidate="txtPolicyNumber"
                                                            Display="Dynamic" ValidationGroup="Add" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter Policy Number"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPolicyNumber" runat="server" MaxLength="16" Style="text-align: left" CssClass="md-form-control form-control login_form_content_input requires_true" Width="120px"
                                                        ToolTip="Policy Number" onblur="FunCheckForZero(this,'Policy Number');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtPolicyNumber" runat="server" FilterType="Numbers,Custom,UppercaseLetters, LowercaseLetters"
                                                        TargetControlID="txtPolicyNumber">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPolicyNumber" runat="server" ControlToValidate="txtPolicyNumber"
                                                            Display="Dynamic" ValidationGroup="Add" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter Policy Number"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Policy Date">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblPolicyDateH" runat="server" Text="Policy Date" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyDate" Text='<%# GVDateFormat(Eval("PolicyDate").ToString()) %>'
                                                    runat="server" ToolTip="PolicyDate" Width="80px" />
                                                <%--<asp:TextBox ID="lblPolicyDate" runat="server" MaxLength="8" Width="80px" Text='<%# Bind("PolicyDate") %>'
                                                                            ToolTip="PolicyDate"></asp:TextBox>
                                                                        <asp:Image ID="imgPolicyDateEdit" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                            ToolTip="Select Policy Date" Visible="false" />
                                                                        <cc1:CalendarExtender ID="calPolicyDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                            PopupButtonID="imgPolicyDateEdit" TargetControlID="lblPolicyDate">
                                                                        </cc1:CalendarExtender>--%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPolicyDate" runat="server" Text='<%# GVDateFormat(Eval("PolicyDate").ToString()) %>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        ToolTip="PolicyDate" Width="80px"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calPolicyDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtPolicyDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPolicyDate" runat="server" ControlToValidate="txtPolicyDate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Policy Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPolicyDate" runat="server" ToolTip="PolicyDate" CssClass="md-form-control form-control login_form_content_input requires_true" Width="80px"></asp:TextBox>

                                                    <cc1:CalendarExtender ID="CEPolicyDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtPolicyDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPolicyDate" runat="server" ControlToValidate="txtPolicyDate"
                                                            Display="Dynamic" ValidationGroup="Add" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter Policy Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Valid Till Date">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblValidTillDateH" runat="server" Text="Valid Till Date" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblValidTill" Width="80px" Text='<%# GVDateFormat(Eval("ValidTill").ToString()) %>'
                                                    runat="server" />
                                                <%--<asp:TextBox ID="lblValidTill" runat="server" MaxLength="8" Text='<%# Bind("ValidTill") %>'
                                                                            ToolTip="Valid Till"></asp:TextBox>
                                                                        <asp:Image ID="imgValidTillEdit" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                            ToolTip="Select Valid Till Date" Visible="false" />
                                                                        <cc1:CalendarExtender ID="calValidDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                            PopupButtonID="imgValidTillEdit" TargetControlID="lblValidTill">
                                                                        </cc1:CalendarExtender>--%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtValidTill" runat="server" Text='<%# GVDateFormat(Eval("ValidTill").ToString()) %>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        ToolTip="Valid Till Date" Width="80px"></asp:TextBox>

                                                    <cc1:CalendarExtender ID="calValidDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtValidTill">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtValidTill" runat="server" ControlToValidate="txtValidTill"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Valid Till Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtValidTill" runat="server" ToolTip="Valid Till Date" CssClass="md-form-control form-control login_form_content_input requires_true" Width="80px"></asp:TextBox>

                                                    <cc1:CalendarExtender ID="calValidDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtValidTill">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtValidTill" runat="server" ControlToValidate="txtValidTill"
                                                            Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Valid Till Date" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Value">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblPolicyValueH" runat="server" Text="Policy Value" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyValue" Text='<%#Bind("PolicyValue") %>' Style="text-align: right;"
                                                    runat="server" ToolTip="Policy Value" />
                                                <%--<asp:TextBox ID="lblPolicyValue" runat="server" Style="padding-left: 5px" Text='<%# Bind("PolicyValue") %>'
                                                                            ToolTip="PolicyValue"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtPolicyValue" runat="server" FilterType="Custom,Numbers"
                                                                            ValidChars="." TargetControlID="lblPolicyValue">
                                                                        </cc1:FilteredTextBoxExtender>--%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPolicyValue" runat="server" Style="text-align: right;" Text='<%# Bind("PolicyValue") %>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="120px"
                                                        ToolTip="PolicyValue" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtPolicyValue" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="txtPolicyValue">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPolicyValue" runat="server" ControlToValidate="txtPolicyValue"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Policy Value"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPolicyValue" runat="server" ToolTip="Policy Value" Style="text-align: right" CssClass="md-form-control form-control login_form_content_input requires_true" Width="120px"
                                                        onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtPolicyValue" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="txtPolicyValue">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPolicyValue" runat="server" ControlToValidate="txtPolicyValue"
                                                            Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter Policy Value"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Premium">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblPremiumH" runat="server" Text="Premium" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblPremium" Text='<%#Bind("Premium") %>' runat="server" Style="text-align: right" />
                                                <%--<asp:TextBox ID="lblPremium" runat="server" Style="padding-left: 5px" Text='<%# Bind("Premium") %>'
                                                                            ToolTip="Premium" AutoPostBack="true" OnTextChanged="lblPremium_TextChanged"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtPremium" runat="server" FilterType="Custom,Numbers"
                                                                            ValidChars="." TargetControlID="lblPremium">
                                                                        </cc1:FilteredTextBoxExtender>--%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPremium" runat="server" Style="padding-left: 5px; text-align: right" CssClass="md-form-control form-control login_form_content_input requires_true" Width="120px"
                                                        Text='<%# Bind("Premium") %>' ToolTip="Premium"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtPremium" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="txtPremium">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPremium" runat="server" ControlToValidate="txtPremium"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Premium"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <%--  <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPremium1" runat="server" ControlToValidate="txtPremium" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic" ErrorMessage="Amount Cannot be Zero" ValidationGroup="Add" InitialValue="0">
                                                        </asp:RequiredFieldValidator>
                                                    </div>--%>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPremium" runat="server" ToolTip="Premium" Style="text-align: right" CssClass="md-form-control form-control login_form_content_input requires_true" Width="120px">
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtPremium" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="txtPremium">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPremium" runat="server" ControlToValidate="txtPremium"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Premium"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <%--  <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPremium1" runat="server" ControlToValidate="txtPremium" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic" ErrorMessage="Amount Cannot be Zero" ValidationGroup="Add" InitialValue="0">
                                                        </asp:RequiredFieldValidator>
                                                    </div>--%>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Premium Pay Date">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblPremiumPayDateH" runat="server" Text="Premium Pay Date" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblPremiumPayDate" Text='<%# GVDateFormat(Eval("PremiumPayDate").ToString()) %>'
                                                    runat="server" ToolTip="PolicyDate" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPremiumPayDate" runat="server" Text='<%# GVDateFormat(Eval("PremiumPayDate").ToString()) %>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        ToolTip="PremiumPayDate" Width="140px"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calPremiumPayDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtPremiumPayDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPremiumPayDate" runat="server" ControlToValidate="txtPremiumPayDate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Premium Pay Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtPremiumPayDate" runat="server" ToolTip="PremiumPayDate" CssClass="md-form-control form-control login_form_content_input requires_true" Width="140px"></asp:TextBox>

                                                    <cc1:CalendarExtender ID="cetxtPremiumPayDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtPremiumPayDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtPremiumPayDate" runat="server" ControlToValidate="txtPremiumPayDate"
                                                            Display="Dynamic" ValidationGroup="Add" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Enter Premium Pay Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="btnEdit" runat="server" CausesValidation="false" Text="Edit" ValidationGroup="Add" AccessKey="E" ToolTip="Alt+Shit+E" CommandName="Edit" CssClass="grid_btn" />
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnRemove" runat="server" CausesValidation="false" Text="Delete" CommandName="Delete" AccessKey="D" ToolTip="Alt+Shit+D" CssClass="grid_btn_delete" />
                                                            </td>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="btnUpdate" runat="server" CausesValidation="true" Text="Update" AccessKey="U" ToolTip="Alt+U" CommandName="Update" ValidationGroup="Add" CssClass="grid_btn" />
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnCancel" runat="server" CausesValidation="false" Text="Cancel" AccessKey="N" ToolTip="Alt+N" CommandName="Cancel" ValidationGroup="Add" CssClass="grid_btn" />
                                                            </td>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <%--    <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="true" ValidationGroup="Add" CssClass="grid_btn"
                                                        CommandName="Add" Text="Add" />--%>
                                                <button class="css_btn_enabled" id="btnAdd" title="Add,Alt+A" onserverclick="btnAdd_ServerClick" runat="server"
                                                    type="button" accesskey="A" validationgroup="Add">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                </button>


                                                <%--   <asp:Button ID="btnAddPolicy" runat="server" CausesValidation="true" CssClass="styleSubmitShortButton"
                                                    OnClick="btnAddPolicy_OnClick" Text="Add" ValidationGroup="Add" Visible="false" />--%>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PaymentId" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPayment_Request_No" Text='<%#Bind("Payment_Request_No") %>' runat="server"
                                                    Visible="false" />
                                                <asp:Label ID="lblCanEdit" Text='<%#Bind("CanEdit") %>' runat="server" Visible="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Details Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDetailsId" Text='<%#Bind("DetailsId") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <%--  </asp:Panel>--%>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row" align="right">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Label ID="lblTotal" runat="server" Text="Total Premium  :" Font-Bold="True"></asp:Label>
                        <asp:Label ID="lblTotalPremium" runat="server" Font-Bold="True" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="pnlInsuranceHistory" Visible="true" runat="server" CssClass="stylePanel"
                            GroupingText="Insurance History" Width="99%">
                            <div id="div11" class="gird" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server">
                                <asp:GridView ID="gvInsuranceHistory" runat="server" AutoGenerateColumns="false"
                                    Visible="true" Width="100%" OnRowDataBound="gvInsuranceHistory_RowDataBound" class="gird_details">
                                    <Columns>
                                        <%-- <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="AINSE Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAINSENumber" runat="server" Text='<%# Eval("AINSE") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="AINSE Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHAINSEDate" runat="server" Text='<%# Eval("AINSEDate") %>' Width="80px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAssetDescription" runat="server" Text='<%# Eval("Asset Description") %>' Width="140px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insurance Done By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHInsuranceDoneBy" runat="server" Text='<%# Eval("InsDoneBy") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insurance Company">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsuranceCompany" runat="server" Text='<%# Eval("Ins_Company_Name") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Insurance Branch">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsuranceBranch" runat="server" Text='<%# Eval("INSBRANCH") %>' Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyType" runat="server" Text='<%# Eval("PolicyType") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Regn No or Serial No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRegnNoorSerialNo" runat="server" Text='<%# Eval("MachineNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyNo" runat="server" Text='<%# Eval("Policy No") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyDate" runat="server" Text='<%# Eval("PolicyDate") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Valid Till Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblValidTill" runat="server" Text='<%# Eval("ValidTill") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Policy Value">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyValue" runat="server" Text='<%# Eval("PolicyValue") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Premium">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPremium" runat="server" Text='<%# Eval("Premium") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Premium Pay Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPremiumPayDate" runat="server" Text='<%# Eval("PremiumPayDate") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- <asp:BoundField HeaderText="PolicyValue" DataField='<%# Eval("PolicyValue").ToString(Funsetsuffix) %>' ItemStyle-HorizontalAlign ="Right"  />
                                                              <asp:BoundField HeaderText="Premium" DataField="Premium" ItemStyle-HorizontalAlign ="Right" />--%>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div align="right">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_OnClick" runat="server" onclick="if(fnCheckPageValidators('Submit'))" validationgroup="Submit"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_OnClick" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_OnClick" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>

                <div class="row" runat="server" visible="false">
                    <asp:CustomValidator ID="cvAssetInsuranceEntry" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true"></asp:CustomValidator>
                    <asp:ValidationSummary ID="vsInsurancePolicy" runat="server" CssClass="styleMandatoryLabel"
                        ValidationGroup="Submit" HeaderText="Correct the following validation(s):" />
                    <asp:ValidationSummary ID="vsPolicyDetails" runat="server" CssClass="styleMandatoryLabel"
                        ValidationGroup="Add" HeaderText="Correct the following validation(s):" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

        //function fnLoadCustomer() {
        //    document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
        //}
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }


        function Resize() {
            if (document.getElementById('divMenu').style.display == 'none') {
                (document.getElementById('ctl00_ContentPlaceHolder1_pnlCurrentInsurance')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            }
            else {
                (document.getElementById('ctl00_ContentPlaceHolder1_pnlCurrentInsurance')).style.width = screen.width - 260;
            }
        }

        function ReHeight(ht) {
            (document.getElementById('ctl00_ContentPlaceHolder1_pnlInner')).style.height = ht + 'px';
        }


        function showMenu(show) {
            if (show == 'T') {

                //Added by Kali K to solve error ( when menu is show scroll should appear in grid )
                //This is used to show scroll bar when div is used in GridView
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "800px";
                    document.getElementById('divGrid1').style.overflow = "scroll";
                }

                document.getElementById('divMenu').style.display = 'Block';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                document.getElementById('ctl00_imgShowMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                (document.getElementById('ctl00_ContentPlaceHolder1_pnlCurrentInsurance')).style.width = screen.width - 260;
            }
            if (show == 'F') {

                //Added by Kali K to solve error ( when menu is hide scroll for is not hiding from grid view )
                //This is used to hide scroll bar when div is used in GridView
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                //document.getElementById('divMenu').setAttribute('width', 0);

                (document.getElementById('ctl00_ContentPlaceHolder1_pnlCurrentInsurance')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            }
        }

        function funCheckFirstLetterisNumeric(textbox, msg) {

            var FieldValue = new Array();
            FieldValue = textbox.value.trim();
            if (FieldValue.length > 0 && FieldValue.value != '') {
                if (isNaN(FieldValue[0])) {
                    return true;
                }
                else {
                    alert(msg + ' name cannot begin with a number');
                    textbox.focus();
                    textbox.value = '';
                    event.returnValue = false;
                    return false;
                }
            }
        }

        function FunCheckForZero(input, strName) {
            var txtBoxVal = input.value;
            if (txtBoxVal != '') {
                if (!isNaN(txtBoxVal)) {
                    if (txtBoxVal == 0) {
                        alert(strName + ' cannot be Zero');
                        input.focus();
                    }
                }
            }
        }

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }


        function fnTrashCustomerSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";


                }
            }
        }

        function fnTrashAccountSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
                }
            }
        }

        function fnTrashVendorSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtBranchCodeDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtBranchCodeDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtBranchCodeDummy.ClientID %>').value = "";
                }
            }
        }

    </script>

</asp:Content>
