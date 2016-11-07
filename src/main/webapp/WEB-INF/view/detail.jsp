<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>3.0店铺详情页</title>
    <script src="/js/detail/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/detail/common.js"></script>
    <script type="text/javascript" src="/js/detail/fastclick.js"></script>
    <script type="text/javascript">
        //移动设备快速响应点击事件
        $(document).ready(function(){
            FastClick.attach(document.body);
        })
    </script>
    <link type="text/css" rel="stylesheet" href="/js/detail/common.css">
    <link type="text/css" rel="stylesheet" href="/js/detail/slides.css">
    <link type="text/css" rel="stylesheet" href="/js/detail/new_store_detail.css">
    <script type="text/javascript" src="/js/detail/slides.js"></script>
    <script type="text/javascript" src="/js/detail/zepto_min.js"></script>
    <script type="text/javascript" src="/js/detail/touchslider.js"></script>
    <script type="text/javascript" src="/js/detail/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/js/detail/btn_active.js"></script>
</head>


<body>
<div class="container">
    <div class="addWrap">
        <div class="swipe" id="mySwipe">
            <div class="swipe-wrap">
                                    <div class="img_li"><a href="javascript:;"><img src="/js/detail/01.jpg"/></a></div>
                                    <div class="img_li"><a href="javascript:;"><img src="/js/detail/02.jpg"/></a></div>
                                    <div class="img_li"><a href="javascript:;"><img src="/js/detail/03.jpg"/></a></div>
                                    <div class="img_li"><a href="javascript:;"><img src="/js/detail/04.jpg"/></a></div>
                            </div>
        </div>
        <ul id="position">
                            <li class="cur"></li>
                            <li class=""></li>
                            <li class=""></li>
                            <li class=""></li>
                    </ul>
    </div><!--banner图End-->
    <div class="store_info">
        <p class="store_name">望京soho店</p>
        <p class="price_main">
            &yen;<span class="yuan">29.8</span>

<!--            <span class="price_tag">特惠时刻价</span>-->
                </p>
        <span class="tips rest_tips">
            <img src="/js/detail/time_icon.png"/>
            <span class="tips_text">预计等待0分钟</span>
        </span><!--rest_tips 休息状态的对应提示-->

<!--        <p class="price_explain top10"><span class="price_label">高峰时刻价¥--><!--</span>周一至周五17:00以后及周六日全天</p>-->
<!--        <p class="price_explain"><span class="price_label">限时特惠价¥--><!--</span>周一至周五17:00前</p>-->

    </div><!--店铺信息End-->

    <div class="gap"></div>
    <div class="info_list">
        <a href="javascript:;" id="appointment_div">
            <div class="info_one">
                <span></span><img src="/js/detail/appointment_icon.png"/>
                <span class="checked_title">预约时间</span>
                <div class="checked_info_main">
                    <span class="checked_info">未选择</span>
                    <span></span><img src="/js/detail/checked_icon.png"/>
                </div>
            </div>
        </a>
        <a href="javascript:;" id="hairstyle_div" hair_id="">
            <div class="info_one">
                <hr style="background: #dadada;height: 1px;border: none"/>
                <span></span><img src="/js/detail/hairstyle_icon.png"/>
                <span class="checked_title">发型精选</span>
                <div class="checked_info_main">
                    <span class="checked_info">未选择</span>
                    <span></span><img src="/js/detail/checked_icon.png"/>
                </div>
            </div>
        </a>
    </div><!--选择信息列表End-->
    <div class="split_line">
        <img src="/js/detail/split_line.png"/>
    </div>
    <!--tab切换部分-->
    <div class="tab_switch">
        <ul id="pagenavi" class="page relative_ul">
            <li><a href="javascript:;" class="active">门店信息</a></li>
            <li><a href="javascript:;">服务内容</a></li>
            <li><a href="javascript:;">用户需知</a></li>
        </ul>
