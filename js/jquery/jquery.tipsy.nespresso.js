/* ----------------------------------------------------- */
/* TIPSY - TOOLTIPS */
/* ----------------------------------------------------- */
$(function() {
	// Campaign Kit Submitted
    $('.project-list-campkitsub img').tipsy({gravity: 'sw', html: true});
	$('.project-list-campkitsub span').tipsy({gravity: 'sw', html: true});
	// Campaign Kit Approved
    $('.project-list-campkitapp img').tipsy({gravity: 'sw', html: true});
	$('.project-list-campkitapp span').tipsy({gravity: 'sw', html: true});
	// Campaign Production Submited
    $('.project-list-prodsub img').tipsy({gravity: 'sw', html: true});
	$('.project-list-prodsub span').tipsy({gravity: 'sw', html: true});
	// Campaign Production Approved
    $('.project-list-prodapp img').tipsy({gravity: 'se', html: true});
	$('.project-list-prodapp span').tipsy({gravity: 'se', html: true});
});