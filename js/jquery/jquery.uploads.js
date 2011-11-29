// JavaScript Document
$(function() {
	
	var archivos= $("#archivos").attr('title');
	
	if(archivos=="si"){
		alert("All files have been uploaded.");
	} else{
		if(archivos=="no"){
			alert("An error ocurred while uploading the files, please try again.");
		}
	}
	
	var url= $("#url").attr('title');
	window.location=url;    
	
});