// JavaScript Document
/* ----------------------------------------------------- */
/* CALENDARS */
/* ----------------------------------------------------- */
$(function() {
	// Projects -> black
	$("#cam_start").datepicker({ firstDay: 1,dateFormat: 'dd/mm/yy', numberOfMonths: 1,showButtonPanel: true});
	$("#cam_end").datepicker({ firstDay: 1,dateFormat: 'dd/mm/yy', numberOfMonths: 1,showButtonPanel: true});
	$("#startdate").datepicker({ firstDay: 1,dateFormat: 'dd/mm/yy', numberOfMonths: 1,showButtonPanel: true});
	
	for(i=0;i<100;i++){
		startTEMP = "#start"+i;
		$(startTEMP).datepicker({ firstDay: 1,dateFormat: 'dd/mm/yy', numberOfMonths: 1,showButtonPanel: true});
		endTEMP = "#end"+i;
		$(endTEMP).datepicker({ firstDay: 1,dateFormat: 'dd/mm/yy', numberOfMonths: 1,showButtonPanel: true});
		dateTEMP = "#date"+i;
		$(dateTEMP).datepicker({ firstDay: 1,dateFormat: 'dd/mm/yy', numberOfMonths: 1,showButtonPanel: true});
	}
	
	
});