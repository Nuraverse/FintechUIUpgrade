(function(){
    function TabbedNavigation(element) {
       
		this.element = element;
		this.navigation = this.element.getElementsByTagName("nav")[0];
		this.navigationElements = this.navigation.getElementsByClassName("js-cd-navigation")[0];
		this.content = this.element.getElementsByClassName("js-cd-content")[0];
		this.activeTab;
		this.activeContent;
		this.init();
	};

	TabbedNavigation.prototype.init = function () {
	   
		var self = this;
		//listen for the click on the tabs navigation
		this.navigation.addEventListener("click", function(event){
			event.preventDefault();
			if(event.target.tagName.toLowerCase() == "a" && !hasClass(event.target, "cd-selected")) {
				self.activeTab = event.target;
				self.activeContent = self.content.querySelectorAll("[data-content="+self.activeTab.getAttribute("data-content")+"]")[0];
				self.updateContent();
			}
		});

		//listen for the scroll in the tabs navigation 
		this.navigation.addEventListener('scroll', function(event){
			self.toggleNavShadow();
		});
	};

	TabbedNavigation.prototype.updateContent = function () {
	    
		var actualHeight = this.content.offsetHeight;
		//update navigation classes
		removeClass(this.navigation.querySelectorAll("a.cd-selected")[0], "cd-selected");
		addClass(this.activeTab, "cd-selected");
		//update content classes
		removeClass(this.content.querySelectorAll("li.cd-selected")[0], "cd-selected");
		addClass(this.activeContent, "cd-selected");
		//set new height for the content wrapper
		(!window.requestAnimationFrame) 
			? this.content.setAttribute("style", "height:"+this.activeContent.offsetHeight+"px;")
			: setHeight(actualHeight, this.activeContent.offsetHeight, this.content, 200);
	};

	TabbedNavigation.prototype.toggleNavShadow = function () {

	  
		//show/hide tabs navigation gradient layer
		this.content.removeAttribute("style");
		var navigationWidth = Math.floor(this.navigationElements.getBoundingClientRect().width),
			navigationViewport = Math.ceil(this.navigation.getBoundingClientRect().width);
		( this.navigation.scrollLeft >= navigationWidth - navigationViewport )
			? addClass(this.element, "cd-tabs--scroll-ended")
			: removeClass(this.element, "cd-tabs--scroll-ended");
	};

	var tabs = document.getElementsByClassName("js-cd-tabs"),
		tabsArray = [],
		resizing = false;
	if( tabs.length > 0 ) {
		for( var i = 0; i < tabs.length; i++) {
			(function(i){
				tabsArray.push(new TabbedNavigation(tabs[i]));
			})(i);
		}

		window.addEventListener("resize", function(event) {
			if( !resizing ) {
				resizing = true;
				(!window.requestAnimationFrame) ? setTimeout(checkTabs, 250) : window.requestAnimationFrame(checkTabs);
			}
		});
	}

	function checkTabs() {
	   
		tabsArray.forEach(function(tab){
			tab.toggleNavShadow();
		});
		resizing = false;
	};

	function setHeight(start, to, element, duration) {
	    
		var change = to - start,
	        currentTime = null;
	        
	    var animateHeight = function(timestamp){  
	    	if (!currentTime) currentTime = timestamp;         
	        var progress = timestamp - currentTime;
	        var val = Math.easeInOutQuad(progress, start, change, duration);
	        element.setAttribute("style", "height:"+val+"px;");
	        if(progress < duration) {
	            window.requestAnimationFrame(animateHeight);
	        }
	    };
	    
	    window.requestAnimationFrame(animateHeight);
	}

	Math.easeInOutQuad = function (t, b, c, d) {
 		t /= d/2;
		if (t < 1) return c/2*t*t + b;
		t--;
		return -c/2 * (t*(t-2) - 1) + b;
	};
	
	//class manipulations - needed if classList is not supported
	function hasClass(el, className) {
	   
	  	if (el.classList) return el.classList.contains(className);
	  	else return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'));
	}
	function addClass(el, className) {
	  
		var classList = className.split(' ');
	 	if (el.classList) el.classList.add(classList[0]);
	 	else if (!hasClass(el, classList[0])) el.className += " " + classList[0];
	 	if (classList.length > 1) addClass(el, classList.slice(1).join(' '));
	}
	function removeClass(el, className) {
	   
		var classList = className.split(' ');
	  	if (el.classList) el.classList.remove(classList[0]);	
	  	else if(hasClass(el, classList[0])) {
	  		var reg = new RegExp('(\\s|^)' + classList[0] + '(\\s|$)');
	  		el.className=el.className.replace(reg, ' ');
	  	}
	  	if (classList.length > 1) removeClass(el, classList.slice(1).join(' '));
	}
})();

