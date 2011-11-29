// JavaScript Document
$(function() {
	/* ------------------------ */
	/* ESCONDE MUESTRA - LOADER */
	/* ------------------------ */
	function esconde(){
		 $("#loaderBG").css("visibility","hidden");
	}
	function muestra(){
		 $("#loaderBG").css("visibility","visible");
	}
	/* ------------------------ */
	/* USER INTERFACE */
	/* ------------------------ */
	msg = "";
	/* ------------------------ */
	/* PROJECT-EDIT             */
	/* ------------------------ */
 	$("#submitKit").click(function(){
		msg = "";
		$(":input").css("background-color","#FFF");
		if( (!_isNotEmpty("#cam_start") && !_isDate("#cam_start")) ){
			msg += "Campaign Start Date have wrong date format (dd/mm/yyyy), please check it. \n";
		}
		if((_isNotEmpty("#cam_end")) ){
			if((!_isDate("#cam_end")) ){
				msg += "Campaign End Date have wrong date format (dd/mm/yyyy), please check it. \n";
			}
		}
		if( !_isFile("#media",1) ){
			msg += "Media Plan file has not the correct format (.xls or .xlsx). \n";			
		}
		if( !_isFile("#kit",1) ){
			msg += "Media Kit has not the correct format (.xls or .xlsx). \n";			
		} 
		if( !_isFile("#cs",1) ){
			msg += "Creative Specs file has not the correct format (.xls or .xlsx). \n";			
		}
		if( !_isFile("#trans",1)){
			msg += "Translation file has not the correct format (.xls or .xlsx). \n";			
		}
		if(msg != ""){
			alert(msg);
		} else {
			 muestra();
			 document.submitCK.submit();
		}
	});
	// -> upload production
	$("#uploadProd").click(function(){
		muestra();	
		var id= $(this).attr('name'); 
		window.location=window.location='project-edit.php?id='+id;						   
	});
	// -> submit production
	$("#submitProd").click(function(){
		msg = "";
		$(":input").css("background-color","#FFF");
		if( !_isFile("#production",2) ){
			msg += "Production file has not the correct format (.zip). \n";			
		}
		if(msg != ""){
			alert(msg);
		} else {
			 muestra();
			 document.submitCK.submit();
		}						   
	});
	/* ------------------------ */
	/* PROJECT-DETAIL           */
	/* ------------------------ */
	$("#approveKit").click(function(){
		var id= $(this).attr('name'); // -> coge el attributo name del boton que tendra el ID de la tabla DB para aprovarlo
		muestra();	
		window.location='approve-media-plan.php?id='+id;
	});
	// -> Approve Production // CONFIRM
	$("#approveProd").click(function(){
		if(confirm("Are you sure do you want to APPOVE PRODUCTION sent by elespacio?.")) {
			muestra();	
			var id= $(this).attr('name'); 
			window.location='approve-production.php?id='+id;
		}
	});
	// -> Active Project // CONFIRM
	$("#activatePrj").click(function(){	
		if(confirm("Are you sure do you want to ACTIVATE this project?.")) {
		  muestra();	
		  var id= $(this).attr('name'); 
		  window.location='activate-project.php?id='+id;
		}
	});
	// -> Cancel Project // CONFIRM
	$("#cancelPrj").click(function(){
		if(confirm("Are you sure do you want to CANCEL this project?.")) {
		  muestra();	
		  var id= $(this).attr('name'); 
		  window.location='cancel-project.php?id='+id;
		}
	});
	// -> Delete Project // CONFIRM
	$("#deletePrj").click(function(){
		if(confirm("Are you sure do you want to DELETE this project?.")) {
			muestra();	
			var id= $(this).attr('name'); 
			window.location='delete-project.php?id='+id;
		}
	});
	// -> Post Ticket //
	$("#postTicket").click(function(){
		msg = "";
		if(!_isNotEmpty("#ticket-text")){
			msg = "Please fill some text in the Post Ticket. Many Thanks";
		}
		if(msg != ""){
			alert(msg);
		} else {
			 muestra();
			 document.ticket.submit();
		}					   
	});
	/* ------------------------ */
	/* CAMPAIGN-DETAIL          */
	/* ------------------------ */
	// -> delete campaign
	$("#deleteCmp").click(function(){
		if(confirm("Are you sure do you want to DELETE this Campaign?.")) {						   
			muestra();
			var id= $(this).attr('name'); 
			window.location='delete-campaign.php?id='+id;
		}
	});
	// -> upload master
	$("#masterUpload").click(function(){
		muestra();
		var id= $(this).attr('name'); 
		window.location='upload-masters.php?id='+id;
	});
	// -> edit campaign
	$("#editCmp").click(function(){
		muestra();
		var id= $(this).attr('name'); 
		window.location='campaign-edit.php?id='+id;
	});
	/* ------------------------ */
	/* CAMPAIGN - NEW   */
	/* ------------------------ */
	// -> save and next
	$("#savenext-new").click(function(){
		msg = "";
		if( !_isNotEmpty("#name") || !_isText("#name") ){
			msg += "Please fill the Campaign title again. \n\n";
		}
		if( !_isNotEmpty("#abreviacion") || !_isText("#abreviacion") || $("#abreviacion").val().lenght>4 ){
			msg += "Please fill the Abbreviated Title again. \n\n";
		}
		if( (!_isDate("#startdate")) ){
			msg += "Campaign Generic Start Date have wrong date format (dd/mm/yyyy), please check it. \n\n";
		}
		if( $("#kit").val()!=""){
			if(!_isFile("#kit",2) ){
				msg += "Campaign Kit file has not the correct format (.zip). \n";
			}
		}
		if( (!_isText("#name1") || !_isNotEmpty("#name1"))){
			msg += "First Master Title field is empty or have special characters. Please check it again. \n";
		}
		if(!_isDate("#start1")){
			msg += "First Row Master Start Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
		}
		if(!_isDate("#end1")){
			msg += "First Row Master End Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
		}
		for(i=2;i<=10;i++){
			tempName = "#name"+i;
			tempStart = "#start"+i;
			tempEnd = "#end"+i;
			if($(tempName).val()!="" || $(tempStart).val()!="" || $(tempEnd).val()!=""){
				if(!_isText(tempName) || !_isNotEmpty(tempName)){
					msg += i+" Master Title field is empty or have special characters. Please check it again. \n";
				}
				if(!_isDate(tempStart)){
					msg += i+" Master Start Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
				}
				if(!_isDate(tempEnd)){
					msg += i+" Master End Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
				}
			}
			
		}
		if(msg != ""){
			alert(msg);
		} else {
			/*alert("lalalal");*/
			muestra();
			var id= $(this).attr('name'); 
			document.forms.formulario.action="insert-campaign.php?action=2";
			document.forms.formulario.submit();
		}
		
	});
	// -> save and close
	$("#saveclose-new").click(function(){
		msg = "";
		if( !_isNotEmpty("#name") || !_isText("#name") ){
			msg += "Please fill the Campaign title again. \n\n";
		}
		if( !_isNotEmpty("#abreviacion") || !_isText("#abreviacion") || $("#abreviacion").val().lenght>4 ){
			msg += "Please fill the Abbreviated Title again. \n\n";
		}
		if( (!_isDate("#startdate")) ){
			msg += "Campaign Generic Start Date have wrong date format (dd/mm/yyyy), please check it. \n\n";
		}
		if( $("#kit").val()!=""){
			if(!_isFile("#kit",2) ){
				msg += "Campaign Kit file has not the correct format (.zip). \n";
			}
		}
		if( (!_isText("#name1") || !_isNotEmpty("#name1"))){
			msg += "First Master Title field is empty or have special characters. Please check it again. \n";
		}
		if(!_isDate("#start1")){
			msg += "First Row Master Start Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
		}
		if(!_isDate("#end1")){
			msg += "First Row Master End Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
		}
		for(i=2;i<=10;i++){
			tempName = "#name"+i;
			tempStart = "#start"+i;
			tempEnd = "#end"+i;
			if($(tempName).val()!="" || $(tempStart).val()!="" || $(tempEnd).val()!=""){
				if(!_isText(tempName) || !_isNotEmpty(tempName)){
					msg += i+" Master Title field is empty or have special characters. Please check it again. \n";
				}
				if(!_isDate(tempStart)){
					msg += i+" Master Start Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
				}
				if(!_isDate(tempEnd)){
					msg += i+" Master End Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
				}
			}
			
		}
		if(msg != ""){
			alert(msg);
		} else {
			if(confirm("Are you sure do you want to SAVE data AND CLOSE this campaign. You may come back later and edit the filled information.\n")) {
				muestra();
				var id= $(this).attr('name'); 
				document.forms.formulario.action="insert-campaign.php?action=1";
				document.forms.formulario.submit();
			}
		}
	});
	/* ------------------------ */
	/* CAMPAIGN - EDIT   */
	/* ------------------------ */
	// -> save and next
	$("#savenext-edit").click(function(){
		msg = "";
		if( (!_isDate("#startdate")) ){
			msg += "Campaign Generic Start Date have wrong date format (dd/mm/yyyy), please check it. \n\n";
		}
		if( $("#kit").val()!=""){
			if(!_isFile("#kit",2) ){
				msg += "Campaign Kit file has not the correct format (.zip). \n";
			}
		}
		if( (!_isText("#name1") || !_isNotEmpty("#name1"))){
			msg += "First Master Title field is empty or have special characters. Please check it again. \n";
		}
		if(!_isDate("#start1")){
			msg += "First Row Master Start Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
		}
		if(!_isDate("#end1")){
			msg += "First Row Master End Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
		}
		for(i=2;i<=10;i++){
			tempName = "#name"+i;
			tempStart = "#start"+i;
			tempEnd = "#end"+i;
			if($(tempName).val()!="" || $(tempStart).val()!="" || $(tempEnd).val()!=""){
				if(!_isText(tempName) || !_isNotEmpty(tempName)){
					msg += i+" Master Title field is empty or have special characters. Please check it again. \n";
				}
				if(!_isDate(tempStart)){
					msg += i+" Master Start Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
				}
				if(!_isDate(tempEnd)){
					msg += i+" Master End Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
				}
			}
			
		}
		if(msg != ""){
			alert(msg);
		} else {
			muestra();
			var id= $(this).attr('name'); 
			document.forms.formulario.action="edit-campaign.php?id="+id+"&action=2";
			document.forms.formulario.submit();
		}
		
	});
	// -> save and close
	$("#saveclose-edit").click(function(){
		msg = "";
		count = 0;
		if( (!_isDate("#startdate")) ){
			msg += "Campaign Generic Start Date have wrong date format (dd/mm/yyyy), please check it. \n\n";
		}
		if( $("#kit").val()!=""){
			if(!_isFile("#kit",2) ){
				msg += "Campaign Kit file has not the correct format (.zip). \n";
			}
		}
		if( (!_isText("#name1") || !_isNotEmpty("#name1"))){
			msg += "First Master Title field is empty or have special characters. Please check it again. \n";
		}
		if(!_isDate("#start1")){
			msg += "First Row Master Start Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
		}
		if(!_isDate("#end1")){
			msg += "First Row Master End Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
		}
		for(i=2;i<=10;i++){
			tempName = "#name"+i;
			tempStart = "#start"+i;
			tempEnd = "#end"+i;
			if($(tempName).val()!="" || $(tempStart).val()!="" || $(tempEnd).val()!=""){
				if(!_isText(tempName) || !_isNotEmpty(tempName)){
					msg += i+" Master Title field is empty or have special characters. Please check it again. \n";
				}
				if(!_isDate(tempStart)){
					msg += i+" Master Start Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
				}
				if(!_isDate(tempEnd)){
					msg += i+" Master End Rights Date have wrong format (dd/mm/yyyy). Please check it again. \n";
				}
			}
			
		}
		if(msg != ""){
			alert(msg);
		} else {
			if(confirm("Are you sure do you want to SAVE data AND CLOSE this campaign. You may come back later and edit the filled information.\n")) {
				muestra();
				var id= $(this).attr('name'); 
				document.forms.formulario.action="edit-campaign.php?id="+id+"&action=1";
				document.forms.formulario.submit();
			}
		}
	});
	/* ------------------------ */
	/* CAMPAIGN-EDIT-2          */
	/* ------------------------ */
	$("#SubmitCmp").click(function(){
		muestra();
		var id= $(this).attr('name'); 
		window.location='submit-campaign.php?id='+id;						   
	});
	$("#UpdateCmp").click(function(){
		muestra();
		var id= $(this).attr('name'); 
		window.location='submit-projects.php?id='+id;
	});
	$("#deletePrjs").click(function(){
		msg="";
		if($("#market-edit-list-box table input[type=checkbox]").is(':checked')){
			// nothing
		} else {
			msg	+= "Please select at least one market to delete for added projects.\n";	
		}
		if(msg != ""){
			alert(msg);
		} else {
			if(confirm("Are you sure do you want to DELETE the selected projects?.\n")) {
				muestra();
				document.deleteProjects.submit();	
			}	
		}
		
	});
	$("#addPrjs").click(function(){	
			msg="";
			if($("#market-edit-add-box table input[type=checkbox]").is(':checked')){
				$("#market-edit-add-box input:checked").each( 
					function() { 
					   id = $(this).attr("name").substr(7);
					   temp = "#date"+id;
					   if(!_isDate(temp)){
						   msg	+= id+" Row Generic Start Date has a invalid format (dd/mm/yyyy). Please check it again.\n";
					   }
					} 
				);
			} else {
				msg	+= "Please select at least one market to added into projects.\n";
			}
			if(msg != ""){
				alert(msg);
			} else {
				muestra();
				document.forms.addProjects.submit();
			}
	});
	/* ------------------------ */
	/* UPLOAD-MASTERS           */
	/* ------------------------ */
	$("#masterSbmt").click(function(){
		muestra();						   
	});
	esconde();
	/* ------------------------------------------------------------------------------------------------------------------------ */
	/* ------------------------------------------------------------------------------------------------------------------------ */
	/* VALIDATION FUNCTIONS 																									*/
	/* -------------------------------------------------------------------------------------------------------------------------*/
	/* ------------------------------------------------------------------------------------------------------------------------ */
	function _isNotEmpty(layerID){
		var fieldVal = $(layerID).val();
		if($(layerID).val() != ""){
			$(layerID).css({"background-color":"#FFFFFF","color":"#666"});
		  	return true;
		} else {
			$(layerID).css({"background-color":"#FF3300","color":"#FFF"});	
			return false;
		}
	}
	
	function _isText(layerID){
		var fieldVal = $(layerID).val();
		var Template = new RegExp("[\!\@\#\$\%\^\&\*\(\)\_\+\=\{\}\[\]\|\;\'\:\|\<\>\?\,\.\]"); 
		if(!Template.test(fieldVal)){
			$(layerID).css({"background-color":"#FFFFFF","color":"#666"});
		  	return true;
		} else {
			$(layerID).css({"background-color":"#FF3300","color":"#FFF"});		
			return false;
		}
	}
	
	function _isFile(layerID,type){
		var fieldVal = $(layerID).val();
		  switch(type){
			  case 1: // -> .xls -> .xlxs
				  var Template = new RegExp("[\.]+[xls|xlsx]{3,}");
				  break;
			  case 2: // -> .zip
				  var Template = new RegExp("[\.]+[zip]{3,}"); 
				  break;
			  case 3: // -> .jpg -> .jpeg -> .png
				  var Template = new RegExp("[\.]+[jpg|jpeg|png]{3,}"); 
				  break;
			  case 4: // -> .swf
				  var Template = new RegExp("[\.]+[swf]{3,}"); 
				  break;
		  }
		if(Template.test(fieldVal)){
			$(layerID).css({"background-color":"#FFFFFF","color":"#666"});
		  	return true;
		} else {
			$(layerID).css({"background-color":"#FF3300","color":"#FFF"});		
			return false;
		}
	}
	
	function _isDate(layerID){
		var fieldVal = $(layerID).val();
		  //var Template = new RegExp("^([123]0|[012][1-9]|31)(\.|-|/|,)(0[1-9]|1[012])(\.|-|/|,)(19[0-9]{2}|2[0-9]{3})$"); 
		var Template = new RegExp("^([123]0|[012][1-9]|31)(\/)(0[1-9]|1[012])(\.|-|/|,)(19[0-9]{2}|2[0-9]{3})$"); 
		if(Template.test(fieldVal)) {
			$(layerID).css({"background-color":"#FFFFFF","color":"#666"});
		  	return true;
		} else {
			$(layerID).css({"background-color":"#FF3300","color":"#FFF"});	
			return false;
		}
	}
	/* -------------------- */
	/* CLEAR FUNCTION       */
	/* -------------------- */
	function clear_form_elements(ele) {
		$(ele).find(':input').each(function() {
			switch(this.type) {
				case 'password':
				case 'select-multiple':
				case 'select-one':
				case 'text':
					$(this).val('');
					break;
				case 'textarea':
					$(this).val('');
					break;
				case 'checkbox':
				case 'radio':
					this.checked = false;
			}
		});
	}
    
});