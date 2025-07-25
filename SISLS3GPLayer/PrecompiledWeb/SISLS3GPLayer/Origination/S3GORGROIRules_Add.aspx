<%@ page language="C#" autoeventwireup="true" inherits="Origination_S3GORGROIRules, App_Web_xfeo3ymh" masterpagefile="~/Common/S3GMasterPageCollapse.master" enableviewstate="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function Trim(strInput) {
            var FieldValue = document.getElementById(strInput).value;
            document.getElementById(strInput).value = FieldValue.trim();
        }
        function fnRecoveryPatternYearIsEmpty(RecoveryPatternYear) {
            //return false;
        }
        function fnGetRecoveryValue(strRecoveryPatternYear) {
            var exp = /_/gi;
            return parseFloat(document.getElementById(strRecoveryPatternYear).value.replace(exp, '0'));
            //return parseFloat(document.getElementById(strRecoveryPatternYear).value);
        }
        function fnEnableRecoveryValue(strRecoveryPatternYear, blnStatus, dcmlRecoveryValue) {

            document.getElementById(strRecoveryPatternYear).disabled = blnStatus;
            document.getElementById(strRecoveryPatternYear).value = dcmlRecoveryValue.toFixed(2);

        }

        function fnShowErrorMessage(intoption, strRecoveryPatternYear) {
            if (intoption == 1) {
                if (document.getElementById('<%=ddlRepaymentMode.ClientID%>').value == 3) {
                    if (fnAllowNumbersOnly(true, false, strRecoveryPatternYear)) {
                        alert('Please enter a recovery structure for the rule.');
                    }
                    document.getElementById(strRecoveryPatternYear).focus();
                    return;
                }
            }
            /*else if(intoption == 2)
            {
                alert('Recovery structure % should not be greater than 100%');
                document.getElementById(strRecoveryPatternYear).focus();
                return;
            }
            else if(intoption == 3)
            {
                alert('Total recovery structure % should not be greater than 100%');  
                //document.getElementById(strRecoveryPatternYear).focus();
                return;
            }*/

        }

        function fnCalculateRecoveryPattern(strControlID, strRecoveryPatternYear1, strRecoveryPatternYear2, strRecoveryPatternYear3, strRecoveryPatternYearRest) {

            var RecoveryPatternYear1;
            var RecoveryPatternYear2;
            var RecoveryPatternYear3;
            var RecoveryPatternYearRest;
            var Total = 0;

            if (parseInt(strControlID) == 3) {
                Total = 0;

                //                fnEnableRecoveryValue(strRecoveryPatternYearRest, true, Total);

                RecoveryPatternYear1 = fnGetRecoveryValue(strRecoveryPatternYear1);
                RecoveryPatternYear2 = fnGetRecoveryValue(strRecoveryPatternYear2);
                RecoveryPatternYear3 = fnGetRecoveryValue(strRecoveryPatternYear3);
                RecoveryPatternYearRest = fnGetRecoveryValue(strRecoveryPatternYearRest);
                Total = RecoveryPatternYear1 + RecoveryPatternYear2 + RecoveryPatternYear3 + RecoveryPatternYearRest;

                if (RecoveryPatternYear3 == 0) {

                    //                    fnShowErrorMessage(1, strRecoveryPatternYear3);
                    //                    return;
                }
                if (RecoveryPatternYear3 > 100) {
                    fnShowErrorMessage(2, strRecoveryPatternYear3);
                    return;
                }
                if (Total > 100) {
                    fnShowErrorMessage(3, strRecoveryPatternYear3);
                    //                    document.getElementById(strRecoveryPatternYear3).focus();
                    return;
                }
                else if (Total < 100) {
                    Total = 100.00 - Total;
                    Total = Total + RecoveryPatternYearRest;
                    fnEnableRecoveryValue(strRecoveryPatternYearRest, true, Total);
                }

            }
            else if (parseInt(strControlID) == 2) {
                Total = 0;

                //                fnEnableRecoveryValue(strRecoveryPatternYear3, true, Total);
                //                fnEnableRecoveryValue(strRecoveryPatternYearRest, true, Total);               

                RecoveryPatternYear1 = fnGetRecoveryValue(strRecoveryPatternYear1);
                RecoveryPatternYear2 = fnGetRecoveryValue(strRecoveryPatternYear2);
                RecoveryPatternYear3 = fnGetRecoveryValue(strRecoveryPatternYear3);
                RecoveryPatternYearRest = fnGetRecoveryValue(strRecoveryPatternYearRest);
                Total = RecoveryPatternYear1 + RecoveryPatternYear2 + RecoveryPatternYear3 + RecoveryPatternYearRest;

                if (RecoveryPatternYear2 == 0) {
                    //                    fnShowErrorMessage(1, strRecoveryPatternYear2);
                    //                    return;
                }
                if (RecoveryPatternYear2 > 100) {
                    fnShowErrorMessage(2, strRecoveryPatternYear2);
                    return;
                }
                if (Total > 100) {
                    fnShowErrorMessage(3, strRecoveryPatternYear2);
                    //                     document.getElementById(strRecoveryPatternYear2).focus();
                    return;
                }
                else if (Total < 100) {
                    Total = 100.00 - Total;
                    Total = Total + RecoveryPatternYear3;
                    //fnEnableRecoveryValue(strRecoveryPatternYear3, false, Total);

                    fnEnableRecoveryValue(strRecoveryPatternYear3, false, Total);
                    document.getElementById(strRecoveryPatternYear3).focus();
                }

            }

            else if (parseInt(strControlID) == 1) {
                Total = 0;

                // fnEnableRecoveryValue(strRecoveryPatternYear2, true, Total);
                // fnEnableRecoveryValue(strRecoveryPatternYear3, true, Total);
                // fnEnableRecoveryValue(strRecoveryPatternYearRest, true, Total);

                RecoveryPatternYear1 = fnGetRecoveryValue(strRecoveryPatternYear1);
                RecoveryPatternYear2 = fnGetRecoveryValue(strRecoveryPatternYear2);
                RecoveryPatternYear3 = fnGetRecoveryValue(strRecoveryPatternYear3);
                RecoveryPatternYearRest = fnGetRecoveryValue(strRecoveryPatternYearRest);
                Total = RecoveryPatternYear1 + RecoveryPatternYear2 + RecoveryPatternYear3 + RecoveryPatternYearRest;

                if (RecoveryPatternYear1 == 0) {
                    //                    fnShowErrorMessage(1, strRecoveryPatternYear1);
                    //                    return;
                }
                if (RecoveryPatternYear1 > 100) {
                    fnShowErrorMessage(2, strRecoveryPatternYear1);
                    return;
                }
                if (Total > 100) {
                    fnShowErrorMessage(3, strRecoveryPatternYear1);
                    //                    document.getElementById(strRecoveryPatternYear1).focus();
                    return;
                }
                else if (Total < 100) {
                    if (document.getElementById('<%=ddlMargin.ClientID%>').value == 1) {
                        if (document.getElementById('<%=ddlMargin.ClientID%>').value != '' && RecoveryPatternYear1 == 0) {

                        }
                        else {
                            Total = 100.00 - Total;
                            Total = Total + RecoveryPatternYear2;
                            fnEnableRecoveryValue(strRecoveryPatternYear2, false, Total);
                            //document.getElementById(strRecoveryPatternYear2).focus();

                        }
                    }
                    else {
                        Total = 100.00 - Total;
                        Total = Total + RecoveryPatternYear2;
                        fnEnableRecoveryValue(strRecoveryPatternYear2, false, Total);
                        document.getElementById(strRecoveryPatternYear2).focus();
                    }
                }

        }

}



