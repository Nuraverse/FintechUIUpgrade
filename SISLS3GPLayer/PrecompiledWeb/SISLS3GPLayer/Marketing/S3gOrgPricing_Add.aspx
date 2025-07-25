<%@ page language="C#" title="S3G - Pricing" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3gOrgPricing_Add, App_Web_ct41cc2n" enableeventvalidation="false" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC5" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM2" TagPrefix="uc3" %>

<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>

<%@ Register TagPrefix="uc7" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <style type="text/css">
        .grid_btn_Disabled {
            font-size: 12px !important;
            font-weight: 400;
            padding: 3px 10px;
            text-align: center;
            background-color: #81868a;
            color: #fff;
            border-radius: 2px;
            text-decoration: none;
            border: none;
            box-shadow: none;
            cursor: pointer;
            /*font-size: 12px !important;
            font-weight: 400;
            padding: 3px 10px;
            text-align: center;
            background-color: #00529c !important;
            color: #fff;
            border-radius: 2px;
            text-decoration: none;
            border: none;
            box-shadow: none;
            cursor: pointer;*/
        }


        .grid_btn_delete_disabled {
            font-size: 12px !important;
            font-weight: 400;
            padding: 3px 10px;
            text-align: center;
            color: #bab0b0 !important;
            border: 1px #c6c2c2 solid;
            border-radius: 5px;
            text-decoration: none;
            box-shadow: none;
            cursor: pointer;
        }

        .stylePanelInline {
            padding-bottom: 0px;
            margin-bottom: -12px;
            padding-top: 5px;
            padding-left: 2px;
            padding-right: 5px;
            border: solid 1px #92aad126;
            background-color: #92aad124;
            color: #003d9e;
        }
    </style>




    <script type="text/javascript">


        function fnSaveValidation() {

            if (!fnCheckPageValidators("Main Page", false)) {
                alert("Fill the Mandatory value in Main Tab");
                return false;
            }


            if (confirm('Do you want to save?')) {
                Page_BlockSubmit = false;
                var a = event.srcElement;

                if (a.type == "button") {
                    a.style.display = 'none';
                }
                return true;
            }
            else {
                return false;
            }



        }



        function funtrimspace(a) {


            var str = document.getElementById(a).value;
            document.getElementById(a).value = str.trim();
        }



        function percentIT() {

            var gridview = document.getElementById("<%= gvPRDDT.ClientID %>");

            if (gridview == null) return;
            var statusCell = gridview.rows[parseInt(selectedRowIndex) + 1].cells[5];
            var dropDown = statusCell.childNodes[1];

            var FdropDown = dropDown.options[dropDown.selectedIndex].value;

        }


        function FunCheckGridIsEmpty(gridview, isfooterexists) {
            //debugger;
            if (document.getElementById(gridview) == null) {
                return false;
            }
            var table = document.getElementById(gridview);
            var rows = table.getElementsByTagName("tr");
            if (isfooterexists == 'No') {
                if (rows.length > 1) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                if (rows.length > 2) {
                    return true;
                }
                else {
                    return false;
                }
            }
        }

        function fnConfirmUpdate() {

            if (confirm('Do you want to Update the Document Details?')) {
                return true;
            }
            else
                return false;

        }


        function fnAddAssetValidation() {

            if (fnCheckPageValidators('TabAddAssetDetails')) {
                if (funcalassetMarginAmt_dp()) {

                    return true;
                }
                else
                    return false;
            }
            else {
                return false;
            }

        }


        function funCheckMandatory() {
            var v = document.getElementById('ctl00_ContentPlaceHolder1_ddlProposalCopy_hdnAutoPostBack').value;
            if (v == '0') {
                alert('Select the Proposal No');
                return false;
            }
        }

        function fnLoadPath(btnBrowse) {

            if (btnBrowse != null)

                document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_btnBrowse').click();
        }
        function fnLoadPath(btnBrowseI) {

            if (btnBrowseI != null)

                document.getElementById(btnBrowseI).click();
        }


        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
        }

        function funSetValidationValuesRecDate(a, Required, Received, ddlCollectedBy, lblCollectedBy, txtCollectedDate, txtRemarksMO, ddlCADVerifiedBy, lblCADVerifiedById, txtCADVerifiedDate, txtCADVerifierRemarks, ddlCADReceivedBy, lblCADReceivedById, txtCADReceived, txtCADReceiverRemarks) {

            var vGrvId = a.id.toString().indexOf('tl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_grvPRDDCDealer');
            if (vGrvId == 1) {
                document.getElementById('<%=hdnSetForceValuesDealer.ClientID %>').value = "1";
            }



            document.getElementById('<%=hdnSetForceValues.ClientID %>').value = "1";
            var VhdnUserId = document.getElementById('<%=hdnUserId.ClientID %>').value;
            var VhdnUserIdName = document.getElementById('<%=hdnUserIdName.ClientID %>').value;


            var ddlRequired = document.getElementById(Required).value;
            var ddlReceived = document.getElementById(Received).value;

            var hdnRecAccess = document.getElementById('<%=hdnRecAccess.ClientID %>').value;
            var hdnCADVERACCESS = document.getElementById('<%=hdnCADVERACCESS.ClientID %>').value;
            var hdnCADRECACCESS = document.getElementById('<%=hdnCADRECACCESS.ClientID %>').value;



            if (hdnCADRECACCESS == "1") {
                document.getElementById(ddlCADReceivedBy).value = "";
                document.getElementById(lblCADReceivedById).value = "";
                document.getElementById(txtCADReceiverRemarks).value = "";
            }
            if (ddlReceived == "2") {

                if (hdnCADRECACCESS == "1") {
                    document.getElementById(ddlCADReceivedBy).disabled = true;
                    document.getElementById(txtCADReceived).disabled = true;
                    document.getElementById(txtCADReceiverRemarks).disabled = true;
                }
            }
            else {
                if (hdnCADRECACCESS == "1") {

                    if (document.getElementById(txtCADReceived).value != "") {
                        document.getElementById(lblCADReceivedById).value = VhdnUserId;
                        document.getElementById(ddlCADReceivedBy).value = VhdnUserIdName;
                    }
                    document.getElementById(ddlCADReceivedBy).disabled = false;
                    document.getElementById(txtCADReceived).disabled = false;
                    document.getElementById(txtCADReceiverRemarks).disabled = false;
                }
            }
        }


        function funSetValidationValuesVerDate(a, Required, Received, ddlCollectedBy, lblCollectedBy, txtCollectedDate, txtRemarksMO, ddlCADVerifiedBy, lblCADVerifiedById, txtCADVerifiedDate, txtCADVerifierRemarks, ddlCADReceivedBy, lblCADReceivedById, txtCADReceived, txtCADReceiverRemarks) {


            var vGrvId = a.id.toString().indexOf('tl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_grvPRDDCDealer');
            if (vGrvId == 1) {
                document.getElementById('<%=hdnSetForceValuesDealer.ClientID %>').value = "1";
            }


            document.getElementById('<%=hdnSetForceValues.ClientID %>').value = "1";


            var VhdnUserId = document.getElementById('<%=hdnUserId.ClientID %>').value;
            var VhdnUserIdName = document.getElementById('<%=hdnUserIdName.ClientID %>').value;


            var ddlRequired = document.getElementById(Required).value;
            var ddlReceived = document.getElementById(Received).value;

            var hdnRecAccess = document.getElementById('<%=hdnRecAccess.ClientID %>').value;
            var hdnCADVERACCESS = document.getElementById('<%=hdnCADVERACCESS.ClientID %>').value;
            var hdnCADRECACCESS = document.getElementById('<%=hdnCADRECACCESS.ClientID %>').value;



            //if (ddlRequired == "2") {
            //    document.getElementById(Received).value = "0";
            //    document.getElementById(Received).disabled = true;
            //}
            //else {
            //    document.getElementById(Received).disabled = false;
            //}





            if (hdnCADVERACCESS == "1") {
                document.getElementById(ddlCADVerifiedBy).value = "";
                document.getElementById(lblCADVerifiedById).value = "";

                document.getElementById(txtCADVerifierRemarks).value = "";
            }

            //if (hdnCADRECACCESS == "1") {
            //    document.getElementById(ddlCADReceivedBy).value = "";
            //    document.getElementById(lblCADReceivedById).value = "";
            //    document.getElementById(txtCADReceived).value = "";
            //    document.getElementById(txtCADReceiverRemarks).value = "";
            //}




            if (ddlReceived == "2" || ddlReceived == "0") {

                if (hdnCADVERACCESS == "1") {
                    document.getElementById(ddlCADVerifiedBy).disabled = true;
                    document.getElementById(txtCADVerifiedDate).disabled = true;
                    document.getElementById(txtCADVerifierRemarks).disabled = true;
                }

            }
            else {
                if (hdnCADVERACCESS == "1") {

                    if (document.getElementById(txtCADVerifiedDate).value != "") {
                        document.getElementById(lblCADVerifiedById).value = VhdnUserId;
                        document.getElementById(ddlCADVerifiedBy).value = VhdnUserIdName;
                    }
                    document.getElementById(ddlCADVerifiedBy).disabled = false;
                    document.getElementById(txtCADVerifiedDate).disabled = false;
                    document.getElementById(txtCADVerifierRemarks).disabled = false;

                }

            }
        }



        function funSetValidationValuesCollectedDate(a, Required, Received, ddlCollectedBy, lblCollectedBy, txtCollectedDate, txtRemarksMO, ddlCADVerifiedBy, lblCADVerifiedById, txtCADVerifiedDate, txtCADVerifierRemarks, ddlCADReceivedBy, lblCADReceivedById, txtCADReceived, txtCADReceiverRemarks) {





            var vGrvId = a.id.toString().indexOf('tl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_grvPRDDCDealer');
            if (vGrvId == 1) {
                document.getElementById('<%=hdnSetForceValuesDealer.ClientID %>').value = "1";
            }


            document.getElementById('<%=hdnSetForceValues.ClientID %>').value = "1";


            var VhdnUserId = document.getElementById('<%=hdnUserId.ClientID %>').value;
            var VhdnUserIdName = document.getElementById('<%=hdnUserIdName.ClientID %>').value;

            document.getElementById(lblCollectedBy).value = VhdnUserId;
            document.getElementById(ddlCollectedBy).value = VhdnUserIdName;
            return;


            var ddlRequired = document.getElementById(Required).value;
            var ddlReceived = document.getElementById(Received).value;

            var hdnRecAccess = document.getElementById('<%=hdnRecAccess.ClientID %>').value;
            var hdnCADVERACCESS = document.getElementById('<%=hdnCADVERACCESS.ClientID %>').value;
            var hdnCADRECACCESS = document.getElementById('<%=hdnCADRECACCESS.ClientID %>').value;



            if (ddlRequired == "2") {
                document.getElementById(Received).value = "0";
                document.getElementById(Received).disabled = true;
            }
            else {
                document.getElementById(Received).disabled = false;
            }





            if (hdnCADVERACCESS == "1") {
                document.getElementById(ddlCADVerifiedBy).value = "";
                document.getElementById(lblCADVerifiedById).value = "";
                document.getElementById(txtCADVerifiedDate).value = "";
                document.getElementById(txtCADVerifierRemarks).value = "";
            }

            if (hdnCADRECACCESS == "1") {
                document.getElementById(ddlCADReceivedBy).value = "";
                document.getElementById(lblCADReceivedById).value = "";
                document.getElementById(txtCADReceived).value = "";
                document.getElementById(txtCADReceiverRemarks).value = "";
            }




            if (ddlReceived == "2") {

                if (hdnRecAccess == "1") {
                    document.getElementById(ddlCollectedBy).disabled = true;
                    document.getElementById(txtCollectedDate).disabled = true;
                    document.getElementById(txtRemarksMO).disabled = true;
                }

                if (hdnCADVERACCESS == "1") {
                    document.getElementById(ddlCADVerifiedBy).disabled = true;
                    document.getElementById(txtCADVerifiedDate).disabled = true;
                    document.getElementById(txtCADVerifierRemarks).disabled = true;
                }

                if (hdnCADRECACCESS == "1") {
                    document.getElementById(ddlCADReceivedBy).disabled = true;
                    document.getElementById(txtCADReceived).disabled = true;
                    document.getElementById(txtCADReceiverRemarks).disabled = true;
                }


            }
            else {
                if (hdnRecAccess == "1") {

                    if (document.getElementById(txtCollectedDate).value != "") {
                        document.getElementById(lblCollectedBy).value = VhdnUserId;
                        document.getElementById(ddlCollectedBy).value = VhdnUserIdName;
                    }
                    else {
                        document.getElementById(lblCollectedBy).value = "";
                        document.getElementById(ddlCollectedBy).value = "";
                    }


                    document.getElementById(ddlCollectedBy).disabled = false;
                    document.getElementById(txtCollectedDate).disabled = false;
                    document.getElementById(txtRemarksMO).disabled = false;
                }

                if (hdnCADVERACCESS == "1") {
                    //document.getElementById(lblCADVerifiedById).value = VhdnUserId;
                    //document.getElementById(ddlCADVerifiedBy).value = VhdnUserIdName;
                    document.getElementById(ddlCADVerifiedBy).disabled = false;
                    document.getElementById(txtCADVerifiedDate).disabled = false;
                    document.getElementById(txtCADVerifierRemarks).disabled = false;
                }

                if (hdnCADRECACCESS == "1") {
                    //document.getElementById(lblCADReceivedById).value = VhdnUserId;
                    //document.getElementById(ddlCADReceivedBy).value = VhdnUserIdName;
                    document.getElementById(ddlCADReceivedBy).disabled = false;
                    document.getElementById(txtCADReceived).disabled = false;
                    document.getElementById(txtCADReceiverRemarks).disabled = false;
                }



            }
        }



        function funSetValidationValuesReceived(a, Required, Received, ddlCollectedBy, lblCollectedBy, txtCollectedDate, txtRemarksMO, ddlCADVerifiedBy, lblCADVerifiedById, txtCADVerifiedDate, txtCADVerifierRemarks, ddlCADReceivedBy, lblCADReceivedById, txtCADReceived, txtCADReceiverRemarks) {


            var vGrvId = a.id.toString().indexOf('tl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_grvPRDDCDealer');
            if (vGrvId == 1) {
                document.getElementById('<%=hdnSetForceValuesDealer.ClientID %>').value = "1";
            }



            document.getElementById('<%=hdnSetForceValues.ClientID %>').value = "1";


            var VhdnUserId = document.getElementById('<%=hdnUserId.ClientID %>').value;
            var VhdnUserIdName = document.getElementById('<%=hdnUserIdName.ClientID %>').value;


            var ddlRequired = document.getElementById(Required).value;
            var ddlReceived = document.getElementById(Received).value;


            var hdnReqAccess = document.getElementById('<%=hdnReqAccess.ClientID %>').value;

            var hdnRecAccess = document.getElementById('<%=hdnRecAccess.ClientID %>').value;
            var hdnCADVERACCESS = document.getElementById('<%=hdnCADVERACCESS.ClientID %>').value;
            var hdnCADRECACCESS = document.getElementById('<%=hdnCADRECACCESS.ClientID %>').value;



            if (ddlRequired == "2") {
                document.getElementById(Received).value = "2";
                document.getElementById(Received).disabled = true;
                document.getElementById(lblCollectedBy).value = "";
                document.getElementById(ddlCollectedBy).value = "";
                document.getElementById(txtCollectedDate).value = "";
                document.getElementById(txtRemarksMO).value = "";
                return;


            }
            else {
                document.getElementById(Received).disabled = false;
            }




            if (hdnReqAccess == "1") {
                document.getElementById(lblCollectedBy).value = "";
                document.getElementById(ddlCollectedBy).value = "";
                document.getElementById(txtCollectedDate).value = "";
                document.getElementById(txtRemarksMO).value = "";
            }

            if (hdnCADVERACCESS == "1") {
                document.getElementById(ddlCADVerifiedBy).value = "";
                document.getElementById(lblCADVerifiedById).value = "";
                document.getElementById(txtCADVerifiedDate).value = "";
                document.getElementById(txtCADVerifierRemarks).value = "";
            }

            if (hdnCADRECACCESS == "1") {
                document.getElementById(ddlCADReceivedBy).value = "";
                document.getElementById(lblCADReceivedById).value = "";
                document.getElementById(txtCADReceived).value = "";
                document.getElementById(txtCADReceiverRemarks).value = "";
            }




            if (ddlReceived == "2") {

                if (hdnReqAccess == "1") {


                    document.getElementById(lblCollectedBy).value = "";
                    document.getElementById(ddlCollectedBy).value = "";
                    document.getElementById(txtCollectedDate).value = "";
                    document.getElementById(txtRemarksMO).value = "";

                    document.getElementById(ddlCollectedBy).disabled = true;
                    document.getElementById(txtCollectedDate).disabled = true;
                    document.getElementById(txtRemarksMO).disabled = true;
                }

                if (hdnCADVERACCESS == "1") {
                    document.getElementById(ddlCADVerifiedBy).disabled = true;
                    document.getElementById(txtCADVerifiedDate).disabled = true;
                    document.getElementById(txtCADVerifierRemarks).disabled = true;
                }

                if (hdnCADRECACCESS == "1") {
                    document.getElementById(ddlCADReceivedBy).disabled = true;
                    document.getElementById(txtCADReceived).disabled = true;
                    document.getElementById(txtCADReceiverRemarks).disabled = true;
                }


            }
            else {
                if (hdnReqAccess == "1") {

                    document.getElementById(lblCollectedBy).value = VhdnUserId;
                    document.getElementById(ddlCollectedBy).value = VhdnUserIdName;
                    document.getElementById(ddlCollectedBy).disabled = false;
                    document.getElementById(txtCollectedDate).disabled = false;
                    document.getElementById(txtRemarksMO).disabled = false;
                    document.getElementById(txtCollectedDate).value = document.getElementById('<%=txtOfferDate.ClientID %>').value;


                }

                if (hdnCADVERACCESS == "1") {
                    document.getElementById(lblCADVerifiedById).value = VhdnUserId;
                    document.getElementById(ddlCADVerifiedBy).value = VhdnUserIdName;
                    document.getElementById(ddlCADVerifiedBy).disabled = false;
                    document.getElementById(txtCADVerifiedDate).disabled = false;
                    document.getElementById(txtCADVerifierRemarks).disabled = false;
                    document.getElementById(txtCADVerifiedDate).value = document.getElementById('<%=txtOfferDate.ClientID %>').value;
                }

                if (hdnCADRECACCESS == "1") {
                    document.getElementById(lblCADReceivedById).value = VhdnUserId;
                    document.getElementById(ddlCADReceivedBy).value = VhdnUserIdName;
                    document.getElementById(ddlCADReceivedBy).disabled = false;
                    document.getElementById(txtCADReceived).disabled = false;
                    document.getElementById(txtCADReceiverRemarks).disabled = false;
                    document.getElementById(txtCADReceived).value = document.getElementById('<%=txtOfferDate.ClientID %>').value;
                }



            }
        }



        function funSetValidationValuesRequired(a, Required, Received, ddlCollectedBy, lblCollectedBy, txtCollectedDate, txtRemarksMO, ddlCADVerifiedBy, lblCADVerifiedById, txtCADVerifiedDate, txtCADVerifierRemarks, ddlCADReceivedBy, lblCADReceivedById, txtCADReceived, txtCADReceiverRemarks) {



            var vGrvId = a.id.toString().indexOf('tl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_grvPRDDCDealer');
            if (vGrvId == 1) {
                document.getElementById('<%=hdnSetForceValuesDealer.ClientID %>').value = "1";
            }

            document.getElementById('<%=hdnSetForceValues.ClientID %>').value = "1";

            var VhdnUserId = document.getElementById('<%=hdnUserId.ClientID %>').value;
            var VhdnUserIdName = document.getElementById('<%=hdnUserIdName.ClientID %>').value;

            return;
            var ddlRequired = document.getElementById(Required).value;
            var ddlReceived = document.getElementById(Received).value;


            var hdnReqAccess = document.getElementById('<%=hdnReqAccess.ClientID %>').value;

            var hdnRecAccess = document.getElementById('<%=hdnRecAccess.ClientID %>').value;
            var hdnCADVERACCESS = document.getElementById('<%=hdnCADVERACCESS.ClientID %>').value;
            var hdnCADRECACCESS = document.getElementById('<%=hdnCADRECACCESS.ClientID %>').value;



            if (ddlRequired == "2") {//Not Required



                if (hdnRecAccess == "0") {

                    document.getElementById(Received).disabled = true;

                }
                else {
                    document.getElementById(Received).value = "2";
                    document.getElementById(Received).disabled = false;
                }


                document.getElementById(Received).disabled = true;
                //document.getElementById(lblCollectedBy).value = "";
                //document.getElementById(ddlCollectedBy).value = "";
                //document.getElementById(txtCollectedDate).value = "";
                //document.getElementById(txtRemarksMO).value = "";

                document.getElementById(lblCollectedBy).disabled = true;
                document.getElementById(ddlCollectedBy).disabled = true;
                document.getElementById(txtCollectedDate).disabled = true;
                document.getElementById(txtRemarksMO).disabled = true;






            }
            else {

                if (hdnRecAccess == "0") {

                    document.getElementById(Received).disabled = true;
                }
                else {
                    document.getElementById(Received).disabled = false;
                }


            }




            //if (hdnReqAccess == "1") {
            //    document.getElementById(lblCollectedBy).value = "";
            //    document.getElementById(ddlCollectedBy).value = "";
            //    document.getElementById(txtCollectedDate).value = "";
            //    document.getElementById(txtRemarksMO).value = "";
            //}

            //if (hdnCADVERACCESS == "1") {
            //    document.getElementById(ddlCADVerifiedBy).value = "";
            //    document.getElementById(lblCADVerifiedById).value = "";
            //    document.getElementById(txtCADVerifiedDate).value = "";
            //    document.getElementById(txtCADVerifierRemarks).value = "";
            //}

            //if (hdnCADRECACCESS == "1") {
            //    document.getElementById(ddlCADReceivedBy).value = "";
            //    document.getElementById(lblCADReceivedById).value = "";
            //    document.getElementById(txtCADReceived).value = "";
            //    document.getElementById(txtCADReceiverRemarks).value = "";
            //}




            if (ddlReceived == "2") {

                if (hdnReqAccess == "1") {


                    //document.getElementById(lblCollectedBy).value = "";
                    //document.getElementById(ddlCollectedBy).value = "";
                    //document.getElementById(txtCollectedDate).value = "";
                    //document.getElementById(txtRemarksMO).value = "";

                    document.getElementById(ddlCollectedBy).disabled = true;
                    document.getElementById(txtCollectedDate).disabled = true;
                    document.getElementById(txtRemarksMO).disabled = true;
                }

                if (hdnCADVERACCESS == "1") {
                    document.getElementById(ddlCADVerifiedBy).disabled = true;
                    document.getElementById(txtCADVerifiedDate).disabled = true;
                    document.getElementById(txtCADVerifierRemarks).disabled = true;
                }

                if (hdnCADRECACCESS == "1") {
                    document.getElementById(ddlCADReceivedBy).disabled = true;
                    document.getElementById(txtCADReceived).disabled = true;
                    document.getElementById(txtCADReceiverRemarks).disabled = true;
                }


            }
            else {
                if (hdnReqAccess == "1") {

                    //document.getElementById(lblCollectedBy).value = VhdnUserId;
                    //document.getElementById(ddlCollectedBy).value = VhdnUserIdName;
                    document.getElementById(ddlCollectedBy).disabled = false;
                    document.getElementById(txtCollectedDate).disabled = false;
                    document.getElementById(txtRemarksMO).disabled = false;



                }

                if (hdnCADVERACCESS == "1") {
                    //document.getElementById(lblCADVerifiedById).value = VhdnUserId;
                    //document.getElementById(ddlCADVerifiedBy).value = VhdnUserIdName;
                    document.getElementById(ddlCADVerifiedBy).disabled = false;
                    document.getElementById(txtCADVerifiedDate).disabled = false;
                    document.getElementById(txtCADVerifierRemarks).disabled = false;

                }

                if (hdnCADRECACCESS == "1") {
                    //document.getElementById(lblCADReceivedById).value = VhdnUserId;
                    //document.getElementById(ddlCADReceivedBy).value = VhdnUserIdName;
                    document.getElementById(ddlCADReceivedBy).disabled = false;
                    document.getElementById(txtCADReceived).disabled = false;
                    document.getElementById(txtCADReceiverRemarks).disabled = false;

                }



            }
        }



        function funSetValidationValuesRequiredFooter(a, b, c, d) {


            var hdnReqAccess = document.getElementById('<%=hdnReqAccess.ClientID %>').value;
            var hdnRecAccess = document.getElementById('<%=hdnRecAccess.ClientID %>').value;


            var ddlRequired = document.getElementById(b).value;
            var ddlReceived = document.getElementById(c).value;
            if (ddlRequired == "2") {

                document.getElementById(c).value = "0";
                document.getElementById(c).disabled = true;
                document.getElementById(d).disabled = true;
                document.getElementById(d).style.visibility = "hidden";
                document.getElementById(d).class = "";
                document.getElementById(d).enabled = false;


            }
            else {
                document.getElementById(c).disabled = false;
                document.getElementById(d).disabled = false;
                document.getElementById(d).style.visibility = "visible";
                document.getElementById(d).class = "validation_msg_box_sapn";
                document.getElementById(d).enabled = true;



            }
        }



        function funSetValidationValues() {

            document.getElementById('<%=hdnSetForceValues.ClientID %>').value = "1";
        }

        function funSetValidationValuesValidate() {

            if (document.getElementById('<%=hdnSetForceValues.ClientID %>').value == "1") {
                alert('Update the Documents and Continue to add the Additional Documents');
            }
        }

        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabMainPage_btnLoadCustomer').click();
        }
        function fnLoadCustomerCopyProfile() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabMainPage_btnLoadCopyProfile').click();
        }



        function fnTrashSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }

        function fnTrashCommonSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNameLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNameLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNameLease.ClientID %>').value = "";


                }
            }
        }


        function fnConfirmDealCancel() {
            if (confirm('Are you sure want to Cancel this Deal'))
                return true;
            else
                return false;
        }
        function fnLoadProposalFromDMS() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabMainPage_btnProposalFromDMS').click();
        }



        function funPriCheckSaveValidation() {

            if (confirm('Do you want to save?')) {
                Page_BlockSubmit = false;
                var a = event.srcElement;

                if (a.type == "submit") {
                    a.style.display = 'none';
                }
                return true;
            }
            else {
                return false;
            }


        }


        var btnActive_index = 0;
        var index = 0;
        function pageLoad() {
            if (document.getElementById('<%=hdnPostback.ClientID %>').value == "0") {
                PageLoadTabContSetFocus();
            }
            tab = $find('ctl00_ContentPlaceHolder1_tcPricing');
            var querymode = location.search.split("qsMode=");
            if (querymode.length > 1) {
                if (querymode[1].length > 1) {
                    querymode = querymode[1].split("&");
                    querymode = querymode[0];
                }
                else {
                    querymode = querymode[1];
                }
                if (querymode != 'Q') {
                    tab.add_activeTabChanged(on_Change);
                    var newindex = tab.get_activeTabIndex(index);
                    btnActive_index = newindex;
                    var btnSave = document.getElementById('<%=btnSave.ClientID %>')

                    //btnSave.disabled = false;
                    //btnSave.className = "css_btn_enabled";

                    //if (newindex == tab._tabs.length - 1) {
                    //    btnSave.disabled = false;
                    //    btnSave.className = "css_btn_enabled";
                    //}
                    //else {
                    //    btnSave.className = "css_btn_disabled";
                    //    btnSave.disabled = true;
                    //}
                }
            }
            function on_Change(sender, e) {
               
                fnMoveNextTab('Tab');
            }
        }
        function uploadComplete(sender, args) {

            var objID = sender._inputFile.id.split("_");
            objID = "<%= gvPRDDT.ClientID %>" + "_" + objID[5];

            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;


            }
            document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_hdnSetForceValues').value = "0";
            document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_btndoPostback').click();
        }
        function uploadCompleteF(sender, args) {

            var objID = sender._inputFile.id.split("_");
            objID = "<%= gvPRDDT.ClientID %>" + "_" + objID[5];

            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;


            }
            document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_hdnSetForceValues').value = "0";
            document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabDocumentDetails_btndoPostbackF').click();
        }

        function funcalassetvalue() {


            debugger;
            var vUnitCount = document.getElementById('<%=txtUnitCount.ClientID %>').value;
            
            if (vUnitCount == "") {
                vUnitCount = 0;
            }

            if (parseFloat(vUnitCount) > 500) {
                alert('Asset Unit Count Should not exceed the 500');
                document.getElementById('<%=txtUnitCount.ClientID %>').value = "";
                return;
            }


            var VUnitValue = document.getElementById('<%=txtUnitValue.ClientID %>').value;




            var str = VUnitValue.split('.');


            if (str.length > 2) {
                document.getElementById('<%=txtUnitValue.ClientID %>').value = "";
                alert('Invalid Amount');
                document.getElementById('<%=txtUnitValue.ClientID %>').value = "";
                document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = "";
                document.getElementById('<%=txtLpoAssetAmount.ClientID %>').value = "";
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "";
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = "";
                document.getElementById('<%=txtMargintoDealer.ClientID %>').value = "";
                document.getElementById('<%=txtMargintoMFC.ClientID %>').value = "";
                document.getElementById('<%=txtTradeIn.ClientID %>').value = "";




                return false;
            }










            var VUnitCount = document.getElementById('<%=txtUnitCount.ClientID %>').value;

            if (VUnitCount == "") {
                return;
            }

            if (VUnitValue == "") {
                return;
            }


            if (parseFloat(document.getElementById('<%=txtUnitCount.ClientID %>').value) != 0 && parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value) != 0) {

                var varTotalAmt;
                var varSetZero;
                varSetZero = 0;
                varTotalAmt = 0;

                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = 0;


                varTotalAmt = ((parseFloat(document.getElementById('<%=txtUnitCount.ClientID %>').value) *
                    parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value)).toFixed(3));
                if (document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value != "") {
                    varTotalAmt = (varTotalAmt - parseFloat(document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value)).toFixed(3);
                }

                document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = varTotalAmt; //-varMarginAmt;
                document.getElementById('<%=txtLpoAssetAmount.ClientID %>').value = parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value).toFixed(3);
                funcalassetMarginAmt();
            }



            document.getElementById('<%=txtMargintoDealer.ClientID %>').value = varSetZero.toFixed(3);
            document.getElementById('<%=txtMargintoMFC.ClientID %>').value = varSetZero.toFixed(3);
            document.getElementById('<%=txtTradeIn.ClientID %>').value = varSetZero.toFixed(3);
            debugger;
            fnthousands_separators('<%=txtTotalAssetValue.ClientID %>', 2);
            fnthousands_separators('<%=txtUnitValue.ClientID %>', 2);
            fnthousands_separators('<%=txtMargintoDealer.ClientID %>', 2);
            fnthousands_separators('<%=txtMargintoMFC.ClientID %>', 2);
            fnthousands_separators('<%=txtTradeIn.ClientID %>', 2);
            fnthousands_separators('<%=txtLpoAssetAmount.ClientID %>', 2);

        }

        function funcalassetMarginAmt() {

            var varTotalAmt;
            if (document.getElementById('<%=txtMarginPercentage.ClientID %>').value != "" && document.getElementById('<%=txtTotalAssetValue.ClientID %>').value != "") {

                varTotalAmt = (parseFloat(document.getElementById('<%=txtTotalAssetValue.ClientID %>').value) *
                    (parseFloat(document.getElementById('<%=txtMarginPercentage.ClientID %>').value) / 100));
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "";
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = varTotalAmt.toFixed(3);
            }
            else {
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "";
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').disabled = false;
            }
            fnthousands_separators('<%=txtTotalAssetValue.ClientID %>', 2);
            fnthousands_separators('<%=txtUnitValue.ClientID %>', 2);
            fnthousands_separators('<%=txtMargintoDealer.ClientID %>', 2);
            fnthousands_separators('<%=txtMargintoMFC.ClientID %>', 2);
            fnthousands_separators('<%=txtTradeIn.ClientID %>', 2);
            fnthousands_separators('<%=txtLpoAssetAmount.ClientID %>', 2);
        }

        function funResetassetMarginPercent() {
            var vartotper;
            if (document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value != "" && document.getElementById('<%=txtTotalAssetValue.ClientID %>').value != "") {

                vartotper = (parseFloat(document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value) / parseFloat(document.getElementById('<%=txtTotalAssetValue.ClientID %>').value)) * 100;
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = "";
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = vartotper.toFixed(3);
            }
            else {
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = "";
                document.getElementById('<%=txtMarginPercentage.ClientID %>').disabled = false;
            }
        }





        function funcalassetMarginAmt_dp() {
            //Added by Sathish R on 20-Aug-2018
            var VMargintoDealer = document.getElementById('<%=txtMargintoDealer.ClientID %>').value;
            var VtxtMargintoMFC = document.getElementById('<%=txtMargintoMFC.ClientID %>').value;
            var VtxtTradeIn = document.getElementById('<%=txtTradeIn.ClientID %>').value;
            debugger;
            VMargintoDealer = VMargintoDealer.replace(/[^0-9\.]+/g, "");
            VtxtMargintoMFC = VtxtMargintoMFC.replace(/[^0-9\.]+/g, "");
            VtxtTradeIn = VtxtTradeIn.replace(/[^0-9\.]+/g, "");

            var VtxtTotalMargin = 0;
            var VtxtLpoAssetAmount = document.getElementById('<%=txtLpoAssetAmount.ClientID %>').value;
            var VtxtTotalAssetValue = document.getElementById('<%=txtTotalAssetValue.ClientID %>').value;


            var VUnitValue = document.getElementById('<%=txtUnitValue.ClientID %>').value;
            var VUnitCount = document.getElementById('<%=txtUnitCount.ClientID %>').value;

            VtxtLpoAssetAmount = VtxtLpoAssetAmount.replace(/[^0-9\.]+/g, "");
            VtxtTotalAssetValue = VtxtTotalAssetValue.replace(/[^0-9\.]+/g, "");
            VUnitValue = VUnitValue.replace(/[^0-9\.]+/g, "");

            if (VUnitCount == "") {

                if (!fnCheckPageValidators('TabAddAssetDetails', false)) {
                    return false;
                }
            }

            if (VUnitValue == "") {

                if (!fnCheckPageValidators('TabAddAssetDetails', false)) {
                    return false;
                }
            }
            if (parseFloat(VUnitValue) <= 0) {

                alert('Unit Value should be greater than the Zero');
                return false;
                if (!fnCheckPageValidators('TabAddAssetDetails', false)) {
                    return false;
                }
            }


            if (parseFloat(document.getElementById('<%=txtUnitCount.ClientID %>').value) != 0 && parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value) != 0) {

                if (VMargintoDealer == "") {
                    VMargintoDealer = 0;
                }
                if (VtxtMargintoMFC == "") {
                    VtxtMargintoMFC = 0;
                }
                if (VtxtLpoAssetAmount == "") {
                    VtxtLpoAssetAmount = 0;
                }
                if (VtxtTotalAssetValue == "") {
                    VtxtTotalAssetValue = 0;
                }
                if (VtxtTradeIn == "") {
                    VtxtTradeIn = 0;
                }
                if (parseFloat(VUnitValue) <= 0) {

                    alert('Unit Value should be greater than the Zero');
                    return false;
                }



                VtxtTotalMargin = parseFloat(VMargintoDealer) + parseFloat(VtxtMargintoMFC) + parseFloat(VtxtTradeIn);
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = parseFloat(VtxtTotalMargin).toFixed(3);

                document.getElementById('<%=txtLpoAssetAmount.ClientID %>').value = (parseFloat(VUnitValue) - (parseFloat(VMargintoDealer) + parseFloat(VtxtTradeIn))).toFixed(3);

                if (parseFloat(VUnitValue) <= parseFloat(VtxtTotalMargin)) {
                    alert('Total margin amount should be less than the Unit Value');
                    //document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "0";
                    return false;
                }
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = (parseFloat(VtxtTotalMargin) / parseFloat(VtxtTotalAssetValue) * 100).toFixed(3);
            }
            fnthousands_separators('<%=txtTotalAssetValue.ClientID %>', 2);
            fnthousands_separators('<%=txtUnitValue.ClientID %>', 2);
            fnthousands_separators('<%=txtMargintoDealer.ClientID %>', 2);
            fnthousands_separators('<%=txtMargintoMFC.ClientID %>', 2);
            fnthousands_separators('<%=txtTradeIn.ClientID %>', 2);
            fnthousands_separators('<%=txtLpoAssetAmount.ClientID %>', 2);
            fnthousands_separators('<%=txtMarginAmountAsset.ClientID %>', 2);


            if (!fnCheckPageValidators('TabAddAssetDetails', false)) {
                return false;
            }
        }



        function fnMoveNextTab(Source_Invoker) {
            
            tab = $find('ctl00_ContentPlaceHolder1_tcPricing');


            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var Valgrp = document.getElementById('<%=vsPricing.ClientID %>')
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            //btnSave.disabled=true;
            Valgrp.validationGroup = strValgrp;

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }

            //btnSave.disabled = false;
            //btnSave.className = "css_btn_enabled";
            //if (newindex == tab._tabs.length - 1) {

            //    btnSave.disabled = false;
            //    btnSave.className = "css_btn_enabled";

            //}
            //else {
            //    btnSave.disabled = true;
            //    btnSave.className = "css_btn_disabled";

            //}


            if (newindex > index) {
                debugger;
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                }
                else {
                    var lobcode = FunGetSelectedLob();
                    var IsAssetAvail;
                    var IsCheckAssetAvail;
                    switch (lobcode.toLowerCase()) {
                        //Code commented to enable Asset tab for "TL" & "TE" - kuppu - Jun-18         
                        //case "te": //Term loan Extensible   
                        //case "tl": //Term loan                                 

                        case "ft": //Factoring 
                        case "wc": //Working Capital

                            //tab.get_tabs()[2].set_enabled(false);
                            if ((lobcode.toLowerCase() == "ft") || (lobcode.toLowerCase() == "wc")) {
                                //Code added to disable Repayment tab for Ft and WC - Kuppu - June-07-2012
                                //tab.get_tabs()[3].set_enabled(false);
                            }
                            IsAssetAvail = "No";
                            break;
                        default:
                            tab.get_tabs()[2].set_enabled(true);
                            tab.get_tabs()[3].set_enabled(true);
                            IsAssetAvail = "Yes";
                            break;
                    }
                    switch (lobcode.toLowerCase()) {
                        //Code commented to enable Asset tab for "TL" & "TE" - kuppu - Jun-18     
                        case "te": //Term loan Extensible   
                        case "tl": //Term loan   
                        case "ft": //Factoring 
                        case "wc": //Working Capital
                        case "ln": //Working Capital
                            IsCheckAssetAvail = false;

                            break;
                        default:
                            IsCheckAssetAvail = true;

                            break;
                    }
                    switch (index) {

                        case 0:
                            
                            if (!FunCheckGridIsEmpty('<%=GRVPDCDetails.ClientID %>', 'Yes')) {

                                if (lobcode.toLowerCase() == "hp" || lobcode.toLowerCase() == "tl") {
                                    alert('PDC Details Mandatory');
                                    tab.set_activeTabIndex(index);
                                    return;
                                }
                            }
                            var v = document.getElementById("<%= hdnPricingId.ClientID %>").value;
                            var hdnIsLoad = document.getElementById("<%= hdnIsLoad.ClientID %>").value;
                            //var hdnIsDMS = document.getElementById("<%= hdnIsDMS.ClientID %>").value;
                            if (v == "0") {
                                if (hdnIsLoad == "1") {
                                    document.getElementById("<%= btnViewDocuments.ClientID %>").click();

                                }
                            }

                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 1:
                            //alert('0');
                            var v = document.getElementById("<%= hdnPricingId.ClientID %>").value;
                            var hdnIsLoad = document.getElementById("<%= hdnIsLoad.ClientID %>").value;
                            if (v == "0") {
                                if (hdnIsLoad == "1") {
                                    document.getElementById("<%= btnViewDocuments.ClientID %>").click();

                                }
                            }
                            $find(tab).get_tabs()[1].set_enabled(false);


                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 2:
                            //alert('2');
                            var v = document.getElementById("<%= hdnPricingId.ClientID %>").value;
                            var hdnIsLoad = document.getElementById("<%= hdnIsLoad.ClientID %>").value;
                            if (v == "0") {
                                if (hdnIsLoad == "1") {
                                    document.getElementById("<%= btnViewDocuments.ClientID %>").click();

                                }
                            }
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 3:
                            //alert('3');
                            var v = document.getElementById("<%= hdnPricingId.ClientID %>").value;
                            var hdnIsLoad = document.getElementById("<%= hdnIsLoad.ClientID %>").value;
                            if (v == "0") {
                                if (hdnIsLoad == "1") {
                                    document.getElementById("<%= btnViewDocuments.ClientID %>").click();

                                }
                            }
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 4:
                        case 5:
                        case 6:
                            if (IsAssetAvail == "Yes") {
                                btnSave.disabled = false;
                            }
                            break;
                        case 7:
                            if (IsAssetAvail == "No") {
                                btnSave.disabled = false;
                            }
                            break;
                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                index = tab.get_activeTabIndex(newindex);

            }
        }
        function FunGetSelectedLob() {
            var ddlLob = document.getElementById('<%=hdnLobCode.ClientID %>').value;
            return ddlLob;
        }
        function PageLoadTabContSetFocus() {
            var TC = $find("<%=tcPricing.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLob.ClientID %>").focus();
            }
        }

        function fnLoadCustomerMaster() {
            ////debugger;
            document.getElementById("<%= btnLoadCustomerMaster.ClientID %>").click();

        }


        



    </script>


    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div style="border: solid 1px #92aad126; background-color: #92aad124;" class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading">
                                </asp:Label>
                                <asp:HiddenField ID="hdnPostback" runat="server" />
                                <input type="hidden" id="bodyy" value="0" />
                                <input type="hidden" id="endreq" value="0" />
                                <input type="hidden" id="hdnPricingId" runat="server" />
                                <asp:HiddenField runat="server" ID="hdnCustAge" />
                                <asp:HiddenField runat="server" ID="hdnAge" />
                                <asp:HiddenField runat="server" ID="hdnIsLoad" />

                                <asp:HiddenField runat="server" ID="hdnUserId" />
                                <asp:HiddenField runat="server" ID="hdnUserIdName" />

                                <asp:HiddenField runat="server" ID="hdnReqAccess" />
                                <asp:HiddenField runat="server" ID="hdnRecAccess" />
                                <asp:HiddenField runat="server" ID="hdnCADVERACCESS" />
                                <asp:HiddenField runat="server" ID="hdnCADRECACCESS" />

                                <asp:TextBox ID="txtCustomerFocus" runat="server"></asp:TextBox>
                                <asp:Button ID="btnLoadCustomerMaster" Style="display: none" runat="server" Text="Load Asset" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomerMaster_Click" />


                                <asp:Button ID="btnViewDocuments" CssClass="save_btn fa fa-floppy-o" Style="display: none" CausesValidation="false" UseSubmitBehavior="false" Text="Update Documents" OnClick="btnViewDocuments_Click" runat="server" />
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <asp:Panel runat="server" ID="Panel5" CssClass="stylePanelInline" HorizontalAlign="Left" Width="100%" GroupingText="">
                            <div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">

                                            <asp:TextBox ID="txtProposalNumber" Enabled="false" ToolTip="Proposal Number" TabIndex="-1" class="md-form-control form-control login_form_content_input requires_true" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblProposalNumber" CssClass="styleDisplayLabel" runat="server" Text="Proposal Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlStatus" Enabled="false" TabIndex="-1" runat="server" ToolTip="Status"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ValidationGroup="Main Page"
                                                ErrorMessage="Enter the Status" InitialValue="0" SetFocusOnError="true" ControlToValidate="ddlStatus"
                                                Display="None"></asp:RequiredFieldValidator>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblStatus" runat="server" CssClass="styleReqFieldLabel" Text="Proposal Status"
                                                    ToolTip="Status"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountNumber" ReadOnly="true" TabIndex="-1" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAccountNumber" TabIndex="-1" CssClass="styleDisplayLabel" runat="server" Text="Account Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div style="display: none" class="col">
                                        <asp:HiddenField ID="hdnLobCode" runat="server" />
                                        <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                        <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                    </div>
                    <div style="margin-top: -0px" class="row">
                        <cc1:TabContainer ID="tcPricing" runat="server" AutoPostBack="false" ActiveTabIndex="0" CssClass="styleTabPanel"
                            Width="100%">
                            <cc1:TabPanel runat="server" Width="99%" HeaderText="MainPage" ID="TabMainPage" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Main Page 
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <asp:Panel runat="server" Style="margin-top: -9px" ID="panInputCriteria" CssClass="stylePanel" Width="99%" GroupingText="Basic Details">
                                                        <div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLob" runat="server" ToolTip="Line of Business" OnSelectedIndexChanged="ddlLob_SelectedIndexChanged"
                                                                            class="md-form-control form-control" DropDownStyle="DropDown"
                                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                            AutoPostBack="true">
                                                                        </asp:DropDownList>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblLob" CssClass="styleReqFieldLabel" runat="server" ToolTip="Line of Business" Text="Line of Business"></asp:Label>
                                                                            <input id="hdnCustID" type="hidden" runat="server" />
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlLob" runat="server" ErrorMessage="Select the Line of Business"
                                                                                SetFocusOnError="true" ControlToValidate="ddlLob" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Main Page"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="cmbLocation" runat="server" ToolTip="Branch" OnSelectedIndexChanged="cmbLocation_SelectedIndexChanged"
                                                                            class="md-form-control form-control" DropDownStyle="DropDown"
                                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                            AutoPostBack="True">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Select the Branch"
                                                                                SetFocusOnError="true" ControlToValidate="cmbLocation" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Main Page"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblLocation" runat="server" ToolTip="Branch" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="cmbSubLocation" runat="server" ToolTip="Sub Branch"
                                                                            class="md-form-control form-control" DropDownStyle="DropDown"
                                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                            AutoPostBack="false">
                                                                        </asp:DropDownList>
                                                                        <%-- <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvSubLocation" runat="server" ErrorMessage="Select the Sub Location"
                                                                                SetFocusOnError="true" ControlToValidate="cmbSubLocation" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Main Page"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>--%>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblSubLocation" runat="server" ToolTip="Sub Branch" Text="Sub Location" CssClass="styleDisplayFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 0px !important; padding-right: 5px !important">


                                                                                    <UC5:AutoSugg ID="ucCheckListFromDMS" runat="server" AutoPostBack="true"
                                                                                        class="md-form-control form-control" ServiceMethod="GetProposalfromDMS" ToolTip="Proposal From DMS(Proposal No/Name)" OnItem_Selected="ucCheckListFromDMS_Item_Selected"
                                                                                        ErrorMessage="Select an Proposal(DMS)" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <asp:HiddenField ID="hdnIsDMS" runat="server" />
                                                                                    <asp:HiddenField ID="hdnISDMSModify" runat="server" />
                                                                                    <asp:HiddenField ID="hdnPricing_ID" runat="server" />
                                                                                    <asp:HiddenField ID="hdnIs_IS_NEW_CUSTOMER_FLAG" runat="server" />
                                                                                    <label>
                                                                                        <asp:Label ID="lblCheckListFromDMS" ToolTip="Proposal From DMS(Proposal No)" runat="server" Text="Proposal From DMS(Proposal No/Name)" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </td>
                                                                                <td style="padding: 0px !important; width: 24px;">
                                                                                    <i style="font-size: 6px; color: aliceblue">

                                                                                        <button id="btnViewPropect" runat="server" title="View Prospect Information" causesvalidation="false" onserverclick="btnViewPropect_ServerClick" class="btn_control"><i class="fa fa-eye"></i></button>

                                                                                    </i>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none;">
                                                                    <div class="md-input">
                                                                        <%-- <div>
                                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">--%>
                                                                        <uc2:LOV ID="ucProposalFromDMS" runat="server" strLOV_Code="CMDPDMS" />
                                                                        <%-- </div>
                                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">--%>
                                                                        <%-- </div>--%>
                                                                        <%--</div>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblProposalfromDMS" ToolTip="Proposal(DMS)" runat="server" Text="Proposal(DMS)" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>

                                                                    <asp:Button ID="btnProposalFromDMS" TabIndex="-1" runat="server" OnClick="btnLoadCProposalfromDMS_OnClick" CssClass="save_btn"
                                                                        Style="display: none;" Text="Load Proposal" CausesValidation="false" />
                                                                </div>
                                                                <%--</div>--%>
                                                                <%--<div class="row">--%>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <%--  <div class="row">
                                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9" style="padding-left: 0px!important; padding-right: 0px !important;">
                                                                                <asp:DropDownList ID="ddlCustomerType" runat="server" AutoPostBack="false" ToolTip="Customer"
                                                                                    class="md-form-control form-control" onchange="ddlCustomerType_SelectedIndexChanged();"
                                                                                    OnSelectedIndexChanged="ddlCustomerType_SelectedIndexChanged">
                                                                                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Existing" Value="2"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvCustomerType" runat="server" ErrorMessage="Select the Customer Type"
                                                                                        SetFocusOnError="true" ControlToValidate="ddlCustomerType" InitialValue="0" CssClass="validation_msg_box_sapn" ValidationGroup="Main Page"
                                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="padding-left: 0px!important; padding-right: 5px !important;">
                                                                                <i>
                                                                                    <asp:Button ID="btnCreateCustomer" AccessKey="C" runat="server" CssClass="grid_btn" OnClick="btnCreateCust_Click" UseSubmitBehavior="false" Text="+"
                                                                                        CausesValidation="False" />
                                                                                </i>

                                                                                <i style="font-size: 36px; color: aliceblue">
                                                                                </i>
                                                                            </div>
                                                                        </div>--%>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 0px !important; padding-right: 5px !important">

                                                                                    <asp:DropDownList ID="ddlCustomerType" runat="server" AutoPostBack="true" ToolTip="Customer"
                                                                                        class="md-form-control form-control"
                                                                                        OnSelectedIndexChanged="ddlCustomerType_SelectedIndexChanged">
                                                                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                                                        <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                                                        <asp:ListItem Text="Existing" Value="2"></asp:ListItem>
                                                                                        <asp:ListItem Text="Prospect" Value="3"></asp:ListItem>


                                                                                    </asp:DropDownList>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvCustomerType" runat="server" ErrorMessage="Select the Customer Type"
                                                                                            SetFocusOnError="true" ControlToValidate="ddlLob" InitialValue="0" CssClass="validation_msg_box_sapn" ValidationGroup="Main Page"
                                                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>


                                                                                </td>
                                                                                <td style="padding: 0px !important; width: 24px;">
                                                                                    <i style="font-size: 6px; color: aliceblue">
                                                                                        <button id="btnCreateCustomer" runat="server" causesvalidation="false" onserverclick="btnCreateCust_Click" class="btn_control"><i class="fa fa-plus"></i></button>

                                                                                    </i>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCustomer" runat="server" ToolTip="Customer" Text="Customer" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCustomerNameLease" runat="server" CssClass="md-form-control form-control"
                                                                            Style="display: none;" MaxLength="50"></asp:TextBox>
                                                                        <UC6:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                            ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_Click"
                                                                            Style="display: none" />

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtCustomerNameLease" runat="server" ErrorMessage="Select the Customer"
                                                                                SetFocusOnError="true" ControlToValidate="txtCustomerNameLease" CssClass="validation_msg_box_sapn" ValidationGroup="Main Page"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Customer Name" ID="Label2" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div id="divddlContType" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div>
                                                                        <asp:Label ID="lblAppraisalType" CssClass="styleReqFieldLabel" Visible="false" ToolTip="Appraisal Type" runat="server" Text="Appraisal Type"></asp:Label>
                                                                    </div>
                                                                    <div style="display: none;">
                                                                        <asp:DropDownList ID="ddlAppraisalType" runat="server" AutoPostBack="false">
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlContType" ToolTip="Contract Type" runat="server"
                                                                            class="md-form-control form-control"
                                                                            OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvToolTip" runat="server" ErrorMessage="Select the Contract Type"
                                                                                SetFocusOnError="true" ControlToValidate="ddlContType" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Main Page"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblContType" CssClass="styleReqFieldLabel" runat="server" ToolTip="Contract Type" Text="Contract Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div id="divddlDealType" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlDealType"
                                                                            class="md-form-control form-control" OnSelectedIndexChanged="ddlDealType_SelectedIndexChanged" runat="server" ToolTip="Deal Type" AutoPostBack="true">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvDealType" runat="server" ErrorMessage="Select the Deal Type"
                                                                                SetFocusOnError="true" ControlToValidate="ddlDealType" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Main Page"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDelaType" CssClass="styleReqFieldLabel" runat="server" ToolTip="Deal Type" Text="Deal Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <%--</div>--%>
                                                                <%--<div class="row">--%>
                                                                <div id="divddlDealerName" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <UC5:AutoSugg ID="ddlDealerName" runat="server" AutoPostBack="true"
                                                                            class="md-form-control form-control" ToolTip="Dealer Name" OnItem_Selected="ddlDealerName_Item_Selected" ServiceMethod="GetDealer"
                                                                            ErrorMessage="Select an Dealer Name"
                                                                            ValidationGroup="Main Page" IsMandatory="true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDealerName" runat="server" Text="Dealer Name" ToolTip="Dealer Name" CssClass="styleReqFieldLabel"></asp:Label>

                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDateofBirth" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" TabIndex="-1" ToolTip="Date of Birth" MaxLength="50"
                                                                            AutoPostBack="false"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDateofBirth" runat="server" ToolTip="Date of Birth" Text="Date of Birth" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <UC5:AutoSugg ID="ddlSalePersonCodeList" runat="server" ToolTip="Marketing Officer" ServiceMethod="GetSalePersonList"
                                                                            ErrorMessage="Select the Marketing Officer" IsMandatory="true" ValidationGroup="Main Page" />

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblSalesPerson" runat="server" ToolTip="Sales Person" Text="Marketing Officer" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlProduct" class="md-form-control form-control" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" runat="server" ToolTip="Scheme " AutoPostBack="true">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlProduct" runat="server" CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Main Page"
                                                                                ErrorMessage="Select the Scheme" ControlToValidate="ddlProduct" SetFocusOnError="True"
                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblProduct" runat="server" Text="Scheme" ToolTip="Scheme" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <%--</div>--%>
                                                                <%--<div class="row">--%>
                                                                <div id="divtxtOfferDate" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtOfferDate" TabIndex="-1" OnTextChanged="txtOfferDate_TextChanged" AutoPostBack="true" ToolTip="Date" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                        <%--<asp:Image ID="imgApplicationdate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                        <cc1:CalendarExtender ID="calCollectedDateffer" runat="server" Enabled="True" TargetControlID="txtOfferDate">
                                                                        </cc1:CalendarExtender>


                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblOfferDate" ToolTip="Date" runat="server" Text="Date" CssClass="styleReqFieldLabel"></asp:Label>

                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvOfferDate" CssClass="validation_msg_box_sapn" runat="server" ValidationGroup="Main Page"
                                                                                ErrorMessage="Enter the Offer Date" Display="Dynamic" ControlToValidate="txtOfferDate" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div id="divtxtOfferValidTill" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtOfferValidTill" Enabled="false" OnTextChanged="txtOfferValidTill_TextChanged" AutoPostBack="true" ToolTip="offer valid Till" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                                                            ValidationGroup="Main Page"></asp:TextBox>
                                                                        <%--<asp:Image ID="imgApplicationdate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                        <cc1:CalendarExtender runat="server"
                                                                            TargetControlID="txtOfferValidTill" ID="calExeOfferValidTill"
                                                                            Enabled="True">
                                                                        </cc1:CalendarExtender>


                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblOfferValidTill" ToolTip="offer valid Till" runat="server" Text="offer valid Till" CssClass="styleReqFieldLabel"></asp:Label>

                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvOffervalidtill" CssClass="validation_msg_box_sapn" runat="server" Display="Dynamic"
                                                                                ValidationGroup="Main Page" ErrorMessage="Enter the offer valid Till" ControlToValidate="txtOfferValidTill"
                                                                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>




                                                                <div id="divtxtSellerName" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtSellerName" ToolTip="Seller Name" onblur="funtrimspace(this);" onkeyup="maxlengthfortxt(100);" runat="server"
                                                                            AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                           <%-- <asp:RequiredFieldValidator ID="rfvSellerName" CssClass="validation_msg_box_sapn" runat="server" ValidationGroup="Main Page"
                                                                                ErrorMessage="Enter the Seller Name" SetFocusOnError="False" ControlToValidate="txtSellerName"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                                        </div>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblSellerName" runat="server" Text="Seller Name" ToolTip="Seller Name" CssClass="styleReqFieldLabel"></asp:Label>

                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div id="divtxtSellerCode" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtSellerCode" ToolTip="Seller Code" runat="server" onkeyup="maxlengthfortxt(30);"
                                                                            AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                           <%-- <asp:RequiredFieldValidator ID="rfvSellerCode" runat="server" ValidationGroup="Main Page"
                                                                                ErrorMessage="Enter the Seller Code" CssClass="validation_msg_box_sapn" SetFocusOnError="False" ControlToValidate="txtSellerCode"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                                                        </div>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblSellerCode" runat="server" Text="Seller Code" ToolTip="Seller Code" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div id="divddldealerSalesPerson" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <%-- <UC5:AutoSugg ID="ddldealerSalesPerson" ToolTip="Dealer Sales Person" runat="server" ServiceMethod="GetVendorsSalesPerson"
                                                                            ErrorMessage="Select the Dealer Sales Person" IsMandatory="false" ValidationGroup="Main Page" />--%>
                                                                        <asp:TextBox ID="ddldealerSalesPerson" ToolTip="Dealer Sales Person" runat="server" onkeyup="maxlengthfortxt(100);"
                                                                            AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDealerSalesPerson" runat="server" Text="Dealer Sales Person" ToolTip="Dealer Sales Person" CssClass="styleDisplayLabel"></asp:Label>

                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <%-- </div>--%>
                                                                <%--<div class="row">--%>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <%--<div class="md-input">
                                                                        <uc2:LOV ID="ucCopyProfileLov" runat="server" strLOV_Code="CMDP" />
                                                                        <asp:Button ID="btnLoadCopyProfile" TabIndex="-1" runat="server" OnClick="btnLoadCustomerCopyProfile_OnClick"
                                                                            Style="display: none;" Text="Load Proposal" CausesValidation="false" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCopyProfile" ToolTip="Copy Profile" runat="server" Text="Copy Profile"></asp:Label>
                                                                        </label>
                                                                    </div>--%>
                                                                    <%--   <div class="md-input">

                                                                        <asp:Button ID="btnCopyProfile" ToolTip="Copy Profile [Alt+Y]" runat="server" AccessKey="Y" CssClass="grid_btn" OnClick="btnLoadCustomerCopyProfile_OnClick"
                                                                            Text="Copy Profile" CausesValidation="false" />
                                                                    </div>--%>

                                                                    <button class="css_btn_enabled" id="btnCopyProfile" title="Copy Profile [Alt+Y]" causesvalidation="false" onserverclick="btnLoadCustomerCopyProfile_OnClick" runat="server"
                                                                        type="button" accesskey="Y">
                                                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u></u>Copy Profile
                                                                    </button>


                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFacilityAmt" onchange="fnthousands_separators(this,1)" runat="server" ToolTip="LPO Amount"
                                                                            AutoPostBack="false" OnTextChanged="txtFacilityAmt_TextChanged"
                                                                            class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                        <%-- <asp:TextBox ID="txtFacilityAmtCommaSep" style="text-align:right" ReadOnly="true" runat="server" ToolTip="LPO Amount"
                                                                            AutoPostBack="false" OnTextChanged="txtFacilityAmt_TextChanged"
                                                                            class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>--%>

                                                                        <cc1:FilteredTextBoxExtender ID="flttxtFacilityAmt" runat="server" TargetControlID="txtFacilityAmt"
                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvLPOAmount" Enabled="false" runat="server" ValidationGroup="Main Page"
                                                                                ErrorMessage="Enter the LPO Amount" CssClass="validation_msg_box_sapn" SetFocusOnError="False" ControlToValidate="txtFacilityAmt"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <label>
                                                                            <asp:Label ID="lblFacilityAmt" runat="server" ToolTip="LPO Amount" Text="LPO Amount" CssClass="styleDisplayLabel"></asp:Label>

                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div id="divtxtTenure" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <div class="row">
                                                                            <div class="col-sm-6 col-xs-6" style="padding: 0px;">

                                                                                <asp:TextBox ID="txtTenure" runat="server" ToolTip="Tenure"
                                                                                    class="md-form-control form-control login_form_content_input requires_false" MaxLength="3" ValidationGroup="Main Page"
                                                                                    onblur="ChkIsZero(this,'Tenure')" Style="text-align: right"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftextExtxtTenure" runat="server" FilterType="Numbers"
                                                                                    TargetControlID="txtTenure">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>


                                                                            </div>

                                                                            <div class="col-sm-6 col-xs-6" style="padding: 0px;">

                                                                                <asp:DropDownList ID="ddlTenureType" class="md-form-control form-control" TabIndex="-1" ToolTip="Tenure" runat="server">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>



                                                                            </div>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvTenure" runat="server" ValidationGroup="Main Page"
                                                                                ErrorMessage="Enter the Tenure/Type" CssClass="validation_msg_box_sapn" SetFocusOnError="False" ControlToValidate="txtTenure"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvTenureType" runat="server" ValidationGroup="Main Page"
                                                                                ErrorMessage="Enter the Tenure/Type" CssClass="validation_msg_box_sapn" InitialValue="-1" SetFocusOnError="False" ControlToValidate="ddlTenureType"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <label>
                                                                            <asp:Label ID="lblTenure" runat="server" ToolTip="Tenure/Tenure type" Text="Tenure/Tenure type" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <%--</div>--%>
                                                                <%--<div class="row">--%>
                                                                <div id="divddlInsuranceby" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlInsuranceby" runat="server"
                                                                            class="md-form-control form-control requires_false" ToolTip="Insurance by">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblInsuranceby" runat="server" Text="Insurance by" ToolTip="Insurance by" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div id="divddlInsuranceCoverage" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlInsuranceCoverage" ToolTip="Insurance Coverage" runat="server" MaxLength="50"
                                                                            AutoPostBack="false"
                                                                            class="md-form-control form-control requires_false">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblInsuranceCoverage" runat="server" ToolTip="Insurance Coverage" Text="Insurance Coverage" CssClass="styleDisplayLabel"></asp:Label>

                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div id="divtxtInsuranceRemarks" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">

                                                                        <asp:TextBox ID="txtInsuranceRemarks" ToolTip="Insurance Remarks" onkeyup="maxlengthfortxt(200);" OnTextChanged="txtInsuranceRemarks_TextChanged" TextMode="MultiLine" runat="server"
                                                                            AutoPostBack="false"
                                                                            class="md-form-control form-control requires_false"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblInsuranceRemarks" runat="server" ToolTip="Insurance Remarks" Text="Insurance Remarks" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div id="divtxtInsurancePolicyNo" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">

                                                                        <asp:TextBox ID="txtInsurancePolicyNo" ToolTip="Insurance Policy No" onkeyup="maxlengthfortxt(50);" runat="server"
                                                                            AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblInsurancePolicyNo" runat="server" Text="Cover Note number" ToolTip="Insurance Cover Note number" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="md-input">

                                                                        <asp:TextBox ID="txtGeneralRemarks" TextMode="MultiLine" ToolTip="General Remarks" onkeyup="maxlengthfortxt(4000);" runat="server"
                                                                            AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblGeneralRemarks" runat="server" Text="General Remarks" ToolTip="General Remarks" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div class="row">
                                                    <asp:Panel ID="pnlPdcHdr" Width="100%" GroupingText="PDC Details" runat="server" CssClass="stylePanel">
                                                        <div>
                                                            <asp:Panel ID="Panel6" Width="50%" HorizontalAlign="Center" GroupingText="" runat="server" CssClass="stylePanel">
                                                                <div>
                                                                    <div class="row">


                                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">


                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtNoPDC" AutoPostBack="true" ToolTip="No of PDC" OnTextChanged="txtNoPDC_TextChanged" MaxLength="3" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>

                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="btnPdcGo"
                                                                                    ErrorMessage="Enter the No of Pdc" Display="None" SetFocusOnError="true" ControlToValidate="txtNoPDC"></asp:RequiredFieldValidator>
                                                                                <cc1:FilteredTextBoxExtender ID="fltNoPDC" runat="server" FilterType="Numbers"
                                                                                    TargetControlID="txtNoPDC">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblNoofPDC" ToolTip="No. of PDC" CssClass="styleReqFieldLabel" runat="server" Text="No. of PDC"></asp:Label>

                                                                                </label>
                                                                            </div>

                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtPDCstDate" ToolTip="PDC St.Date" OnTextChanged="txtPDCstDate_TextChanged" AutoPostBack="true" runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <%--  <asp:Image ID="imgpdc" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                                --%>
                                                                                <asp:RequiredFieldValidator ID="rfvpdcStartDate" runat="server" ValidationGroup="btnPdcGo"
                                                                                    ErrorMessage="Select the Pdc Start Date" Display="None" SetFocusOnError="true" ControlToValidate="txtPDCstDate"></asp:RequiredFieldValidator>
                                                                                <cc1:CalendarExtender ID="CEtxtNoPDC" runat="server" Enabled="True"
                                                                                    TargetControlID="txtPDCstDate">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblPDCstDate" ToolTip="PDC St.Date" CssClass="styleDisplayLabel" runat="server" Text="PDC St.Date"></asp:Label>

                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="float: right;">
                                                                            <div style="width: fit-content; margin-top: 15px;">
                                                                                <i class="fa fa-floppy-o btn_i" aria-hidden="true" style="top: 26px !important;"></i>
                                                                                <asp:Button ID="btnPdcGo" runat="server" ToolTip="PDC Go" ValidationGroup="btnPdcGo"
                                                                                    Text="Go" CssClass="save_btn fa fa-floppy-o" OnClick="btnPDCGo_Click" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <asp:Panel ID="pnlPdcdtl" Width="100%" HorizontalAlign="Center" GroupingText="" runat="server" CssClass="stylePanel">

                                                                <div class="gird">
                                                                    <asp:GridView runat="server" ID="GRVPDCDetails" Height="10px" AutoGenerateColumns="False" ShowFooter="true" class="gird_details"
                                                                        OnRowDataBound="GRVPDCDetails_RowDataBound" OnRowDeleting="GRVPDCDetails_RowDeleting" OnRowCommand="GRVPDCDetails_RowCommand" ToolTip="PDC Entry Details">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No" HeaderStyle-Width="8%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSno" runat="server" Text='<%#Eval("Sno")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="PDC Type" HeaderStyle-Width="8%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblPDCType"  runat="server"  Text='<%#Eval("PDC_Type")%>'></asp:Label>
                                                                                    <asp:Label ID="lblPDCTypeID" runat="server" Text='<%#Eval("PDC_Type_ID")%>' Visible="false"></asp:Label>

                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlPdcType" AutoPostBack="true" OnSelectedIndexChanged="ddlPdcType_SelectedIndexChanged"
                                                                                            CssClass="md-form-control form-control login_form_content_input" ToolTip="PDC Type" runat="server">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvPDCType" runat="server" ValidationGroup="btnAddPdc"
                                                                                                ErrorMessage="Select the PDC Type" Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="0" SetFocusOnError="true" ControlToValidate="ddlPdcType"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:TemplateField>

                                                                            <asp:TemplateField HeaderText="Drawee Bank" HeaderStyle-Width="8%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDraweeBankG" runat="server" Text='<%#Eval("Bank")%>'></asp:Label>
                                                                                    <asp:Label ID="lblDraweeBankGId" runat="server" Text='<%#Eval("BankId")%>' Visible="false"></asp:Label>

                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlDraweeBankG" runat="server" AutoPostBack="true" ToolTip="Drawee Bank" OnSelectedIndexChanged="ddlDraweeBankG_SelectedIndexChanged"
                                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                                        </asp:DropDownList>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvBank" runat="server" ValidationGroup="btnAddPdc"
                                                                                                ErrorMessage="Select the Drawee Bank" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="true" ControlToValidate="ddlDraweeBankG"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>

                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Drawee Bank Place" HeaderStyle-Width="8%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblBankPlace" runat="server" Text='<%#Eval("BankPlace")%>'></asp:Label>
                                                                                    <asp:Label ID="lblBankPlace_Id" runat="server" Text='<%#Eval("BankPlace_Id")%>' Visible="false"></asp:Label>

                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlDraweeBankGPlace" ToolTip="Drawee Bank Place" runat="server" AutoPostBack="false"
                                                                                            CssClass="md-form-control form-control login_form_content_input"
                                                                                            Style="border-color: White;">
                                                                                        </asp:DropDownList>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvBankPlace" CssClass="validation_msg_box_sapn" runat="server" ValidationGroup="btnAddPdc"
                                                                                                ErrorMessage="Select the Drawee Bank Place" Display="Dynamic" InitialValue="0" SetFocusOnError="true" ControlToValidate="ddlDraweeBankGPlace"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Inst.Start" HeaderStyle-Width="6%">
                                                                                <ItemTemplate>
                                                                                    <div style="display: block; text-align: right;">
                                                                                        <asp:Label ID="lblInsStartI" Text='<%#Eval("Ins_Start")%>' Style="text-align: right" Width="50px"
                                                                                            runat="server"></asp:Label>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtInsStart" Style="text-align: right" ToolTip="Inst.Start" runat="server" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <cc1:FilteredTextBoxExtender ID="fltInsStart" runat="server" FilterType="Numbers"
                                                                                            TargetControlID="txtInsStart">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvInsStart" runat="server" ValidationGroup="btnAddPdc"
                                                                                                ErrorMessage="Enter the Ins.Start" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtInsStart"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Inst.End" HeaderStyle-Width="6%">
                                                                                <ItemTemplate>
                                                                                    <div style="display: block; text-align: right;">
                                                                                        <asp:Label ID="lblInsEndI" Style="text-align: right" Text='<%#Eval("Ins_End")%>' runat="server"></asp:Label>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtInsEnd" Style="text-align: right" MaxLength="3" ToolTip="Inst.End" runat="server" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <cc1:FilteredTextBoxExtender ID="fltInsEnd" runat="server" FilterType="Numbers"
                                                                                            TargetControlID="txtInsEnd">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvInsEnd" runat="server" ValidationGroup="btnAddPdc"
                                                                                                ErrorMessage="Enter the Ins.End" Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="true" ControlToValidate="txtInsEnd"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                            </asp:TemplateField>

                                                                            <asp:TemplateField  HeaderText="Amount" HeaderStyle-Width="10%">
                                                                                <ItemTemplate >
                                                                                    <div style="display: block; text-align: right;">
                                                                                        <asp:Label ID="lblAmount" runat="server"    Text='<%# Bind("Total_Amount")%>'
                                                                                            Style="text-align: right"></asp:Label>

                                                                                        <%--<span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEAmount" runat="server" TargetControlID="txtAmount"
                                                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                        </cc1:FilteredTextBoxExtender>--%>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtAmountF" runat="server" MaxLength="20" onchange="fnthousands_separators(this,1)" ToolTip="Amount" Text='<%# Bind("Total_Amount")%>'
                                                                                            Style="text-align: right" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>


                                                                                        <cc1:FilteredTextBoxExtender ID="flttxtAmountF" runat="server" TargetControlID="txtAmountF"
                                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="True">
                                                                                        </cc1:FilteredTextBoxExtender>


                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>

                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvInsAmount" runat="server" ValidationGroup="btnAddPdc"
                                                                                                ErrorMessage="Enter the Amount" Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="true" ControlToValidate="txtAmountF"></asp:RequiredFieldValidator>
                                                                                        </div>

                                                                                    </div>
                                                                                </FooterTemplate>

                                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-Width="10%">
                                                                                <ItemTemplate>

                                                                                    <%--  <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CssClass="grid_btn_delete"  CommandName="Edit" CausesValidation="false"></asp:LinkButton>--%>

                                                                                    <asp:Button ID="btnRemoveDays" Text="Delete" CssClass="grid_btn_delete" AccessKey="R" ToolTip="Delete [Alt+R]"
                                                                                        CommandName="Delete" runat="server"
                                                                                        CausesValidation="false" OnClientClick="return confirm('Are you sure want to delete this record?');" />



                                                                                </ItemTemplate>
                                                                                <%-- <EditItemTemplate>

                                                                                                            <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                                                CausesValidation="false"></asp:LinkButton>
                                                                                     
                                                                                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                                                CausesValidation="false"></asp:LinkButton>
                                                                                                        </EditItemTemplate>--%>
                                                                                <FooterTemplate>
                                                                                    <%--  <i class="fa fa-plus" aria-hidden="true"></i>--%>
                                                                                    <%--  <asp:Button ID="btnAddrowDays" runat="server" Text="Add" OnClick="btnAddrowDays_Click" CssClass="grid_btn" AccessKey="A" ToolTip="Alt+A"
                                                                                        ValidationGroup="btnAddPdc"></asp:Button>--%>
                                                                                    <button class="grid_btn" id="btnAddrowDays" validationgroup="btnAddPdc" title="Add [Alt+A]" accesskey="A" runat="server" onserverclick="btnAddrowDays_Click"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>


                                                                                    <%-- <button class="grid_btn"  id="btnAddrowDays" title="Save[Alt+A]" onclick="return confirm('Are you sure you want to Add this record?');"   validationgroup="btnAddPdc" onserverclick="btnAddrowDays_Click" runat="server"
                                                                                        type="submit" accesskey="A">
                                                                                        <i class="fa fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                                                    </button>--%>


                                                                                    <%-- <asp:Button ID="Button2" runat="server" Text="lnk" CssClass="grid_btn_link" AccessKey="T" ToolTip="Alt+T"
                                                                                        ValidationGroup="btnAddPdc" CommandName="Addnew"></asp:Button>--%>
                                                                                </FooterTemplate>
                                                                                <ItemStyle Width="20%" HorizontalAlign="Center" />
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>

                                                                        </Columns>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:GridView>
                                                                </div>
                                                                <div class="row">
                                                                    <div style="margin-left: 400px" class="col">
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblTotalPdcAmountlbl" CssClass="styleDisplayLabel" runat="server" Text="Total PDC Amount :"></asp:Label>
                                                                        </label>

                                                                        <asp:Label ID="lblTotalPdcAmount" runat="server" Text=""></asp:Label>
                                                                    </div>

                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div class="row">
                                                    <asp:Panel ID="Panel1" Visible="false" Width="100%" GroupingText="Down Payment Receipt" runat="server" CssClass="stylePanel">
                                                        <div>
                                                            <div class="gird">
                                                                <asp:GridView runat="server" ID="grvDownPaymentReceipt" AutoGenerateColumns="False" ShowFooter="true" class="gird_details"
                                                                    ToolTip="PDC Entry Details">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.NO" HeaderStyle-Width="2%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Eval("Sno")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="40%">
                                                                            <ItemTemplate>
                                                                                <div style="display: block; text-align: right;">
                                                                                    <asp:Label ID="lbldownPaymentAmount" Style="text-align: right" runat="server" Text='<%#Eval("DownPayAmount")%>'></asp:Label>
                                                                                </div>
                                                                                <%--   <cc1:FilteredTextBoxExtender ID="fltdownPaymentAmountI" runat="server" ValidChars="." FilterType="Numbers,Custom"
                                                                                    TargetControlID="txtdownPaymentAmount">
                                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtdownPaymentAmount" Style="text-align: right" runat="server" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <cc1:FilteredTextBoxExtender ID="fltdownPaymentAmount" runat="server" ValidChars="" FilterType="Numbers"
                                                                                        TargetControlID="txtdownPaymentAmount">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvdownPaymentAmount" CssClass="validation_msg_box_sapn" runat="server" ValidationGroup="btnRec"
                                                                                            ErrorMessage="Enter the Amount" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtdownPaymentAmount"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Receipt" HeaderStyle-Width="47%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbldownPaymentReceipt" runat="server" Text='<%#Eval("DownPayReceipt")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtddownPaymentReceipt" Style="text-align: left" runat="server" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <%-- <cc1:FilteredTextBoxExtender ID="fltdownPaymentReceipt" runat="server" FilterType="Numbers"
                                                                                        TargetControlID="txtddownPaymentReceipt">
                                                                                    </cc1:FilteredTextBoxExtender>--%>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvdownPaymentReceipt" runat="server" ValidationGroup="btnRec"
                                                                                            ErrorMessage="Enter the Receipt" Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="true" ControlToValidate="txtddownPaymentReceipt"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderStyle-Width="4%">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="btnRemovedp" Text="Delete" CssClass="grid_btn_delete"
                                                                                    CommandName="Delete" runat="server"
                                                                                    CausesValidation="false" OnClientClick="return confirm('Are you sure want to delete this record?');" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <%-- <asp:Button ID="btnAdDPRow" runat="server" Text="Add" OnClick="btnAdDPRow_Click" CssClass="grid_btn" AccessKey="B" ToolTip="Alt+B"
                                                                                    ValidationGroup="btnRec"></asp:Button>--%>
                                                                                <%--<button class="grid_btn" id="btnAdDPRow" validationgroup="btnRec" runat="server" title="Alt+B" accesskey="B" onserverclick="btnAdDPRow_Click"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>--%>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="20%" HorizontalAlign="Center" />
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>

                                                                    </Columns>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>

                                                <div style="display: none" class="row">
                                                    <asp:Panel ID="pnlPrint" HorizontalAlign="Center" CssClass="stylePanel" runat="server" Width="99%" GroupingText="Mail/Print Details">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList Enabled="false" ID="ddlTemplateType" AutoPostBack="true" ToolTip="Template Type" OnSelectedIndexChanged="ddlTemplateType_SelectedIndexChanged" runat="server" class="md-form-control form-control  requires_false">
                                                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Check List" Selected="True" Value="1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblTemplate" ToolTip="Template Type" runat="server" Text="Template Type"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlLanguage" AutoPostBack="false" ToolTip="Language" runat="server" class="md-form-control form-control  requires_false">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblLanguage" ToolTip="Language" runat="server" Text="Language"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <%--  <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12"> 
                                                                    <asp:Label ID="lblPrintType" ToolTip="Print Type" runat="server" Text="Print Type"></asp:Label>
                                                           
                                                                </div>--%>

                                                            <%-- <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">--%>
                                                            <%--<div style="width: fit-content; margin-top: 15px;">
                                                                    <i class="fa fa-file-pdf-o btn_i" aria-hidden="true" style="top: 26px !important;"></i>
                                                                    <asp:Button ID="btnPdf" AccessKey="O" ToolTip="PDF [Alt+O]" CausesValidation="false" CssClass="save_btn fa-file-pdf-o" OnClick="btnCheckListPrint" Text="PDF" runat="server" />
                                                                    &nbsp;
                                                                </div>--%>


                                                            <%--  <button class="css_btn_enabled" id="btnPdf" title="PDF [Alt+O]"  causesvalidation="false" onserverclick="btnCheckListPrint" runat="server"
                                                                    type="button" accesskey="O">
                                                                    <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u></u>PDF
                                                                </button>--%>




                                                            <%-- </div>--%>
                                                            <div style="display: none" class="row">
                                                                <div class="col">
                                                                    <iframe id="MyIframeOpenFile" visible="false" src="~/Common/S3GViewFileCheckList.aspx" runat="server" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100px; height: 21px;" allowtransparency="true"></iframe>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                                                                <%--<div style="width: fit-content; margin-top: 15px;">
                                                                    <i class="fa fa-envelope btn_i" aria-hidden="true" style="top: 26px !important;"></i>
                                                                    <asp:Button ID="btnEmail" CausesValidation="false" AccessKey="E" ToolTip="Email [Alt+E]" CssClass="save_btn fa fa-times" Text="Email" runat="server" />
                                                                </div>--%>


                                                                <button class="css_btn_enabled" id="btnEmail" title="Email [Alt+E]" style="display: none" causesvalidation="false" runat="server"
                                                                    type="button" accesskey="E">
                                                                    <i class="fa fa-envelope-open" aria-hidden="true"></i>&emsp;<u></u>Email
                                                                </button>

                                                            </div>
                                                        </div>
                                                    </asp:Panel>

                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>

                                            <asp:PostBackTrigger ControlID="btnCopyProfile" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabAssetDetails" Width="99%" runat="server" HeaderText="TabAssetDetails"
                                CssClass="tabpan">
                                <HeaderTemplate>
                                    Asset Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">

                                                    <asp:Panel runat="server" ID="pnlAssetDetails" CssClass="stylePanel" Width="99%" GroupingText="Asset Details">
                                                        <div>
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="md-input">

                                                                        <UC5:AutoSugg ID="ddlAssetCodeList1" runat="server" ToolTip="Asset Code" ErrorMessage="Select the Asset" ValidationGroup="TabAddAssetDetails"
                                                                            OnItem_Selected="ddlAssetCodeList1_SelectedIndexChanged"
                                                                            ServiceMethod="GetAsset" ItemToValidate="Value" IsMandatory="true" AutoPostBack="true" />
                                                                        <asp:Button ID="btnLoadAssetCode" Visible="false" runat="server" ToolTip="Load Code" CssClass="styleSubmitButton" CausesValidation="false" AccessKey="O" OnClick="btnLoadAssets_Click"
                                                                            Text="Load Asset Code" UseSubmitBehavior="False" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAssetCodeList" ToolTip="Asset Code" CssClass="styleReqFieldLabel" Text="Asset Code"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRequiredFromDate" ToolTip="Required From" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                        <!--  <asp:Image ID="ImgtxtRequiredFromDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                            Height="16px" />   -->
                                                                        <cc1:CalendarExtender ID="CalendarExtenderSD_RequiredFromDate" runat="server" Enabled="True"
                                                                            OnClientDateSelectionChanged="checkDate_PrevSystemDate" TargetControlID="txtRequiredFromDate">
                                                                        </cc1:CalendarExtender>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label3" ToolTip="Required From" CssClass="styleReqFieldLabel"
                                                                                Text="Required From"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtUnitCount" runat="server" MaxLength="3" Text="1" ToolTip="Unit Count" class="md-form-control form-control login_form_content_input requires_true"
                                                                            onblur="ChkIsZero(this,'Unit Count')" onchange="funcalassetvalue();" Style="text-align: right"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftextExtxtUnitCount" runat="server" FilterType="Numbers"
                                                                            TargetControlID="txtUnitCount" Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvUnitCount" runat="server" ControlToValidate="txtUnitCount"
                                                                                ValidationGroup="TabAddAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                SetFocusOnError="False" ErrorMessage="Enter the Unit count"></asp:RequiredFieldValidator>
                                                                        </div>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblUnitCount" CssClass="styleReqFieldLabel" Text="Unit Count"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtUnitValue" onblur="ChkIsZero(this,'Unit Count')" runat="server" onchange="funcalassetvalue();" ToolTip="Unit Value" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvUnitValue" runat="server" ControlToValidate="txtUnitValue"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="False" ValidationGroup="TabAddAssetDetails"
                                                                                ErrorMessage="Enter the Unit value"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <cc1:FilteredTextBoxExtender ID="flttxtUnitValue" runat="server" TargetControlID="txtUnitValue"
                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <input id="HdnGPSDecimal" type="hidden" runat="server" />



                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label4" CssClass="styleReqFieldLabel" Text="Unit Value"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtTotalAssetValue" ToolTip="Total Asset Value" Style="text-align: right" TabIndex="-1" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>



                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblTotalAssetValue" Text="Total Asset Value" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>


                                                                <%--<div class="row">--%>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMarginPercentage" TabIndex="-1" ToolTip="Margin %" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>


                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblMarginPercentage" CssClass="styleDisplayLabel" Text="Margin %"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMarginAmountAsset" Style="text-align: right" TabIndex="-1" ToolTip="Margin Amount" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblMarginAmountAsset" CssClass="styleDisplayLabel"
                                                                                Text="Margin Amount"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtBookDepreciationPerc" runat="server" ToolTip="Book Depreciation %" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>


                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblBookDepreciationPerc" CssClass="styleDisplayLabel"
                                                                                Text="Book Depreciation %"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPayTo" ToolTip="Pay To" runat="server" OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged"
                                                                            AutoPostBack="true" class="md-form-control form-control">

                                                                            <asp:ListItem Value="0">Entity</asp:ListItem>
                                                                            <asp:ListItem Value="1">Customer</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvPayTo" runat="server" ControlToValidate="ddlPayTo"
                                                                                ValidationGroup="TabAddAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                InitialValue="-1" SetFocusOnError="True" ErrorMessage="Select a Pay To"></asp:RequiredFieldValidator>
                                                                        </div>




                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPayTo" CssClass="styleReqFieldLabel" Text="Pay To"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <%--</div>--%>
                                                                <%-- <div class="row">--%>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <UC5:AutoSugg ID="ddlEntityNameList" ToolTip="Customer Name/Entity Name" runat="server" ServiceMethod="GetVendors"
                                                                            ErrorMessage="Select the Entity Name"
                                                                            ValidationGroup="TabAddAssetDetails" IsMandatory="true" />
                                                                        <asp:TextBox ID="txtCustomerName" class="md-form-control form-control login_form_content_input requires_true" runat="server" ReadOnly="true" TabIndex="-1"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="TabAddAssetDetails"
                                                                                ErrorMessage="Enter Customer Name"></asp:RequiredFieldValidator>
                                                                        </div>


                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCustomerName" runat="server" CssClass="styleDisplayLabel" Text="Customer Name" Visible="False"></asp:Label>
                                                                            <asp:Label runat="server" ID="lblEntityNameList" CssClass="styleReqFieldLabel" Text="Entity Name"></asp:Label>

                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMargintoDealer" onchange="funcalassetMarginAmt_dp();" ToolTip="Margin to Dealer" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                                            onkeypress="fnAllowNumbersOnly(false,false,this)"></asp:TextBox>

                                                                        <cc1:FilteredTextBoxExtender ID="flttxtMargintoDealer" runat="server" TargetControlID="txtMargintoDealer"
                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblMargintoDealer" CssClass="styleDisplayLabel"
                                                                                Text="Margin to Dealer"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMargintoMFC" OnTextChanged="txtMargintoMFC_TextChanged" ToolTip="Margin to MFC" AutoPostBack="true" onchange="funcalassetMarginAmt_dp();" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                                            onkeypress="fnAllowNumbersOnly(false,false,this)"></asp:TextBox>

                                                                        <cc1:FilteredTextBoxExtender ID="flttxtMargintoMFC" runat="server" TargetControlID="txtMargintoMFC"
                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblMargintoMFC" CssClass="styleDisplayLabel"
                                                                                Text="Margin to MFC"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtTradeIn" onchange="funcalassetMarginAmt_dp();" ToolTip="Trade In" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>

                                                                        <cc1:FilteredTextBoxExtender ID="fttxtTradeIn" runat="server" TargetControlID="txtTradeIn"
                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblTradeIn" CssClass="styleDisplayLabel"
                                                                                Text="Trade In"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>


                                                                <%-- </div>--%>
                                                                <%-- <div class="row">--%>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtLpoAssetAmount" TabIndex="-1" Style="text-align: right" ToolTip="LPO Amount" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                            onkeypress="fnAllowNumbersOnly(false,false,this)"></asp:TextBox>


                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>

                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblLpoAssetamount" CssClass="styleDisplayLabel"
                                                                                Text="LPO Amount"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>


                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlAssetType" runat="server" ToolTip="Asset Type" MaxLength="10"
                                                                            class="md-form-control form-control login_form_content_input requires_false">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblAssetType" ToolTip="Asset Type" runat="server" Text="Asset Type" CssClass="styleReqFieldLabel"></asp:Label>

                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvAssetType" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlAssetType"
                                                                                ErrorMessage="Select the Asset Type" Display="Dynamic" InitialValue="0" ValidationGroup="TabAddAssetDetails" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDownPaymentReceipt" ToolTip="Down Payment Receipt" Enabled="false" Style="text-align: right" AutoPostBack="false" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="20"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>

                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblDownPaymentReceipt" CssClass="styleDisplayLabel"
                                                                                Text="Down Payment Receipt"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <%--</div>--%>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">

                                                                    <asp:Button ID="btnAddNew" runat="server" AccessKey="C" ToolTip="Add [Alt+C]" OnClientClick="return funcalassetMarginAmt_dp();" CausesValidation="true" ValidationGroup="TabAddAssetDetails" CssClass="grid_btn" OnClick="btnAddAsset_OnClick"
                                                                        Text="Add" />

                                                                    <%--  <button class="css_btn_enabled" id="btnAddNew" title="Add [Alt+C]" onclick="if(fnAddAssetValidation())" causesvalidation="false" onserverclick="btnAddAsset_OnClick" runat="server"
                                                                        type= accesskey="C">
                                                                        <i class="fa fa-plus-circle" aria-hidden="true"></i>&emsp;<u></u>Add
                                                                    </button>--%>
                                                                </div>
                                                            </div>
                                                            <%--<table width="100%">
                                                                <tr>
                                                                    <td class="styleFieldLabel" colspan="6" style="padding-top: 1%">--%>
                                                            <asp:Panel runat="server" ID="pnlAssetDtl" CssClass="stylePanel" GroupingText="Asset Details"
                                                                Width="98%">
                                                                <div style="width: 98%; padding-left: 1%">
                                                                    <div>
                                                                        <table width="100%">
                                                                            <tr align="right">
                                                                                <td>
                                                                                    <asp:Label ID="lblAssetAmt" runat="server" Text="Total Lpo Amount :"></asp:Label>
                                                                                    <asp:Label ID="lblTotalAssetAmount" ToolTip="Total Lpo Amount " runat="server"
                                                                                        Text="0"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <div class="gird">
                                                                        <asp:GridView ID="gvAssetDetails" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvAssetDetails_SelectedIndexChanged" OnRowDeleting="gvAssetDetails_RowDeleting" class="gird_details"
                                                                            Width="100%" OnRowDataBound="gvAssetDetails_RowDataBound">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="S.No">
                                                                                    <ItemTemplate>
                                                                                        <%--<asp:Label ID="lblAssetNo" runat="server" Text='<%# Bind("Sl_No") %>'></asp:Label>--%>
                                                                                        <asp:Label ID="lblRecordSno" CssClass="styleDisplayLabel" CausesValidation="false" runat="server" Text='<%#Bind("PAGE_SNO") %>' Style="text-align: right"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Number">
                                                                                    <ItemTemplate>
                                                                                        <%--<asp:Label ID="lblAssetNo" runat="server" Text='<%# Bind("Sl_No") %>'></asp:Label>--%>
                                                                                        <asp:LinkButton ID="lblAssetNo" OnClientClick="return confirm('Are you sure want to Modify this record?');" CssClass="grid_btn" CausesValidation="false" ToolTip="Edit" OnClick="lblAssetNo_Click" runat="server" Text='<%#Bind("Sl_No") %>' Style="text-align: right"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Id">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Code">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetCode" runat="server" Text='<%# Bind("Asset_Code") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Description">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetDescription" runat="server" Text='<%# Bind("Asset_Description") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Type">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetTypeId" Visible="false" runat="server" Text='<%# Bind("ASSET_TYPE_ID") %>'></asp:Label>
                                                                                        <asp:Label ID="lblAssetType" runat="server" Text='<%# Bind("ASSET_TYPE") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField Visible="false" HeaderText="Required From Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblReqFrm" runat="server" Text='<%# Bind("Required_FromDate") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Unit Count">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblUnitCount" runat="server" Text='<%# Bind("Noof_Units") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Unit Value">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblUnitVal" runat="server" Text='<%# Bind("Unit_Value") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Value">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetVal" runat="server" Text='<%# Bind("AssetValue") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Margin to Dealer">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblMargintoDealer" runat="server" Text='<%# Bind("Margin_Dealer") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Margin to MFC">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblMargintoMFC" runat="server" Text='<%# Bind("Margin_MFC") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Trade In">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblTradeIn" runat="server" Text='<%# Bind("Trade_In") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="LPO Amount">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblLpoAmount" runat="server" Text='<%# Bind("LPO_Amount") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField Visible="false" HeaderText="Margin Percentage">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblMarginPer" runat="server" Text='<%# Bind("Margin_Percentage") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Down Payment Amount">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblMarginAmt" runat="server" Text='<%# Bind("Margin_Amount") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField Visible="false" HeaderText="Book Depreciation Percentage">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblBookRate" runat="server" Text='<%# Bind("Book_Depreciation_Percentage") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField Visible="false" HeaderText="Block Depreciation Percentage">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblBlockRate" runat="server" Text='<%# Bind("Block_Depreciation_Percentage") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="IsOwnAsset" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblOwnAsset" runat="server" Text='<%# Bind("IsOwnAsset") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Status" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblStatusDesc" runat="server" Text='<%# Bind("Status_Desc") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="StatusCode" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblStatusCode" runat="server" Text='<%# Bind("Status_Code") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Status" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Pay Type">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblpaytype" runat="server" Text='<%# Bind("paytype") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Pay To" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblpayto" runat="server" Text='<%# Bind("pay_to") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Payid" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblpayid" runat="server" Text='<%# Bind("pay_id") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Dealer/Customer Name">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblpayname" Width="100%" runat="server" Text='<%# Bind("payname") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Receipt No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblReceiptNo" Width="100%" runat="server" Text='<%# Bind("RECEIPT_NO") %>'></asp:Label>
                                                                                        <asp:Label ID="lblReceiptID" Visible="false" Width="100%" runat="server" Text='<%# Bind("RECEIPT_ID") %>'></asp:Label>
                                                                                        <asp:Label ID="lblTotalLpoAmount" Visible="false" Width="100%" runat="server" Text='<%# Bind("TOTAL_LPO_AMOUNT") %>'></asp:Label>
                                                                                        <asp:Label ID="lblTotalFinAmount" Visible="false" Width="100%" runat="server" Text='<%# Bind("TOTAL_FIN_AMOUNT") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>

                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LnkDelete" CssClass="grid_btn_delete" CausesValidation="false" AccessKey="K" ToolTip="Delete [Alt+K]" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure want to delete this record?');" Width="100%" runat="server"></asp:LinkButton>


                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <%--<asp:CommandField ButtonType="Link"  CausesValidation="False" DeleteText="Delete"
                                                                                    HeaderText="" InsertVisible="False" ShowCancelButton="False" ShowDeleteButton="True">
                                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                </asp:CommandField>--%>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <uc7:PageNavigator ID="ucCustomPaging" runat="server"></uc7:PageNavigator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <asp:ValidationSummary ID="vsTabAddAssetDetails" runat="server" CssClass="styleMandatoryLabel"
                                                                        HeaderText="Correct the following validation(s):" ShowMessageBox="false" ShowSummary="true" ValidationGroup="TabAddAssetDetails" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                                                                    <input type="hidden" id="hdnSortDirection" runat="server" />
                                                                    <input type="hidden" id="hdnSortExpression" runat="server" />
                                                                    <input type="hidden" id="hdnSearch" runat="server" />
                                                                    <input type="hidden" id="hdnOrderBy" runat="server" />
                                                                </div>
                                                            </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btnLoadAssetCode" />

                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabDocumentDetails" Width="99%" runat="server" BackColor="Red" CssClass="tabpan">
                                <HeaderTemplate>
                                    Document Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel51" runat="server">
                                        <ContentTemplate>
                                            <div id="Div2" style="height: 600px; overflow: auto;" runat="server">
                                                <div id="Div1" style="height: 600px; overflow: auto;" runat="server">
                                                    <div style="margin-top: -26px" class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
                                                            <asp:Button ID="btndoPostback" CausesValidation="false" UseSubmitBehavior="false" Style="display: none" OnClick="btndoPostback_Click" runat="server" />
                                                            <asp:Button ID="btndoPostbackF" CausesValidation="false" UseSubmitBehavior="false" Style="display: none" OnClick="btndoPostbackF_Click" runat="server" />
                                                            <asp:HiddenField ID="hdnSetForceValues" runat="server" />
                                                            <asp:HiddenField ID="hdnSetForceValuesDealer" runat="server" />
                                                            <asp:Button ID="btnBrowse" CausesValidation="false" runat="server" OnClick="btnBrowse_OnClick" Style="display: none"></asp:Button>
                                                            <button class="css_btn_enabled" id="lnkUpdateDocuments" visible="false" title="Update [Alt+U]" onclick="if(fnConfirmUpdate())" onserverclick="lnkUpdateDocuments_Click" causesvalidation="false" runat="server"
                                                                type="button" accesskey="U">
                                                                <i class="fa fa-sign-in" aria-hidden="true"></i>&emsp;<u>U</u>pdate Documents
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
                                                            <div class="md-input">
                                                                <button class="css_btn_enabled" id="btnUploadROPDocuments" onserverclick="btnUploadROPDocuments_ServerClick" runat="server"
                                                                    type="button" accesskey="U" causesvalidation="False" title="Upload[Alt+U]">
                                                                    <i class="fa fa-upload" aria-hidden="true"></i>&emsp;<u>U</u>pload
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Panel Style="margin-top: -24px" runat="server" ID="pnlCustomerDocuments" CssClass="stylePanel" GroupingText="Customer Documents"
                                                        Width="99%">
                                                        <div class="gird">

                                                            <asp:GridView ID="gvPRDDT" runat="server" Width="99%" AutoGenerateColumns="False"
                                                                DataKeyNames="PRDDC_Doc_Cat_ID" class="gird_details" ShowFooter="true" OnRowDeleting="gvPRDDT_RowDeleting" OnRowDataBound="gvPRDDT_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSno" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PRDDC TypeId" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPRTID" runat="server" Text='<%# Bind("PRDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Priority">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPRIORITYTYPE" runat="server" Text='<%# Bind("PRIORITY_TYPE") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:DropDownList Style="display: none" ID="ddlPriority" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="false" Width="120px" ToolTip="Required" runat="server">
                                                                                    <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="Primary" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Secondary" Value="2"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlPriority" runat="server" ControlToValidate="ddlPriority"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="DOC" ErrorMessage="Enter the Priority"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Doc Type">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTDocType" ToolTip="Doc Type" runat="server" Text='<%# Bind("PRDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                            <asp:Label ID="lblPRICINGDOCID" Visible="false" runat="server" Text='<%# Bind("PRICING_DOC_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false" HeaderText="PRDDC Type">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblType" runat="server" Text='<%# Bind("PRDDC_Doc_Type") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false" HeaderText="Is_Addtional">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblIsAddtional" Width="400px" runat="server" Text='<%# Bind("Is_Addtional") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Particulars">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:Label ID="lblDesc" Width="400px" ToolTip="Particulars" runat="server" Text='<%# Bind("PRDDC_Doc_Description") %>'></asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtPRDDCTypeF" onkeyup="maxlengthfortxt(100)" ToolTip="Particulars" CssClass="md-form-control form-control login_form_content_input" Width="100%" AutoPostBack="false"
                                                                                    runat="server">
                                                                                </asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RfvPRDDCTypeF" runat="server" ControlToValidate="txtPRDDCTypeF"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="DOC" ErrorMessage="Enter the Particulars"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Doc Required">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:Label ID="lblDocRequired" runat="server" Visible="false" Text='<%#Bind("Doc_Required") %>' />
                                                                                <asp:DropDownList ID="ddlRequired" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="false" Width="120px" ToolTip="Document Required" runat="server">
                                                                                    <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="Required" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Not Required" Value="2"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlRequiredF" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input" OnSelectedIndexChanged="ddlRequiredF_SelectedIndexChanged" Width="120px" ToolTip="Document Required" runat="server">
                                                                                    <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="Required" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Not Required" Value="2"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div id="dvddlRequiredF" runat="server" class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RfvRequiredF" runat="server" ControlToValidate="ddlRequiredF"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="DOC" ErrorMessage="Select the Document Required"
                                                                                        InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Doc Received">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:Label ID="lblDocReceived" Visible="false" runat="server" Text='<%#Bind("Doc_Received") %>' />
                                                                                <asp:DropDownList ID="ddlReceived" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" Width="120px" AutoPostBack="false" ToolTip="Document Received" runat="server">
                                                                                    <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="Received" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Not Received" Value="2"></asp:ListItem>
                                                                                    <asp:ListItem Text="Waived" Value="3"></asp:ListItem>
                                                                                    <asp:ListItem Text="Not Applicable" Value="4"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>

                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlReceivedF" CssClass="md-form-control form-control login_form_content_input" Width="120px" ToolTip="Document Received" runat="server">
                                                                                    <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="Received" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Not Received" Value="2"></asp:ListItem>
                                                                                    <asp:ListItem Text="Waived" Value="3"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RfvddlReceivedF" runat="server" ValidationGroup="DOC" ControlToValidate="ddlReceivedF"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Document Received"
                                                                                        InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Collected Date">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCollectedDate" ToolTip="Collected Date" Width="100px" CssClass="md-form-control form-control login_form_content_input" runat="server" Text='<%#Bind("Col_Date") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calCollectedDate" runat="server" Enabled="True" TargetControlID="txtCollectedDate">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCollectedDateF" ToolTip="Collected Date" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server">
                                                                                </asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calCollectedDateF" runat="server" Enabled="True" TargetControlID="txtCollectedDateF">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RfvtxtCollectedDateF" runat="server" ControlToValidate="txtCollectedDateF"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="DOC" ErrorMessage="Select Collected Date"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>


                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Collected/Waived By">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">

                                                                                <asp:TextBox ID="ddlCollectedBy" Enabled="false" ToolTip="Collected/Waived By" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" Text='<%# Bind("CollectedBy") %>' runat="server" Width="200px" />
                                                                                <asp:HiddenField ID="lblCollectedBy" runat="server" Value='<%# Bind("Collected_By_Id") %>'></asp:HiddenField>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="ddlCollectedByF" Enabled="false" ToolTip="Collected/Waived By" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Bind("CollectedBy") %>'
                                                                                    IsMandatory="true" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtRemarks" ToolTip="Marketing Officer Remarks" onchange="funSetValidationValues();" runat="server" Width="200px" Text='<%# Eval("Remarks")%>'
                                                                                    TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>


                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtRemarksMOF" ToolTip="Marketing Officer Remarks" runat="server" Width="200px" Text='<%# Eval("Remarks")%>'
                                                                                    TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>

                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CAD">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:CheckBox ID="ChkCadI" ToolTip="CAD" runat="server"></asp:CheckBox>
                                                                                <asp:Label ID="lblCADI" Text='<%# Bind("IS_Scanned") %>' Visible="false" ToolTip="CAD" runat="server"></asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:CheckBox ID="ChkCadF" ToolTip="CAD" runat="server"></asp:CheckBox>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Prv.Remarks">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:UpdatePanel ID="updRemarks" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <asp:Button runat="server" ToolTip="View" CausesValidation="false" CssClass="grid_btn" ID="ImgButtonViewPrvRemarks" OnClick="ImgButtonViewPrvRemarks_Click" Text="View"></asp:Button>
                                                                                    </ContentTemplate>
                                                                                    <Triggers>
                                                                                        <asp:PostBackTrigger ControlID="ImgButtonViewPrvRemarks" />
                                                                                    </Triggers>
                                                                                </asp:UpdatePanel>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>

                                                                    <%--                                                                    <asp:TemplateField HeaderText="CAD Received Date">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADReceived" ToolTip="CAD Received Date" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server" Text='<%#Bind("Rec_Date") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calCADReceived" runat="server" Enabled="True" TargetControlID="txtCADReceived">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADReceivedF" Enabled="false" ToolTip="CAD Received Date" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server" Text='<%#Bind("Rec_Date") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calCADReceivedF" runat="server" Enabled="True" TargetControlID="txtCADReceivedF">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CAD Received By">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="ddlCADReceivedBy" ToolTip="CAD Received By" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Bind("CADReceivedBy") %>'
                                                                                    IsMandatory="true" />
                                                                                <asp:HiddenField ID="lblCADReceivedById" runat="server" Value='<%# Bind("CADReceivedById") %>'></asp:HiddenField>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="ddlCADReceivedByF" Enabled="false" CssClass="md-form-control form-control login_form_content_input" ToolTip="CAD Received By" runat="server" Width="200px" Text='<%# Bind("CADReceivedBy") %>'
                                                                                    IsMandatory="true" />

                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CAD Receiver Remarks">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADReceiverRemarks" ToolTip="CAD Receiver Remarks" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("CADReceiverRemarks")%>'
                                                                                    TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADReceiverRemarksF" Enabled="false" ToolTip="CAD Receiver Remarks" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="100%"
                                                                                    TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CAD Verified Date">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADVerifiedDate" ToolTip="CAD Verified Date" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server" Text='<%#Bind("Ver_Date") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calCADVerified" runat="server" Enabled="True" TargetControlID="txtCADVerifiedDate">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADVerifiedDateF" Enabled="false" ToolTip="CAD Verified Date" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="100px" Text='<%#Bind("Ver_Date") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:CalendarExtender ID="calCADVerifiedF" runat="server" Enabled="True" TargetControlID="txtCADVerifiedDateF">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CAD Verified By">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="ddlCADVerifiedBy" Enabled="false" ToolTip="CAD Verified By" CssClass="md-form-control form-control login_form_content_input" runat="server" Text='<%# Bind("CADVerifiedBy") %>'
                                                                                    IsMandatory="false" />
                                                                                <asp:HiddenField ID="lblCADVerifiedById" runat="server" Value='<%# Bind("CADVerifiedById") %>'></asp:HiddenField>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="ddlCADVerifiedByF" Enabled="false" CssClass="md-form-control form-control login_form_content_input" ToolTip="CAD Verified By" Width="200px" runat="server" Text='<%# Bind("CADVerifiedBy") %>'
                                                                                    IsMandatory="true" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>

                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CAD Verifier Remarks">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADVerifierRemarks" ToolTip="CAD Verifier Remarks" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("CADVerifierRemarks")%>'
                                                                                    TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADVerifierRemarksF" Enabled="false" ToolTip="CAD Verifier Remarks" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("CADVerifierRemarks")%>'
                                                                                    TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="File Upload">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:UpdatePanel ID="updFileI" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <asp:FileUpload runat="server" ID="flUploadI" ToolTip="Upload File" />
                                                                                        <asp:Button ID="btnBrowseI" CausesValidation="false" runat="server" OnClick="btnBrowseI_OnClick" Style="display: none"></asp:Button>
                                                                                        <asp:TextBox ID="txtFileupldI" Visible="false" runat="server" ReadOnly="true" CssClass="styleDisplayText" />
                                                                                        <asp:Label ID="lblActualPathI" CausesValidation="false" BorderColor="Green" runat="server" Text='<%# Eval("Document_Path")%>'></asp:Label>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ContentTemplate>
                                                                                    <Triggers>
                                                                                        <asp:PostBackTrigger ControlID="btnBrowseI" />
                                                                                    </Triggers>
                                                                                </asp:UpdatePanel>
                                                                            </div>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:FileUpload runat="server" ID="flUpload" ToolTip="Upload File" />
                                                                                <asp:TextBox ID="txtFileupld" Visible="false" runat="server" ReadOnly="true" CssClass="styleDisplayText" />
                                                                                <asp:Label ID="lblActualPath" CausesValidation="false" BorderColor="Green" runat="server" Text='<%# Bind("Document_Path") %>'></asp:Label>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Scan Ref No" Visible="false">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtScan" runat="server" Width="95%" MaxLength="12" Enabled="false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtScan"
                                                                                    FilterType="Numbers, Custom , UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                                    Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtScanF" runat="server" Width="95%" MaxLength="12" Enabled="false"></asp:TextBox>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Document">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:Label runat="server" ID="lblPath" Visible="false" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                                <asp:LinkButton runat="server" ToolTip="View Document" CausesValidation="false" onchange="funSetValidationValues();" CssClass="grid_btn" ID="hyplnkView" OnClick="hyplnkView_Click" Text="View"></asp:LinkButton>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:Label runat="server" ID="lblPathF" Style="display: none" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                                <asp:LinkButton runat="server" ToolTip="View Document" CausesValidation="false" onchange="funSetValidationValues();" CssClass="grid_btn" ID="hyplnkViewF" OnClick="hyplnkView_ClickF" Text="View"></asp:LinkButton>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Download">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:Label runat="server" ID="lblPathDownLoadI" Visible="false" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                                <asp:ImageButton runat="server" ToolTip="Download" CausesValidation="false" onchange="funSetValidationValues();" ImageUrl="~/Images/downloadFile.png" Height="30px" Width="30px" ID="hyplnkViewDownLoadI" OnClick="hyplnkViewDownLoadI_Click" Text="View"></asp:ImageButton>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:Label runat="server" ID="lblPathFPathDownLoadF" Style="display: none" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                                <asp:ImageButton runat="server" ToolTip="Download" CausesValidation="false" onchange="funSetValidationValues();" ImageUrl="~/Images/downloadFile.png" Height="30px" Width="30px" ID="hyplnkDownLoadF" OnClick="hyplnkDownLoadF_Click" Text="View"></asp:ImageButton>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Value">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADValue" ToolTip="Value" onchange="funSetValidationValues();" Width="100px" runat="server" CssClass="md-form-control form-control login_form_content_input" Text='<%# Eval("txtCADValue")%>'
                                                                                    onkeyup="maxlengthfortxt(40)" MaxLength="100"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCADValueF" Enabled="false" ToolTip="Value" Width="100px" CssClass="md-form-control form-control login_form_content_input" runat="server" Text='<%# Eval("txtCADValue")%>'
                                                                                    onkeyup="maxlengthfortxt(40)" MaxLength="100"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>

                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>--%>
                                                                    <asp:TemplateField FooterStyle-HorizontalAlign="Center">
                                                                        <HeaderTemplate>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:LinkButton ID="lnkRemovePRDDC" CssClass="grid_btn_delete" runat="server" Text="Remove" ToolTip="Remove [Alt+D or Alt+Shif+D]" OnClick="lnkRemovePRDDC_Click1" OnClientClick="return confirm('Do you want to Remove Line Item?');" AccessKey="D"
                                                                                    CausesValidation="false"></asp:LinkButton>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="8%" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:Button ID="addPRDDC" CssClass="grid_btn" runat="server" ValidationGroup="DOC" Text="Add" AccessKey="J" ToolTip="Add [Alt+J]"
                                                                                    OnClick="lnkAAddPRDDCGrid_Click" CausesValidation="true"></asp:Button>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <FooterStyle Width="8%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>

                                                        </div>
                                                    </asp:Panel>
                                                    <div style="display: none" class="row">
                                                        <div class="col">
                                                            <uc7:PageNavigator ID="ucCustomPagingDoc" runat="server"></uc7:PageNavigator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <asp:Panel runat="server" ID="pnlDealerDocuments" CssClass="stylePanel" GroupingText="Dealer Documents"
                                                Width="99%">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <UC5:AutoSugg ID="ddlDealerDoc" ToolTip="Dealer Name" runat="server" ServiceMethod="GetVendorsDoc"
                                                                IsMandatory="true" ErrorMessage="Select the Dealer" ValidationGroup="DealerGO" />

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblddlDealerDoc" CssClass="styleReqFieldLabel" Text="Dealer Name"></asp:Label>

                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="float: right; margin-top: auto">
                                                            <button class="css_btn_enabled" id="btnGoDealerDoc" validationgroup="DealerGO" accesskey="K" onserverclick="btnGoDealerDoc_Click" runat="server"
                                                                type="button" causesvalidation="false" title="Go,Alt+K">
                                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                            </button>
                                                            <button class="css_btn_enabled" id="btnUpdateDocumentsDealer" accesskey="J" onserverclick="btnUpdateDocumentsDealer_ServerClick" runat="server"
                                                                type="button" causesvalidation="false" title="Update,Alt+J">
                                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>&emsp;<u></u>Update
                                                            </button>
                                                            <button class="css_btn_enabled" id="btnClearDealerDocInfo" accesskey="H" onserverclick="btnClearDealerDocInfo_ServerClick" runat="server"
                                                                type="button" causesvalidation="false" title="Clear,Alt+H">
                                                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u></u>Clear
                                                            </button>
                                                        </div>
                                                    </div>


                                                </div>

                                                <div class="gird">
                                                    <asp:GridView ID="grvPRDDCDealer" runat="server" Width="99%" AutoGenerateColumns="False"
                                                        DataKeyNames="PRDDC_Doc_Cat_ID" class="gird_details" ShowFooter="false" OnRowDeleting="gvPRDDT_RowDeleting" OnRowDataBound="grvPRDDCDealer_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSno" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="PRDDC TypeId" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPRTID" runat="server" Text='<%# Bind("PRDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Priority">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPRIORITYTYPE" runat="server" Text='<%# Bind("PRIORITY_TYPE") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:DropDownList Style="display: none" ID="ddlPriority" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="false" Width="120px" ToolTip="Required" runat="server">
                                                                            <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="Primary" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="Secondary" Value="2"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlPriority" runat="server" ControlToValidate="ddlPriority"
                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="DOC" ErrorMessage="Enter the Priority"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTDocType" ToolTip="Doc Type" runat="server" Text='<%# Bind("PRDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                    <asp:Label ID="lblPRICINGDOCID" Visible="false" runat="server" Text='<%# Bind("PRICING_DOC_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false" HeaderText="PRDDC Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblType" runat="server" Text='<%# Bind("PRDDC_Doc_Type") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false" HeaderText="Is_Addtional">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblIsAddtional" Width="400px" runat="server" Text='<%# Bind("Is_Addtional") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Particulars">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:Label ID="lblDesc" Width="400px" ToolTip="Particulars" runat="server" Text='<%# Bind("PRDDC_Doc_Description") %>'></asp:Label>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPRDDCTypeF" onkeyup="maxlengthfortxt(100)" ToolTip="Particulars" CssClass="md-form-control form-control login_form_content_input" Width="100%" AutoPostBack="false"
                                                                            runat="server">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RfvPRDDCTypeF" runat="server" ControlToValidate="txtPRDDCTypeF"
                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="DOC" ErrorMessage="Enter the Particulars"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Required">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:Label ID="lblDocRequired" runat="server" Visible="false" Text='<%#Bind("Doc_Required") %>' />
                                                                        <asp:DropDownList ID="ddlRequired" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="false" Width="120px" ToolTip="Document Required" runat="server">
                                                                            <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="Required" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="Not Required" Value="2"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlRequiredF" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input" OnSelectedIndexChanged="ddlRequiredF_SelectedIndexChangedDealer" Width="120px" ToolTip="Document Required" runat="server">
                                                                            <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="Required" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="Not Required" Value="2"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div id="dvddlRequiredF" runat="server" class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RfvRequiredF" runat="server" ControlToValidate="ddlRequiredF"
                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="DOC" ErrorMessage="Select the Document Required"
                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Received">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:Label ID="lblDocReceived" Visible="false" runat="server" Text='<%#Bind("Doc_Received") %>' />
                                                                        <asp:DropDownList ID="ddlReceived" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" Width="120px" AutoPostBack="false" ToolTip="Document Received" runat="server">
                                                                            <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="Received" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="Not Received" Value="2"></asp:ListItem>
                                                                            <asp:ListItem Text="Waived" Value="3"></asp:ListItem>
                                                                            <asp:ListItem Text="Not Applicable" Value="4"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>

                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlReceivedF" CssClass="md-form-control form-control login_form_content_input" Width="120px" ToolTip="Document Received" runat="server">
                                                                            <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                            <asp:ListItem Text="Received" Value="1"></asp:ListItem>
                                                                            <asp:ListItem Text="Not Received" Value="2"></asp:ListItem>
                                                                            <asp:ListItem Text="Waived" Value="3"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RfvddlReceivedF" runat="server" ValidationGroup="DOC" ControlToValidate="ddlReceivedF"
                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Document Received"
                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Collected Date">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCollectedDate" ToolTip="Collected Date" Width="100px" CssClass="md-form-control form-control login_form_content_input" runat="server" Text='<%#Bind("Col_Date") %>'>
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calCollectedDate" runat="server" Enabled="True" TargetControlID="txtCollectedDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCollectedDateF" ToolTip="Collected Date" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server">
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calCollectedDateF" runat="server" Enabled="True" TargetControlID="txtCollectedDateF">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RfvtxtCollectedDateF" runat="server" ControlToValidate="txtCollectedDateF"
                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="DOC" ErrorMessage="Select Collected Date"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>


                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Collected/Waived By">
                                                                <ItemTemplate>
                                                                    <div class="md-input">

                                                                        <asp:TextBox ID="ddlCollectedBy" Enabled="false" ToolTip="Collected/Waived By" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" Text='<%# Bind("CollectedBy") %>' runat="server" Width="200px" />
                                                                        <asp:HiddenField ID="lblCollectedBy" runat="server" Value='<%# Bind("Collected_By_Id") %>'></asp:HiddenField>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="ddlCollectedByF" Enabled="false" ToolTip="Collected/Waived By" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Bind("CollectedBy") %>'
                                                                            IsMandatory="true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <FooterStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRemarks" ToolTip="Marketing Officer Remarks" onchange="funSetValidationValues();" runat="server" Width="200px" Text='<%# Eval("Remarks")%>'
                                                                            TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRemarksMOF" ToolTip="Marketing Officer Remarks" runat="server" Width="200px" Text='<%# Eval("Remarks")%>'
                                                                            TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="CAD">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:CheckBox ID="ChkCadI" ToolTip="CAD" runat="server"></asp:CheckBox>
                                                                        <asp:Label ID="lblCADI" Text='<%# Bind("IS_Scanned") %>' Visible="false" ToolTip="CAD" runat="server"></asp:Label>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:CheckBox ID="ChkCadF" ToolTip="CAD" runat="server"></asp:CheckBox>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Prv.Remarks">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:UpdatePanel ID="updRemarks" runat="server">
                                                                            <ContentTemplate>
                                                                                <asp:Button runat="server" ToolTip="View" CausesValidation="false" CssClass="grid_btn" ID="ImgButtonViewPrvRemarksDeal" OnClick="ImgButtonViewPrvRemarksDeal_Click" Text="View"></asp:Button>
                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:PostBackTrigger ControlID="ImgButtonViewPrvRemarksDeal" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>

                                                            <%-- <asp:TemplateField HeaderText="CAD Received Date">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADReceived" ToolTip="CAD Received Date" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server" Text='<%#Bind("Rec_Date") %>'>
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calCADReceived" runat="server" Enabled="True" TargetControlID="txtCADReceived">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADReceivedF" Enabled="false" ToolTip="CAD Received Date" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server" Text='<%#Bind("Rec_Date") %>'>
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calCADReceivedF" runat="server" Enabled="True" TargetControlID="txtCADReceivedF">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CAD Received By">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="ddlCADReceivedBy" ToolTip="CAD Received By" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Bind("CADReceivedBy") %>'
                                                                            IsMandatory="true" />
                                                                        <asp:HiddenField ID="lblCADReceivedById" runat="server" Value='<%# Bind("CADReceivedById") %>'></asp:HiddenField>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="ddlCADReceivedByF" Enabled="false" CssClass="md-form-control form-control login_form_content_input" ToolTip="CAD Received By" runat="server" Width="200px" Text='<%# Bind("CADReceivedBy") %>'
                                                                            IsMandatory="true" />

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CAD Receiver Remarks">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADReceiverRemarks" ToolTip="CAD Receiver Remarks" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("CADReceiverRemarks")%>'
                                                                            TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADReceiverRemarksF" Enabled="false" ToolTip="CAD Receiver Remarks" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="100%"
                                                                            TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CAD Verified Date">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADVerifiedDate" ToolTip="CAD Verified Date" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server" Text='<%#Bind("Ver_Date") %>'>
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calCADVerified" runat="server" Enabled="True" TargetControlID="txtCADVerifiedDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADVerifiedDateF" Enabled="false" ToolTip="CAD Verified Date" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="100px" Text='<%#Bind("Ver_Date") %>'>
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calCADVerifiedF" runat="server" Enabled="True" TargetControlID="txtCADVerifiedDateF">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CAD Verified By">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="ddlCADVerifiedBy" Enabled="false" ToolTip="CAD Verified By" CssClass="md-form-control form-control login_form_content_input" runat="server" Text='<%# Bind("CADVerifiedBy") %>'
                                                                            IsMandatory="false" />
                                                                        <asp:HiddenField ID="lblCADVerifiedById" runat="server" Value='<%# Bind("CADVerifiedById") %>'></asp:HiddenField>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="ddlCADVerifiedByF" Enabled="false" CssClass="md-form-control form-control login_form_content_input" ToolTip="CAD Verified By" Width="200px" runat="server" Text='<%# Bind("CADVerifiedBy") %>'
                                                                            IsMandatory="true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>

                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CAD Verifier Remarks">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADVerifierRemarks" ToolTip="CAD Verifier Remarks" onchange="funSetValidationValues();" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("CADVerifierRemarks")%>'
                                                                            TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADVerifierRemarksF" Enabled="false" ToolTip="CAD Verifier Remarks" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("CADVerifierRemarks")%>'
                                                                            TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="File Upload">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:UpdatePanel ID="updFileI" runat="server">
                                                                            <ContentTemplate>
                                                                                <asp:FileUpload runat="server" ID="flUploadIDealer" ToolTip="Upload File" />
                                                                                <asp:Button ID="btnBrowseIDealer" CausesValidation="false" runat="server" OnClick="btnBrowseIDealer_OnClick" Style="display: none"></asp:Button>
                                                                                <asp:TextBox ID="txtFileupldIDealer" Visible="false" runat="server" ReadOnly="true" CssClass="styleDisplayText" />
                                                                                <asp:Label ID="lblActualPathIDealer" CausesValidation="false" BorderColor="Green" runat="server" Text='<%# Eval("Document_Path")%>'></asp:Label>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:PostBackTrigger ControlID="btnBrowseIDealer" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>
                                                                    </div>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:FileUpload runat="server" ID="flUpload" ToolTip="Upload File" />
                                                                        <asp:TextBox ID="txtFileupld" Visible="false" runat="server" ReadOnly="true" CssClass="styleDisplayText" />
                                                                        <asp:Label ID="lblActualPath" CausesValidation="false" BorderColor="Green" runat="server" Text='<%# Bind("Document_Path") %>'></asp:Label>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Scan Ref No" Visible="false">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtScan" runat="server" Width="95%" MaxLength="12" Enabled="false"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtScan"
                                                                            FilterType="Numbers, Custom , UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                            Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtScanF" runat="server" Width="95%" MaxLength="12" Enabled="false"></asp:TextBox>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Document">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:Label runat="server" ID="lblPathDealer" Visible="false" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                        <asp:LinkButton runat="server" ToolTip="View Document" CausesValidation="false" onchange="funSetValidationValues();" CssClass="grid_btn" ID="hyplnkView" OnClick="hyplnkViewDealer_Click" Text="View"></asp:LinkButton>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:Label runat="server" ID="lblPathFDealer" Style="display: none" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                        <asp:LinkButton runat="server" ToolTip="View Document" CausesValidation="false" onchange="funSetValidationValues();" CssClass="grid_btn" ID="hyplnkViewF" OnClick="hyplnkView_ClickF" Text="View"></asp:LinkButton>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Download">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:Label runat="server" ID="lblPathDownLoadI" Visible="false" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                        <asp:ImageButton runat="server" ToolTip="Download" CausesValidation="false" onchange="funSetValidationValues();" ImageUrl="~/Images/downloadFile.png" Height="30px" Width="30px" ID="hyplnkViewDownLoadIDealer" OnClick="hyplnkViewDownLoadIDealer_Click" Text="View"></asp:ImageButton>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:Label runat="server" ID="lblPathFPathDownLoadF" Style="display: none" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                        <asp:ImageButton runat="server" ToolTip="Download" CausesValidation="false" onchange="funSetValidationValues();" ImageUrl="~/Images/downloadFile.png" Height="30px" Width="30px" ID="hyplnkDownLoadFDealer" OnClick="hyplnkDownLoadFDealer_Click" Text="View"></asp:ImageButton>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Value">
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADValue" ToolTip="Value" onchange="funSetValidationValues();" Width="100px" runat="server" CssClass="md-form-control form-control login_form_content_input" Text='<%# Eval("txtCADValue")%>'
                                                                            onkeyup="maxlengthfortxt(40)" MaxLength="100"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCADValueF" Enabled="false" ToolTip="Value" Width="100px" CssClass="md-form-control form-control login_form_content_input" runat="server" Text='<%# Eval("txtCADValue")%>'
                                                                            onkeyup="maxlengthfortxt(40)" MaxLength="100"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>--%>
                                                            <asp:TemplateField FooterStyle-HorizontalAlign="Center">
                                                                <HeaderTemplate>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <div class="md-input">
                                                                        <asp:LinkButton ID="lnkRemovePRDDC" Visible="false" CssClass="grid_btn_delete" runat="server" Text="Remove" ToolTip="Remove [Alt+D or Alt+Shif+D]" OnClick="lnkRemovePRDDC_Click1" OnClientClick="return confirm('Do you want to Remove Line Item?');" AccessKey="D"
                                                                            CausesValidation="false"></asp:LinkButton>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="8%" />
                                                                <FooterTemplate>
                                                                    <div class="md-input">
                                                                        <asp:Button ID="addPRDDC" CssClass="grid_btn" runat="server" ValidationGroup="DOC" Text="Add" AccessKey="J" ToolTip="Add [Alt+J]"
                                                                            OnClick="lnkAAddPRDDCGrid_Click" CausesValidation="true"></asp:Button>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <FooterStyle Width="8%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                            <div style="display: none" class="row">
                                                <div class="col">
                                                    <uc7:PageNavigator ID="ucCustomPagingDocDealer" runat="server"></uc7:PageNavigator>
                                                </div>
                                            </div>


                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btnBrowse" />
                                            <asp:PostBackTrigger ControlID="btnUploadROPDocuments" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabAlerts" CssClass="tabpan" HeaderText="TabAlerts"
                                BackColor="Red" Width="99%">
                                <HeaderTemplate>
                                    Alerts
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                        <ContentTemplate>
                                            <%--<table style="width: 100%">
                                                <tr valign="middle">
                                                    <td style="padding-top: 1%">--%>
                                            <div>
                                                <asp:Panel runat="server" ID="Panel11" HorizontalAlign="Center" Width="99%" CssClass="stylePanel" GroupingText="Alert Details">
                                                    <%--    <div id="div2" style="overflow: auto; width: 50%; padding-left: 1%;" runat="server"
                                                                    border="1">--%>
                                                    <div class="gird">
                                                        <asp:GridView ID="gvAlert" runat="server" AutoGenerateColumns="False" ShowFooter="True" class="gird_details"
                                                            OnRowDeleting="gvAlert_RowDeleting">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="TypeId" Visible="False">
                                                                    <ItemTemplate>
                                                                        <div class="md-input">
                                                                            <asp:Label ID="lblTypeId" runat="server" Text='<%# Bind("TypeId") %>' />

                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Type">
                                                                    <ItemTemplate>
                                                                        <div class="md-input">
                                                                            <asp:Label ID="lblType" ToolTip="Type" runat="server" Text='<%# Bind("Type") %>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlType_AlertTab" ToolTip="Type" CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlType_AlertTab" runat="server" ControlToValidate="ddlType_AlertTab"
                                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="TabAlert1" SetFocusOnError="False"
                                                                                    InitialValue="-1" ErrorMessage="Select a Alert Type"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="User ContactId" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblUserContactid" runat="server" Text='<%# Bind("UserContactId") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="User Contact">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblUserContact" ToolTip="User Contact" runat="server" Text='<%# Bind("UserContact") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <%--  <asp:DropDownList ID="ddlContact_AlertTab" runat="server" Width="200px">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvddlContact_AlertTab" runat="server" ControlToValidate="ddlContact_AlertTab"
                                                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="TabAlert1" SetFocusOnError="False"
                                                                            InitialValue="-1" ErrorMessage="Select a User Contact"></asp:RequiredFieldValidator>--%>
                                                                        <div class="md-input">
                                                                            <UC5:AutoSugg ID="ddlContact_AlertTab" ToolTip="User Contact" CssClass="md-form-control form-control login_form_content_input" runat="server" ServiceMethod="GetSaleAlertUser"
                                                                                ErrorMessage="Select a User Contact" IsMandatory="true" ValidationGroup="TabAlert1" />
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="EMail">
                                                                    <ItemTemplate>
                                                                        <%--Checked='<%# Bind("EMail") %>' --%>
                                                                        <div class="md-input">
                                                                            <asp:CheckBox ID="ChkEmail" ToolTip="EMail" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "EMail")))%>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input">
                                                                            <asp:CheckBox ID="ChkEmail" ToolTip="EMail" runat="server"></asp:CheckBox>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="SMS">
                                                                    <ItemTemplate>
                                                                        <%--Checked='<%# Bind("SMS") %>'--%>
                                                                        <div class="md-input">
                                                                            <asp:CheckBox ID="ChkSMS" runat="server" ToolTip="SMS" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "SMS")))%>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input">
                                                                            <asp:CheckBox ID="ChkSMS" ToolTip="SMS" runat="server"></asp:CheckBox>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <div class="md-input">
                                                                            <asp:LinkButton ID="lnRemove" CausesValidation="false" AccessKey="B" ToolTip="Remove [Alt+B]" OnClientClick="return confirm('Are you sure want to delete this record?');" CssClass="grid_btn_delete" runat="server" CommandName="Delete"
                                                                                Text="Remove"></asp:LinkButton>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input">
                                                                            <asp:Button ID="btnAddAlert" runat="server" Text="Add" AccessKey="T" ToolTip="Add [Alt+T]" CausesValidation="true" CssClass="grid_btn"
                                                                                OnClick="Alert_AddRow_OnClick" ValidationGroup="TabAlert1" Width="50px"></asp:Button>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                    <%-- </div>--%>
                                                </asp:Panel>
                                            </div>
                                            <div>
                                                <div class="row">
                                                    <div class="gird col-lg-6 col-md-9 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Additional Parameter Informations" ID="pnlAddiotnalInfo" runat="server" ToolTip="Additional Parameter Informations"
                                                            CssClass="stylePanel">
                                                            <asp:GridView ID="grvAdditionalInfo" runat="server" AutoGenerateColumns="False"
                                                                OnRowDataBound="grvAdditionalInfo_RowDataBound" class="gird_details">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Parameter Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblParamName" runat="server" Text='<%# Bind("Param_Name") %>'></asp:Label>
                                                                            <asp:Label ID="lblParamType" runat="server" Text='<%# Bind("Param_Type") %>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblLookupType" runat="server" Text='<%# Bind("Lookup_Type") %>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblParamSize" runat="server" Text='<%# Bind("Param_Size") %>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Values">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtValues" runat="server" Visible="false" class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("PARAM_VALUES") %>'></asp:TextBox>
                                                                            <asp:DropDownList ID="ddlValues" runat="server" Visible="false" class="md-form-control form-control"></asp:DropDownList>
                                                                            <asp:Label ID="lblParamValues" Text='<%#Eval("PARAM_VALUES")%>' runat="server" Visible="false"></asp:Label>
                                                                            <cc1:FilteredTextBoxExtender ID="fteValues" runat="server" FilterType="Custom"
                                                                                Enabled="True" TargetControlID="txtValues">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtValues"
                                                                                Format="dd/MM/YYYY" ID="calAddValues" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PARAM_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPARAM_ID" runat="server" Text='<%# Bind("PARAM_ID") %>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PARAM_DET_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPARAM_DET_ID" runat="server" Text='<%# Bind("PARAM_DET_ID") %>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CONSTANT_TRAN_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCONSTANT_TRAN_ID" runat="server" Text='<%# Bind("CONSTANT_TRAN_ID") %>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>
                                            <%-- </td>
                                                </tr>
                                            </table>--%>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row" style="float: right; margin-top: 5px;">
                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnSaveValidation())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                                    type="button" accesskey="S">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                    type="button" accesskey="l">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" causesvalidation="false" onclick="if(fnConfirmExit())" onserverclick="btnCancel_Click" runat="server"
                                    type="button" accesskey="X">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                                <button class="css_btn_enabled" id="btnCancelCheckList" title="Cancel CheckList[Alt+W]" onclick="if(fnConfirmDealCancel())" causesvalidation="false" onserverclick="btnCancelCheckList_Click" runat="server"
                                    type="button" accesskey="W">
                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>W</u>ithDraw CheckList
                                </button>
                                <asp:Button runat="server" ID="btnPrintDocCreateModeDummy" UseSubmitBehavior="false" Text="Print" CausesValidation="false" CssClass="styleSubmitButton"
                                    OnClick="btnCheckListPrint" Style="display: none;" />
                                <button class="css_btn_enabled" id="btnPdf" title="PDF [Alt+O]" causesvalidation="false" onserverclick="btnCheckListPrint" runat="server"
                                    type="button" accesskey="O">
                                    <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u></u>PDF
                                </button>
                                <%-- </div>--%>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <asp:CustomValidator ID="cvPricing" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" />
                            </di>

                      
                        </div>
                        <div style="display: none">
                            <div class="col">
                                <asp:ValidationSummary ID="vsPricing" Style="display: none" runat="server" CssClass="styleMandatoryLabel"
                                    HeaderText="Correct the following validation(s):" ShowMessageBox="false" ShowSummary="true" ValidationGroup="Main Page" />
                            </div>
                        </div>
                    </div>


                </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrintDocCreateModeDummy" />
        </Triggers>
    </asp:UpdatePanel>

    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <asp:Label ID="lblCoproView" runat="server" Style="display: none;"></asp:Label>
        <cc1:ModalPopupExtender ID="mpeProShow" runat="server" PopupControlID="dvProView" TargetControlID="lblCoproView"
            BackgroundCssClass="modalBackground" Enabled="true" />
        <div runat="server" id="dvProView" style="display: none; width: 75%;">
            <div id="divrProimg" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -35px;">
                <asp:ImageButton ID="rptimg" runat="server" Enabled="false" ToolTip="Close [Alt+I]" AccessKey="I" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                    OnClick="divrProimg_Click" />
            </div>
            <asp:Panel ID="pnlProView" GroupingText="Copy Profile" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="md-input">

                            <%-- <asp:UpdatePanel ID="updCopyProfile" runat="server">
                                <ContentTemplate>--%>

                            <div class="row">
                                <div class="col-sm-6 col-xs-6" style="padding: 0px;">
                                    <UC5:AutoSugg ID="ddlProposalCopy" ToolTip="Proposal No" runat="server" AutoPostBack="false"
                                        class="md-form-control form-control" ServiceMethod="GetProposalCopy"
                                        ErrorMessage="Select the Proposal No"
                                        IsMandatory="false" />
                                </div>
                                <div class="col-sm-6 col-xs-6" style="padding: 0px;">
                                    <asp:Button ID="btnGoProfileCopy" runat="server" Enabled="false" AccessKey="Q" ToolTip="Alt+Q" CausesValidation="true" CssClass="grid_btn" OnClick="ddlProposal_Item_Selected"
                                        Text="Go" />
                                </div>
                            </div>

                            <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>


                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblProposal" runat="server" Text="Proposal No" ToolTip="Proposal No" CssClass="styleReqFieldLabel"></asp:Label>

                            </label>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    <asp:Label ID="lblfile" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="MPUploadFiles" runat="server" PopupControlID="plUploadfiles" TargetControlID="lblfile"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBIDD" />
    <asp:Panel ID="plUploadfiles" GroupingText="" Height="400px" Width="50%" runat="server" CssClass="stylePanel" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
        <table width="100%">
            <tr>
                <td colspan="2" align="center" class="stylePageHeading">
                    <asp:Label ID="Label8" runat="server" Text="Upload Files"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUploadFile" runat="server" Text="Upload File"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="fuOtherFiles" runat="server" Width="200px" />
                    <asp:Label ID="lblCurerntSNo" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblSSID" runat="server" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFileRemarks" runat="server" Text="Remarks"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFileRemarks" ToolTip="File Remarks" Width="200px" onkeyup="maxlengthfortxt(500);" TextMode="MultiLine" runat="server"
                        AutoPostBack="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <button class="css_btn_enabled" id="btnUploadMulti" onserverclick="btnUpload_Click" runat="server" causesvalidation="false" title="Upload"
                        type="button">
                        <i class="fa fa-upload" aria-hidden="true"></i>&emsp;<u></u>Upload
                    </button>
                    <button class="css_btn_enabled" id="btnUploadCancel" onserverclick="btnUploadCancel_Click" runat="server" causesvalidation="false" title="Exit" onclick="if(fnConfirmExit())"
                        type="button">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u></u>Exit
                    </button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:UpdatePanel ID="updUploadGrid" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel2" GroupingText="Files" CssClass="stylePanel" runat="server"
                                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:GridView ID="grvUploadedFiles" Width="100%" runat="server" class="gird_details" AutoGenerateColumns="false" ShowFooter="false" OnRowDataBound="grvUploadedFiles_RowDataBound" OnRowDeleting="grvUploadedFiles_RowDeleting">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNoDisplay" runat="server" Text='<%# Container.DataItemIndex+1  %>'></asp:Label>
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%# Bind("Serial_No")  %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("SNo") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="File Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFileName" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="lblRemarks" class="md-form-control form-control login_form_content_input requires_true" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Select" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ToolTip="View Document" ImageUrl="~/Images/ViewFile2_Enable.jpg" Width="20px" Height="20px" CausesValidation="false" ID="hyplnkView" OnClick="hyplnkView_Click1" Text="View"></asp:ImageButton>
                                                        <asp:Label runat="server" ID="lblPath" Text='<%# Eval("Scanned_Ref_No")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Download">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ToolTip="View Document" ImageUrl="~/Images/downloadFile.PNG" Width="20px" Height="20px" CausesValidation="false" ID="hyplnkDownload" OnClick="hyplnkDownload_Click" Text="View"></asp:ImageButton>

                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:UpdatePanel ID="updDel" runat="server">
                                                            <ContentTemplate>
                                                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CssClass="grid_btn_delete" OnClientClick="return confirm('Are you sure want to delete this record?');" CausesValidation="false" OnClick="lnkDelete_Click"></asp:LinkButton>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="lnkDelete" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </asp:Panel>


    <%--RemarkHistory--%>

    <asp:Label ID="lblRemarkHis" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="MPERemarkHistory" runat="server" PopupControlID="plRemarkHistory" TargetControlID="lblRemarkHis"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
    <asp:Panel ID="plRemarkHistory" GroupingText="" Height="400px" Width="50%" runat="server" CssClass="stylePanel" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
        <table width="100%">

            <tr>
                <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="Panel4" GroupingText="Remark History" CssClass="stylePanel" runat="server"
                                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:GridView ID="grvRemarkHistory" Width="100%" runat="server" class="gird_details" AutoGenerateColumns="false" ShowFooter="false">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNoDisplay" runat="server" Text='<%# Container.DataItemIndex+1  %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Particulars">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblParticulars" runat="server" Text='<%# Bind("PRDDC_DOC_DESCRIPTION") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="lblRemarks" Enabled="false" TextMode="MultiLine" runat="server" Text='<%# Bind("REMARK") %>'></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("HIS_DATE") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks Log By">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRemarksLogBy" runat="server" Text='<%# Bind("HIS_By") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">

                    <button class="css_btn_enabled" id="btnCancelRemarkHis" onserverclick="btnCancelRemarkHis_Click" runat="server" accesskey="Z" causesvalidation="false" title="Exit[Alt+Z]" onclick="if(fnConfirmExit())"
                        type="button">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u></u>Exit
                    </button>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
