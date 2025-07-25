<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GORGConstitutionCodeSetup_Add, App_Web_xfeo3ymh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
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
                    <%--<div class="col" align="right">
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel GroupingText="Constitution Header" ID="Panel1" runat="server" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="trConstitutionCode" runat="server">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtConstitutionCode" ReadOnly="false" Enabled="false" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');" runat="server" ToolTip="Constitution Code"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Constitution Code" ID="lblConstitutionCode" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtConstitutionName" MaxLength="40" runat="server"
                                            ToolTip="Enter Constitution Name" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');">
                                        </asp:TextBox>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Constitution Name" ID="lblConstitutionName" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvConstitutionName" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtConstitutionName" ValidationGroup="Constitution"
                                                ErrorMessage="Enter the Constitution Name" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlCustomerType" MaxLength="40" runat="server"
                                            ToolTip="Customer Type" class="md-form-control form-control">
                                        </asp:DropDownList>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Customer Type" ID="lblCustomerType" ToolTip="Customer Type" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvCustomerType" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="ddlCustomerType" InitialValue="-1" ValidationGroup="Constitution"
                                                ErrorMessage="Enter the Customer Type" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <button class="css_btn_enabled" id="lnkCopyProfile"  title="Copy Profile,Alt+C" onclick="return fnCopyProfile();" causesvalidation="false" runat="server"
                                        type="button" accesskey="C">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>opy Profile
                                    </button>
                                        <button class="css_btn_enabled" id="lnkHideCopyProfile" title="Hide Copy Profile,Alt+H" style="display:none;" onclick="return fnHideCopyProfile();" causesvalidation="false" runat="server"
                                        type="button" accesskey="H">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>H</u>ide Copy Profile
                                    </button>
                                    <%--      <asp:Button OnClientClick="return fnCopyProfile();" AccessKey="C" CssClass="save_btn fa fa-floppy-o"
                                        Text="Copy Profile" ID="lnkCopyProfile" runat="server" ToolTip="Copy Profile,Alt+C"></asp:Button>--%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel GroupingText="Line of Business Details" ID="pnllob" runat="server" CssClass="stylePanel">
                                        <asp:GridView runat="server" ID="grvLOB" Width="100%" HeaderStyle-CssClass="styleGridHeader"
                                            OnRowDataBound="grvLOB_RowDataBound" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Line of Business"
                                                    HeaderStyle-Width="100%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" ToolTip='<%#Eval("LOB_Name")%>' Text='<%#Eval("LOB_Name")%>'></asp:Label>
                                                        <asp:Label ID="lblLOBID" runat="server" Visible="false" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                        <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-Width="30%">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkSelectAllLOB" runat="server"></asp:CheckBox>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectLOB" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <%--  <HeaderStyle CssClass="styleGridHeader" />--%>
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                </br>
                <div class="row">
                    <div class="col-md-12">
                        <div id="divCopyProfile" runat="server" style="display: none">
                            <div>
                                <div class="row" runat="server" id="trCopyProfileMessage" visible="false">
                                    <div class="col-md-12">
                                        <asp:Label runat="server" ID="Label4" Text="No Records Found" Font-Size="Medium"
                                            class="styleMandatoryLabel"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="divGrid" style="width: 100%">
                                            <asp:Panel GroupingText="Constitution Details" ID="Panel2" Width="100%" runat="server" CssClass="stylePanel">
                                                <asp:GridView runat="server" ID="grvConstitution" Width="100%" OnRowDataBound="grvConstitution_RowDataBound"
                                                    AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                                    OnRowCreated="grvConstitution_RowCreated">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSel" OnCheckedChanged="FunPriGetCopyProfileDetails" AutoPostBack="true"
                                                                    runat="server"></asp:CheckBox>
                                                                <asp:Label Visible="false" ID="lblConstitutionID" runat="server" Text='<%#Eval("Constitution_ID")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Constitution_Code" ItemStyle-HorizontalAlign="Left" HeaderText="Constitution Code" />
                                                        <asp:BoundField DataField="Constitution_Name" ItemStyle-HorizontalAlign="Left" HeaderText="Constitution Name" />
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <%-- <td valign="top" style="padding-top: 6px"></td>--%>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel GroupingText="Constitution Documents" ID="pnlDocs" runat="server" CssClass="stylePanel">
                            <div>
                                <div class="row">
                                    <div class="col">
                                        <div class="gird">
                                            <asp:GridView ShowFooter="True" runat="server" ID="grvConsDocuments" Width="100%"
                                                Height="10px" OnRowDataBound="grvConsDocs_RowDataBound" DataKeyNames="Sno" AutoGenerateColumns="False"
                                                OnRowCommand="grvConsDocuments_RowCommand" class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Document Type" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <%#Eval("Doc_Cat_Flag")%>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <uc2:Suggest ID="ddlDocCatGird" runat="server" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" ErrorMessage="Select Document Flag"
                                                                    ServiceMethod="GetDocumentFlags" Width="340px"
                                                                    OnItem_Selected="ddlDocCatGrid_SelectedIndexChanged" ValidationGroup="Constitution" IsMandatory="false" />
                                                                <%-- <span class="highlight"></span>
                                                                <span class="bar"></span>--%>
                                                            </div>
                                                        </FooterTemplate>
                                                        <FooterStyle VerticalAlign="Middle" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Doc_Cat_Name" ItemStyle-HorizontalAlign="Left" Visible="false"
                                                        HeaderText="Document Category">
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Document Description" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <%#Eval("Doc_Cat_Desc")%>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:UpdatePanel ID="upd" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:TextBox runat="server" Width="300px" ID="txtOthersGrid" MaxLength="40" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                            Enabled="false" OnTextChanged="txtOthersGrid_TextChanged" ToolTip="Document Description">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtOthersGrid"
                                                                            FilterType="Numbers, UppercaseLetters, LowercaseLetters,Custom" ValidChars=" "
                                                                            Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <cc1:AutoCompleteExtender ID="AutoCompleteExtenderDemo" runat="server" TargetControlID="txtOthersGrid"
                                                                            ServiceMethod="getDocumentsList" MinimumPrefixLength="1" CompletionSetCount="20"
                                                                            DelimiterCharacters="" Enabled="True" ServicePath="">
                                                                        </cc1:AutoCompleteExtender>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Doc_Cat_Flag" HeaderText="Document Flag" Visible="false">
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Doc_Cat_Desc" Visible="false" HeaderText="Document Description">
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderStyle-Wrap="true" HeaderText="Mandatory">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkOptMan" runat="server" Enabled="false" ToolTip="Mandatory"></asp:CheckBox>
                                                            <asp:Label Visible="false" ID="lblOptMan" runat="server" Text='<%#Eval("Doc_Cat_OptMan")%>'></asp:Label>
                                                            <asp:Label Visible="false" ID="lblDocCatID" runat="server" Text='<%#Eval("Doc_Cat_ID")%>'></asp:Label>
                                                            <asp:Label Visible="false" ID="lblDocCatIDAssigned" runat="server" Text='<%#Eval("Doc_Cat_IDAssigned")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Wrap="True" />
                                                        <FooterTemplate>
                                                            <asp:CheckBox ID="chkOptManIns" runat="server" ToolTip="Mandatory"></asp:CheckBox>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Image Copy">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkImageCopy" runat="server" Enabled="false"></asp:CheckBox>
                                                            <asp:Label Visible="false" ID="lblImageCopy" runat="server" Text='<%#Eval("Doc_Cat_ImageCopy")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:CheckBox ID="chkImageCopyIns" runat="server" ToolTip="Image Copy"></asp:CheckBox>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox runat="server" ID="txtRemarks" Wrap="true" style="overflow:hidden" onkeydown="maxlengthfortxt(60);"
                                                                    Columns="25" Rows="2" Text='<%#Eval("Remarks")%>' Width="230px" Height="250px" CssClass="md-form-control form-control login_form_content_input"
                                                                    TextMode="MultiLine" ToolTip='<%#Eval("Remarks")%>'></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox runat="server" ID="txtRemarks" style="overflow:hidden" Wrap="true" onkeydown="maxlengthfortxt(60);" CssClass="md-form-control form-control login_form_content_input"
                                                                    Columns="25" Rows="2" Text='<%#Eval("Remarks")%>' Width="230px" Height="250px"
                                                                    TextMode="MultiLine" ToolTip='<%#Eval("Remarks")%>'></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnRemove" runat="server" Text="Remove" CausesValidation="false" OnClick="RemoveRow" CommandName="Remove"
                                                                ToolTip="Remove,Alt+R" AccessKey="R" CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to remove this Record?');" />

                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Button ID="btnSave" CssClass="grid_btn" Text="Add" runat="server" AccessKey="T"
                                                                ToolTip="Add,Alt+T" CausesValidation="true" CommandName="Save" OnClick="SaveRow" ValidationGroup="btnAdd" />
                                                            <%--<i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd--%>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" Width="7%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Constitution'))" causesvalidation="true" onserverclick="btnSave_Click" runat="server"
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
                <div class="row">
                    <%--<div class="col">
                        <div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="row" style="float: right; margin-top: 5px;">
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                            <asp:Button runat="server" ID="btnSave" AccessKey="S" CssClass="save_btn fa fa-floppy-o" Text="Save"
                                                OnClick="btnSave_Click" ValidationGroup="Constitution" ToolTip="Save, Alt+S" OnClientClick="return fnCheckPageValidators('Constitution');" />
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                                            <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="save_btn fa fa-eraser-o"
                                                Text="Clear" AccessKey="L" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                                                ToolTip="Clear, Alt+L" />
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                            <asp:Button runat="server" ID="btnCancel" AccessKey="X" Text="Exit" CausesValidation="false"
                                                ToolTip="Exit, Alt+X" CssClass="save_btn fa fa-share-o" OnClick="btnCancel_Click" />
                                            <div id="divTooltip" runat="server" style="border: 1px solid #000000; background-color: #FFFFCE; position: absolute; display: none;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-12">
                            <input type="hidden" value="0" runat="server" id="hdnConstitution" />
                            <input type="hidden" value="0" runat="server" id="hdnMode" />
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px; display: none;">
                        <div class="col-md-12">
                            <asp:ValidationSummary runat="server" ID="ValidationSummary1"
                                HeaderText="Correct the following validation(s):" CssClass="styleSummaryStyle"
                                Width="500px" ShowMessageBox="false" ShowSummary="false" />
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">


        function fnConfirm() {
            if (confirm('Are you sure want to save?')) {
                return true;
            }
            else
                return false;
        }

        var bResult;
        function fnCheckPageValidation(grpName) {
            if ((!fnCheckPageValidators(grpName, 'false')) && (Page_ClientValidate(grpName) == false)) {
                Page_BlockSubmit = false;
                return false;
            }
            if (Page_ClientValidate(grpName)) {
                bResult = fnIsCheckboxChecked('<%=grvLOB.ClientID%>', 'chkSelectLOB', 'Line of Business');
                if (bResult) {
                    bResult = fnIsCheckboxCheckedDoc('<%=grvConsDocuments.ClientID%>', 'chkSel', 'document from constitutional documents');
                }

                if (bResult) {
                    if (confirm('Are you sure want to save?')) {
                        return true;
                    }
                    else {
                        //Added by Thangam M on 18/Oct/2012 to avoid double save click
                        var a = event.srcElement;
                        //a.style.display = 'block';
                        a.style.removeProperty('display');
                        //End here
                        return false;
                    }
                }
                else {
                    //Added by Thangam M on 18/Oct/2012 to avoid double save click
                    var a = event.srcElement;
                    //a.style.display = 'block';
                    a.style.removeProperty('display');
                    //End here
                }

                return bResult;

            }
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
            objTxtRemarks = 'txtRemarks';
            chkbox = document.getElementById(gridId + '_ctl0' + i + '_' + objid);
            //reqRemarks=document.getElementById(gridId + '_ctl0' + i + '_' + objRemarksID);
            txtRemarks = document.getElementById(gridId + '_ctl0' + i + '_' + objTxtRemarks);
            while ((chkbox != null)) {
                txtRemarks.className = "styleReqFieldDefalut";
                if (chkbox.checked) {

                    bChecked = true;

                    //if(txtRemarks.value!='')
                    //  {
                    //reqRemarks.enabled=false;      
                    //}
                    if (txtRemarks.value == '') {
                        bRemarks = false;
                        txtRemarks.className = "styleReqFieldFocus";
                        //reqRemarks.enabled=true;      
                    }
                    //break;
                }
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
                alert('Enter the remarks for the selected document(s)');
                return false;
            }

        }

        function pageLoad() {
            //if(document.getElementById('<%=hdnMode.ClientID%>').value=='M')
            // document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl01_chkAllDoc').disabled=true;

        }
        function fnCheck() {
            alert('calling');
            var chkbox;
            var i = 2;
            var gridId = 'ctl00_ContentPlaceHolder1_grvConsDocuments';
            var chkStatus = true;
            chkbox = document.getElementById(gridId + '_ct' + i + '_chkSel');
            //  alert(gridId + '_ct' + i + '_chkSel');
            while (chkbox != null) {
                chkbox = document.getElementById(gridId + '_ct' + i + '_chkSel');
                if (chkbox != null) {
                    /*  if(chkbox.checked==false)
                    {
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ct'+ i + '_chkOptMan').disabled=true;
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ct'+ i + '_chkImageCopy').disabled=true;
                    }
                    else
                    {
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ct'+ i + '_chkOptMan').disabled=false;
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ct'+ i + '_chkImageCopy').disabled=false;                
                    }                
                    i=i+1;*/
                }

            }
        }

        function fnEnableCheckes(chkSel, chkOptMan, chkImageCopy) {


            document.getElementById(chkOptMan).disabled = true;
            document.getElementById(chkImageCopy).disabled = true;

            if (document.getElementById(chkSel).checked) {
                document.getElementById(chkOptMan).disabled = false;
                document.getElementById(chkImageCopy).disabled = false;
            }
            else {
                document.getElementById(chkOptMan).disabled = true;
                document.getElementById(chkImageCopy).disabled = true;
            }

            /*
            var chkSel = document.getElementById(chkSel);
            var chkOptMan = document.getElementById(chkOptMan);
            var chkImageCopy = document.getElementById(chkImageCopy);
            //alert(document.getElementById(chkSel)+'-'+document.getElementById(chkOptMan)+'-'+document.getElementById(chkImageCopy));
            //        chkOptMan.Enabled = false;
            //        chkImageCopy.Enabled = false;
            chkOptMan.Disabled = true;
            chkImageCopy.Disabled= = true;
            if (chkSel.checked)
            {
            chkOptMan.Disabled = false;
            chkImageCopy.Disabled= = false;
            chkOptMan.checked = true;
            chkImageCopy.checked = true;
            }
            */
        }


        function fnHideCopyProfile() {
            document.getElementById('<%=lnkCopyProfile.ClientID%>').style.display = 'block';
            document.getElementById('<%=lnkHideCopyProfile.ClientID%>').style.display = 'none';
                document.getElementById('<%=lnkCopyProfile.ClientID%>').value = 'Copy Profile';
                document.getElementById('ctl00_ContentPlaceHolder1_divCopyProfile').style.display = 'none';
                //            document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments').style.height="275px";
                //document.getElementById('<%=lnkCopyProfile.ClientID%>').title = 'Copy Profile,Alt+C'
                //document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments').style.height = "275px";

                document.getElementById('ctl00_ContentPlaceHolder1_pnlDocs').style.display = 'block';
                return false;
        }

        function fnCopyProfile() {
            document.getElementById('<%=lnkCopyProfile.ClientID%>').style.display = 'none';
            document.getElementById('<%=lnkHideCopyProfile.ClientID%>').style.display = 'block';
                document.getElementById('<%=lnkCopyProfile.ClientID%>').value = 'Hide Copy Profile';
                //document.getElementById('<%=lnkCopyProfile.ClientID%>').title = 'Hide Copy Profile,Alt+H'
                document.getElementById('ctl00_ContentPlaceHolder1_divCopyProfile').style.display = 'Block';

                document.getElementById('ctl00_ContentPlaceHolder1_pnlDocs').style.display = 'none';

                //            document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments').style.height="150px";
            
       //document.getElementById('<%=lnkCopyProfile.ClientID%>').title = document.getElementById('<%=lnkCopyProfile.ClientID%>').value;

       return false;
   }



        function fnAddDocType() {
            var gridId = 'ctl00_ContentPlaceHolder1_grvConsDocuments';
            var len = parseFloat(document.getElementById(gridId).rows.length);
            if (document.getElementById(gridId + '_ctl' + len + '_ddlDocCatGird')) {
                if (document.getElementById(gridId + '_ctl' + len + '_ddlDocCatGird').value == "0") {
                    alert("Select the Document Category");
                    document.getElementById(gridId + '_ctl' + len + '_ddlDocCatGird').focus();
                    return false;
                }
            }
            if (document.getElementById(gridId + '_ctl' + len + '_txtOthersGrid')) {
                if (document.getElementById(gridId + '_ctl' + len + '_txtOthersGrid').value == "") {
                    alert("Enter the Document Description");
                    document.getElementById('ctl00_ContentPlaceHolder1_grvConsDocuments_ctl' + len + '_txtOthersGrid').focus();
                    return false;
                }
            }

            if (confirm('Are you sure want to Add?'))
                return true;
            else
                return false;


            return true;
        }


        function showTip(objDrop, e) {
            if (objDrop.options.length > 0) {
                document.getElementById('ctl00_ContentPlaceHolder1_divTooltip').style.display = "inline";
                document.getElementById('ctl00_ContentPlaceHolder1_divTooltip').innerHTML = "&nbsp;" + objDrop.options[objDrop.selectedIndex].text + "&nbsp;";
                document.getElementById('ctl00_ContentPlaceHolder1_divTooltip').style.left = e.x;
                document.getElementById('ctl00_ContentPlaceHolder1_divTooltip').style.top = e.y;
            }
        }

        function hideText() {
            document.getElementById('ctl00_ContentPlaceHolder1_divTooltip').style.display = "none";
        }

        function fnDGUnselectAllExpectSelected(gridid, SelectedChkboxid) {
            //Get target base & child control.

            var TargetBaseControl =
       document.getElementById(gridid);

            var TargetControl = SelectedChkboxid;

            //Get all the control of the type INPUT in the base control.
            var Inputs = TargetBaseControl.getElementsByTagName("input");

            //Checked/Unchecked all the checkBoxes in side the GridView.
            //alert(SelectedChkboxid.checked);
            if (SelectedChkboxid.checked) {
                for (var n = 0; n < Inputs.length; ++n)
                    if (Inputs[n].type == 'checkbox' && Inputs[n].uniqueID != TargetControl.uniqueID) {
                        if (Inputs[n].checked) Inputs[n].checked = false;
                    }
            }
        }

    </script>

</asp:Content>
