 <%@ page language="C#" autoeventwireup="true" inherits="test, App_Web_e3xzh3ai" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Fintech Solutions :: Login ::</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Content/css/bootstrap.css" rel="stylesheet" />
    <link href="Content/css/style.css" rel="stylesheet" />
    <link href="Content/css/style_sheet.css" rel="stylesheet" />
    <link href="Content/css/custom.css" rel="stylesheet" />
    <link href="Content/css/font.css" rel="stylesheet" />
    <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>

    <link href="Content/css/chosen-min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading">Panel Heading</div>
                <div class="panel-body">Panel Content</div>
            </div>
        </div>
        <br />
        <br />


        <div class="container">
            <h2>Modal Example</h2>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                        </div>
                        <div class="modal-body">
                            <p>Some text in the modal.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <!--success-->
        <div class="container">
            <h2>Success Modal Example</h2>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Success Modal</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header success_header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">&#10004; Modal Header</h4>
                        </div>
                        <div class="modal-body">
                            <p>Some success in the modal.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <!--error-->
        <div class="container">
            <h2>Error Modal Example</h2>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">Error Modal</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header error_header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">&#10761; Modal Header</h4>
                        </div>
                        <div class="modal-body">
                            <p>Some error in the modal.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <!--warning-->

        <div class="container">
            <h2>warning Modal Example</h2>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal3">warning Modal</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal3" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header warning_header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">&#10226; Modal Header</h4>
                        </div>
                        <div class="modal-body">
                            <p>Some warning in the modal.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <br />
        <br />
        <%--choosen dropdown--%>

        <div class="container">
            <h2>choosen dropdown Example</h2>
            <div>
                <select data-placeholder="Choose a cdfsdfs.." class="chosen" style="width: 200px;">
                    <option value=""></option>
                    <option value="US">United Status</option>
                    <option value="wUS">United qqq</option>
                    <option value="UeS">United ddd</option>
                    <option value="UrS">United eee</option>
                    <option value="UfS">eee ff</option>
                </select>
            </div>
        </div>
    </form>

    <script src="Content/Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Content/Scripts/bootstrap.js"></script>

    <script src="Content/Scripts/bootstrap.bundle.js"></script>
    <script src="Content/Scripts/UserScript.js"></script>
    
    <script src="Content/Scripts/chosen-min.js"></script>
    
    <script>
        //    ({}).change(function (obj, result) {

        //});
        $(document).ready(function () {
            $('select.chosen').chosen();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            $('select.chosen').chosen();
        }
    </script>
</body>
</html>