function fnCalculateMarginPercentage(strMarginPercentage, intprefix, intsuffix) {
    if (isNaN(parseFloat(strMarginPercentage.value))) {
        if (strMarginPercentage.value == '')
            alert('Margin Percentage cannot be empty');
        else
            alert('Enter a valid decimal');
        strMarginPercentage.value = '';
        //strMarginPercentage.focus();
        return false;
    }
    else {
        var str = strMarginPercentage.value.split('.');
        if (str != null) {
            if (str[0].length > intprefix) {
                alert('Margin% precision should not exceed ' + intprefix + ' digits');
                strMarginPercentage.value = "";
                //strMarginPercentage.focus();
                return false;
            }
        }
    }
    if (strMarginPercentage.value == 0) {
        alert('Margin% should be greater than 0.');
        // strMarginPercentage.value = '0';
        strMarginPercentage.value ='';
        //strMarginPercentage.focus();
        return false;
    }
    else if (strMarginPercentage.value > 100) {
        alert('Margin% should not be greater than 100%');
        //strMarginPercentage.focus();
        return;
    }
    else if (strMarginPercentage.value <= 100) {
        strMarginPercentage.value = parseFloat(strMarginPercentage.value).toFixed(intsuffix);
    }


}

//function to check percentage should not exceed 100

