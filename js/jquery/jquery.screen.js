// JavaScript Document
$(function() {
	// LOADER
	function Loader(){
		var layer = ".loader";
		var StageWidth = $(window).width();;
		var StageHeight =  $(window).height();
		var layerHeight = parseInt($(layer).css("height"));
		var layerWidth = parseInt($(layer).css("width"));
		VertMiddle = (StageHeight-layerHeight)/2;
		HorzMiddle = (StageWidth-layerWidth)/2;
		$(layer).css("top",VertMiddle);
		$(layer).css("left",HorzMiddle);
		$(".loader").fadeIn("slow");
	}
	
	// BOTONES
	$("#search-button").click(function(){
		$('#storeContainer').css("display","none");
		var val=$("#search-input").val();
		Loader();
		$.get("display.php",{val:val}, function(data) {
		  	
		  	$('#storeContainer').empty().html(data);
		  	$(".loader").fadeOut(100, function(){	
				$('#storeContainer').fadeIn("slow");
				BOTONES();
		  	});
		});
	});
	$("#headerContainer").hover(function(){
		  $(this).animate({
				opacity: 1,
			  }, 500);
		  },function(){
			  $(this).animate({
				opacity: 0.5,
			  }, 500);
		  });
	// -> Icons
	function BOTONES(){
		$(".icon-info").hover(function(){
			$(this).parent().parent().children().children("#thumbContainer-0-infoContainer").animate({
				  height: 100,
				  opacity:0.6
				}, 400, function() {
				  // Animation complete.
				});							 
		}, function(){
				$(this).parent().parent().children().children("#thumbContainer-0-infoContainer").animate({
				  height: 0,
				  opacity:0
				}, 400, function() {
				  // Animation complete.
				});	
		});
		$("#thumbContainer-0").hover(function () {
			$(this).stop().animate({backgroundColor:'#4E1402'}, 300);
			}, function () {
			$(this).stop().animate({backgroundColor:'#943D20'}, 100);
			
		});
	}
	BOTONES();
});