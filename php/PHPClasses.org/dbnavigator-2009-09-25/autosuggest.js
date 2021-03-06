
/**
 * An autosuggest textbox control.
 * @class
 * @scope public
 */
function AutoSuggestControl(name,oTextbox /*:HTMLInputElement*/,field /*array or text*/) {
	
	/* a name for the get parameter used in ajax request */
	this.name=name; 
	
	/* the database field to fetch on th server side */
	this.field=field;
	
    /**
     * The currently selected suggestions.
     * @scope private
     */   
    this.cur /*:int*/ = -1;

    /**
     * The dropdown list layer.
     * @scope private
     */
    this.layer = null;
    
    
    /**
     * The textbox to capture.
     * @scope private
     */
	oTextbox.setAttribute("autocomplete","off");
	this.textbox /*:HTMLInputElement*/ = oTextbox;
    
    /**
     * Timeout ID for fast typers.
     * @scope private
     */
    this.timeoutId /*:int*/ = null;

    /**
     * The text that the user typed.
     * @scope private
     */
    this.userText /*:String*/ = oTextbox.value;
    

	this.http = zXmlHttp.createRequest();

    //initialize the control
    this.init();
    
}

/**
 * Autosuggests one or more suggestions for what the user has typed.
 * If no suggestions are passed in, then no autosuggest occurs.
 * @scope private
 * @param aSuggestions An array of suggestion strings.
 * @param bTypeAhead If the control should provide a type ahead suggestion.
 */
AutoSuggestControl.prototype.autosuggest = function (aSuggestions /*:Array*/,
                                                     bTypeAhead /*:boolean*/,
													 searchText /*:String*/) {
    
    //re-initialize pointer to current suggestion
    this.cur = -1;
    
    //make sure there's at least one suggestion
    if (aSuggestions.length > 0 && searchText==this.textbox.value) {
        if (bTypeAhead) {
           this.typeAhead(aSuggestions[0]);
        }
        
        this.showSuggestions(aSuggestions);
    } else {
        this.hideSuggestions();
    }
};

/**
 * Creates the dropdown layer to display multiple suggestions.
 * @scope private
 */
AutoSuggestControl.prototype.createDropDown = function () {


    //FOR IE6 create iframe to place beneath the div layer
    this.iframe=document.createElement("iframe");
	this.iframe.style.width=(this.textbox.offsetWidth-2)+'px'; // 2 for the border
	this.iframe.style.position='absolute';
	this.iframe.style.display = "none";
	this.iframe.setAttribute("frameBorder","0");
	//this.iframe.style.filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';

	//create the layer and assign styles
	this.layer = document.createElement("div");
    this.layer.style.border="1px solid #AAA";
    this.layer.style.position='absolute';     
	this.layer.style.color='#666';
    this.layer.style.backgroundColor = "#FFF";
	this.layer.style.visibility = "hidden";
    this.layer.style.width = (this.textbox.offsetWidth-2)+'px'; // 2 for the border
	this.layer.style.overflow = 'hidden'; 

	
	document.body.appendChild(this.iframe);    
    document.body.appendChild(this.layer);
    //when the user clicks on the a suggestion, get the text (innerHTML)
    //and place it into a textbox
    var oThis = this;
    this.layer.onmousedown = 
    this.layer.onmouseup = 
    this.layer.onmouseover = function (oEvent) {
        oEvent = oEvent || window.event;
        oTarget = oEvent.target || oEvent.srcElement;

        if (oEvent.type == "mousedown") 
		{
            oThis.hideSuggestions();
            oThis.textbox.value = oTarget.firstChild.nodeValue!=null? oTarget.firstChild.nodeValue: oThis.lastSuggestionHighlighted;
			oThis.suggestionClicked=true;
		} else if (oEvent.type == "mouseover") {
            oThis.highlightSuggestion(oTarget);
        } else {
            oThis.textbox.focus();
        }
    };
    
};

/**
 * Gets the left coordinate of the textbox.
 * @scope private
 * @return The left coordinate of the textbox in pixels.
 */
AutoSuggestControl.prototype.getLeft = function () /*:int*/ {

    var oNode = this.textbox;
    var iLeft = 0;
    
    while(oNode.tagName != "BODY") {
        iLeft += oNode.offsetLeft;
        oNode = oNode.offsetParent;        
    }
    
    return iLeft;
};

/**
 * Gets the top coordinate of the textbox.
 * @scope private
 * @return The top coordinate of the textbox in pixels.
 */
AutoSuggestControl.prototype.getTop = function () /*:int*/ {

    var oNode = this.textbox;
    var iTop = 0;
    
    while(oNode.tagName != "BODY") {
        iTop += oNode.offsetTop;
        oNode = oNode.offsetParent;
    }
    
    return iTop;
};

