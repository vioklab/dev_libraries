Ajax = {};

Ajax.makeRequest = function(method, url, params, callbackMethod)
{
    this.request = (window.XMLHttpRequest)? new XMLHttpRequest(): new ActiveXObject
("MSXML2.XMLHTTP");
	if(method=="POST"){
		this.request.onreadystatechange = callbackMethod;
    	this.request.open(method, url, true);
		this.request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");			
		this.request.setRequestHeader("Content-length", params.length);
	    this.request.send(params);
	}else if(method == "GET"){
		this.request.onreadystatechange = callbackMethod;
		this.request.open(method, url + "?" + params, true);
    	this.request.send(null);
	}else{
		alert("Illegal method. pass GET or POST");
	}
   
}

Ajax.checkReadyState = function(_id)
{
    switch(this.request.readyState)
    {
		// 1 = loading
        case 1:
            document.getElementById(_id).innerHTML = "<br /><br /><center><img src='ajax-loader.gif' /></center>";
            break;
		// 2 = loaded
        case 2:
            document.getElementById(_id).innerHTML = "<br /><br /><center><img src='ajax-loader.gif' /></center>";
            break;
		// 3 = interactive
        case 3:
            document.getElementById(_id).innerHTML = "<br /><br /><center><img src='ajax-loader.gif' /></center>";
            break;
		// 4 = complete
        case 4:
            AjaxUpdater.isUpdating = false;
            document.getElementById(_id).innerHTML = '';
			// here the status must be equal to 200
			// which means its ready
            return this.request.status;
    }
}


Ajax.getResponse = function()
{
	try{
		// detect the response type whether it is text or XML
		if(this.request.getResponseHeader('Content-Type').indexOf('xml') != -1)
		{
			return this.request.responseXML.documentElement;
		}
		else
		{
			return this.request.responseText;
		}

	}catch(e){
		alert(e.toString());
	}
}
