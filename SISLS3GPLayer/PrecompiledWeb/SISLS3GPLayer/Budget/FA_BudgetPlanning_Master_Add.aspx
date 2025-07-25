<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Budget_BudgetPlanning_Master, App_Web_rj0nx3uf" title="S3G - Budjet Planning Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>
<%--<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>--%>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>

        <style type="text/css">
            .switch {
                position: relative;
                display: inline-block;
                width: 40px;
                height: 20px;
                margin-top: 9px;
            }

                .switch input {
                    display: none;
                }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
            }

                .slider:before {
                    position: absolute;
                    content: "";
                    height: 13px;
                    width: 13px;
                    left: 3px;
                    bottom: 4px;
                    background-color: white;
                    transition: .4s;
                }

                .slider:after {
                    left: 3px;
                }


            /* include generated hidden field here */
            input[type="checkbox"]:checked + input[type="hidden"] + .slider,
            input[type="checkbox"]:checked + .slider {
                background-color: #336699;
            }

            /* include generated hidden field here */
            input[type="checkbox"]:focus + input[type="hidden"] + .slider,
            input[type="checkbox"]:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            /* include generated hidden field here */
            input[type="checkbox"]:checked + input[type="hidden"] + .slider:before,
            input[type="checkbox"]:checked + .slider:before {
                transform: translateX(20px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

                .slider.round:before {
                    border-radius: 50%;
                }

                .custom-checkbox .custom-control-label::before {border-color: transparent; background-color: transparent;}
.custom-checkbox .custom-control-label::after {background-image: url(five-pointed-star.svg); background-size: 100%;}
.custom-checkbox .custom-control-input:checked~.custom-control-label::before {border-color: transparent; background-color: transparent;}
.custom-checkbox .custom-control-input:checked~.custom-control-label::after {background-image: url(five-pointed-star-selected.svg); background-size: 100%;}

        </style>
    </head>
    <script language="javascript" type="text/javascript">

        function Alert(type, title, msg) {
            switch (type) {
                case "basic":
                    swal({
                        Text: msg
                    });
                    break;
                case "success":
                    swal(title, msg, "success");
                    break;
                case "error":
                    swal(title, msg, "error");
                    break;
                case "warning":
                    swal(title, msg, "warning");
                    break;
            }

        }
        function fnConfirmSave() {

            if (confirm('Do you want to Save?')) {
                return true;
            }
            else
                return false;

        }
        function fnConfirmClear() {

            if (confirm('Do you want to Clear?')) {
                return true;
            }
            else
                return false;
        }

        function fnConfirmLock() {

            if (confirm('Do you want to Lock this budget?')) {
                return true;
            }
            else
                return false;
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

      

    </script>

    <asp:UpdatePanel ID="PnlBudgetPalnning" runat="server">
        <ContentTemplate>

            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading"></asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div id="divpnlHierarchyType" runat="server">
                            <asp:Panel ID="pnlHierarchyType" runat="server" GroupingText="Hierarchy Type" CssClass="stylePanel"
                                Visible="false">

                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:RadioButtonList ID="rblHierarchy" runat="server" RepeatDirection="Horizontal"
                                                ValidationGroup="vgLocationGroup">
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="rfvHierarchy" runat="server" ValidationGroup="vgLocationGroup"
                                                Display="None" InitialValue="" ControlToValidate="rblHierarchy" ErrorMessage="Select the Hierarchy Type"></asp:RequiredFieldValidator>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <span class="styleReqFieldLabel">Hierarchy Type</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div id="divLocationCatDetails" runat="server">
                            <asp:Panel Visible="true" runat="server" ID="pnlBudgetMaster" GroupingText="Budget Planning"
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
                                                        <asp:Label ID="lblLocationCode" runat="server" CssClass="styleReqFieldLabel" Text="Financial Year"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 styleFieldLabel">
                                                <div class="md-input">

                                                    <asp:DropDownList ID="ddlCurrency" Style="background-color: white;" runat="server" ValidationGroup="Save" ToolTip="Currency" CssClass="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVCurrency" ValidationGroup="Save" ErrorMessage="Select Currency"
                                                            InitialValue="--Select--" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlCurrency"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCurrency" runat="server" Text="Currency"
                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtYearBudget" runat="server" AutoPostBack="true" OnTextChanged="onTxtYEarbudgetChange" onkeypress="return isNumberKey(event)" ValidationGroup="Save" MaxLength="15" autocomplete="off" class="md-form-control form-control login_form_content_input text-right requires_true"></asp:TextBox>


                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVYearBudget" ValidationGroup="Save" ErrorMessage="Enter Year Budget Amount"
                                                            InitialValue="" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtYearBudget"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblYearbudget" runat="server" Text="Year Budget" CssClass="styleReqFieldLabel"></asp:Label><br />
                                                    </label>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">

                                            <div class="col-lg-4 col-md-6 styleFieldLabel">

                                                <div class="md-input">
                                                    <uc2:Suggest ID="ddlGlAccounts" runat="server" ServiceMethod="GetGLList" ToolTip="GL Account" IsMandatory="true"
                                                        ValidationGroup="Save" OnItem_Selected="onGlChange"  AutoPostBack="true" ErrorMessage="Select GL Account" class="md-form-control form-control" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="LblGlCode" CssClass="styleReqFieldLabel"
                                                            Text="GL Account"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4  styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlActivity" runat="server" ToolTip="Activity" OnSelectedIndexChanged="onGlActivityChange" AutoPostBack="true" ValidationGroup="Save" CssClass="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Save" ErrorMessage="Select Activity"
                                                            InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlActivity"
                                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label runat="server" Text="Activity" CssClass="styleReqFieldLabel" ID="Label3"></asp:Label>
                                                    </label>

                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 styleFieldLabel">
                                                <div class="md-value">
                                                    <label>
                                                        <asp:Label runat="server" Text="Branch" CssClass="styleReqFieldLabel" ID="Label2"></asp:Label>
                                                    </label>
                                                </div>
                                                <div style="overflow-x: hidden; overflow-y: auto; max-height: 120px; text-align: center" class="grid">
                                                    <asp:GridView runat="server" ID="grvLocationList" HeaderStyle-CssClass="styleGridHeader" Width="100%"
                                                        OnRowDataBound="grvLocation_RowDataBound" AutoGenerateColumns="False" class="grid_details">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Branch"
                                                                HeaderStyle-Width="70%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLOB" runat="server" ToolTip='<%#Eval("location_name")%>' Text='<%#Eval("location_name")%>'></asp:Label>
                                                                    <asp:Label ID="lblLOCID" runat="server" Visible="false" Text='<%#Eval("location_name")%>'></asp:Label>
                                                                    <asp:TextBox ID="txtLocId" Visible="false" AutoPostBack="true" Text='<%#Eval("location_id")%>' runat="server"></asp:TextBox>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-Width="30%">
                                                               <%-- <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkSelectAllLI" runat="server"></asp:CheckBox>
                                                                </HeaderTemplate>--%>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelectLI" runat="server"></asp:CheckBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <RowStyle HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="row">

                                            <div class="col-lg-3 col-md-4 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlBudgetPattern" runat="server" ToolTip="Budget Pattern" OnSelectedIndexChanged="onBudgetPatternChange" AutoPostBack="true" CssClass="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Budget Pattern" CssClass="styleReqFieldLabel" ID="lblBudgetPattern"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-1 mt-2 styleFieldLabel">
                                                <button class="css_btn_enabled" style="min-width: 84px !important;" id="btnGo" onserverclick="onGoclick" runat="server"
                                                    type="button" causesvalidation="false" title="Exit[Alt+G]" accesskey="G">
                                                    <i class="fa fa-arrow-circle-right"></i>&emsp;<u>G</u>o
                                                </button>
                                            </div>

                                            <div class="col-md-4 mt-2 styleFieldLabel">
                                                <div class="md-value">
                                                    <label>
                                                        <asp:Label runat="server" Text="Active" ID="Label4"></asp:Label>
                                                    </label>
                                                </div>

                                                <label class="switch ">
                                                    <input type="checkbox" disabled="disabled" class="md-form-control form-control" runat="server" id="CbxActive" checked="checked" />
                                                    <span class="slider round"></span>
                                                </label>
                                                <span class="highlight"></span>

                                            </div>

                                            <div class="col-md-2 mt-2 styleFieldLabel">
                                                <button class="css_btn_enabled" style="min-width: 84px !important;" id="btnCopyProfile" runat="server" title="Exit[Alt+P]" accesskey="P"
                                                    type="button" data-toggle="modal" data-target="#copyProfileModal" causesvalidation="false">
                                                    <i class="fa fa-copy"></i>&emsp;Copy <u>P</u>rofile
                                                </button>

                                            </div>
                                            <div class="col-md-2 mt-2 styleFieldLabel">

                                                <asp:LinkButton ID="lnkBudgetLock" runat="server" OnClientClick="return fnConfirmLock(this);"
                                                    OnClick="onLockbudgetClick">
                                                    <span>
                                                        <h5><i class="fa fa-unlock-alt btn-lg" id="icoUnlock" runat="server" style="cursor: pointer;" aria-hidden="true"></i>
                                                           
                                                        </h5>
                                                        Budget Lock</span>
                                                </asp:LinkButton>
                                                  <span id="icolock" runat="server">
                                                <h5>  <i class="fa fa-lock btn-lg"  runat="server"  aria-hidden="true"></i>
                                                       </h5>
                                                        Budget Lock</span>
                                            </div>
                                            
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6  styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:Panel ID="pnlCurrentBudget" Visible="false" GroupingText="Current year Budget Details" runat="server" CssClass="stylePanel">

                                                           <div style="overflow-x: hidden; overflow-y: auto; max-height: 200px; text-align: center" class="grid">
                                                        <asp:GridView ID="grvCurrentYearBudget" runat="server" ShowFooter="true" AutoGenerateColumns="false" OnRowDeleting="GRDealerCommisionRate_RowDeleting"
                                                            OnRowDataBound="GridViewYearBudget_RowDataBound">
                                                            <Columns>

                                                                <asp:TemplateField HeaderText="Year" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:DropDownList ID="ddlCurrentBudYear" OnSelectedIndexChanged="onddlCurrentBudYearChange" AutoPostBack="true" Visible="false" class="md-form-control form-control" Style="text-align: center; max-width: 100px;" runat="server">
                                                                        </asp:DropDownList>
                                                                        <asp:TextBox ID="txtBudgetYear" class="md-form-control form-control" Style="text-align: right; max-width: 100px;" Text='<%#Eval("Year")%>' runat="server"></asp:TextBox>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Budget" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtBudget" AutoPostBack="true" onkeypress="return isNumberKey(event)" OnTextChanged="onCurrentBudgetChange"
                                                                            autocomplete="off" class="md-form-control form-control" Style="text-align: right; max-width: 100px;" Text='<%#Eval("Budget")%>' runat="server"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <%--<span><i class="fa fa-trash" runat="server"></i></span>--%>

                                                                        <asp:Button ID="btnDeleteRow" runat="server" ItemStyle-CssClass="fa fa-trash" Text="Delete" CommandName="Delete" CssClass="grid_btn_delete" AccessKey="T" ToolTip="Delete, Alt+T" OnClientClick="return confirm('Do you want to delete this record?');" />
                                                                    </ItemTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                    <FooterTemplate>

                                                                        <button id="btnAddNew" class="css_btn_enabled" style="min-width: 84px !important;" runat="server"
                                                                            type="button" accesskey="N" causesvalidation="false" title="Add New[Alt+N]" onserverclick="AddNewRowToGrid">
                                                                            <i class="fa fa-plus"></i>&emsp;<u>A</u>dd New
                                                                        </button>

                                                                    </FooterTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>

                                                        </asp:GridView>
                                                               </div>

                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 styleFieldLabel">

                                                <div class="md-input">
                                                    <asp:Panel ID="pnlPrjBudget" GroupingText="Projected Budget Details" Visible="false" runat="server" CssClass="stylePanel">
                                                           <div style="overflow-x: hidden; overflow-y: auto; max-height: 200px; text-align: center" class="grid">
                                                        <asp:GridView runat="server" ID="grvProjectedBudget" HeaderStyle-CssClass="styleGridHeader"
                                                            AutoGenerateColumns="False" class="gird_details">
                                                            <Columns>
                                                                <asp:BoundField DataField="year" HeaderText="Year" />

                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Budget" HeaderStyle-CssClass="styleGridHeader" Visible="true">
                                                                    <ItemTemplate>

                                                                        <asp:TextBox ID="txtPrjbudget" class="md-form-control form-control text-right"  AutoPostBack="true" OnTextChanged="onProjectedBudgetChange" onkeypress="return isNumberKey(event)" autocomplete="off" Style="max-width: 100px;" runat="server"
                                                                            Text='<%# Eval("budget") %>'
                                                                            Visible="true"></asp:TextBox>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                            <RowStyle HorizontalAlign="Center" />

                                                        </asp:GridView>
                                                               </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>



                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                            <div class="btn_height"></div>
                            <div align="right" class="fixed_btn">
                                <button class="css_btn_enabled" id="btnSave" runat="server" type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" onserverclick="btnSaveClick" onclick="if(fnCheckPageValidators())">
                                    <i class="fa fa-floppy-o"></i>&emsp;<u>S</u>ave
                                </button>

                                <button class="css_btn_enabled" id="btnClear" runat="server"
                                    type="button" accesskey="l" causesvalidation="false" onserverclick="btnClearClick" onclick="if(fnConfirmClear('Do you want to Clear?'))" title="Clear[Alt+l]">
                                    <i class="fa fa-eraser"></i>&emsp;C<u>l</u>ear
                                </button>

                                <button class="css_btn_enabled" id="btnExit" runat="server" causesvalidation="false" onserverclick="btnExitClick" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                                    type="button" accesskey="X">
                                    <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>

                            </div>
                        </div>
                    </div>
                </div>


                <!--Copy Profile Modal -->
                <div id="copyProfileModal" data-backdrop="static" data-keyboard="false" class="modal fade" role="dialog">
                    <div class="modal-dialog" style="width: 60%">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title">Copy Profile</h4>
                            </div>
                            <div class="modal-body">
                                <asp:Panel ID="Panel2" GroupingText="Copy Profile" runat="server" CssClass="stylePanel">
                                    <div style="overflow-x: hidden; overflow-y: auto; max-height: 350px; text-align: center" class="grid">
                                        <asp:GridView ID="grvCopyProfile" runat="server" ShowFooter="true" AutoGenerateColumns="false" OnRowCommand="grvCopyProfile_RowCommand">
                                            <Columns>
                                                <asp:BoundField DataField="fin_Year" HeaderText="Financial Year" />
                                                <asp:BoundField DataField="Gl_Name" HeaderText="GL Account" />
                                                <asp:BoundField DataField="Activity" HeaderText="Activity" />
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Select" HeaderStyle-CssClass="styleGridHeader" Visible="true">
                                                    <ItemTemplate>

                                                        <u>
                                                            <asp:LinkButton ID="lnkCopy" Style="text-decoration: underline; color: #0324fc;" runat="server" CausesValidation="false" CommandName="CopyProfile"
                                                                Text="Select" CommandArgument='<%# Eval("Budget_Id") %>' EnableTheming="False">
                                                            </asp:LinkButton></u>

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>

                                        </asp:GridView>
                                    </div>
                                </asp:Panel>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="css_btn_enabled" accesskey="C" title="Exit[Alt+C]" data-dismiss="modal"><i class="fa fa-times"></i>&emsp;<u>C</u>lose</button>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