/**
 * Highlights the next or previous suggestion in the dropdown and
 * places the suggestion into the textbox.
 * @param iDiff Either a positive or negative number indicating whether
 *              to select the next or previous sugggestion, respectively.
 * @scope private
 */
AutoSuggestControl.prototype.goToSuggestion = function (iDiff /*:int*/) {
    var cSuggestionNodes = this.layer.childNodes;
    
    if (cSuggestionNodes.length > 0) {
        var oNode = null;
    
        if (iDiff > 0) {
            if (this.cur < cSuggestionNodes.length-1) {
                oNode = cSuggestionNodes[++this.cur];
            }        
        } else {
            if (this.cur > 0) {
                oNode = cSuggestionNodes[--this.cur];
				//alert(oNode.firstChild.nodeValue.length);
            }    
        }
        
        if (oNode) {
            this.highlightSuggestion(oNode);
            this.textbox.value = oNode.firstChild.nodeValue;
        }
    }
};

/**
 * Handles three keydown events.
 * @scope private
 * @param oEvent The event object for the keydown event.
 */
AutoSuggestControl.prototype.handleKeyDown = function (oEvent /*:Event*/) {


    switch(oEvent.keyCode) {
        case 38: //up arrow
            this.goToSuggestion(-1);
			return false;
            break;
        case 40: //down arrow 
            this.goToSuggestion(1);
            break;
        case 27: //esc
            this.textbox.value = this.userText;
            //this.selectRange(this.userText.length,this.userText.length);
            /* falls through */
        case 13: //enter			
			if (this.dropDownOpen)
			{
				this.hideSuggestions();			
				oEvent.returnValue = false;
				if (oEvent.preventDefault) {
					oEvent.preventDefault();
				}
			}
			break;
    }

};

/**
 * Handles keyup events.
 * @scope private
 * @param oEvent The event object for the keyup event.
 */
AutoSuggestControl.prototype.handleKeyUp = function (oEvent /*:Event*/) {

    var iKeyCode = oEvent.keyCode;
    var oThis = this;
    
    //get the currently entered text
    this.userText = this.textbox.value;
    

    //for backspace (8) and delete (46), shows suggestions without typeahead
    if (iKeyCode == 8 || iKeyCode == 46) {

	    clearTimeout(this.timeoutId);

        this.timeoutId = setTimeout( function () {
            oThis.requestSuggestions(oThis.userText,false);
        }, 250);
        
    //make sure not to interfere with non-character keys
    } else if (iKeyCode < 32 || (iKeyCode >= 33 && iKeyCode < 46) || (iKeyCode >= 112 && iKeyCode <= 123)) {
        //ignore
    } else {

	    clearTimeout(this.timeoutId);

        //request suggestions from the suggestion provider with typeahead
        this.timeoutId = setTimeout( function () {
            oThis.requestSuggestions(oThis.userText,true);
        }, 250);
    }
};

/**
 * Hides the suggestion dropdown.
 * @scope private
 */
AutoSuggestControl.prototype.hideSuggestions = function () {
	this.dropDownOpen=false;
    this.layer.style.visibility = "hidden";
	this.iframe.style.display = "none";
};

/**
 * Highlights the given node in the suggestions dropdown.
 * @scope private
 * @param oSuggestionNode The node representing a suggestion in the dropdown.
 */
AutoSuggestControl.prototype.highlightSuggestion = function (oSuggestionNode) 
{    
    for (var i=0; i < this.layer.childNodes.length; i++) 
	{
        var oNode = this.layer.childNodes[i];
		
        if (oNode == oSuggestionNode) 
		{
            oNode.style.backgroundColor = '#2F2BC8';
			oNode.style.color='white';
			this.lastSuggestionHighlighted=oNode.firstChild.nodeValue;
			this.cur=i;
        } 
		else 
		{
            oNode.style.backgroundColor = '#FFF';
			oNode.style.color='#666';
		}
    }
};

/**
 * Initializes the textbox with event handlers for
 * auto suggest functionality.
 * @scope private
 */
AutoSuggestControl.prototype.init = function () {

    //save a reference to this object
    var oThis = this;
    
    //assign the onkeyup event handler
    this.textbox.onkeyup = function (oEvent) {
    
        //check for the proper location of the event object
        if (!oEvent) {
            oEvent = window.event;
        }    
        
        //call the handleKeyUp() method with the event object
        oThis.handleKeyUp(oEvent);
    };
    
    //assign onkeydown event handler
    this.textbox.onkeydown = function (oEvent) {

        //check for the proper location of the event object
        if (!oEvent) {
            oEvent = window.event;
        }    
        
        //call the handleKeyDown() method with the event object
        return oThis.handleKeyDown(oEvent);
    };
    
    //assign onblur event handler (hides suggestions)    
    this.textbox.onblur = function () 
	{
		oThis.hideSuggestions();
		setTimeout(
				   function()
				   {
						if (oThis.suggestionClicked==false) {oThis.textbox.value=oThis.userText;}
				   }
				   ,50
				   );
		
    };
    
    //create the suggestions dropdown
    this.createDropDown();
};

