<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GSysAdminWorkFlow_Add, App_Web_vm4o5lue" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Work Flow Master" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                        </div>
                    </div>

                    <div class="row">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                              <asp:Panel ID="pnlHeader" runat="server" CssClass="stylePanel" GroupingText="Header details">
                                  <div class="row">
                                      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                 <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_OnSelectedIndexChanged" class="md-form-control form-control"
                                                                        >
                                                                    </asp:DropDownList>
                                                                
                                                                <div class="validation_msg_box">
                                                                     <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="Dynamic"
                                                    ControlToValidate="ddlLOB" InitialValue="0" ErrorMessage="Select the Line of Business"  CssClass="validation_msg_box_sapn"
                                                   >
                                                        </asp:RequiredFieldValidator>
                                                                    
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                                                  

                                                                </label>
                                                            </div>
                                                        </div>     
                                      
                                      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlProductCode" runat="server" class="md-form-control form-control"  onchange="fnDisplayWorkflow();">
                                                                </asp:DropDownList>
                                                               
                                                                
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvProductCode" CssClass="validation_msg_box_sapn" runat="server"
                                                    ControlToValidate="ddlProductCode" InitialValue="0" ErrorMessage="Select the Product"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                                                   
                                                                    
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                     <asp:Label runat="server" Text="Product" ID="lblProductCode" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                                                  

                                                                </label>
                                                            </div>
                                                        </div>  
                                      
                                       <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                  <asp:TextBox ID="txtWorkflowSequence" Enabled="false" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                               
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                     <asp:Label runat="server" Text="Workflow Sequence" ID="lblWorkflowSequence" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                                                  

                                                                </label>
                                                            </div>

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                 <asp:CheckBox ID="chkActive" Checked="true" runat="server" />
                                                               
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                      <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleDisplayLabel">
                                                            </asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>                
                                     
                                  </asp:Panel>
                              </div>
                    
                          </div>

                    <div class="row">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                              <div class="gird">
                               
                                        <asp:GridView ID="gvWorkFlowSequence" runat="server" AutoGenerateColumns="false" CssClass="gird_details"
                                           ShowFooter="true" DataKeyNames="WorkFlow_ID" OnRowDataBound="gvWorkFlowSequence_RowDataBound"
                                            OnRowCommand="gvWorkFlowSequence_RowCommand" OnRowEditing="gvWorkFlowSequence_RowEditing"
                                            OnRowCancelingEdit="gvWorkFlowSequence_RowCancelingEdit" OnRowUpdating="gvWorkFlowSequence_RowUpdating"
                                            OnRowDeleting="gvWorkFlowSequence_RowDeleting">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Module">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblModuleCode_Grd" runat="server" Text='<%#Bind("Module_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlModuleCode_Grd" runat="server" OnSelectedIndexChanged ="ddlModuleCode_Grd_SelectedIndexChanged"  CssClass="md-form-control form-control login_form_content_input" AutoPostBack ="true">
                                                        </asp:DropDownList>
                                                    </FooterTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlModuleCode_Grd" runat="server" OnSelectedIndexChanged ="ddlModuleCode_Grd_SelectedIndexChanged"  CssClass="md-form-control form-control login_form_content_input" AutoPostBack ="true" >
                                                        </asp:DropDownList>
                                                        
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Program">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProgramID_Grd" runat="server" Text='<%#Bind("Program_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlProgramID_Grd" runat="server" OnSelectedIndexChanged="ddlProgramID_Grd_SelectedIndexChanged"  CssClass="md-form-control form-control login_form_content_input"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </FooterTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlProgramID_Grd" runat="server" OnSelectedIndexChanged="ddlProgramID_Grd_SelectedIndexChanged"  CssClass="md-form-control form-control login_form_content_input"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Program Flow Number">
                                                <ItemStyle HorizontalAlign = "Right"  />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProgramFlowNumber" runat="server" Text='<%#Bind("Program_Flow_ID") %>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlProgramFlowNumber_Grd"  CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                        </asp:DropDownList>
                                                    </FooterTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlProgramFlowNumber_Grd"  CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sequence ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSequenceID" runat="server" Text='<%#Bind("WokfFlow_Sequence_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtSequenceID" runat="server" Visible="false" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <EditItemTemplate>
                                                          <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"  CssClass="grid_btn"
                                                                            ValidationGroup="VgUpdate"  AccessKey="U" title="Update[Alt+U]"></asp:LinkButton>
                                                      
                                                       <%-- <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                            CausesValidation="false"></asp:LinkButton>--%>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false" class="grid_btn"  AccessKey="J" title="Edit[Alt+J]"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                          <button class="grid_btn" id="btnAdd" validationgroup="VgAdd" title="Alt+A" accesskey="A" runat="server" onserverclick="btnAdd_ServerClick" ><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                        <%--<asp:LinkButton ID="btnAdd" runat="server" Text="Add" CommandName="Add" CausesValidation="false"></asp:LinkButton>--%>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnRemove" runat="server" CommandName="Delete" Text="Delete" AccessKey="R" 
                                                                                            OnClientClick="return confirm('Are you sure you want to Delete this record?');"
                                                                                            ToolTip="Delete,Alt+R" CssClass="grid_btn_delete">
                                                                                        </asp:LinkButton>
                                                        
                                                    </ItemTemplate>
                                                     <EditItemTemplate>
                                                                     |
                                                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn_delete"
                                                                                            CausesValidation="false" ToolTip="Cancel" AccessKey="G" title="Cancel[Alt+G]"></asp:LinkButton>
                                                                    </EditItemTemplate>
                                                    <ItemStyle Width="10%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                   
                                  </div>
                              </div>
                           </div>
                  
                    <div class="btn_height"></div>

                    <div align="right" class="fixed_btn">
                                             <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]"  onclick="if(fnCheckPageValidators())" causesvalidation="false" 
                                                 onserverclick="btnSave_Click" runat="server"
                                                type="button" accesskey="S">
                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                            </button>

                                             <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                                type="button" accesskey="L">
                                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                            </button>
                                             <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                                type="button" accesskey="X">
                                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                            </button>

                                            </div>
                            
                        <div>
                                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                  </div>

                    <div>
                        <input type="hidden" id="hdnCompanyCode" runat="server" />
                        <input type="hidden" id="hdnLOB" runat="server" />
                        <input type="hidden" id="hdnID" runat="server" />
                        <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Please correct the following validation(s):"
                            Height="250px" CssClass="styleSummaryStyle" Width="500px" ShowMessageBox="false"
                            ShowSummary="true" />
                   </div>
                      </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

