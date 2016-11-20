var SITE_NAME="zblog";
var SITE_URL="http://localhost:8080/zblog";
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

/* functions
 * ====================================================
 */
function scrollTo(name, add, speed) {
    if (!speed) speed = 300
    if (!name) {
        $('html,body').animate({
            scrollTop: 0
        }, speed)
    } else {
        if ($(name).length > 0) {
            $('html,body').animate({
                scrollTop: $(name).offset().top + (add || 0)
            }, speed)
        }
    }
}


function is_name(str) {    
    return /^[\w]{3,16}$/.test(str) 
}
function is_url(str) {
    return /^((http|https)\:\/\/)([a-z0-9-]{1,}.)?[a-z0-9-]{2,}.([a-z0-9-]{1,}.)?[a-z0-9]{2,}$/.test(str)
}
function is_qq(str) {
    return /^[1-9]\d{4,13}$/.test(str)
}
function is_mail(str) {
    return /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/.test(str)
}


$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function strToViews(n){
	var len = Number(n.length);
	if(len > 4){
		n = Math.round((n /10000) * 100) / 100;
		n = n + "万";		
	}
	$(".read-number span").text(n);
}


function strToDate(str, fmt) { 
    if( !fmt ) fmt = 'yyyy-MM-dd hh:mm:ss'
    str = new Date(str*1000)
    var o = {
        "M+": str.getMonth() + 1, //月份   
        "d+": str.getDate(), //日   
        "h+": str.getHours(), //小时   
        "m+": str.getMinutes(), //分   
        "s+": str.getSeconds(), //秒   
        "q+": Math.floor((str.getMonth() + 3) / 3), //季度   
        "S": str.getMilliseconds() //毫秒   
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (str.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}