/**
 * Selects a range of text in the textbox.
 * @scope public
 * @param iStart The start index (base 0) of the selection.
 * @param iEnd The end index of the selection.
 */
AutoSuggestControl.prototype.selectRange = function (iStart /*:int*/, iEnd /*:int*/) {

    //use text ranges for Internet Explorer
    if (this.textbox.createTextRange) {
        var oRange = this.textbox.createTextRange(); 
        oRange.moveStart("character", iStart); 
        oRange.moveEnd("character", iEnd - this.textbox.value.length);      
        oRange.select();
        
    //use setSelectionRange() for Mozilla
    } else if (this.textbox.setSelectionRange) {
        this.textbox.setSelectionRange(iStart, iEnd);
    }     

    //set focus back to the textbox
    this.textbox.focus();      
}; 

/**
 * Builds the suggestion layer contents, moves it into position,
 * and displays the layer.
 * @scope private
 * @param aSuggestions An array of suggestions for the control.
 */
AutoSuggestControl.prototype.showSuggestions = function (aSuggestions /*:Array*/) {
    
    var oDiv = null;
    this.layer.innerHTML = "";  //clear contents of the layer
    
	this.lastSuggestionHighlighted=this.userText; //for IE6 - set the last selected suggestion as empty
	this.suggestionClicked=false;  //indicate if the onblur is caused by a clicking of a suggestion or not
	this.dropDownOpen=true;
	
    for (var i=0; i < aSuggestions.length; i++) {
        oDiv = document.createElement("div");
        //oDiv.appendChild(document.createTextNode(aSuggestions[i]));
		oDiv.innerHTML=aSuggestions[i];
		oDiv.style.paddingLeft='4px';
		oDiv.style.paddingRight='4px';
		oDiv.style.paddingTop='2px';
		oDiv.style.paddingBottom='2px';
		oDiv.style.cursor= "default";
        this.layer.appendChild(oDiv);
    }
    
    this.layer.style.left = this.getLeft() + "px";
    this.layer.style.top = (this.getTop()+this.textbox.offsetHeight) + "px";
    this.layer.style.visibility = "visible";
	
    this.iframe.style.left = this.getLeft() + "px";
    this.iframe.style.top = (this.getTop()+this.textbox.offsetHeight) + "px";
    this.iframe.style.display = "block";
	this.iframe.style.height = this.layer.offsetHeight + "px";

	

};

/**
 * Inserts a suggestion into the textbox, highlighting the 
 * suggested part of the text.
 * @scope private
 * @param sSuggestion The suggestion for the textbox.
 */
AutoSuggestControl.prototype.typeAhead = function (sSuggestion /*:String*/) {

    //check for support of typeahead functionality
    if (this.textbox.createTextRange || this.textbox.setSelectionRange)
	{
        var iLen = this.textbox.value.length; 
		
	 	this.textbox.value = sSuggestion.replace(/&amp;/g,'&').replace(/&gt;/g,'>').replace(/&lt;/g,'<'); 
		this.selectRange(iLen, sSuggestion.length);
    }
};


/**
 * Request suggestions for the given autosuggest control. 
 * @scope protected
 * @param oAutoSuggestControl The autosuggest control to provide suggestions for.
 */
AutoSuggestControl.prototype.requestSuggestions = function (searchText,bTypeAhead /*:boolean*/) {

	if (searchText=='') 
	{
		this.hideSuggestions();
		return false;
	}
	
    var oHttp = this.http;
	var oThis=this;
                                   
    //cancel any active requests                          
    if (oHttp.readyState != 0) {
        oHttp.abort();
    }                 

	href=location.href.indexOf('#')==-1?location.href:location.href.substr(0,location.href.indexOf('#'));
	href=href.indexOf('?')==-1?href+'?':href;
	
	href=href+'&'+this.name+'_suggestText='+escape(searchText);
	
	if (typeof(this.field)=='object')
	for (i=0;i<this.field.length;i++)
	href=href+'&'+this.name+'_suggestField[]='+this.field[i];
	else 
	href=href+'&'+this.name+'_suggestField[]='+this.field;

	//alert(href);

	oHttp.open("get", href, true);
    oHttp.onreadystatechange = function () 
	{
        if (oHttp.readyState == 4) 
		{
			//if (oHttp.status == 200) 
			//{
            	//evaluate the returned text JavaScript (an array)
            	var aSuggestions = oHttp.responseText!=''?oHttp.responseText.split("-###-"):Array();

            	//provide suggestions to the control
            	oThis.autosuggest(aSuggestions,bTypeAhead,searchText);        
			//}
			//else oThis.requestSuggestions(searchText,bTypeAhead);
			
		}    
    };

    //send the request
    oHttp.send(null);

};