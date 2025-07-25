<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Budget_Budget_Formula_Master, App_Web_rj0nx3uf" title="S3G - Budjet Formula Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
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
                    height: 14px;
                    width: 14px;
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
                background-color: gray;
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
        </style>
    </head>

    <script language="javascript" type="text/javascript">

    </script>


    <div id="tab-content" class="tab-content">
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="Formula Master" ID="lblHeading"> </asp:Label>
                </h6>
            </div>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="md-input">
                        <%-- <asp:TextBox ID="txtFinancialyear" runat="server" class="md-form-control login_form_content_input requires_true"
                        MaxLength="3"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlItemHeader" runat="server" AutoPostBack="True" ToolTip="Item Header" CssClass="md-form-control form-control">
                            <asp:ListItem Selected="True">--Select--</asp:ListItem>
                            <asp:ListItem>Cash Flow</asp:ListItem>

                        </asp:DropDownList>
                        <div class="validation_msg_box">
                        </div>
                        <label class="tess">
                            <asp:Label ID="lblLocationCode" runat="server" CssClass="" Text="Item Header"></asp:Label>
                        </label>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="md-input">
                        <%-- <asp:TextBox ID="txtFinancialyear" runat="server" class="md-form-control login_form_content_input requires_true"
                        MaxLength="3"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlAccountNature" runat="server" AutoPostBack="True" ToolTip="Item Header" CssClass="md-form-control form-control">
                            <asp:ListItem Selected="True">--Select--</asp:ListItem>
                            <asp:ListItem>Particulars</asp:ListItem>

                        </asp:DropDownList>

                        <label class="tess">
                            <asp:Label ID="lblAccountNature" runat="server" CssClass="" Text="Account Nature"></asp:Label>
                        </label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="md-input">

                        <asp:DropDownList ID="ddlLineItem" runat="server" AutoPostBack="false" ToolTip="Line Item" CssClass="md-form-control form-control">
                            <asp:ListItem Selected="True">--Select--</asp:ListItem>
                            <asp:ListItem>InFlow</asp:ListItem>

                        </asp:DropDownList>
                        <div class="validation_msg_box">
                        </div>
                        <label class="tess">
                            <asp:Label ID="lbllineitem" runat="server" CssClass="" Text="Line Item"></asp:Label>
                        </label>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="md-input">
                        <%-- <asp:TextBox ID="txtFinancialyear" runat="server" class="md-form-control login_form_content_input requires_true"
                        MaxLength="3"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlSublineitem" runat="server" AutoPostBack="True" ToolTip="Item Header" CssClass="md-form-control form-control">
                            <asp:ListItem Selected="True">--Select--</asp:ListItem>
                            <asp:ListItem>Vehicular Total</asp:ListItem>

                        </asp:DropDownList>

                        <label class="tess">
                            <asp:Label ID="lblsublineitem" runat="server" CssClass="" Text="Subline item/sub Total"></asp:Label>
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2  styleFieldLabel">
                    <div class="md-value">
                        <label>
                            <asp:Label runat="server" Text="Active" CssClass="styleReqFieldLabel" ID="Label2"></asp:Label>
                        </label>
                    </div>
                    <label class="switch">
                        <input type="checkbox" runat="server" checked="checked" />
                        <span class="slider round"></span>
                    </label>
                    <span class="highlight"></span>

                </div>
            </div>


        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div id="divLocationCatDetails" runat="server">
                    <asp:Panel Visible="true" runat="server" ID="pnlLocationCatDetails" GroupingText="Formula Details"
                        CssClass="stylePanel">
                        <asp:UpdatePanel ID="upLocationdetails" runat="server">
                            <ContentTemplate>

                                <div class="row">
                                    <div class="col-md-6 grid">

                                        <asp:GridView runat="server" ID="grvLineItemList" HeaderStyle-CssClass="styleGridHeader" Width="100%"
                                            OnRowDataBound="grvLineItem_RowDataBound" AutoGenerateColumns="False" class="grid_details">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Line of Business"
                                                    HeaderStyle-Width="70%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" ToolTip='<%#Eval("LineItem")%>' Text='<%#Eval("LineItem")%>'></asp:Label>
                                                        <asp:Label ID="lblLOBID" runat="server" Visible="false" Text='<%#Eval("Value")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-Width="30%">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkSelectAllLI" runat="server"></asp:CheckBox>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectLI" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>

                                    </div>


                                    <div class="col-md-6 grid">

                                        <asp:GridView runat="server" ID="grvItemcategory" HeaderStyle-CssClass="styleGridHeader" Width="100%"
                                            OnRowDataBound="grvItemCategory_RowDataBound" AutoGenerateColumns="False" class="grid_details">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Item Category"
                                                    HeaderStyle-Width="70%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" ToolTip='<%#Eval("ItemCategory")%>' Text='<%#Eval("ItemCategory")%>'></asp:Label>
                                                        <asp:Label ID="lblLOBID" runat="server" Visible="false" Text='<%#Eval("Value")%>'></asp:Label>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-Width="30%">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkSelectAllIC" runat="server"></asp:CheckBox>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectIC" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>

                                    </div>

                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>

                    <div class="m-2 text-center">
                        <button class="css_btn_enabled" style="min-width: 84px !important;" id="BtnCurrentYBudgetSave" runat="server"
                            type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" style="min-width: 84px !important;" id="Button1" runat="server"
                            type="button" accesskey="R" title="Clear[Alt+R]" causesvalidation="false">
                            <i class="fa fa-trash"></i>&emsp;<u>C</u>lear
                        </button>
                        <button class="css_btn_enabled" style="min-width: 84px !important;" id="Button2" runat="server"
                            type="button" accesskey="C" title="Cancel[Alt+C]" onserverclick="onCancelClick" causesvalidation="false">
                            <i class="fa fa-close"></i>&emsp;<u>C</u>ancel
                        </button>
                    </div>
                </div>
            </div>
        </div>




        <%--  <div class="row" style="display: none;">
            <asp:ValidationSummary ID="vsLocationMaster" runat="server"
                ValidationGroup="save"
                HeaderText="Please correct the following validation(s):"
                ShowMessageBox="false" ShowSummary="true" />
            <asp:CustomValidator ID="cvLocationMaster" runat="server"></asp:CustomValidator>

            <asp:ValidationSummary ID="vsLocationGrouip" runat="server"
                ValidationGroup="vgLocationGroup"
                HeaderText="Please correct the following validation(s):"
                ShowMessageBox="false" ShowSummary="true" />

        </div>--%>
    </div>
</asp:Content>
