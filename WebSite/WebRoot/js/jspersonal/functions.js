function addFavorite(){
	var thisURL = document.URL;
	var favURL = "http://" + getHost(thisURL);
	if(document.all){
		window.external.addFavorite(favURL, "Site name");
	}else{
		window.sidebar.addPanel("Site name", favURL, "");
	}
	return false;
}
function setHome(obj){
	var vrl = "http://" + getHost(document.URL);
	try{
		obj.style.behavior = 'url(#default#homepage)';
		obj.setHomePage(vrl);
	}catch(e){
		if(window.netscape){
			try{
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPCon");
			}catch(e){
				alert("refused.");
			}
			var prefs = Components.classes['@@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);  
            prefs.setCharPref('browser.startup.homepage', vrl);
		}
	}
}
var getHost = function(url){
	var host = "null";  
    if (typeof url == "undefined" || null == url)  
        url = window.location.href;  
    var regex = /.*\:\/\/([^\/]*).*/;  
    var match = url.match(regex);  
    if (typeof match != "undefined" && null != match)  
        host = match[1];  
    return host;
}