function fncheckvalidpercentage(ObjCtrl) {
    if (ObjCtrl.value != '') {
        if (parseFloat(ObjCtrl.value) > 100) {
            alert('Value should not be greater than 100%');
            ObjCtrl.value = '';
            ObjCtrl.focus();
        }
    }

}


function lob_Change(values) {
        <%--
        
            document.getElementById('<%=rfvRateType.ClientID%>').enabled = false;
            document.getElementById('<%=lblRateType.ClientID%>').className = "";
             
            var OptionText = values.options[values.selectedIndex].text.toLowerCase();           
            if(OptionText.indexOf('hire') != -1)
            {
                document.getElementById('<%=rfvRateType.ClientID%>').enabled = true;
                document.getElementById('<%=lblRateType.ClientID%>').className = "styleReqFieldLabel";
            }

            if(OptionText.indexOf('loan') != -1)
            {
                document.getElementById('<%=rfvRateType.ClientID%>').enabled = true;
                document.getElementById('<%=lblRateType.ClientID%>').className = "styleReqFieldLabel";
            }

            if(OptionText.indexOf('financial') != -1)
            {
                document.getElementById('<%=rfvRateType.ClientID%>').enabled = true;
                document.getElementById('<%=lblRateType.ClientID%>').className = "styleReqFieldLabel";
            } 
           
               --%>
}


    </script>

    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                    <%-- <div class="col" align="right">
                        <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLineofBusiness" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged"
                                        onchange="javascript:lob_Change(this);" ToolTip="Line of Business" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business" ToolTip="Line of Business"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLineOfBusiness" runat="server" Display="Dynamic"
                                            ControlToValidate="ddlLineofBusiness" ValidationGroup="btnSave" InitialValue="0"
                                            ErrorMessage="Select the Line of Business" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProduct" runat="server" ToolTip="Product" CssClass="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Product" ID="lblProduct" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtModelDescription" runat="server" MaxLength="40" ToolTip="Model Description" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblModelDescription" runat="server" Text="Model Description" ToolTip="Model Description"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvProduct" runat="server" Display="Dynamic" ControlToValidate="txtModelDescription"
                                            ValidationGroup="btnSave" ErrorMessage="Enter Model Description" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlRateType" runat="server" OnSelectedIndexChanged="ddlRateType_SelectedIndexChanged"
                                        AutoPostBack="true" ToolTip="Rate Type" class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblRateType" runat="server" Text="Rate Type" ToolTip="Rate Type"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvRateType" runat="server" Display="Dynamic" ControlToValidate="ddlRateType"
                                            ValidationGroup="btnSave" InitialValue="0" ErrorMessage="Select the Rate Type"
                                            CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <%--                        </div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtROIRuleNumber" runat="server" MaxLength="6" ToolTip="ROI Rule Number" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblROIRuleNumber" runat="server" Text="ROI Rule Number" ToolTip="ROI Rule Number"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvROIRuleNumber" runat="server" Display="Dynamic" ControlToValidate="txtROIRuleNumber"
                                            ValidationGroup="btnSave" ErrorMessage="Enter ROI Rule Number" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="validation_msg_box">
                                        <asp:RegularExpressionValidator ID="regROIRuleNumber" runat="server" Display="Dynamic"
                                            ControlToValidate="txtROIRuleNumber" ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="True"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlRatePattern" runat="server" OnSelectedIndexChanged="ddlRatePattern_SelectedIndexChanged"
                                        AutoPostBack="true" ToolTip="Return Pattern" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblRatePattern" runat="server" Text="Return Pattern" ToolTip="Return Pattern"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvRatePattern" runat="server" Display="Dynamic" ControlToValidate="ddlRatePattern"
                                            ValidationGroup="btnSave" ErrorMessage="Select the Return Pattern"
                                            InitialValue="0" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlTime" runat="server" ToolTip="Time" class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblTime" runat="server" Text="Time" ToolTip="Time"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvTime" runat="server" Display="Dynamic" ControlToValidate="ddlTime"
                                            ValidationGroup="btnSave" ErrorMessage="Select the Time" InitialValue="0"
                                            CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <%--                        </div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFrequency" runat="server" ToolTip="Frequency" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblFrequency" runat="server" Text="Frequency" ToolTip="Frequency"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvFrequency" runat="server" Display="Dynamic" ControlToValidate="ddlFrequency"
                                            ValidationGroup="btnSave" ErrorMessage="Select the Frequency" InitialValue="0"
                                            CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlRepaymentMode" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRepaymentMode_SelectedIndexChanged"
                                        class="md-form-control form-control" ToolTip="Repayment Mode">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblRepaymentMode" runat="server" Text="Repayment Mode" ToolTip="Repayment Mode"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvRepaymentMode" runat="server" Display="Dynamic" ControlToValidate="ddlRepaymentMode"
                                            ValidationGroup="btnSave" ErrorMessage="Select the Repayment Mode"
                                            InitialValue="0" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div id="divSerialNo" runat="server" visible="false" class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtSerialNumber" runat="server" Text="1" ToolTip="Serial Number" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblSerialNumber" runat="server" CssClass="styleReqFieldLabel" Text="Serial Number"
                                            Visible="false" ToolTip="Serial Number"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <%--                        </div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtRate" runat="server" MaxLength="5" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');"
                                        ToolTip="Rate" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblRate" runat="server" Text="Rate" ToolTip="Rate"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvRate" runat="server" Display="Dynamic" ControlToValidate="txtRate"
                                            ValidationGroup="btnSave" ErrorMessage="Enter Rate" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlIRRRest" runat="server" class="md-form-control form-control" ToolTip="IRR Rest">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblIRRRest" runat="server" Text="IRR Rest" ToolTip="IRR Rest"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvIRRRest" runat="server" Display="Dynamic" ControlToValidate="ddlIRRRest"
                                            ValidationGroup="btnSave" ErrorMessage="Select the IRR rest" InitialValue="0"
                                            CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlIntrestCalculation" class="md-form-control form-control" runat="server" ToolTip="Interest Calculation">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblIntrestCalculation" runat="server" Text="Interest Calculation"
                                            ToolTip="Interest Calculation"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvIntrestCalculation" runat="server" Display="Dynamic"
                                            ControlToValidate="ddlIntrestCalculation" ValidationGroup="btnSave" ErrorMessage="Select the Interest Calculation"
                                            InitialValue="0" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <%--                        </div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlIntrestLevy" runat="server" class="md-form-control form-control" ToolTip="Interest Levy">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblIntrestLevy" runat="server" Text="Interest Levy" ToolTip="Interest Levy"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvIntrestLevy" runat="server" Display="Dynamic" ControlToValidate="ddlIntrestLevy"
                                            ValidationGroup="btnSave" ErrorMessage="Select the Interest Levy"
                                            InitialValue="0" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlInsurance" runat="server" class="md-form-control form-control" ToolTip="Insurance">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblInsurance" runat="server" Text="Insurance" ToolTip="Insurance"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvInsurance" runat="server" Display="Dynamic" ControlToValidate="ddlInsurance"
                                            ValidationGroup="btnSave" ErrorMessage="Select the Insurance" InitialValue="0"
                                            CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlResidualValue" class="md-form-control form-control" runat="server" ToolTip="Residual Value">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblResidualValue" runat="server" Text="Residual Value" ToolTip="Residual Value"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvResidualValue" runat="server" Display="Dynamic" ControlToValidate="ddlResidualValue"
                                            ValidationGroup="btnSave" ErrorMessage="Select the ResidualValue"
                                            CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <%--                        </div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlMargin" class="md-form-control form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMargin_SelectedIndexChanged"
                                        ToolTip="Margin">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblMargin" runat="server" Text="Margin" ToolTip="Margin"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvMargin" runat="server" Display="Dynamic" ControlToValidate="ddlMargin"
                                            ValidationGroup="btnSave" ErrorMessage="Select the Margin" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtMarginPercentage" runat="server" MaxLength="6" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');"
                                        ToolTip="Margin %" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblMarginPercentage" runat="server" Text="Margin %" ToolTip="Margin %"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvMarginPercentage" runat="server" Display="Dynamic"
                                            ControlToValidate="txtMarginPercentage" ValidationGroup="btnSave" ErrorMessage="Enter Margin %"
                                            CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active"
                                        ToolTip="Active"></asp:Label>
                                    <asp:CheckBox ID="chkActive" runat="server" ToolTip="Active" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel ID="Panel1" GroupingText="Recovery Pattern" runat="server" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtRecoveryPatternYear1" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                            Width="40%" MaxLength="10" ToolTip="Year1"></asp:TextBox>
                                        <%--   <asp:RequiredFieldValidator ID="rfvRecoveryPatternYear1" runat="server" Display="None"
                                            InitialValue="0.00" ControlToValidate="txtRecoveryPatternYear1" ValidationGroup="btnSave"
                                            ErrorMessage="select a Recorvery Pattern Year 1" CssClass="styleMandatoryLabel"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblRecoveryPatternYear1" runat="server" Text="Year 1" ToolTip="Year1"
                                                Font-Bold="true"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtRecoveryPatternYear2" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                            Width="40%" MaxLength="10" ToolTip="Year2"></asp:TextBox>
                                        <%-- <asp:RequiredFieldValidator ID="rfvRecoveryPatternYear2" runat="server" Display="None"
                                            ControlToValidate="txtRecoveryPatternYear2" ValidationGroup="btnSave" ErrorMessage="select a Recorvery Pattern Year 2"
                                            CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label3" runat="server" Text="Year 2" ToolTip="Year2" Font-Bold="true"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtRecoveryPatternYear3" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                            Width="40%" MaxLength="10" ToolTip="Year 3"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvRecoveryPatternYear3" runat="server" Display="None"
                                            ControlToValidate="txtRecoveryPatternYear3" ValidationGroup="btnSave" ErrorMessage="select a Recorvery Pattern Year 3"
                                            CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label4" runat="server" Text="Year 3" ToolTip="Year3" Font-Bold="true"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtRecoveryPatternYearRest" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');"
                                            Width="40%" MaxLength="10" ToolTip="Rest of the Period" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                        <%--  <asp:RequiredFieldValidator ID="rfvRecoveryPatternYearRest" runat="server" Display="None"
                                            ControlToValidate="txtRecoveryPatternYearRest" ValidationGroup="btnSave" ErrorMessage="select a Recorvery Pattern Year Rest"
                                            CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label5" runat="server" Text="Rest of the Period" ToolTip="Rest Periods"
                                                Font-Bold="true"></asp:Label>
                                        </label>

                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%-- <div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators();"
                            ValidationGroup="btnSave" CssClass="save_btn fa fa-floppy-o" OnClick="btnSave_Click"
                            Text="Save" ToolTip="Save,Alt+S" AccessKey="S" />
                        <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnClear" runat="server" CausesValidation="False" OnClientClick="return fnConfirmClear();"
                            CssClass="save_btn fa fa-eraser-o" Text="Clear" OnClick="btnClear_Click" ToolTip="Clear,Alt+L" AccessKey="L" />
                        <i class="fa fa-share btn_i" aria-hidden="true"></i>
                        <asp:Button runat="server" ID="btnCancel" Text="Exit" CausesValidation="False" OnClientClick="return fnConfirmExit();"
                            CssClass="save_btn fa fa-share-o" OnClick="btnCancel_Click" ToolTip="Exit,Alt+X" AccessKey="X" />
                    </div>
                </div>--%>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <%--  <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" />--%>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
