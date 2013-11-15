function showLinkFavouritedNotice(link) {
  var favourited = !!$(link).data("favourited");
  // get the text of the .title element
  // that we find among the children of link
  var name = $(link).find('.title').text();
  var message = favourited ?
                name + " was added to favourites" :
                name + " was removed from favourites";
  var flash = $("<div></div>").addClass('flash').addClass('notice').html(message);
  $(flash).appendTo('#flash-container');
  setTimeout(function() {
    $(flash).fadeOut();
  }, 3000);
}

function addFavouritesHandler() {
	$('.star.solid').click(function() {
		var link = $(this).parent();
		var favourited = !!$(link).data("favourited");
		var newOpacity = favourited ? 0 : 1;
		$(link).data("favourited", !favourited);
	$(this).animate({opacity: newOpacity}, 1000);
	showLinkFavouritedNotice(link);
	});
}

$(function() {
	addFavouritesHandler();
})


