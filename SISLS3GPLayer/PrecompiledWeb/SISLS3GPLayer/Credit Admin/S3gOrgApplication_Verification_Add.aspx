<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" title="S3G - Pricing" autoeventwireup="true" inherits="Origination_S3gOrgPricing_Add, App_Web_perom1xt" enableeventvalidation="false" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC5" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM" TagPrefix="uc3" %>

<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function CloseWindow() {

        }

        function fnConfirmExitInner() {



            var frame = document.getElementById(this.frameElement.attributes.id);
            frame.parentNode.removeChild(frame);



            return true;

        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
        <ContentTemplate>

            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>



                <div class="row">
                    <div class="col-md-12">

                        <asp:Panel GroupingText="Stage Status" ID="pnlStageStatus" CssClass="stylePanel" runat="server" ToolTip="Stage Status">
                            <table>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkVerificationComplted" AutoPostBack="true" OnCheckedChanged="chkVerificationComplted_CheckedChanged" Text="Verification Completed" runat="server" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ChkDataEntryRouteback" AutoPostBack="true" OnCheckedChanged="ChkDataEntryRouteback_CheckedChanged" Text="Data Entry Stage Route Back" runat="server" />
                                    </td>

                                </tr>
                            </table>
                        </asp:Panel>

                        <asp:Panel runat="server" ID="Panel1" CssClass="stylePanel" GroupingText="Proposal Details" HorizontalAlign="Center" Width="100%">


                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 styleFieldLabel">
                                            <div class="md-input">
                                                <table width="100%">
                                                    <tr>
                                                        <td>


                                                            <UC5:AutoSugg ID="ddlApplicationNo" AutoPostBack="true" class="md-form-control form-control" ToolTip="Application No[Proposal From Checklist]" runat="server" ErrorMessage="Select the Marketing Officer" IsMandatory="false" ServiceMethod="GetProposalFromCheckList" OnItem_Selected="ddlApplicationNo_Item_Selected" />


                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label ID="lblProposalNumber" runat="server" Text="Proposal Number"></asp:Label>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <button class="css_btn_enabled" id="btnGo" title="Go,Alt+G" causesvalidation="false" onserverclick="btnGo_Click" runat="server"
                                                                type="button" accesskey="G">
                                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                            </button>
                                                        </td>
                                                        <td>
                                                            <button class="css_btn_enabled" id="lnkViewAccountDetails" title="View Application [Alt+V]" accesskey="v" causesvalidation="false" runat="server"
                                                                type="button">
                                                                <i class="fa fa-eye" aria-hidden="true"></i>&emsp;<u></u>View Application   
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="md-input">
                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="pnlApplicantDetails"
                            ExpandControlID="divApplicationVerification" CollapseControlID="divApplicationVerification" Collapsed="false"
                            TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />

                        <asp:Panel ID="divApplicationVerification" runat="server" CssClass="accordionHeader" Width="98.5%">
                            <div style="float: left;">
                                Application Verification
                            </div>
                            <div style="float: left; margin-left: 20px;">
                                <asp:Label ID="lblDetails" runat="server">(Show Details...)</asp:Label>
                            </div>
                            <div style="float: right; vertical-align: middle;">
                                <asp:ImageButton ID="imgDetails" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                    AlternateText="(Show Details...)" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>



                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel runat="server" ID="pnlApplicantDetails" CssClass="stylePanel" HorizontalAlign="Left" Width="100%" GroupingText="Verify">
                            <table width="99%">

                                <tr>
                                    <td>
                                        <asp:GridView ID="grvApplicantDetails" HorizontalAlign="Center" runat="server" AutoGenerateColumns="false"
                                            Width="100%" ShowFooter="false" OnRowDataBound="grvApplicantDetails_RowDataBound"
                                            OnRowCommand="grvApplicantDetails_RowCommand" OnRowDeleting="grvApplicantDetails_RowDeleting"
                                            OnRowEditing="grvApplicantDetails_RowEditing" OnRowCancelingEdit="grvApplicantDetails_RowCancelingEdit"
                                            OnRowUpdating="grvApplicantDetails_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                                    </ItemTemplate>
                                                    <HeaderStyle Width="1%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false" HeaderText="VER DET ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblVerDetId" runat="server" Text='<%#Eval("APP_VERIFY_DET_ID")%>'>></asp:Label>

                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Parameter">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblParameterId" Visible="false" runat="server" Text='<%#Eval("VARIFICATION_FIELD")%>'>></asp:Label>
                                                        <asp:Label ID="lblDataType" Visible="false" runat="server" Text='<%#Eval("DATA_TYPE")%>'>></asp:Label>
                                                        <asp:Label ID="lblParameter" runat="server" Text='<%#Eval("VARIFICATION_FIELD_DESC")%>'>></asp:Label>


                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Value">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="lblVaue" class="md-form-control form-control login_form_content_input requires_true" Width="98%" Enabled="false" runat="server" Text='<%#Eval("Value")%>'></asp:TextBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Verifiy">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChangedVerBase"
                                                            Text="Select All" ToolTip="Include" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="ChkVerified" runat="server"></asp:CheckBox>
                                                        <asp:Label ID="lblChkVerified" Visible="false" runat="server" Text='<%#Eval("VIO")%>'>></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="1%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Verification Results Not in Order">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAllInOrder" runat="server" AutoPostBack="true" OnCheckedChanged="chkAllInOrder_CheckedChangedVerBase"
                                                            Text="Select All" ToolTip="Include" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="ChkVerificationResultsNotinOrder" runat="server"></asp:CheckBox>
                                                        <asp:Label ID="lblChkVerificationResultsNotinOrder" Visible="false" runat="server" Text='<%#Eval("VNIO")%>'>></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="1%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Previos Remarks">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtPreviosRemarks" class="md-form-control form-control login_form_content_input requires_true" Width="100%" TextMode="MultiLine" runat="server" Text='<%#Eval("PRM")%>'></asp:TextBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtRemarks" onkeyup="maxlengthfortxt(200);" class="md-form-control form-control login_form_content_input requires_true" Width="100%" TextMode="MultiLine" runat="server" Text='<%#Eval("RM")%>'></asp:TextBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>

                            </table>
                        </asp:Panel>

                    </div>
                </div>



                <div class="row">
                    <div class="col-md-12">
                        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server" TargetControlID="pnlAssetDetails"
                            ExpandControlID="divpnlAccordAssetLov" CollapseControlID="divpnlAccordAssetLov" Collapsed="false"
                            TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />

                        <asp:Panel ID="divpnlAccordAssetLov" runat="server" CssClass="accordionHeader" Width="98.5%">
                            <div style="float: left;">
                                Application Asset Verification
                            </div>
                            <div style="float: left; margin-left: 20px;">
                                <asp:Label ID="Label1" runat="server">(Show Details...)</asp:Label>
                            </div>
                            <div style="float: right; vertical-align: middle;">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                    AlternateText="(Show Details...)" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel runat="server" ID="pnlAssetDetails" CssClass="stylePanel" HorizontalAlign="Left" Width="100%" GroupingText="Verify">
                            <table width="50%">
                                <tr>
                                    <td>
                                        <div class="md-input">
                                            <UC5:AutoSugg ID="ddlAssetCode" runat="server" ErrorMessage="Select Asset"
                                                ServiceMethod="GetAsset" IsMandatory="false" AutoPostBack="false" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblAssetCode" runat="server" Text="Asset Code"></asp:Label>
                                            </label>
                                        </div>
                                    </td>

                                    <td>
                                        <button class="css_btn_enabled" id="btnGoAsset" title="Go,Alt+H" causesvalidation="false" onserverclick="btnGoAsset_Click" runat="server"
                                            type="button" accesskey="H">
                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>F</u>etch Asset Details
                                        </button>
                                    </td>

                                </tr>
                            </table>
                            <table width="99%">

                                <tr>
                                    <td>
                                        <asp:GridView ID="grvAssetDetails" HorizontalAlign="Center" runat="server" AutoGenerateColumns="false"
                                            Width="100%" ShowFooter="true" OnRowDataBound="grvAssetDetails_RowDataBound"
                                            OnRowCommand="grvApplicantDetails_RowCommand" OnRowDeleting="grvApplicantDetails_RowDeleting"
                                            OnRowEditing="grvApplicantDetails_RowEditing" OnRowCancelingEdit="grvApplicantDetails_RowCancelingEdit"
                                            OnRowUpdating="grvApplicantDetails_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                                    </ItemTemplate>
                                                    <HeaderStyle Width="1%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false" HeaderText="VER DET ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblVerDetId" runat="server" Text='<%#Eval("app_verify_extn_det_id")%>'>></asp:Label>

                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false" HeaderText="VER ASSET DET ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblVerAssetDetId" runat="server" Text='<%#Eval("APPLICATION_PROCESS_ASSET_ID")%>'>></asp:Label>

                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Parameter">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblParameterId" Visible="false" runat="server" Text='<%#Eval("VARIFICATION_FIELD")%>'>></asp:Label>
                                                        <asp:Label ID="lblParameter" runat="server" Text='<%#Eval("VARIFICATION_FIELD_DESC")%>'>></asp:Label>


                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Value">

                                                    <ItemTemplate>
                                                        <asp:TextBox ID="lblVaue" class="md-form-control form-control login_form_content_input requires_true" Width="98%" Enabled="false" runat="server" Text='<%#Eval("Value")%>'></asp:TextBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Verifiy">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAllAsset" runat="server" AutoPostBack="true" OnCheckedChanged="chkAllAsset_CheckedChanged"
                                                            Text="Select All" ToolTip="Include" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="ChkVerified" runat="server"></asp:CheckBox>
                                                        <asp:Label ID="lblChkVerified" Visible="false" runat="server" Text='<%#Eval("VIO")%>'>></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="1%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Verification Results Not in Order">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAllAssetInOrder" runat="server" AutoPostBack="true" OnCheckedChanged="chkAllAssetInOrder_CheckedChanged"
                                                            Text="Select All" ToolTip="Include" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="ChkVerificationResultsNotinOrder"   runat="server"></asp:CheckBox>
                                                        <asp:Label ID="lblChkVerificationResultsNotinOrder" Visible="false" runat="server" Text='<%#Eval("VNIO")%>'>></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:Button ID="btnUpdateAsset" runat="server" Text="Update" OnClick="btnUpdateAsset_Click" CssClass="grid_btn" AccessKey="T" ToolTip="Update Asset Details Alt+T"></asp:Button>
                                                        </div>
                                                    </FooterTemplate>
                                                    <HeaderStyle Width="1%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Previos Remarks">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtPreviosRemarks" class="md-form-control form-control login_form_content_input requires_true" Width="100%" TextMode="MultiLine" runat="server" Text='<%#Eval("PRM")%>'></asp:TextBox>
                                                    </ItemTemplate>

                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtRemarks" onkeyup="maxlengthfortxt(200);" class="md-form-control form-control login_form_content_input requires_true" Width="100%" TextMode="MultiLine" runat="server" Text='<%#Eval("RM")%>'></asp:TextBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>

                            </table>
                        </asp:Panel>

                    </div>
                </div>


                <div align="right" class="fixed_btn_InLine">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" onclick="if(fnCheckPageValidators())" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