function fnDisplayWorkflow(intModuleID, intProgramID, ProgramFlowID, SequenceID)
{   
   
    var idLOBCode=document.getElementById('<%=ddlLOB.ClientID%>');   
    var idLOBCode=document.getElementById('<%=hdnLOB.ClientID%>').value;
    var idProCode=document.getElementById('<%=ddlProductCode.ClientID%>');
    
    var strPgmCode;
    if (idProCode.options.selectedIndex>0)
    //if ((idProCode.options.selectedIndex>0)&&(idModCode.options.selectedIndex>0)&&(idPgmCode.options.selectedIndex>0))
    {
        //strPgmCode=idPgmCode.options.value;    
        //if(idPgmCode.options.value.length==1)
          //  strPgmCode="00"+idPgmCode.options.value;    
        //if(idPgmCode.options.value.length==2)
          //  strPgmCode="0"+idPgmCode.options.value;    
            
        document.getElementById('<%=txtWorkflowSequence.ClientID%>').value=document.getElementById('<%=hdnCompanyCode.ClientID%>').value + idLOBCode +idProCode.options[idProCode.selectedIndex].value;;
    }
    else
    {
        document.getElementById('<%=txtWorkflowSequence.ClientID%>').value="";
    }
    

}


function fnDisplayWorkflow1(intModuleID, intProgramID, ProgramFlowID, SequenceID)
{
// alert(intModuleID);
 //return;   
    
    //var idLOBCode=document.getElementById('<%=ddlLOB.ClientID%>');
    
    //var idLOBCode=document.getElementById('<%=hdnLOB.ClientID%>').value;
    //var idProCode=document.getElementById('<%=ddlProductCode.ClientID%>');
    var idModCode=document.getElementById(intModuleID);
    var idPgmCode=document.getElementById(intProgramID);
    var idProgramFlowID=document.getElementById(ProgramFlowID);
    var idSequenceID=document.getElementById(SequenceID);
    if(idModCode.value == 0)
    {
        alert('Please select the Module');
        idModCode.focus();
        return;
    }
    if(idPgmCode.value == 0)
    {
        alert('Please select the Program');
        idPgmCode.focus();
        return;
    }
    if(idProgramFlowID.value == '')
    {
        alert('Please enter Program Flow Number');
        idProgramFlowID.focus();
        return;    
    }
    idSequenceID.value = "" + idModCode.value + idPgmCode.value + idProgramFlowID.value;
    /*
    var strPgmCode;
    if ((idProCode.options.selectedIndex>0)&&(idModCode.options.selectedIndex>0)&&(idPgmCode.options.selectedIndex>0))
    {
        strPgmCode=idPgmCode.options.value;    
        if(idPgmCode.options.value.length==1)
            strPgmCode="00"+idPgmCode.options.value;    
        if(idPgmCode.options.value.length==2)
            strPgmCode="0"+idPgmCode.options.value;    
            
        document.getElementById('<%=txtWorkflowSequence.ClientID%>').value=document.getElementById('<%=hdnCompanyCode.ClientID%>').value + idLOBCode + idProCode.options.value + idModCode.options.value + strPgmCode;
    }
    else
    {
        document.getElementById('<%=txtWorkflowSequence.ClientID%>').value="";
    }
    */

}

    </script>

</asp:Content>