// dynamic tab

var button='<button class="close" type="button" title="Close">×</button>';
var tabID = 1;
function resetTab() {
   
    var tabs = $("#ulContainer li:not(:first)");
    $(tabs[1]).remove();
    $("#tab-content").find('#tab2').remove();
    var len = 1
    for (var i = 2; i < tabs.length; i++) {
        len++;
        $(tabs[i]).find('a').attr("href", '#tab' + len);
        var _tt = len + 1;
        $('div#tab'+_tt+'').attr('id', 'tab'+len+'');
        };

    tabID--;
}

function funClose()
{
    

    if (confirm('Do you want to Close the Tab?')) {
        return true;
    }
    else
        return false;
}

function LoadDynamictTabIframe(name, value, tabcount) {
   
    var tabID1 = $(parent.document).find("#ulContainer >li");
    if (tabID1 == tabcount) { resetTab(); }
    if ($('li').hasClass('active')) {
        $('li').removeClass('active');
    }    
    tabID++;
   // alert(tabID);
    $('#ulContainer').append($('<li id="li' + tabID + '" class="active"><a href="#tab' + tabID + '" role="tab" data-toggle="tab" onclick="LoadbasedonTab(this)"> ' + name + '<button   class="close" style="margin-left:6px;margin-top:-2px;" type="button" title="Close">×</button></a></li>'));
    // $('#tab-content').append($('<div class="tab-pane fade" id="tab' + tabID + '">Tab dsfdsfs sdfsdfs sdfdsf ' + tabID + ' content</div>'));
   
    if ($('div').hasClass('active show')) {
        $('div').removeClass('active show');
    }
    if ($('div').hasClass('active')) {
        $('div').removeClass('active');
    }
    if ($('div').hasClass('show')) {
        $('div').removeClass('show');
    }
    if ($('div').hasClass('in')) {
        $('div').removeClass('in');
    }
    $('#tab-content').append($('<div class="tab-pane fade in active show" id="tab' + tabID + '"><iframe runat="server" id="ifrmMain' + tabID + '" width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="yes"  class="iframe_id frm_height" visible="true" src="' + value + '"></iframe></div>'));

};

function LoadbasedonTab(obj) {
  
    $(obj.hash).addClass('active show');
    
};

function RemoveTabnew(obj) {
   
    var tabID1 = $(parent.document).find("#ulContainer >li.active");
    var div_t = $(parent.document).find("#ulContainer >li.active >a").attr('href');
    $(div_t).remove();
    $(tabID1).remove();
    $(parent.document).find('#tab1').addClass('in active show');
    $(parent.document).find('#lihome').addClass('active');
    
    try { $(parent.document).find(div_t).remove(); } catch (ex) { }
    
    //alert('111');
    //var cntril = $(parent.document).find('#tab-content div');
    //if (cntril.hasClass('active show')) {
    //    cntril.removeClass('active show');
    //}
    //if (cntril.hasClass('active')) {
    //    cntril.removeClass('active');
    //}
    //if (cntril.hasClass('show')) {
    //    cntril.removeClass('show');
    //}
    //if (cntril.hasClass('in')) {
    //    cntril.removeClass('in');
    //}
    //$(parent.document).find('#tab-content div:last').addClass('active show');
    //alert('ddd')
};

$(document).ready(function () {
    
   
    $('#btn-add-tab').click(function () {
        tabID++
        //
        $('#ulContainer').append($('<li><a href="#tab' + tabID + '" role="tab" data-toggle="tab">Tab ' + tabID + '<button class="close" type="button" title="Close">×</button></a></li>'));
       // $('#tab-content').append($('<div class="tab-pane fade" id="tab' + tabID + '">Tab dsfdsfs sdfsdfs sdfdsf ' + tabID + ' content</div>'));
        $('#tab-content').append($('<div class="tab-pane fade in active show" id="tab' + tabID + '"><iframe runat="server" id="ifrmMain1" width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" style="width: 100%; border: 0; min-height: 420px" visible="true" src="' + $("#hdnActivetabValue").val() + '"></iframe></div>'));      
    });

    $('#ulContainer').on('click', '.close', function () {

        if (confirm('Do you want to Close the Tab?')) {
           
        }
        else {
            return ;
        }

        var tabID1 = $(this).parents('a').attr('href');
        $(this).parents('li').remove();
        $(tabID1).remove();
       // tabID--;
        //display last tab
        $('#ulContainer li:last').addClass('active');
        if ($('div').hasClass('active show')) {
            $('div').removeClass('active show');
        }
        $('#tab-content div:last').addClass('active show');
    }

    );
    var list = document.getElementById("ulContainer");
});