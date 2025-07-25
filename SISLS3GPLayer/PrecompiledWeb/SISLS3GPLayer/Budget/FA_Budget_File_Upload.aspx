<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Budget_Budget_File_Upload, App_Web_rj0nx3uf" title="S3G - Budjet File Upload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        function fnCheckPageValidators_Extn(strValGrp, blnConfirm)
        {
            if (Page_ClientValidate() == false) {
                var iResult = "1";
                for (i = 0; i < Page_Validators.length; i++) {
                    val = Page_Validators[i];
                    controlToValidate = val.getAttribute("controltovalidate");
                    if (controlToValidate != undefined) {
                        if (document.getElementById(controlToValidate) != null) {
                            document.getElementById(controlToValidate).border = "1";
                        }
                    }
                }
                for (i = 0; i < Page_Validators.length; i++) { //For loop1
                    val = Page_Validators[i];
                    var isValidAttribute = val.getAttribute("isvalid");
                    var controlToValidate = val.getAttribute(" ");
                    if (controlToValidate != undefined) {
                        if (strValGrp == undefined) {
                            if (document.getElementById(controlToValidate) != null) {
                                if (isValidAttribute == false) {

                                    document.getElementById(controlToValidate).className = 'styleReqFieldFocus';
                                    //This is to avoid not to validate control which is already in false state (valid attribute)
                                    document.getElementById(controlToValidate).border = "0";
                                    iResult = "0";
                                }
                                else if (document.getElementById(controlToValidate).border != "0") {
                                    document.getElementById(controlToValidate).className = 'styleReqFieldDefalut';
                                }
                            }
                        }

                    }
                }
                Page_BlockSubmit = false;
            }
            if (Page_ClientValidate(strValGrp)) {

                if (blnConfirm == undefined) {
                    if (confirm('Do you want to Upload?')) {
                        Page_BlockSubmit = false;
                        var a = event.srcElement;
                        if (a.type == "submit") {
                            a.style.display = 'none';
                        }
                        //End here
                        return true;
                    }
                    else
                        return false;
                }
                else {
                    Page_BlockSubmit = false;
                    //Added by Thangam M on 18/Oct/2012 to avoid double save click
                    var a = event.srcElement;
                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    //End here
                    return true;
                }
            }
            else {
                Page_BlockSubmit = false;
                return false;
            }
        }

        function fnConfirmClear() {

            if (confirm('Do you want to Clear?')) {
                return true;
            }
            else
                return false;
        }

        function fnConfirmCancel() {

            if (confirm('Do you want to Exit?')) {
                return true;
            }
            else
                return false;
        }

       
    </script>

    <script type="text/javascript">
        function openModal() {
            $('#copyProfileModal').modal('show');
        }
    </script>

    <div id="tab-content" class="tab-content">
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="File Upload" ID="lblHeading"> </asp:Label>
                </h6>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div id="divLocationCatDetails" runat="server">
                    <asp:Panel Visible="true" runat="server" ID="pnlLocationCatDetails" GroupingText="Upload Details"
                        CssClass="stylePanel">
                        <asp:UpdatePanel ID="upLocationdetails" runat="server">
                            <ContentTemplate>
                                <div class="row">

                                    <div class="col-lg-4  styleFieldLabel">
                                        <div class="md-input">

                                            <asp:DropDownList ID="ddlFinancialyear" runat="server" ToolTip="Financial Year" CssClass="md-form-control form-control">
                                            </asp:DropDownList>

                                            <div class="validation_msg_box">
                                            </div>
                                            <label class="tess">
                                                <asp:Label ID="lblFinyear" runat="server" CssClass="styleReqFieldLabel" Text="Financial Year"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-4  styleFieldLabel">
                                        <div class="md-input">

                                            <asp:DropDownList ID="ddlItemHeader" runat="server" ToolTip="Item Header" CssClass="md-form-control form-control">
                                            </asp:DropDownList>

                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Upload" ErrorMessage="Select Item Header"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlItemHeader"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>


                                            <label class="tess">
                                                <asp:Label ID="lblItemHeader" runat="server" CssClass="styleReqFieldLabel" Text="Item Header"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4  styleFieldLabel">
                                        <div class="md-input">

                                            <asp:DropDownList ID="ddlAccountNature" runat="server" ToolTip="Account Nature" CssClass="md-form-control form-control">
                                            </asp:DropDownList>

                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Upload" ErrorMessage="Select Account Nature"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlAccountNature"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>

                                            <label class="tess">
                                                <asp:Label ID="Label1" runat="server" CssClass="styleReqFieldLabel" Text="Account Nature"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                </div>

                                <div class="row">

                                    <div class="col-lg-4  styleFieldLabel">
                                        <div class="md-input">

                                            <asp:DropDownList ID="ddlActivity" runat="server" ToolTip="Activity" CssClass="md-form-control form-control">
                                            </asp:DropDownList>

                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVActivity" ValidationGroup="Upload" ErrorMessage="Select Activity"
                                                    InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlActivity"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>

                                            <label class="tess">
                                                <asp:Label ID="lblActivity" runat="server" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 styleFieldLabel">

                                        <div class="md-input">

                                            <asp:FileUpload runat="server" CssClass="md-form-control btn border" ToolTip="File Upload" ID="flUpload" accept=".xls,.xlsx" />
                                            <div class="validation_msg_box" style="margin-top: 10px;">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Upload" ErrorMessage="Select File"
                                                    InitialValue="" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="flUpload"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <label class="tess">
                                                <asp:Label ID="lblfile" runat="server" CssClass="styleReqFieldLabel" Text="File Name"></asp:Label>
                                            </label>

                                        </div>


                                    </div>
                                    <div class="col-lg-4 styleFieldLabel">
                                        <div class="mt-4 text-center">
                                            <a runat="server" onserverclick="onDownloadTemplateClick" class="btn-link"><u>Download Template</u></a>
                                        </div>
                                    </div>

                                </div>

                                <asp:Label ID="lblErr" runat="server"></asp:Label>
                                <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </asp:Panel>

                    <div class="m-2 text-center">
                        <button class="css_btn_enabled" style="min-width: 84px !important;" id="btnFileupload" runat="server" onclick="if(fnCheckPageValidators_Extn())"
                            type="button" accesskey="U" causesvalidation="false" onserverclick="btnUpload_ServerClick" title="Upload[Alt+U]">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>U</u>pload
                        </button>
                        <%--<button class="css_btn_enabled" style="min-width: 84px !important;" onclick="return confirm('Do you want to Clear?');" id="btnClear" runat="server"
                            type="button" accesskey="L" title="Clear[Alt+L]"  onserverclick="btnClear_ServerClick" causesvalidation="false">
                            <i class="fa fa-trash"></i>&emsp;C<u>l</u>ear
                        </button>--%>

                          <button class="css_btn_enabled" id="Button1" runat="server"
                                    type="button" accesskey="l" causesvalidation="false" onserverclick="btnClear_ServerClick" onclick="if(fnConfirmClear('Do you want to Clear?'))" title="Clear[Alt+l]">
                                    <i class="fa fa-eraser"></i>&emsp;C<u>l</u>ear
                                </button>



                        <button class="css_btn_enabled" style="min-width: 84px !important;" id="btnSearch" runat="server"
                            type="button" accesskey="R" title="Search[Alt+R]" onserverclick="btnSearchClick" causesvalidation="false">
                            <i class="fa fa-search"></i>&emsp;Sea<u>r</u>ch
                        </button>
                        <button class="css_btn_enabled" style="min-width: 84px !important;" id="btnCancel" runat="server"
                            type="button" accesskey="X" title="Exit[Alt+X]" causesvalidation="false" onserverclick="btnCancelClick"   onclick="if(fnConfirmCancel('Do you want to Exit?'))">
                            <i class="fa fa-close"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>

                    <asp:Panel GroupingText="Upload Summary" ID="pnlSummary" runat="server" CssClass="stylePanel" Visible="false" Width="100%">
                        <div class="gird">
                            <asp:GridView ID="grvUploadSummary" runat="server" CssClass="styleInfoLabel" AutoGenerateColumns="false"
                                ToolTip="Summary Details" EmptyDataText="No Records Found" OnRowDataBound="grvUploadSummary_RowDataBound" OnRowDeleting="grvUploadSummary_RowDeleting"
                                ShowFooter="true" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Activity Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgram_Name" runat="server" Text='<%#Eval("Program_Name")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFProgram_Name" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" Width="20%"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="File Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFile_Name" runat="server" Text='<%#Eval("File_Name")%>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblFFile_Name" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" Width="20%"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Upload Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpload_ID" runat="server" Visible="false" Text='<%#Eval("Upload_ID")%>'></asp:Label>
                                            <asp:Label ID="lblUpload" runat="server" Text='<%# Eval("Upload_Status") %>' />
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblgvftrUpload" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="Exception" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblWithExceptionCount" runat="server" Text='<%# Eval("Exception") %>' />
                                            <asp:Label ID="lblcntsave" Visible="false" runat="server" Text='<%# Eval("cnt_save") %>' />
                                          
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblgvftrExceptionCoun" runat="server" CssClass="styleDisplayLabel" />
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:UpdatePanel ID="tempUpdate" runat="server">
                                                <ContentTemplate>



                                                    <asp:LinkButton ID="btnException" CssClass="text-info" runat="server" CausesValidation="false"
                                                        CommandName="Exception" Text="View/Exception" OnClick="btnException_Click" />

                                                    <asp:LinkButton ID="btnSave" CssClass="text-success" runat="server" CausesValidation="false"
                                                        Visible='<%# Eval("UPLOAD_STATUS").ToString() == "Validated" ? true : false %>' OnClientClick="return confirm('Do you want to Save this record?');" ToolTip="Save"
                                                        CommandName="Save" Text="Save" OnClick="btnSave_ServerClick" />

                                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="text-danger" CausesValidation="false"
                                                        OnClientClick="return confirm('Do you want to Delete this record?');" ToolTip="Delete"
                                                        CommandName="Delete" Text="Delete" AutoPostBack="true" />

                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnException" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center" Width="16%"></ItemStyle>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>
    </div>



</asp:Content>




