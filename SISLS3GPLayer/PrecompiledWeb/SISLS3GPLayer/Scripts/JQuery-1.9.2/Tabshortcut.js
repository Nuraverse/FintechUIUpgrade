
function fnShortcutKeys(sender)
//, TabContainerID)

{
    
    var evt = sender || window.event

    //alert(evt.type);

    //alert(event.keyCode);

    var tabContainer = $find('ctl00_ContentPlace_Main_TabContainer1')
    //var tabContainer = document.getElementById(TabContainerID).value;

   // var tabContainer = $find('ctl00_ContentPlaceHolder1_tcCompanyCreation');
    //alert(tabContainer)

    document.defaultAction = false;


    // 1 Pressed For Tab 1
    if(window.event.keyCode == 49)

        //alert(window.event.keyCode); used to see if I got the right value

    {

        tabContainer.set_activeTabIndex(0); //Sets to Tab 1

    }

    // 2 Pressed For Tab 2

    if (event.keyCode == 50)

    {

        tabContainer.set_activeTabIndex(1); //Sets to Tab 2

    }

 

    // 3 Pressed For Tab 3

    if (event.keyCode == 51)

    {

        tabContainer.set_activeTabIndex(2); //Sets to Tab 2

    }

 

    // 4 Pressed For Tab 4

    if (event.keyCode == 52)

    {

        tabContainer.set_activeTabIndex(3);

    }

}