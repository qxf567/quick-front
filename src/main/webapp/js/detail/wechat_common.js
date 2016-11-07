//调出知道了浮层
function pop_alert(title,content)
{
    $("#all_opcation,.pop_alert").show();

    $(".pop_alert").find("div:eq(0)").html(title);
    $(".pop_alert").find("div:eq(1)").html(content);
}

//调出高峰时段浮层
function pop_rush_time()
{
    var f_is_float_price = $("input[name=f_is_float_price]").val();
    if(f_is_float_price == 1)
    {
        $("#discount_div").show();
        $("#discount_div").prev(".partition").show();
        $(".now_price_type").html("高峰价");
        $("#all_opcation,.pop_rush_time").show();
    }
    else
    {
        $("#discount_partition,#discount_div").hide();
    }
}

//判断是否是微信浏览器
function is_weixin(){
    var ua = navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i)=="micromessenger") {
        return true;
    } else {
        //alert("请使用微信客户端打开");history.go(-1);
        //var opened = window.open('about:blank', '_self');
        //opened.opener = null;
        //opened.close();
    }
}

$(document).ready(function(){
    is_weixin();

    //关闭浮层
    $("#pop_alert_close").click(function(){
        $("#all_opcation,.pop_alert").hide();
    });

    //关闭高峰时段
    $("#close_rush_time_button,#close_rush_time").click(function(){
        $("#all_opcation,.pop_rush_time").hide();
        $("input[name=f_is_float_price]").val(0);
        $("#discount_partition,#discount_div").hide();
    });

})