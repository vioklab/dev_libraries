// JavaScript Document
$(function() {
	// cursor
	$("#tickets-add").hover(
		function () {
		  $(this).css("cursor","pointer");
		}, 
		function () {
		  $(this).css("cursor","");
		}
	  );
	// toggle add and close buttons
	$("#tickets-add").toggle(function() {
		$(this).removeClass('post-add').addClass('post-close');
		$('#ticket-add-form textarea').slideToggle("slow");
		$('#ticket-add-form input').show();
	}, function() {
		$(this).removeClass('post-close').addClass('post-add');
		$('#ticket-add-form textarea').slideToggle("slow");	
		$('#ticket-add-form input').hide();	
	});
	// elastic text area
	$('#tickets textarea').elastic();
	$('.list-normal-hi textarea').elastic();
});