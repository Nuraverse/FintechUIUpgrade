$(document).ready(function () {
    // $('.date').bootstrapMaterialDatePicker({ time: false, clearButton: true });
    //$(".requires_true").prop('required', true);
   // $(".requires_false").prop('required', false);
    $("input").prop('required', false);


    $(".md-form-control").focusin(function () {
        $(this).closest(".md-input").addClass('md-focus');

        if ($(this).val() != "") {
            $(this).closest(".md-input").addClass('md-value');
        }
        else {
            $(this).closest(".md-input").removeClass('md-value');
        }

    });

    $(".md-form-control").focusout(function () {
        $(this).closest(".md-input").removeClass('md-focus');
        if ($(this).val() != "") {
            $(this).closest(".md-input").addClass('md-value');
        }
        else {
            $(this).closest(".md-input").removeClass('md-value');
        }

    });

    $(".md-form-control").each(function () {
        if ($(this).val() != '') {
            $(this).closest(".md-input").addClass('md-value');
        }
    });

    $(".lmd-form-control").focusout(function () {
        if ($(this).parent().hasClass('lmd-input')) {
            $(this).parent().removeClass('lmd-input');
        }
    });
});

Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
function EndRequestHandler(sender, args) {

    $(".md-form-control").focusin(function () {
        $(this).closest(".md-input").addClass('md-focus');

        if ($(this).val() != "") {
            $(this).closest(".md-input").addClass('md-value');
        }
        else {
            $(this).closest(".md-input").removeClass('md-value');
        }

    });

    $(".md-form-control").focusout(function () {
        $(this).closest(".md-input").removeClass('md-focus');
        if ($(this).val() != "") {
            $(this).closest(".md-input").addClass('md-value');
        }
        else {
            $(this).closest(".md-input").removeClass('md-value');
        }

    });

    $(".md-form-control").each(function () {
        if ($(this).val() != '') {
            $(this).closest(".md-input").addClass('md-value');
        }
    });

    $(".lmd-form-control").focusout(function () {
        if ($(this).parent().hasClass('lmd-input')) {
            $(this).parent().removeClass('lmd-input');
        }
    });
}



var isMenuShowing = false;
function openNav() {
    if ($("#mySidenav").hasClass("sidemenuhide"))
        $(parent.document).find('#mySidenav').removeClass("sidemenuhide");

    if ($("#mySidenav").hasClass("sidemenushow"))
        $(parent.document).find('#mySidenav').removeClass("sidemenushow");

    if (isMenuShowing) {
        $(parent.document).find('#mySidenav').addClass("sidemenuhide");
        $("#mySidenav").addClass("sidemenuhide");
        isMenuShowing = false;
    } else {
        $("#mySidenav").addClass("sidemenushow");
        isMenuShowing = true;
    }
}
function closeNav() {
    if (isMenuShowing) {
        $(parent.document).find('#mySidenav').addClass("sidemenuhide");
        $("#mySidenav").addClass("sidemenuhide");
        isMenuShowing = false; 
    }
}

$(window).keydown(function (event) {
 

    if (event.ctrlKey && event.keyCode == 84) {// Ctrl+T
        event.preventDefault();
    }
    if (event.ctrlKey && event.keyCode == 83) {//Ctrl+S
        event.preventDefault();
    } if (event.ctrlKey && event.keyCode == 70) {//Ctrl+F
        event.preventDefault();
    }
    if (event.altKey && event.keyCode == 70) {//Alt+F
        event.preventDefault();
    }
    if (event.altKey && event.keyCode == 115) {//Alt+F4
        // ALT+F4 
        //alert("ALT+F4");
       
        //window.onbeforeunload = function () {
        //    alert("teete");
        //};

        event.preventDefault();
        //if (!evt) 
        //    evt = event;
        //if (evt.altKey && evt.keyCode==115)
        //{ 
        //    windows.onbeforeunload = function(){
        //        return false;
        //    }
        //} 
    }
});
//$(document).mouseup(function (e) {
//    var container = $("#divMenu");
//    
//    if (!container.is(e.target) && container.has(e.target).length === 0) {
//        closeNav();

//    }
//});


$('body').bind('click', function (e) {
    if (e.target.id == "mySidenav" || $(e.target).parents("#mySidenav").length) {
        openNav();
    } else {
        if (e.target.id == "SideMenuOpen" || $(e.target).parents("#SideMenuOpen").length) { isMenuShowing = false;  return false; }
      //  else {
            isMenuShowing = true;
            openNav();
       // }
    }  


    if (e.target.id == "dropmenu" || $(e.target).parents("#dropmenu").length) {
        dropmenuhide();
    } else {
        if (e.target.id == "dropdownMenuButton" || $(e.target).parents("#dropdownMenuButton").length) { isdropmenuHide = false; return false; }
        //  else {
        isdropmenuHide = true;
        dropmenuhide();
        // }
    }

});



$('iframe').bind('click', function (e) {
    if ($(e.target).closest('.sidenav').length == 0 && $(e.target).closest('.side_menu_icon').length == 0) {
        // click happened outside of .sidenav, so hide
        //  if (document.getElementById("mySidenav").style.width == "250px") {
        //  isMenuShowing = true;
        openNav();
        //  }
    }

    //if ($("#dropmenu").hasClass("drop_down_menu_list")) {
    //    $("#dropmenu").removeClass("drop_down_menu_list");
    //    isdropmenuHide = false;
    //}
});

var isMenuHide = false;
function menuhide() {
    if (isMenuHide) {
        //  $("#headermenu").css("display", "block");
        //$("#content_base").css({ 'height': 'calc(100vh - 150px)' });
        //$("#mySidenav").css({ 'height': 'calc(100vh - 50px)' });//$
        document.getElementById("headermenu").style.display = "block";
        document.getElementById("content_base").style.height = "calc(100vh - 120px)";
        document.getElementById("mySidenav").style.height = "calc(100vh - 50px)";
        $("#icon_fa").removeClass("fa-angle-double-up").removeClass("fa-angle-double-down");
        
        $(".iframe_id").removeClass("frm_height1");
        $(".iframe_id").addClass("frm_height");
        $("#icon_fa").addClass("fa-angle-double-up");
        isMenuHide = false;
    }
    else {
        $("#headermenu").css("display", "none");
        $("#content_base").css({ 'height': 'calc(100vh - 70px)' });
        $("#mySidenav").css({ 'height': '100vh' });
        //document.getElementById("headermenu").style.display = "none";
        // document.getElementById("content_base").style.height = "calc(100vh - 100px)";
        // document.getElementById("mySidenav").style.height = "100vh";
        // 
        $(".iframe_id").removeClass("frm_height");
        $(".iframe_id").addClass("frm_height1");
        $("#icon_fa").removeClass("fa-angle-double-up").removeClass("fa-angle-double-down");
        $("#icon_fa").addClass("fa-angle-double-down");
        isMenuHide = true;
    }
}

var isdropmenuHide = false;
function dropmenuhide() {
    if (isdropmenuHide) {
        $(parent.document).find('#dropmenu').removeClass("drop_down_menu_list");
        isdropmenuHide = false;
    }
    else {

        $(parent.document).find('#dropmenu').addClass("drop_down_menu_list");
        isdropmenuHide = true;
    }
}

