$(function(){ 
	
	var $searchBtn =$(".navto-search");
	var $searchDiv =$("div,.site-search");
	var $searchDel =$("li,.navto-search i ");
	$searchBtn.click(function(){
		console.log('...');
		if( $searchBtn.hasClass("active") )
		{
			$searchBtn.removeClass("active");
			$searchDiv.removeClass("active");
			$("li a .search-show").removeClass("active");
			$("li a i").removeClass("fa-remove");
		}
		else
		{
			$searchBtn.addClass("active");
			$searchDiv.addClass("active");
			$("li a .search-show").addClass("active");
			$("li a i").addClass("fa-remove");
		}
	});
}); 