<!--        <ul id="pagenavi2" class="page fixed_ul" style="position: fixed;top: 0; z-index: 2;">-->
<!--            <li><a href="javascript:;" class="active">门店信息</a></li>-->
<!--            <li><a href="javascript:;">服务内容</a></li>-->
<!--            <li><a href="javascript:;">用户需知</a></li>-->
<!--        </ul>-->
        <div class="gap" style="margin-top: 2px;"></div>
        <div id="slider" class="swipe">
            <ul class="tab_switch_list">
                <li class="li_list">
                    <div class="list_one list_default">
                        <span></span><img src="/js/detail/work_time_icon.png"/>
                        <span class="text_main">10:00-21:00</span>
                    </div>
                    <hr style="background: #dadada;height: 1px;border: none;width: 94%;margin: 0 auto"/>
                    <a href="javascript:;">
                        <div class="list_one list_default go_to_map">
                            <span></span><img src="/js/detail/address_icon.png"/>
                            <span class="text_main">北京市朝阳区望京SOHO塔3内街-F1-3110室</span>
                            <div class="checked_info_main">
                                <span></span><img src="/js/detail/checked_icon.png"/>
                            </div>
                        </div>
                    </a>
                    <hr style="background: #dadada;height: 1px;border: none;width: 94%;margin: 0 auto"/>
                                        <a href="javascript:;">
                        <div class="list_one list_default go_to_map">
                            <span></span><img src="/js/detail/route_icon.png"/>
                            <span class="text_main">
                                <p>地铁：乘坐地铁14号线阜通站下车C口出，沿阜安西路向东走800米到望京SOHO右转到T3</p>
                                <p>公交：乘坐公交536,538，快速直达专线19路，快速直达专线8路，到融科橄榄城下车向西南方向走500米到望京SOHOT3.</p>                            </span>
                            <div class="checked_right"><span></span><img src="/js/detail/checked_icon.png"/></div>
                        </div>
                    </a>
                                        <div class="gap"></div>
                    <div class="mall_real_map">
                        <img src="/js/detail/location.jpg"/>
                    </div>
                    <div class="cellphone">
                        <a href="tel:4006555200"><img src="/img/index/icon-customer.png"/></a>
                        <p>全国客服热线:09:30－21:00</p>
                    </div>
                </li>
                <li class="li_list">
                    <div class="mall_real_map">
                        <img src="/js/detail/service.jpg"/>
                    </div>
                </li>
                <li class="li_list">
                    <div class="user_know">
                        <p class="title">微信下单：</p>
                        <p><img src="/js/detail/list_style.png"/>关注“社区快剪”公众号，点击 我要剪发，在线下单</p>
                        <p class="title">到店扫码下单：</p>
                        <p><img src="/js/detail/list_style.png"/>在社区快剪——订单——订单详情，可查看最新排队信息</p>
                        <p><img src="/js/detail/list_style.png"/>过号不作废，点击——订单详情——刷新，进行重新排号享受服务</p>
                        <p><img src="/js/detail/list_style.png"/>此页面下单仅限社区快剪望京soho店内消费使用，其他店不可使用</p>
                        <p><img src="/js/detail/list_style.png"/>建议选择特惠时段，避开高峰期以免等待时间过长。</p>
                        <p><img src="/js/detail/list_style.png"/>特惠时段仅限特惠时段使用，过号重排。</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="bottom_height"></div>
    <div class="fixed_menu">
        <div class="amount">合计29.8元</div>
        <a href="javascript:;" id="payment">
        <div class="payment_btn">立即下单</div>
        </a>
    </div><!--底部固定End-->
</div>

<script type="text/javascript">
    //全局变量区域
    var f_user_id = '317926';
    var time = '1478159349';
    var get_token = '7eb3fbd5383bf37489b71a318c0e3f98';
    var f_store_id = 35;

    var ticket_num = 1;   //小票数量
    var f_selected_ticket_type = '1';   //票据类型1全天票2限时票

    var f_appointment_day = '';     //预约时段

    var f_appointment_time = '';     //预约分钟

    var hair_id =  '';//发型ID

    $(document).ready(function(){

        //给列添加伪类背景
        $(".info_one,.list_default")
            .mouseenter(function(){
                $(".info_one,.list_default").removeClass("info_one_active");//移除所有.handle的active类
                $(this).addClass("info_one_active");//再将滑倒的这个添加上active类
            })
            .mouseleave(function(){
                $(this).removeClass("info_one_active");
            })
            .click(function(){
                $(".info_one,.list_default").removeClass("info_one_active");//移除所有.handle的active类
                $(this).addClass("info_one_active");//再将滑倒的这个添加上active类
            });

        //发型选择
        $("#hairstyle_div").click(function(){
            pop_up_loading();

            var url_params = {
                'f_store_id'                :   f_store_id,
                'ticket_num'                :   ticket_num,
                'f_selected_ticket_type'    :   f_selected_ticket_type,
                'f_user_id'                 :   f_user_id,
                'time'                      :   time,
                'get_token'                 :   get_token,
                'select_hair_id'            :   hair_id,
                'f_appointment_day'         :   f_appointment_day,
                'f_appointment_time'        :   f_appointment_time
            };

            var url_prefix = '/mobile3/hairstyle_list';
            var url_subfix = $.param(url_params);
            var url = url_prefix + '?' + url_subfix;

            window.location.href = url;
        });

        //预约时间选择
        $("#appointment_div").click(function(){
            pop_up_loading();

            var url_params = {
                'f_store_id'                :   f_store_id,
                'ticket_num'                :   ticket_num,
                'f_selected_ticket_type'    :   f_selected_ticket_type,
                'f_user_id'                 :   f_user_id,
                'time'                      :   time,
                'get_token'                 :   get_token,
                'select_hair_id'            :   hair_id,
                'f_appointment_day'         :   f_appointment_day,
                'f_appointment_time'        :   f_appointment_time
            };

            var url_prefix = '/mobile3/time_appointment';
            var url_subfix = $.param(url_params);
            var url = url_prefix + '?' + url_subfix;

            window.location.href = url;
        });

        //立即下单
        $("#payment").click(function(){

                                            var url_params = {
                    'f_store_id'                :   f_store_id,
                    'ticket_num'                :   ticket_num,
                    'f_selected_ticket_type'    :   f_selected_ticket_type,
                    'f_user_id'                 :   f_user_id,
                    'time'                      :   time,
                    'get_token'                 :   get_token,
                    'hair_id'                   :   hair_id,
                    'f_appointment_day'         :   f_appointment_day,
                    'f_appointment_time'        :   f_appointment_time
                };

                var url_prefix = '/mobile3/pay_detail.html';
                var url_subfix = $.param(url_params);
                var url = url_prefix + '?' + url_subfix;

                window.location.href = url;

                                        });



    });

    //banner滑动效果处理
    var bullets = document.getElementById('position').getElementsByTagName('li');
    var banner = Swipe(document.getElementById('mySwipe'), {
        auto: 10000,
        continuous: true,
        disableScroll:false,
        callback: function(pos) {
            var i = bullets.length;
            while (i--) {
                bullets[i].className = ' ';
            }
            bullets[pos].className = 'cur';
        }
    })

    //tab切换部分js -- start
    var page = 'pagenavi' ;
    var mslide = 'slider';
