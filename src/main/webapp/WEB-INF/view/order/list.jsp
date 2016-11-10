<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="common/meta.jsp"%> 
	<title>订单列表页</title>
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/detail/common.js"></script>
    <script type="text/javascript" src="/js/detail/btn_active.js"></script>
    <script type="text/javascript" src="/js/detail/fastclick.js"></script>
    <script type="text/javascript">
        //移动设备快速响应点击事件
        $(document).ready(function(){
            FastClick.attach(document.body);
        })
    </script>
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/common.css">
    <link type="text/css" rel="stylesheet" href="http://cdn.xingkeduo.com/css/order_list.css">
    <script type="text/javascript" src="/js/detail/zepto_min.js"></script>
    <script type="text/javascript" src="/js/detail/touchslider.js"></script>
    <style type="text/css">
        .max_box{max-width: 640px;padding-top: 50%;font-family: "microsoft yahei", Arial, sans-serif}
        .info_box img{width: 30%;display: block;margin: 0 auto}
        .info_box{color: #999;font-size: 1rem;text-align: center;}
        .info_box p{ line-height: 26px;}
    </style>
</head>
<body>
<div class="container">
    <!--tab切换部分-->
    <div class="tab_switch">
        <ul id="pagenavi" class="page fixed_top">
            <li><a href="#" class="active">待服务</a></li>
           <!--  <li><a href="#">待评价</a></li> -->
            <li><a href="#">已完成</a></li>
             <li><a href="#">全部</a></li>
        </ul>

        <div id="slider" class="swipe mt37">
            <ul class="tab_switch_list">
                <!--  全部  -->
                <li class="li_list">
                    <div class="gap"></div>
                                            <div class="one_order hide_order_li">
                            <div class="max_box">
                                <div class="info_box">
                                    <img src="http://cdn.xingkeduo.com/image/mobile3/no_has_order.jpg">
                                    <p>您还没有相关的订单～</p>
                                </div>
                            </div>
                        </div>
                                    </li>

                <!--  等待中  -->
                <li class="li_list">
                    <div class="gap"></div>
                                            <div class="one_order hide_order_li">
                            <div class="max_box">
                                <div class="info_box">
                                    <img src="/img/my-icon08.png">
                                    <p>您还没有相关的订单～</p>
                                </div>
                            </div>
                        </div>
                                    </li>

                <!--  待评价  -->
          <!--       <li class="li_list">
                    <div class="gap"></div>
                                           <div class="one_order hide_order_li">
                            <div class="max_box">
                                <div class="info_box">
                                    <img src="/img/my-icon08.png">
                                    <p>您还没有相关的订单～</p>
                                </div>
                            </div>
                       </div>
                                    </li> -->

                <!--  已完成  -->
                <li class="li_list">
                    <div class="gap"></div>
                                            <div class="one_order hide_order_li">
                            <div class="max_box">
                                <div class="info_box">
                                    <img src="/img/my-icon08.png">
                                    <p>您还没有相关的订单～</p>
                                </div>
                            </div>
                        </div>
                                    </li>
            </ul>
        </div>
    </div>
    <div class="fix_height"></div>

    <!--  弹窗开始  -->
    <style>
    #all_opcation{width:100%;overflow:hidden;height:100%;background-color:#000;top:0;opacity:0.6;z-index: 2001; display: none;
        position:fixed!important;/*FF IE7*/
        position:absolute;/*IE6*/


    }
    .pop_alert {height: 164px;width: 272px;background-color: #FFFFFF;border-radius:4px;z-index: 2002;position:absolute;margin-left: -136px;margin-top: -82px;top:50%;left:50%;display: none;
        position:fixed!important;/*FF IE7*/
        position:absolute;/*IE6*/
        _top:       expression(eval(document.compatMode &&
            document.compatMode=='CSS1Compat') ?
            documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :/*IE6*/
            document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2);/*IE5 IE5.5*/
    }

    .pop_rush_time{width: 278px;height: 376px;z-index: 2002;margin-left: -139px;margin-top: -232px;top:50%;left:50%;display: none;
        position:fixed!important;/*FF IE7*/
        position:absolute;/*IE6*/
        _top:       expression(eval(document.compatMode &&
            document.compatMode=='CSS1Compat') ?
            documentElement.scrollTop + (document.documentElement.clientHeight-this.offsetHeight)/2 :/*IE6*/
            document.body.scrollTop + (document.body.clientHeight - this.clientHeight)/2);/*IE5 IE5.5*/
    }
    .rush_time_button{height: 44px;width: 23px;float:right;margin-right: 10px;}
    .rush_time_con{height: 332px;width: 278px;padding-top:75px;background-color: #FFFFFF;border-radius:4px;}

    /* 高峰时段样式 */
    .submit{display:inline-block;background-color: #ff5f07;height:50px;line-height: 50px;text-align: center;color:#fff;font-size: 18px;}
    .rush_time_con .defalt{display:inline-block;color: #ff5f08;border: 1px solid #ff5f08;height:42px;line-height: 42px;text-align: center;font-size: 18px;width: 252px;border-radius:4px;margin-top: 10px}

</style>

<!--蒙板-->
<div id="all_opcation"></div>

<!--弹窗-->
<div class="pop_alert">
    <div style="font-size: 18px;height: 60px;line-height: 60px;text-align: center"></div>
    <div style="font-size: 14px;width:94%;margin-left: 5%;color:#999999;height: 60px"></div>
    <div style="height: 44px;line-height: 44px;text-align: center;font-size: 16px;color:#ff5f08;border-top: 1px solid #dadada;" id="pop_alert_close">
        知道了
    </div>
</div>

<!--高峰时段弹窗-->
<div class="pop_rush_time">
    <div id="close_rush_time_button" class="rush_time_button">
        <img src="/js/detail/close_1.png"/>
    </div>
    <div style="clear: both"></div>
    <div id="opcation" class="rush_time_con" align="center">
        <div style="font-size: 18px;height: 26px;line-height: 26px;text-align: center;color:#000">高峰时段</div>
        <div style="font-size: 14px;width:78%;margin-left: 5%;color:#999999;margin-top: 10px;line-height: 23px" align="left">现在正处于高峰时段，您可以选择特惠时段下单，享受优惠。</div>
        <a href="javascript:;" class="submit" style="width: 252px;border-radius:4px;margin-top: 70px;height: 42px;line-height: 42px">我要优惠</a>
        <a href="javascript:;" class="defalt" id="close_rush_time">不要优惠，高峰下单</a>
    </div>
</div>    <!--  弹窗结束  -->

    <!--navbar start-->
    <!--底部导航栏-->
<div class="fixed_menu" id="bottom_menu">
    <a href="/mobile3/store_list?f_user_id=317926&time=1478251614&get_token=1bca76b56765be0e41c0fb9bd0624490" class="haircut">
        <!--menu_cut_on-->
        <span class="menu_bg menu_cut">剪发</span>
    </a>
    <a href="javascript:;" class="order_checked">
        <span class="menu_bg menu_order">订单</span>
    </a>
    <a href="/mobile3/user?f_user_id=317926&time=1478251614&get_token=1bca76b56765be0e41c0fb9bd0624490" class="personal">
        <span class="menu_bg menu_user">个人</span>
    </a>
    <a href="/mobile3/more_read?f_user_id=317926&time=1478251614&get_token=1bca76b56765be0e41c0fb9bd0624490" class="more">
        <span class="menu_bg menu_more">更多</span>
    </a>
</div>

<!--底部固定切换状态的js-->
<script type="text/javascript">

    $(document).ready(function(){

        $("#bottom_menu a").click(function(){

            var _this = $(this);

            //寻找亮起节点,改为不亮的
            $('#bottom_menu a').each(function(){
                if( $(this).hasClass("haircut_checked") )
                {
                    $(this).addClass("haircut").removeClass("haircut_checked");
                }
                else if( $(this).hasClass("order_checked") )
                {
                    $(this).addClass("order").removeClass("order_checked");
                }
                else if( $(this).hasClass("personal_checked") )
                {
                    $(this).addClass("personal").removeClass("personal_checked");
                }
                else if( $(this).hasClass("more_checked") )
                {
                    $(this).addClass("more").removeClass("more_checked");
                }
            })

            //自己亮起
            if( _this.hasClass("haircut") )
            {
                _this.addClass("haircut_checked").removeClass("haircut");
            }
            else if( _this.hasClass("order") )
            {
                _this.addClass("order_checked").removeClass("order");
            }
            else if( _this.hasClass("personal") )
            {
                _this.addClass("personal_checked").removeClass("personal");
            }
            else if( _this.hasClass("more") )
            {
                _this.addClass("more_checked").removeClass("more");
            }
        })
    });
</script>    <!--navbar end-->
</div>
<!--tab切换部分js-->

<!--[if !IE]> -->
<script
    type="text/javascript"> window.jQuery || document.write('<script src="/js/detail/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>
<!-- <![endif]-->
<!--[if lte IE 9]>
<script
    type="text/javascript"> window.jQuery || document.write('<script src="assets/javascripts/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>
<![endif]-->

<!--  页面是否可以分享 f_can_share 0否1是  -->
<script src="/js/detail/jweixin-1.0.0.js"></script>
<script>
    wx.config({
        debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wx8d0ca17fea670939', // 必填，公众号的唯一标识
        timestamp: 1478251687, // 必填，生成签名的时间戳
        nonceStr: 'wechat_code', // 必填，生成签名的随机串
        signature: 'e68cb04287efea932a7447cc833504e26e21dd79',// 必填，签名，见附录1
        jsApiList: ['hideOptionMenu'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
</script>
<script>
    //是否可以分享
    var f_can_share = 1;

    function onWeixinBridgeReady() {
        wx.hideOptionMenu();
        WeixinJSBridge.call('hideOptionMenu');
    }

    //是否可以分享
    function is_can_share()
    {
        if (typeof WeixinJSBridge === 'undefined') {
            if (document.addEventListener) {
                document.addEventListener('WeixinJSBridgeReady', onWeixinBridgeReady, false);
            } else if (document.attachEvent) {
                document.attachEvent('WeixinJSBridgeReady', onWeixinBridgeReady);
                document.attachEvent('onWeixinJSBridgeReady', onWeixinBridgeReady);
            }
        } else {
            onWeixinBridgeReady();
        }
    }

    wx.ready(function () {
        //是否可以分享
        if(f_can_share == 1) is_can_share();
    });
</script><!--  页面是否可以分享  -->

<script type="text/javascript">
    var page='pagenavi';
    var mslide='slider';
    //    var mtitle='emtitle';
    arrdiv = 'arrdiv';

    var as=document.getElementById(page).getElementsByTagName('a');

    var tt=new TouchSlider({id:mslide,'auto':'-1',fx:'ease-out',direction:'left',speed:300,timeout:5000,'before':function(index){
        var as=document.getElementById(this.page).getElementsByTagName('a');
        as[this.p].className='';
        as[index].className='active';
        this.p=index;
        var txt=as[index].innerText;
//        $("#"+this.page).parent().find('.emtitle').text(txt);
        var txturl=as[index].getAttribute('href');
        var turl=txturl.split('#');
//        $("#"+this.page).parent().find('.go_btn').attr('href',turl[1]);
    }});

    tt.page = page;
    tt.p = 0;
    //console.dir(tt); console.dir(tt.__proto__);
    for(var i=0;i<as.length;i++){
        (function(){
            var j=i;
            as[j].tt = tt;
            as[j].onclick=function(){
                this.tt.slide(j);
                return false;
            }
        })();
    }
</script>

<script type="text/javascript">

    var screen_height = $(window).height() - 50 - $("#pagenavi li").height();
    $(".li_list").css({"min-height": screen_height+"px","line-height": screen_height+"px","text-algin": "center"});

    //调出知道了浮层
    function pop_alert(title,content)
    {
        $("#all_opcation,.pop_alert").show();

        $(".pop_alert").find("div:eq(0)").html(title);
        $(".pop_alert").find("div:eq(1)").html(content);
    }

    //关闭浮层
    function close_pop_alert()
    {
        $("#all_opcation,.pop_alert").hide();
    }

    //退款
    $(".refund_query").click(function(){
        var f_user_id   = '317926';
        var time        = '1478251614';
        var get_token   = '1bca76b56765be0e41c0fb9bd0624490';

        var _this       = $(this);
        var f_order_no  = _this.attr("order_no");
        var mobile_type = _this.attr("mobile_type");    //1微信 2支付宝

        var msg = confirm("您确定要立即退款吗？交易时间超过一年的订单无法提交退款。退款有一定延时，零钱支付退款20分钟内到账，银行卡支付退款3个工作日内到账。");
        if (msg == true)
        {
            //ajax请求
            $.ajax({
                //"async"     :   false,
                "url"		:	"/mobile3/refund",
                "type"		:	"post",
                "data"		:	{f_user_id:f_user_id, time:time, get_token:get_token, f_order_no:f_order_no},
                "dataType"	:	"json",//html json
                "beforeSend" :  function(){
                    pop_alert("星客多快剪退款","系统正在退款中，请勿关闭页面。");
                    $("#pop_alert_close").css("border-top","0px solid #dadada");
                    if(mobile_type == 2)
                    {
                        $("#pop_alert_close").html("<iframe width='0' height='0' frameborder='0' id='mobile_refund_iframe' src=''></iframe>");
                    }
                    else
                    {
                        $("#pop_alert_close").html('');
                    }
                },
                "success"	:	function(res)
                {
                    //退款成功
                    if(res.error == 0)
                    {
                        _this.remove();

                        if(res.html.mobile_type == 2)   //如果是支付宝退款
                        {
                            $("#mobile_refund_iframe").attr("src","https://mapi.alipay.com/gateway.do?"+res.html.alipay_refund_url);

                            //关闭弹出层 todo 先注释掉，明天修改
                            setTimeout(function(){
                                close_pop_alert();
                                alert(res.msg);
                                location.reload();  //页面刷新
                            },3000);
                        }
                        else    //微信退款
                        {
                            close_pop_alert();
                            alert(res.msg);
                            location.reload();  //页面刷新
                        }
                    }
                    else
                    {
                        close_pop_alert();
                        alert(res.msg);
                    }
                }
            });
        }
    });
</script>
</body>
</html>