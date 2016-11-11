//loading层
function pop_up_loading()
{
    $("#close_loading").css({ display: "block", height: $(document).height() });

    var scrolled = $(window).scrollTop();
    var screen_width        = $(window).width();
    var screen_height       = $(window).height();
    var loading_box_width   = $(".loading_box").width();
    var loading_box_height  = $(".loading_box").height();

    $(".loading_box").css({
        "display"   : "block",
        "left"      : (screen_width/2-loading_box_width/2)+"px",
        "top"       : (screen_height/2-loading_box_height/2) + scrolled +"px"
    })
  //  $("body").css("overflow","hidden");
}

//打开提示框
function pop_up_alert(type,msg)
{
    if( type == 'warning' )
    {
        var img_src = '/js/detail/warning.png';
    }
    else
    {
        var img_src = '/js/detail/loading.gif';
    }

    var html =
        '<div class="pop_box" style="display: none">'
            +'<div class="pop_main">'
                +'<table width="100%" cellpadding="0" cellspacing="0" border="0" >'
                    +'<tr><td align="center"><img src="'+img_src+'"></td></tr>'
                    +'<tr><td valign="middle" align="center">' + msg + '</td></tr>'
                +'</table>'
            +'</div>'
        +'</div>';

    $("body").append(html);


    setTimeout(function(){
        var scrolled = $(window).scrollTop();
        var screen_width        = $(window).width();
        var screen_height       = $(window).height();
        var pop_box_width   = $(".pop_box").width();
        var pop_box_height  = $(".pop_box").height();

        $(".pop_box").css({
            "display"   :   'block',
            "left"      : (screen_width-pop_box_width)/2+"px",
            "top"       : (screen_height-pop_box_height)/2 + scrolled +"px"
        })
    },300)
    setTimeout(function(){$(".pop_box").remove();},2000);
}

//
function pop_close()
{
    $(".loading_box").hide();
}

$(document).ready(function(){
    $("body").append('<div class="loading_box" style="display:none; "><div class="loading_main"><table width="100%" cellpadding="0" cellspacing="0" border="0" ><tr><td align="center"><img src="/js/detail/loading.gif"></td></tr></table></div></div>');

    $("a").click(function(){
        if ( ($(this).attr("href")!='javascript:;') && ($(this).attr("href")!='#') && ($(this).attr("href")!='tel:4006555200')  )
        {
            $("#close_loading").css({ display: "block", height: $(document).height() });
            var scrolled = $(window).scrollTop();
            var screen_width        = $(window).width();
            var screen_height       = $(window).height();
            var loading_box_width   = $(".loading_box").width();
            var loading_box_height  = $(".loading_box").height();

            $(".loading_box").css({
                "display"   : "block",
                "left"      : (screen_width/2-loading_box_width/2)+"px",
                "top"       : (screen_height/2-loading_box_height/2) + scrolled +"px"
            });

      //      $("body").css("","");
        }
    });


})



//进行经纬度转换为距离的计算

function Rad(d) {
	return d * Math.PI / 180.0;//经纬度转换成三角函数中度分表形式。
}
//计算距离，参数分别为第一点的纬度，经度；第二点的纬度，经度
function getDistance(lat1, lng1, lat2, lng2) {
	var radLat1 = Rad(lat1);
	var radLat2 = Rad(lat2);
	var a = radLat1 - radLat2;
	var b = Rad(lng1) - Rad(lng2);
	var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
			+ Math.cos(radLat1) * Math.cos(radLat2)
			* Math.pow(Math.sin(b / 2), 2)));
	s = s * 6378.137;// EARTH_RADIUS;
	s = Math.round(s * 10000) / 1000; //输出为公里
	s=s.toFixed(1);
	return s;
}