//    var mtitle = 'emtitle';

    var as = document.getElementById(page).getElementsByTagName('a');

    var tt = new TouchSlider({id:mslide,'auto':'-1',fx:'ease-out',direction:'left',speed:300,timeout:5000,'before':function(index){
        var as = document.getElementById(this.page).getElementsByTagName('a');
        as[this.p].className = '';
        as[index].className = 'active';
        this.p = index;

        //tab文字显示
//        var txt = as[index].innerText;
//        $("#"+this.page).parent().find('.emtitle').text(txt);

        //tab链接
//        var txturl=as[index].getAttribute('href');
//        var turl = txturl.split('#');
//        $("#"+this.page).parent().find('.go_btn').attr('href',turl[1]);
    }});

    tt.page = page;
    tt.p = 0;
    //console.dir(tt); console.dir(tt.__proto__);
    for(var i = 0 ; i < as.length ; i++){
        (function(){
            var j = i;
            as[j].tt = tt;
            as[j].onclick = function(){
                this.tt.slide(j);
                return false;
            }
        })();
    }
    //tab切换部分js -- end

    //微信jssdk调取地理位置的方法
    wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: 'wx8d0ca17fea670939', // 必填，公众号的唯一标识
        timestamp: 1478229349, // 必填，生成签名的时间戳
        nonceStr: 'wechat_code', // 必填，生成签名的随机串
        signature: '56e309ad4501cfe5c31ef0ed2e68193b54a365ae',// 必填，签名，见附录1
        jsApiList: ['openLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });

    wx.ready(function () {
        $(".go_to_map").click(function(){
            wx.openLocation({
                latitude: 39.99612, // 纬度，浮点数，范围为90 ~ -90
                longitude: 116.48085, // 经度，浮点数，范围为180 ~ -180。
                name: '望京soho店', // 位置名
                address: '北京市朝阳区望京SOHO塔3内街-F1-3110室', // 地址详情说明
                scale: 28, // 地图缩放级别,整形值,范围从1~28。默认为最大
                infoUrl: 'http://www.xingkeduo.com' // 在查看位置界面底部显示的超链接,可点击跳转
            });
        })
    });

    //服务流程滑动到顶部时让它固定顶部
    $("body").scroll(function(){
        var title_height = $(".addWrap").height();
        var store_info_height = $(".store_info").height();
        var split_line_height = $(".split_line").height();
        var info_list_height = $(".info_list").height();
        var all = title_height + store_info_height + split_line_height + info_list_height + 6;
        if( document.body.scrollTop >= all )
        {
            $("#pagenavi").css({
                'position'  :   'fixed',
                'top'       :   '0',
                'zIndex'    :   '2'
            })
        }
        else
        {
            $("#pagenavi").css({
                'position'  :   'relative',
                'top'       :   document.body.scrollTop
            })
        }
    })
</script>
</body>
</html>

