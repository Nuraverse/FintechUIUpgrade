<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FATransLander, App_Web_skbf4x1n" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function Location_ItemSelected(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = e.get_value();
        }
        function Location_ItemPopulated(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = '';
        }
        function Branch_ItemSelected(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = e.get_value();
        }
        function Branch_ItemPopulated(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = '';
        }
    </script>
    <%--Design Started--%>
     <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel">
                    </asp:Label>

                </h6>
            </div>
        </div>





        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList ID="ComboBoxLocationSearch" runat="server"
                        class="md-form-control form-control">
                    </asp:DropDownList>
                    <asp:HiddenField ID="hdnBranchID" runat="server" />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Text="Branch" runat="server" ID="lblLocationSearch" CssClass="styleReqFieldLabel" />

                    </label>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:TextBox ID="txtStartDateSearch" runat="server" OnTextChanged="txtStartDateSearch_TextChanged"
                        AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                    <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                    <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                        PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                    </cc1:CalendarExtender>
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn"
                            Enabled="false" runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                            ErrorMessage="Enter a Start Date" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
              <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:TextBox ID="txtEndDateSearch" runat="server" OnTextChanged="txtEndDateSearch_TextChanged"
                        AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                        PopupButtonID="imgEndDate" TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                    </cc1:CalendarExtender>
                    <asp:Image runat="server" ID="imgEndDate" Visible="false" />
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                            Enabled="false" runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True"
                            ErrorMessage="Enter a End Date" Display="None">
                        </asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                    </label>

                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">

                    <asp:RadioButton ID="rdoManual" AutoPostBack="true" CssClass="styleDisplayLabel"
                        OnCheckedChanged="Journal_OnCheckedChanged" Visible="false" Checked="true" runat="server"
                        GroupName="DocYes" Text="Manual Journal" />
                    <asp:RadioButton ID="rdoSystem" AutoPostBack="true" CssClass="styleDisplayLabel"
                        OnCheckedChanged="Journal_OnCheckedChanged" Visible="false" GroupName="DocYes"
                        runat="server" Text="System Journal" />
                    <UC:Suggest ID="cmbDocumentNumberSearch" runat="server" ServiceMethod="GetDocNumber" />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Text="" runat="server" ID="lblProgramIDSearch" CssClass="styleDisplayLabel" />
                        <asp:Label Text="Journal Type" Visible="false" runat="server" ID="lblJVType" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>

          
            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:TextBox ID="cmbJournalNo" runat="server" OnTextChanged="cmbJournalNo_OnTextChanged"
                        AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true">
                    </asp:TextBox>
                    <cc1:AutoCompleteExtender ID="autoLocationSearch" MinimumPrefixLength="3" OnClientPopulated="Location_ItemPopulated"
                        OnClientItemSelected="Location_ItemSelected" runat="server" TargetControlID="cmbJournalNo"
                        ServiceMethod="GetBranchList" Enabled="True" ServicePath="" CompletionSetCount="5"
                        CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                        ShowOnlyCurrentWordInCompletionListItem="true" CompletionInterval="0">
                    </cc1:AutoCompleteExtender>
                    <cc1:TextBoxWatermarkExtender ID="txtJournalNumberExtender" runat="server" TargetControlID="cmbJournalNo"
                        WatermarkText="--Select--">
                    </cc1:TextBoxWatermarkExtender>
                    <asp:HiddenField ID="hdnCommonID" runat="server" />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Text="Journal Number" Visible="false" runat="server" ID="lblJVNo" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>



            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <label>
                        <asp:Label Visible="false" Text="Transaction" runat="server" ID="lblMultipleDNC"
                            CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList Visible="false" ID="ddlDNCOption" runat="server"
                        class="md-form-control form-control">
                    </asp:DropDownList>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Visible="false" Text="Select Status" runat="server" ID="lblDNCOption"
                            CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList Visible="false" AutoPostBack="true" ID="ddlMultipleDNC" runat="server"
                        Width="185px" OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Visible="false" Text="Transaction" runat="server" ID="Label1" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlTransationType"  runat="server" class="md-form-control form-control"  AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                  
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Transaction Type" ID="lblTransactionType" CssClass="styleDisplayLabel"
                                                                            ToolTip="Transaction Type"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

            
        </div>

    

    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
       <div class="gird">
    
            <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound">
                <Columns>
                    <%--Query Column--%>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle CssClass="styleGridHeader" />
                        <HeaderTemplate>
                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--Edit Column--%>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle CssClass="styleGridHeader" />
                        <HeaderTemplate>
                            <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                CommandArgument='<%# Bind("ID") %>' CommandName="Modify" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false">
                        <HeaderStyle CssClass="styleGridHeader" />
                        <HeaderTemplate>
                            <asp:Label ID="lblPrint" runat="server" Text="Print"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgbtnPrint" CssClass="styleGridEdit" ImageUrl="~/Images/pdf.png"
                                CommandArgument='<%# Bind("ID") %>' CommandName="Print" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--Created by - User ID Column--%>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                            <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
           </div>
            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
       
          </div>
        </div>
      
   

    <div class="btn_height"></div>
            <div align="right" class="fixed_btn" >
                <button class="css_btn_enabled" id="btnSearch" title="Search[Alt+S]" causesvalidation="false" onserverclick="btnSearch_Click" runat="server"
                    type="button" accesskey="S" validationgroup="RFVDTransLander">
                    <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                </button>
                <button class="css_btn_enabled" id="btnCreate" title="Create[Alt+C]" causesvalidation="false" onserverclick="btnCreate_Click" runat="server"
                    type="button" accesskey="C">
                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>C</u>reate
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear_FA[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>


            </div>
                     </div>
         </div>
  
   <div>
       <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
   </div>
       
        <div>
            <%--Hidden fields for grid usage--%>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
            <input id="hidDate" type="hidden" runat="server" />
        </div>
    <div>
        
            <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                ShowSummary="true" />
       </div>
</asp:Content>
