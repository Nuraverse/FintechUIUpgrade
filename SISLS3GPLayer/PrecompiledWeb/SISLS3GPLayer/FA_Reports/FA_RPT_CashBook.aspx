<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_RPT_CashBook, App_Web_ygb51gin" title="Untitled Page" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register TagPrefix="uc2" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Cash Book Report" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                                <div class="row">
                                     <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlActivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" 
                                                AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ControlToValidate="ddlActivity"
                                                    InitialValue="--Select--" ErrorMessage="Select Activity" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                             <%--<asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                            </asp:DropDownList>--%>
                                            <%--<div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvLocation1" runat="server"
                                                    ErrorMessage="Select Branch" ControlToValidate="ddlLocation" CssClass="validation_msg_box_sapn"
                                                    InitialValue="0" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblLocation" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkremarks" runat="server" ToolTip="Remarks" AutoPostBack="true" />
                                            <asp:Label runat="server" ID="lblremarks" Text="Remarks" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlglcode" runat="server" OnItem_Selected="ddlglcode_SelectedIndexChanged" IsMandatory="true" ValidationGroup="Main"
                                                AutoPostBack="true" ServiceMethod="GetGLCodeList" ErrorMessage="Select GL Account" />
                                            <%--<cc1:ComboBox ID="ddlglcode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlglcode_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>--%>
                                            <%-- <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvddlglcode" runat="server"
                                                    ErrorMessage="Select GL Account" ControlToValidate="ddlglcode" CssClass="validation_msg_box_sapn"
                                                    InitialValue="--Select--" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblglcode" CssClass="styleReqFieldLabel" Text="GL Account"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlslcode" runat="server" OnItem_Selected="ddlslcode_SelectedIndexChanged"
                                                AutoPostBack="true" ServiceMethod="GetSLCodeList"  watermarktext="ALL"  />
                                            <%--  <cc1:ComboBox ID="ddlslcode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlslcode_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblSLCode" CssClass="styleDisplayLabel" Text="SL Account"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDateSearch" runat="server"
                                                AutoPostBack="True" onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtStartDateSearch_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFromdate" runat="server" ControlToValidate="txtStartDateSearch"
                                                    Display="Dynamic" ErrorMessage="Select Start Date" SetFocusOnError="True"
                                                    ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="From Date" ID="lblStartDateSearch" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEndDateSearch" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                AutoPostBack="True" OnTextChanged="txtEndDateSearch_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgEndDate" TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:Image runat="server" ID="imgEndDate" Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvenddate" runat="server" ControlToValidate="txtEndDateSearch"
                                                    Display="Dynamic" ErrorMessage="Select End Date" SetFocusOnError="True"
                                                    ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblEndDateSearch" Text="To Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddltypeofReport" runat="server" Visible="false"
                                                class="md-form-control form-control">
                                                <%--<asp:ListItem Value="0" Text="--Select--" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Receipt"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="Payment"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                            <%--<div class="validation_msg_box">
                                                <%--<asp:RequiredFieldValidator ID="rfvddltypeofReport" runat="server" ControlToValidate="ddltypeofReport"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbltypeofReport" runat="server" Visible="false" CssClass="styleDisplayLabel" Text="Type of Report"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div align="right">

                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Main" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclick="if( fnConfirmClear())"
                            type="button" accesskey="L" title="Clear[Alt+L]" onserverclick="btnClear_Click">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="BtnCancel" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())" onserverclick="BtnCancel_Click" 
                            type="button" accesskey="X" title="Exit[Alt+X]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>

                       <button class="css_btn_enabled" id="BtnPrint" onserverclick="BtnPrint_Click" validationgroup="Print" runat="server"
                            type="button" causesvalidation="false" accesskey="P" title="Print,Alt+P" visible="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>

                   
                    </div>
                  <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                           <asp:Panel ID="pnlTransactionDetails" runat="server" Visible="false" GroupingText="Cash Book Report"
                                Width="100%" CssClass="stylePanel">
                                <asp:Label ID="lblLocationG" runat="server" Text="Location" Visible="false" />
                                <asp:Label ID="lblUserName" Font-Size="Small" runat="server" Text="User Name" Visible="false" />
                                <asp:Label ID="lblOpenBal" runat="server" Text="" />

                                <%--                                <div style="height: 250px; overflow: auto">--%>
                                <asp:Panel ID="pnlScroll" runat="server" GroupingText="" Width="100%" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvAccountLedger" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                                RowStyle-Width="0" OnRowDataBound="gvAccountLedger_RowDataBound" Width="100%">
                                                                <Columns>
                                                                    <%--Serial Number--%>
                                                                    <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                    <%--Location--%>
                                                                    <asp:TemplateField HeaderText="Branch">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                    </asp:TemplateField>
                                                                    <%--Doc Date --%>
                                                                    <asp:TemplateField HeaderText="Document Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <%--Doc No --%>
                                                                    <asp:TemplateField HeaderText="Document Number">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <%--Value Date --%>
                                                                    <asp:TemplateField HeaderText="Value Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("Value_Date") %>' ToolTip="Value Date" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <%--Account --%>
                                                                    <%--  <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                    <%--Description --%>
                                                                    <asp:TemplateField HeaderText="Description">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' />

                                                                            <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />
                                                                            <asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                                            <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotalD" runat="server" Text="Total :" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%--SL Code--%>
                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSubAccount" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                    </asp:TemplateField>
                                                                    <%--Debit--%>
                                                                    <asp:TemplateField HeaderText="Debit">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <%--Credit--%>
                                                                    <asp:TemplateField HeaderText="Credit">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <%--Balance--%>
                                                                    <asp:TemplateField HeaderText="Balance">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance1") %>' ToolTip="Balance" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotBalance" runat="server" Text="" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <uc2:PageNavigator ID="ucCustomPaging" runat="server"></uc2:PageNavigator>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <%--  </div>--%>
                            </asp:Panel>

                      </div>
                      </div>
                         <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvprint" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                    RowStyle-Width="0" Width="100%" DataKeyNames="GL_Code">

                                    <Columns>
                                        <%--Serial Number--%>
                                        <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                        <%--Location--%>

                                        <asp:TemplateField HeaderText="Branch">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="7%" />
                                        </asp:TemplateField>
                                        <%--     <asp:TemplateField HeaderText="Add" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="3%" >
                                                        <ItemTemplate>
                                                            <a href="JavaScript:divexpandcollapse('div<%# Eval("Gl_code")%>');">

                                                                <img id='imgdiv<%# Eval("Gl_code")%>' alt="Add" width="15px" border="0" src="../Images/plus.png" onclick="Show_Hide_DetailsGrid"  />
                                                            </a>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                        <%--Doc Date --%>
                                        <asp:TemplateField HeaderText="Document Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Doc No --%>
                                        <asp:TemplateField HeaderText="Document Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Value Date --%>
                                        <asp:TemplateField HeaderText="Value Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("Value_Date") %>' ToolTip="Value Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Account --%>
                                        <%--  <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                        <%--Description --%>
                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' />

                                                <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />


                                                <asp:Label ID="lblcoulumndesc" runat="server" Text='<%#Eval("column_desc") %>' ToolTip="Description" Visible="false" />
                                                <br />
                                                <asp:Label ID="lblremarks" Visible="false" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                <asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />
                                                <asp:HiddenField ID="hdnsort" runat="server" Value='<%#Eval("sort") %>' />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotalD" runat="server" Text="Total :" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" />
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>
                                        <%--SL Code--%>
                                               <asp:TemplateField HeaderText="Remarks">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubAccount" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateField>
                                        <%--Debit--%>
                                        <asp:TemplateField HeaderText="Debit">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Credit--%>
                                        <asp:TemplateField HeaderText="Credit">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                        <%--Balance--%>
                                        <asp:TemplateField HeaderText="Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance1") %>' ToolTip="Balance" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotBalance" runat="server" Text="" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Total" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotaldebit" runat="server" Text='<%#Eval("Totaldebit") %>' ToolTip="Balance" />
                                                <asp:Label ID="lblTotalCredit" runat="server" Text='<%#Eval("Totalcredit") %>' ToolTip="Balance" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />

                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                     
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="vsBankBook" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            <asp:CustomValidator ID="cvBankBook" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </td>
                    </tr>
                    </div>
                </div>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

