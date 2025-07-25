<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="HomePage, App_Web_3y5trygh" enableeventvalidation="false" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <%-- <link rel="stylesheet" href="../Content/css/bootstrap.min.css">--%>
    <%--  <link rel="stylesheet" href="../Content/DashBoard/DashBoardBoostratp.css">--%>
    <meta charset="utf-8">
    <%-- <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../Dashboard/Components/Styles/bootstrap.min.css" />
    <script src="../Dashboard/Components/Scripts/jquery.min.js"></script>
    <script src="../Dashboard/Components/Scripts/popper.min.js"></script>
    <script src="../Dashboard/Components/Scripts/bootstrap.min.js"></script>--%>

    <link rel="stylesheet" href="../Dashboard/Components/Styles/S3G_StyleSheet.css" />


    <style type="text/css">
        .stylePanelInline {
            padding-bottom: 0px;
            margin-bottom: -12px;
            padding-top: 5px;
            padding-left: 2px;
            padding-right: 5px;
            border: solid 1px ##92aad170;
            background-color: #92aad124;
            color: #003d9e;
        }

        legend {
            display: block;
            width: 100%;
            max-width: 100%;
            padding: 0;
            margin-bottom: .5rem;
            font-size: 1.5rem;
            line-height: inherit;
            color: inherit;
            white-space: normal;
        }

        .text-success_In {
            color: #4caf50!important;
            font-size: 1.25rem;
        }

        .stylePanelInlineNotify {
            padding-bottom: 0px;
            margin-bottom: -12px;
            padding-top: 5px;
            padding-left: 2px;
            padding-right: 5px;
            border: solid 1px ##92aad170;
            background-color: #92aad124;
            color: #003d9e;
        }

        legend {
            display: block;
            width: 100%;
            max-width: 100%;
            padding: 0;
            margin-bottom: .5rem;
            font-size: 1.5rem;
            line-height: inherit;
            color: inherit;
            white-space: normal;
        }

        .text-success_In {
            color: #4caf50!important;
            font-size: 1.25rem;
        }

        a.text-success_In:focus,
        a.text-success_In:hover {
            font-size: 1.25rem;
            color: #3d8b40!important;
        }

        .text-primary_In {
            color: #009688!important;
            font-size: 1.25rem;
        }

        a.text-primary_In:focus,
        a.text-primary_In:hover {
            color: #00635a!important;
            font-size: 1.25rem;
        }

        .text-secondary_In {
            color: #6c757d!important;
            font-size: 1.25rem;
        }

        a.text-secondary_In:focus,
        a.text-secondary_In:hover {
            color: #545b62!important;
        }

        .text-info_In {
            color: #03a9f4!important;
            font-size: 1.25rem;
        }

        a.text-info_In:focus,
        a.text-info_In:hover {
            color: #0286c2!important;
        }

        .badge-notify {
            background: red;
            position: absolute;
            top: 0px;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .notification {
            color: white;
            text-decoration: none;
            padding: 2px 2px;
            position: relative;
            display: inline-block;
            border-radius: 2px;
        }



            .notification .badge {
                position: absolute;
                top: -5px;
                right: -10px;
                padding: 5px 10px;
                border-radius: 50%;
                background-color: red;
                color: white;
                cursor: pointer;
            }
    </style>
    <script type="text/javascript">
        //Sathish R-23-Dec-2019
        function funLoadtxnDtls(a) {
            document.getElementById("<%= hdnFunctionControl.ClientID %>").value = a;
            document.getElementById("<%= btnLoadDashBoardTransactions.ClientID %>").click();
        }
    </script>
    <%-- <div id="div3" style="overflow: auto;">--%>

    <asp:Panel GroupingText="Dash Board"  Visible="false" ID="Panel1" runat="server" CssClass="stylePanelInline">



        <div style="margin-top: -30px; margin-left: 700px" class="notification">
            <asp:ImageButton ID="Image2" Width="30px" Height="30px" ImageUrl="~/Dashboard/icons8-alarm-50.png" runat="server" />
            <span class="badge">3</span>
        </div>




        <div id="tblContainer" style="margin-top: -20px;" runat="server">
            <%--class="content_base_details" id="content_base">--%>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="WFHeaderPanel" GroupingText="Filter Criteria" runat="server" CssClass="stylePanel" Visible="false">
                        <table width="80%">
                            <tr>
                                <td width="15%">From Date
                                </td>
                                <td width="20%">

                                    <asp:TextBox runat="server" ID="txtFromDate" Width="70%" ContentEditable="False"
                                        AutoPostBack="True" OnTextChanged="txtFromDate_TextChanged"></asp:TextBox>
                                    <asp:Image ID="imgTransactionDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                        ToolTip="Transaction Date" ImageAlign="AbsMiddle" />
                                    <asp:RequiredFieldValidator ID="RFVTransactionDate" CssClass="styleMandatoryLabel"
                                        runat="server" ValidationGroup="VGPDC" ControlToValidate="txtFromDate" Display="None"></asp:RequiredFieldValidator>
                                    <cc1:CalendarExtender ID="CEFrom" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                        PopupButtonID="imgTransactionDate" TargetControlID="txtFromDate" Format="dd/MM/yyyy">
                                    </cc1:CalendarExtender>
                                </td>
                                <td width="15%">To Date
                                </td>
                                <td width="20%">
                                    <asp:TextBox runat="server" ID="txtToDate" Width="70%" ContentEditable="False" AutoPostBack="True"
                                        OnTextChanged="txtToDate_TextChanged"></asp:TextBox>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Transaction Date"
                                        ImageAlign="AbsMiddle" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            CssClass="styleMandatoryLabel" runat="server" ValidationGroup="VGPDC" ControlToValidate="txtToDate"
                                            Display="None"></asp:RequiredFieldValidator><cc1:CalendarExtender ID="CETo" runat="server"
                                                Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="Image1"
                                                TargetControlID="txtToDate" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                </td>
                                <td width="28%">
                                    <asp:CheckBox ID="chkShowAll" runat="server" Text="Show All Work Items" OnCheckedChanged="chkShowAll_CheckedChanged"
                                        AutoPostBack="true" />
                                </td>
                                <td width="20%">
                                    <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="styleSubmitButton"
                                        OnClick="btnShow_Click" Visible="False" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel GroupingText="" ID="pnlWorkFlowDetails" runat="server">

                        <div class="row">
                            <asp:Button ID="btnLoadDashBoardTransactions" Style="display: none" runat="server" Text="Load Asset" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadDashBoardTransactions_Click" />
                            <asp:HiddenField runat="server" ID="hdnFunctionControl" />
                            <%--Box1--%>
                            <div style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12">
                                <div class="bg-primaryIn text-white">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-lg-3 col-sm-3 col-xs-3">
                                                <i class="fa fa-tasks fa-3x"></i>
                                            </div>
                                            <div class="col-lg-9 col-sm-9 col-xs-9 text-right">
                                                <div id="divPendingTasks" runat="server" class="huge large_text">0</div>
                                                <div class="small_txt">Pending Approvals</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--                                    <a href="/LeadTracker">--%>
                                    <div onclick="funLoadtxnDtls('1');" class="panel-footer" style="margin-top: 15px; cursor: pointer;">
                                        <div class="row">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <span class="pull-left">View Details</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                <div class="clearfix"></div>

                                            </div>
                                        </div>

                                    </div>
                                    <%-- </a>--%>
                                </div>
                            </div>
                            <%--Box2--%>
                            <div style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12">
                                <div class="bg-successIn text-white">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-lg-3 col-sm-3 col-xs-3">
                                                <i class="fa fa-tasks fa-3x"></i>
                                            </div>
                                            <div class="col-lg-9 col-sm-9 col-xs-9 text-right">
                                                <div id="divComletedTasks" runat="server" class="huge large_text">0</div>
                                                <div class="small_txt">Completed Approvals</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div onclick="funLoadtxnDtls('4');" class="panel-footer" style="margin-top: 15px; cursor: pointer;">
                                        <div class="row">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <span class="pull-left">View Details</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <%--Box3--%>
                            <div style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12">
                                <div class="bg-dangerIn text-white">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-lg-3 col-sm-3 col-xs-3">
                                                <i class="fa fa-tasks fa-3x"></i>
                                            </div>
                                            <div class="col-lg-9 col-sm-9 col-xs-9 text-right">
                                                <div id="divEscalation" runat="server" class="huge large_text">0</div>
                                                <div class="small_txt">Escalation</div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- <a href="/LeadTracker">--%>
                                    <div onclick="funLoadtxnDtls('2');" class="panel-footer" style="margin-top: 15px; cursor: pointer;">
                                        <div class="row">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <span class="pull-left">View Details</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>

                                    </div>
                                    <%-- </a>--%>
                                </div>
                            </div>
                            <%--Box4--%>
                            <div style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12">
                                <div class="bg-warningIn text-white">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-lg-3 col-sm-3 col-xs-3">
                                                <i class="fa fa-calendar  fa-3x"></i>
                                            </div>
                                            <div class="col-lg-9 col-sm-9 col-xs-9 text-right">
                                                <div id="divPendingTransaction" runat="server" class="huge large_text">0</div>
                                                <div class="small_txt">Pending Transactions</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div onclick="funLoadtxnDtls('9');" class="panel-footer" style="margin-top: 15px; cursor: pointer;">
                                        <div class="row">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <span class="pull-left">View Details</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <%--Box5--%>
                            <div style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12">
                                <div class="bg-infoIn text-white">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-lg-3 col-sm-3 col-xs-3">
                                                <i class="fa fa-calendar  fa-3x"></i>
                                            </div>
                                            <div class="col-lg-9 col-sm-9 col-xs-9 text-right">
                                                <div id="divCompletedTransactions" runat="server" class="huge large_text">0</div>
                                                <div class="small_txt">Completed Transactions</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div onclick="funLoadtxnDtls('8');" class="panel-footer" style="margin-top: 15px; cursor: pointer;">
                                        <div class="row">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <span class="pull-left">View Details</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12">
                                <div class="bg-PinkIn text-white">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-lg-3 col-sm-3 col-xs-3">
                                                <i class="fa fa-calendar  fa-3x"></i>
                                            </div>
                                            <div class="col-lg-9 col-sm-9 col-xs-9 text-right">
                                                <div class="huge large_text">0</div>
                                                <div class="small_txt">Expired Deals</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel-footer" style="margin-top: 15px;">
                                        <div class="row">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <span class="pull-left">View Details</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>
                            </div>
                           <%-- <div id="divChartPieDisplay1" runat="server" style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12">
                                <asp:Chart ID="Chart1" runat="server" Height="350px" Width="470px">
                                    <Titles>
                                        <asp:Title ShadowOffset="3" Name="Items" />
                                    </Titles>
                                    <Legends>
                                        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="true" Name="Default" LegendStyle="Row" />
                                    </Legends>
                                    <Series>
                                        <asp:Series Name="Default" />
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                                    </ChartAreas>
                                </asp:Chart>

                            </div>
                            <div id="divChartPieDisplay2" runat="server" style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12">
                                <asp:Chart ID="Chart2" runat="server" Height="350px" Width="470px">
                                    <Titles>
                                        <asp:Title ShadowOffset="3" Name="Items" />
                                    </Titles>
                                    <Legends>
                                        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="true" Name="Default" LegendStyle="Row" />
                                    </Legends>
                                    <Series>
                                        <asp:Series Name="Default" />
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                                    </ChartAreas>
                                </asp:Chart>

                            </div>--%>
                            <div style="margin-top: 15px; display: none" class="col-lg-4 col-md-8 col-xs-12">
                                <asp:Panel ID="pnlThingstodo" runat="server" GroupingText="Things To Do" CssClass="stylePanelInline">
                                    <div style="margin-left: 10px; height: 200px">
                                        <asp:PlaceHolder ID="plThingstodo" runat="server"></asp:PlaceHolder>
                                    </div>
                                </asp:Panel>
                            </div>
                            <div style="margin-top: 15px" class="col-lg-4 col-md-8 col-xs-12 ">
                                <asp:Panel ID="pnlGeneralAnouncement" runat="server" GroupingText="Notifications" CssClass="stylePanelInlineNotify">
                                    <div style="margin-left: 10px;">
                                        <marquee width="99%" onmouseover="this.stop()" onmouseout="this.start()" direction="up" height="200px">
                           <asp:PlaceHolder   ID="plShoNotifi" runat="server"></asp:PlaceHolder>
                          </marquee>
                                    </div>
                                </asp:Panel>
                            </div>


                        </div>
                    </asp:Panel>
                </div>
            </div>

            <div style="display: none" class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlWorkItems" runat="server" GroupingText="Work Items" CssClass="stylePanel" Visible="false">
                        <div class="gird">
                        </div>
                        <div class=" gird">
                            <asp:GridView HorizontalAlign="Center" runat="server" ID="gvEscalExpiredDet" Width="100%" Visible="false"
                                AutoGenerateColumns="true">
                                <EmptyDataTemplate>
                                    No Documents found to load.
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%-- </div>--%>
    <div style="margin-top: 50px; display: none" class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:Label ID="lblCoproView" runat="server" Style="display: none;"></asp:Label>
            <cc1:ModalPopupExtender ID="MPShowDashBoard" runat="server" PopupControlID="dvProView" TargetControlID="lblCoproView"
                BackgroundCssClass="modalBackground" Enabled="true">
            </cc1:ModalPopupExtender>



            <div runat="server" id="dvProView" style="display: none; width: 75%; height: 80%">
                <div id="divrProimg" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -35px;">
                    <asp:ImageButton ID="rptimg" runat="server" ToolTip="Close [Alt+I]" AccessKey="I" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                        OnClick="btnUploadCancel_ServerClick" />
                </div>
                <asp:Panel ID="pnlProView" GroupingText="Transactions" CssClass="stylePanel" runat="server"
                    BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                    <div style="Height: 400px; overflow-y: scroll" class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:GridView HorizontalAlign="Center" runat="server" ID="gvListWFDocuments" Width="100%"
                                AutoGenerateColumns="False"
                                DataKeyNames="Workflow_Status_ID,Workflow_Program_ID,Task_Document_No,LOB_ID,Branch_Id,Product_Id,Ref_Document_No,Workflow_Sequnce_ID,RefValue1,RefValue2,Document_Type"
                                BorderStyle="None" BorderWidth="0px" OnSelectedIndexChanged="gvListWFDocuments_SelectedIndexChanged"
                                OnRowCreated="gvListWFDocuments_RowCreated" class="gird_details">
                                <RowStyle HorizontalAlign="Left"></RowStyle>
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                <Columns>
                                    <asp:TemplateField HeaderText="Workflow Sequence Id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblWofkflowSequenceId" runat="server" Text='<%#Bind("Workflow_Sequnce_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="LOBID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLOBId" runat="server" Text='<%#Bind("LOB_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BranchId" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBranchId" runat="server" Text='<%#Bind("Branch_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ProgramRefNo" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgramRefNo" runat="server" Text='<%#Bind("Workflow_Program_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Previous Program" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpp" runat="server" Text='<%#Bind("Current_Program") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Document Number" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lnkDocumentNo" runat="server" Text='<%#Bind("Task_Document_No") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Current Program" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNextPgm" runat="server" Text='<%#Bind("Program_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Document Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocDate" runat="server" Text='<%#Bind("Enabled_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" Visible="true" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Bind("Task_Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CompanyId" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCompanyId" runat="server" Text='<%#Bind("Company_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Document_Type" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocument_Type" runat="server" Text='<%#Bind("Document_Type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created By">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreated_By" runat="server" Text='<%#Bind("Created_By") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Created On">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreated_On" runat="server" Text='<%#Bind("Enabled_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Documents found to load.
                                </EmptyDataTemplate>
                                <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                            </asp:GridView>

                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>
