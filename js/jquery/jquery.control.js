// JavaScript Document
/* ----------------------------------------------------- */
/* CONTROL PLAY AND STOP */
/* ----------------------------------------------------- */
$(function() {
	// hover
	$("#master-display").hover(
		function () {
		  $(this).css("cursor","pointer");
		}, 
		function () {
		  $(this).css("cursor","");
		}
	  );
	// hover
	$("#master-info-download-control a").hover(
		function () {
		  $(this).css("cursor","pointer");
		}, 
		function () {
		  $(this).css("cursor","");
		}
	  );
	// Control Functions
	$('#master-info-download-control a').toggle(function() {
		// cambia de estado el boton de: PLAY a STOP;
		$(this).parent().removeClass('play-button').addClass('stop-button');
		$(this).parent().parent().parent().children('#master-display').children('a').empty().append('\
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="300" height="250" align="middle" id="master-flash">\
	<param name="allowScriptAccess" value="sameDomain" />\
	<param name="allowFullScreen" value="false" />\
	<param name="movie" value="'+$(this).parent().attr("animation")+'" />\
	<param name="quality" value="high" />\
	<param name="bgcolor" value="#000000" />\
	<embed src="'+$(this).parent().attr("animation")+'" quality="high" bgcolor="#000000" width="300" height="250" id="master-flash  align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" />\
	</object>');
	}, function() {
		// cambia de estado el boton de: STOP a PLAY;
		$(this).parent().removeClass('stop-button').addClass('play-button');
		$(this).parent().parent().parent().children('#master-display').children('a').empty().append('<img src="'+$(this).parent().attr("preview")+'" width="300" height="250">');
	});
});