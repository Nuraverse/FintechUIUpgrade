<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysAdminUserLoginDetails.aspx.cs" Inherits="System_Admin_S3GSysAdminUserLoginDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register TagName="PageNavigator" TagPrefix="uc1" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagName="PageTransNavigator" TagPrefix="uc2" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <%--  <div runat="server">
        <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />
    </div>--%>

    <script type="text/javascript">


        function fnCheckPageValidators_Go(strValGrp, blnConfirm) {
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

                return true;

            }
            else {
                Page_BlockSubmit = false;
                return false;
            }
        }


        function UserName_ItemSelected(sender, e) {
            var hdnBranchID = $get('<%= hdnUserName.ClientID %>');
            hdnBranchID.value = e.get_value();
            document.getElementById('<%= BtnRefresh.ClientID %>').click();
        }
        function UserName_ItemPopulated(sender, e) {
            var hdnBranchID = $get('<%= hdnUserName.ClientID %>');
            hdnBranchID.value = '';
        }
        function Removetext(e) {
            document.getElementById('<%= hdnUserName.ClientID %>').value = e.value;

            if (e.value == "" || event.keyCode == 13) {
                document.getElementById('<%= BtnRefresh.ClientID %>').click();
            }
        }
        function ShowTrans() {
            document.getElementById('<%= PnlUserTrans.ClientID %>').style.display = 'block';
        }



    </script>

    <%--<asp:Timer ID="timer" runat="server" Interval="600000" Enabled="true" OnTick="Timer_Tick">
    </asp:Timer>--%>
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="User Login Details" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                <asp:UpdatePanel ID="Up" runat="server">
                    <ContentTemplate>



                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">

                                <cc1:TabContainer ID="tcLocation" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                    Width="100%" ScrollBars="None" TabStripPlacement="top" AutoPostBack="True" OnActiveTabChanged="tcLocation_ActiveTabChanged">

                                    <cc1:TabPanel runat="server" ID="tpLocationDef" CssClass="tabpan" BackColor="Red">
                                        <HeaderTemplate>
                                            User Login &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </HeaderTemplate>
                                        <ContentTemplate>

                                            <asp:Panel ID="PnlInputCriteria0" GroupingText="Input Criteria" runat="server" CssClass="stylePanel">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlLocation" runat="server" OnSelectedIndexChanged="ddlLocation_OnSelectedIndexChanged"
                                                                AutoPostBack="true" class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Location" ID="lblLocation" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
                                                        <div class="md-input">
                                                            <asp:RadioButtonList ID="RBList" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                                OnSelectedIndexChanged="RBList_SelectedIndexChanged" CssClass="md-form-control form-control radio">
                                                                <asp:ListItem Text="Active Users" Value="" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="All Users" Value="Yes"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtUserCount" runat="server" Text="0" Enabled="false"
                                                                Style="vertical-align: middle;"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Active Users Count" ID="lblUserCount" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div align="right">
                                                    <button class="css_btn_enabled" id="BtnRefresh" onserverclick="BtnRefresh_Click" runat="server"
                                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                    </button>
                                                </div>



                                            </asp:Panel>
                                        </ContentTemplate>
                                    </cc1:TabPanel>

                                    <cc1:TabPanel runat="server" ID="tabSession" CssClass="tabpan" BackColor="Red">
                                        <HeaderTemplate>
                                            Session Lock &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </HeaderTemplate>
                                        <ContentTemplate>

                                            <asp:Panel ID="Panel1" GroupingText="Input Criteria" runat="server" CssClass="stylePanel">
                                                <div class="row">

                                                    <div class="col-lg-4 col-md-6 styleFieldLabel">

                                                        <div class="md-input">


                                                            <us:Suggest ID="ddlUserId" runat="server" ServiceMethod="GetSessionUserList" ToolTip="User" IsMandatory="true"
                                                                ValidationGroup="Save" AutoPostBack="true" OnItem_Selected="OnUserChange" ErrorMessage="Select User" class="md-form-control form-control" />


                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="LblGlCode" CssClass="styleReqFieldLabel"
                                                                    Text="User"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-6 styleFieldLabel">

                                                        <div class="md-input">
                                                            <us:Suggest ID="ddlProgramId" runat="server" ServiceMethod="GetSessionProgramList" ToolTip="Program Name" OnItem_Selected="OnProgramIdChange"
                                                                AutoPostBack="true" ErrorMessage="Select Program Name" class="md-form-control form-control" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="Label1" CssClass=""
                                                                    Text="Program Name"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-6 styleFieldLabel">

                                                        <div class="md-input">
                                                            <us:Suggest ID="ddlPrgramRefNo" runat="server" ServiceMethod="GetSessionProgramRefNumList" ToolTip="Program Ref Number"
                                                                AutoPostBack="true" ErrorMessage="Select Program Ref Number" class="md-form-control form-control" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="Label2" CssClass=""
                                                                    Text="Program Ref Number"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div align="right">
                                                    <%--                     <button class="css_btn_enabled" id="btnSessionGO" onserverclick="BtnSessionGO_Click" runat="server" onclick="if(fnCheckPageValidators())"
                                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                    </button>--%>


                                                    <button class="css_btn_enabled" id="btnSave" runat="server" type="button" accesskey="O" causesvalidation="false" title="Go,Alt+O" onserverclick="BtnSessionGO_Click" onclick="if(fnCheckPageValidators_Go())">
                                                        <i class="fa fa-arrow-circle-right"></i>&emsp;G<u>o</u>
                                                    </button>

                                                    <button class="css_btn_enabled" id="btnClear" runat="server" type="button" accesskey="L" causesvalidation="false" title="Clear,Alt+L" onserverclick="BtnSessionClear_Click">
                                                        <i class="fa fa-eraser"></i>&emsp;C<u>l</u>ear
                                                    </button>

                                                </div>

                                            </asp:Panel>
                                        </ContentTemplate>
                                    </cc1:TabPanel>

                                </cc1:TabContainer>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 ">
                                <asp:Panel ID="PnlDetails" GroupingText="Details" runat="server" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                            <div class="gird">
                                                <div style="height: 290px; overflow-y: scroll;">
                                                    <asp:GridView ID="GrdUsers" DataKeyNames="Pagecounts,Company_ID,User_Name,Is_LoggedIn,User_ID,Is_CurrentlyActive"
                                                        runat="server" AutoGenerateColumns="false" OnRowCommand="GrdUsers_RowCommand"
                                                        OnRowDataBound="GrdUsers_RowDataBound" Width="100%">
                                                        <RowStyle HorizontalAlign="Left" />
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <Columns>
                                                            <asp:BoundField HeaderText="User Code" DataField="User_Code" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <table width="100%">
                                                                        <thead>
                                                                            <tr align="center">
                                                                                <th style="padding: 0px !important; background: none !important;">
                                                                                    <span>User Name</span>
                                                                                </th>
                                                                            </tr>
                                                                            <tr align="left">
                                                                                <th style="padding: 0px !important; background: none !important;">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox oncontextmenu="return false;" onpaste="return false;" ID="txtUserNameSearch"
                                                                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                            MaxLength="50" onkeyup="Removetext(this);"
                                                                                            OnTextChanged="txtUserNameSearch_OnTextChanged" ToolTip="Enter minimum 3 characters to begin search"
                                                                                            AutoPostBack="true"></asp:TextBox>
                                                                                        <cc1:AutoCompleteExtender ID="autoBranchSearch" MinimumPrefixLength="3" OnClientPopulated="UserName_ItemPopulated"
                                                                                            OnClientItemSelected="UserName_ItemSelected" runat="server" TargetControlID="txtUserNameSearch"
                                                                                            ServiceMethod="GetUserNameList" Enabled="True" ServicePath="" CompletionSetCount="5"
                                                                                            CompletionListCssClass="CompletionList" DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                                                                            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                                                            ShowOnlyCurrentWordInCompletionListItem="true">
                                                                                        </cc1:AutoCompleteExtender>
                                                                                        <cc1:TextBoxWatermarkExtender ID="txtUserNameSearchExtender" runat="server" TargetControlID="txtUserNameSearch"
                                                                                            WatermarkText="-- Search --">
                                                                                        </cc1:TextBoxWatermarkExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </th>
                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Designation" DataField="Designation" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Login Time" DataField="Last_LoginDate" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="LogOut Time" DataField="Last_LogOutDate" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                                                HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderTemplate>
                                                                    <span>History</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="ImgHistory" runat="server" ImageUrl="../Images/search_gray.jpg"
                                                                        CommandArgument='<%# Bind("User_ID") %>' CommandName="History" />
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                                                HeaderStyle-HorizontalAlign="Left">
                                                                <HeaderTemplate>
                                                                    <span>Logged In</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="ChkDisconnect" runat="server" />
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                                    <asp:HiddenField ID="hdnUserName" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                            <div class="gird">
                                                <div style="display: none;">
                                                    <asp:GridView ID="GrdUsersExcel" runat="server" DataKeyNames="Is_LoggedIn,Is_CurrentlyActive"
                                                        OnRowDataBound="GrdUsersExcel_RowDataBound" AutoGenerateColumns="false" Width="100%">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="User Code" DataField="User_Code" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="User Name" DataField="User_Name" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Designation" DataField="Designation" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Login Time" DataField="Last_LoginDate" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="LogOut Time" DataField="Last_LogOutDate" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Logged In" DataField="Is_LoggedIn" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                            <input type="hidden" id="hdnSortDirection" runat="server" />
                                            <input type="hidden" id="hdnSortExpression" runat="server" />
                                            <input type="hidden" id="hdnSearch" runat="server" />
                                            <input type="hidden" id="hdnOrderBy" runat="server" />
                                            <input type="hidden" id="hdnShowAll" runat="server" />
                                        </div>
                                    </div>
                                    <div align="right">
                                        <button id="BtnExportToExcel" runat="server" accesskey="X" title="Export To Excel[Alt+X]" class="css_btn_enabled" type="button"
                                            tooltip="Excel" onserverclick="BtnExportToExcel_Click">
                                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Export To E<u>x</u>cel    
                                        </button>
                                        <button id="BtnDisconnect" runat="server" accesskey="D" title="Disconnect Users[Alt+D]" class="css_btn_enabled" type="button"
                                            tooltip="Disconnect Users" onserverclick="BtnDisconnect_Click">
                                            <i class="fa fa-user-times" aria-hidden="true"></i>&emsp;Export To <u>D</u>isconnect Users  
                                        </button>
                                        <div style="display: none">
                                            <button class="css_btn_enabled" id="BtnShowAll" onserverclick="BtnShowAll_Click" title="Show All Users, Alt+H" runat="server"
                                                type="button" accesskey="H">
                                                <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                                            </button>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="PnlSessionDtl" Style="padding: 20px 206px 5px 206px;" GroupingText="Details" runat="server" CssClass="stylePanel">

                                    <div style="overflow-x: hidden; overflow-y: auto; max-height: 350px; text-align: center" class="grid">
                                        <asp:GridView ID="grvSessionDetails" runat="server" ShowFooter="true" AutoGenerateColumns="false" OnRowCommand="grvSessionDetails_RowCommand">
                                            <Columns>
                                                <asp:BoundField DataField="SL_No" HeaderText="S.No" />
                                                <asp:BoundField DataField="PROGRAM_NAME" HeaderText="Program Name" />
                                                <asp:BoundField DataField="Doc_No" HeaderText="Document Number" />
                                                <asp:BoundField DataField="LOCKING_DATE" HeaderText="Lock Date" />
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Select" HeaderStyle-CssClass="styleGridHeader" Visible="true">
                                                    <ItemTemplate>

                                                        <%--                 <asp:Button ID="btnRemoveDays" Text="Delete" CssClass="grid_btn_delete" AccessKey="R" ToolTip="Delete [Alt+R]"
                                                                                        CommandName="RemoveLock" runat="server"
                                                                                        CausesValidation="false" OnClientClick="return confirm('Are you sure want to delete this record?');" />--%>


                                                        <asp:Button ID="lnkRemove" CssClass="grid_btn_delete" runat="server" CausesValidation="false" CommandName="RemoveLock"
                                                            Text="Remove" CommandArgument='<%# Eval("SESSION_ID") %>' EnableTheming="False" OnClientClick="return confirm('Are you sure want to Remove this Session Lock?');"></asp:Button>


                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>

                                        </asp:GridView>

                                    </div>
                                </asp:Panel>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                <asp:Panel ID="PnlUserTrans" runat="server" Width="70%" GroupingText="User Login Transaction Details"
                                    Style="position: absolute; margin-left: 80px; margin-top: 15px;" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                            <div style="height: 310px; overflow-y: scroll;">
                                                <asp:UpdatePanel ID="UpTransDetails" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtFromDate" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="From Date" Visible="false" />
                                                                    <cc1:CalendarExtender ID="CEFromDate" runat="server" Enabled="True" Format="dd-MMM-yyyy"
                                                                        PopupButtonID="Image1" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="From Date" ID="lblFromDate" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtToDate" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="To Date" Visible="false" />
                                                                    <cc1:CalendarExtender ID="CEToDate" runat="server" Enabled="True" Format="dd-MMM-yyyy"
                                                                        PopupButtonID="Image2" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="To Date" ID="lblToDate" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div align="right">
                                                            <button class="css_btn_enabled" id="btnSearchTrans" onserverclick="btnSearchTrans_Click" title="Filter, Alt+F" runat="server"
                                                                type="button" accesskey="F">
                                                                <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>F</u>ilter
                                                            </button>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                                                <div class="gird">
                                                                    <asp:GridView ID="GrdTransDetails" runat="server" DataKeyNames="Pagecounts" AutoGenerateColumns="false"
                                                                        Width="100%">
                                                                        <RowStyle HorizontalAlign="Left" />
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <Columns>
                                                                            <asp:BoundField HeaderText="Logged In" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                                DataField="LoggedIn_Date" HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left"
                                                                                ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                            <asp:BoundField HeaderText="Logged Out" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                                DataField="LoggedOut_Date" HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left"
                                                                                ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                            <asp:BoundField HeaderText="IP Address" DataField="IP_Address" HeaderStyle-CssClass="styleGridHeader"
                                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                            <asp:BoundField HeaderText="Host Name" DataField="Host_Name" HeaderStyle-CssClass="styleGridHeader"
                                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                            <asp:BoundField HeaderText="LogOut Status" DataField="LogOut_Status_Code" HeaderStyle-CssClass="styleGridHeader"
                                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                    <%--ctl00$ContentPlaceHolder1$UCCustomTransPaging$txtPageSize--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div style="display: none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                                                <div class="gird">
                                                                    <asp:GridView ID="GrdTransDetailsExcel" runat="server" DataKeyNames="Pagecounts"
                                                                        AutoGenerateColumns="false" Width="100%">
                                                                        <RowStyle HorizontalAlign="Left" />
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <Columns>
                                                                            <asp:BoundField HeaderText="Logged In" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                                DataField="LoggedIn_Date" HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left"
                                                                                ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                            <asp:BoundField HeaderText="Logged Out" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                                DataField="LoggedOut_Date" HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left"
                                                                                ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                            <asp:BoundField HeaderText="IP Address" DataField="IP_Address" HeaderStyle-CssClass="styleGridHeader"
                                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                            <asp:BoundField HeaderText="Host Name" DataField="Host_Name" HeaderStyle-CssClass="styleGridHeader"
                                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                            <asp:BoundField HeaderText="LogOut Status" DataField="LogOut_Status_Code" HeaderStyle-CssClass="styleGridHeader"
                                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:BoundField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                                                <uc2:PageTransNavigator ID="UCCustomTransPaging" Visible="false" runat="server"></uc2:PageTransNavigator>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                                                <input type="hidden" id="hdnTransSortDirection" runat="server" />
                                                                <input type="hidden" id="hdnTransSortExpression" runat="server" />
                                                                <input type="hidden" id="hdnTransSearch" runat="server" />
                                                                <input type="hidden" id="hdnTransOrderBy" runat="server" />
                                                            </div>
                                                        </div>
                                                        <div align="right">
                                                            <button id="BtnExportTrans" runat="server" accesskey="X" title="Export To Excel[Alt+X]" class="css_btn_enabled" type="button"
                                                                tooltip="Export To Excel" onserverclick="BtnExportTrans_Click">
                                                                <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Export To E<u>x</u>cel    
                                                            </button>
                                                            <button id="BtnCloseTransPanel" runat="server" accesskey="C" title="Close[Alt+C]" class="css_btn_enabled" type="button"
                                                                tooltip="Close" onserverclick="BtnCloseTransPanel_Click">
                                                                <i class="fa fa-user-times" aria-hidden="true"></i>&emsp; <u>C</u>lose
                                                            </button>
                                                        </div>
                                                        <asp:HiddenField ID="hdnUserId" runat="server" />
                                                        <asp:HiddenField ID="HdnCompanyId" runat="server" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="BtnExportTrans" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <%--<asp:AsyncPostBackTrigger ControlID="timer" />--%>
                        <asp:AsyncPostBackTrigger ControlID="BtnCloseTransPanel" />
                        <asp:PostBackTrigger ControlID="BtnExportToExcel" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
