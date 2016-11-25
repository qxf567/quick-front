<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<%@ include file="../common/meta.jsp"%>
    <title>店铺详情页</title>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/fastclick.js"></script>
    <script type="text/javascript">
        //移动设备快速响应点击事件
        $(document).ready(function(){
            FastClick.attach(document.body);
        })
    </script>
    <link type="text/css" rel="stylesheet" href="/css/common.css">
    <link type="text/css" rel="stylesheet" href="/css/slides.css">
    <link type="text/css" rel="stylesheet" href="/css/new_store_detail.css">
    <script type="text/javascript" src="/js/slides.js"></script>
    <script type="text/javascript" src="/js/zepto.min.js"></script>
    <script type="text/javascript" src="/js/TouchSlide.1.1.js"></script>
    <script type="text/javascript" src="/js/jweixin-1.0.0.js"></script>
</head>


<body>
<div class="container">
    <div class="addWrap">
        <div class="swipe" id="mySwipe">
            <div class="swipe-wrap">
            	<c:forEach items="${shop.multiImageUrls.split(',')}" var="image">
	            	<div class="img_li"><a href="javascript:;"><img src="${image}"/></a></div>
	            </c:forEach>
                                    <!-- <div class="img_li"><a href="javascript:;"><img src="/img/detail/01.jpg"/></a></div>
                                    <div class="img_li"><a href="javascript:;"><img src="/img/detail/02.jpg"/></a></div>
                                    <div class="img_li"><a href="javascript:;"><img src="/img/detail/03.jpg"/></a></div> -->
             </div>
        </div>
        <ul id="position">
        	<c:if test="${shop.multiImageUrls ne ''}">
        		<li class="cur"></li>
        	</c:if>
        	<c:forEach items="${shop.multiImageUrls.split(',')}" begin="1">
            	<li class=""></li>
            </c:forEach>
        </ul>
    </div><!--banner图End-->
    <div class="store_info">
        <p class="store_name">${shop.name}</p>
        <p class="price_main">
            &yen;<span class="yuan">${shop.price}</span>

           <!--  <span class="price_tag">特惠时刻价</span> -->
         </p>
        <span class="tips rest_tips">
            <img src="/img/detail/time_icon.png"/>
            <span class="tips_text">预计等待0分钟</span>
        </span><!--rest_tips 休息状态的对应提示-->

<!--        <p class="price_explain top10"><span class="price_label">高峰时刻价¥--><!--</span>周一至周五17:00以后及周六日全天</p>-->
<!--        <p class="price_explain"><span class="price_label">限时特惠价¥--><!--</span>周一至周五17:00前</p>-->

    </div>

    <div class="gap"></div>
    <div class="info_list">
        <a href="javascript:;" id="appointment_div">
            <div class="info_one">
                <span></span><img src="/img/detail/appointment_icon.png"/>
                <span class="checked_title">预约时间</span>
                <div class="checked_info_main">
                    <span class="checked_info"> 
                    	<c:if test="${!empty order.appointmentDay}">${order.appointmentDay} ${order.appointmentTime}</c:if>
                   	 	<c:if test="${empty order.appointmentDay}">未选择</c:if>
                   	</span>
                    <span></span><img src="/img/detail/checked_icon.png"/>
                </div>
            </div>
        </a>
        <a href="javascript:;" id="hairstyle_div" hairstyleId="${order.hairstyleId}">
            <div class="info_one">
                <hr style="background: #dadada;height: 1px;border: none"/>
                <span></span><img src="/img/detail/hairstyle_icon.png"/>
                <span class="checked_title">发型精选</span>
                <div class="checked_info_main">
                    <span class="checked_info">
        				 <c:if test="${!empty order.hairstyleId}">${order.hairstyleName}</c:if>
        				 <c:if test="${empty order.hairstyleId}">未选择</c:if>         
                    </span>
                    <span></span><img src="/img/detail/checked_icon.png"/>
                </div>
            </div>
        </a>
        <a href="javascript:;" id="hairdresser_div">
            <div class="info_one">
            	<hr style="background: #dadada;height: 1px;border: none"/>
                <span></span><img src="/img/detail/hairdresser.png"/>
                <span class="checked_title">理发师</span>
                <div class="checked_info_main">
                    <span class="checked_info"> 
                    	<c:if test="${!empty order.hairdresserId}">${order.hairdresserName}</c:if>
                   	 	<c:if test="${empty order.hairdresserId}">可选</c:if>
                   	</span>
                    <span></span><img src="/img/detail/checked_icon.png"/>
                </div>
            </div>
        </a>
    </div><!--选择信息列表End-->
    <div class="split_line">
        <img src="/img/detail/split_line.png"/>
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
                        <span></span><img src="/img/detail/work_time_icon.png"/>
                        <span class="text_main">${shop.businessHours}</span>
                    </div>
                    <hr style="background: #dadada;height: 1px;border: none;width: 94%;margin: 0 auto"/>
                    <a href="javascript:;">
                        <div class="list_one list_default go_to_map">
                            <span></span><img src="/img/detail/address_icon.png"/>
                            <span class="text_main">${shop.address}</span>
                            <div class="checked_info_main">
                                <span></span><img src="/img/detail/checked_icon.png"/>
                            </div>
                        </div>
                    </a>
                    <hr style="background: #dadada;height: 1px;border: none;width: 94%;margin: 0 auto"/>
                    <a href="javascript:;">
                        <div class="list_one list_default go_to_map">
                            <span></span><img src="/img/detail/route_icon.png"/>
                            <span class="text_main">
                                <p>@TODO地铁：乘坐地铁14号线阜通站下车C口出，沿阜安西路向东走800米到望京SOHO右转到T3</p>
                                <p>@TODO公交：乘坐公交536,538，快速直达专线19路，快速直达专线8路，到融科橄榄城下车向西南方向走500米到望京SOHOT3.</p>                            </span>
                            <div class="checked_right"><span></span><img src="/img/detail/checked_icon.png"/></div>
                        </div>
                    </a>
                                        <div class="gap"></div>
                    <div class="mall_real_map">
                        <img src="/img/detail/location.jpg"/>
                    </div>
                    <div class="cellphone">
                        <a href="tel:${shop.phoneNumber}"><img src="/img/index/icon-customer.png"/></a>
                        <p>客服热线:${shop.businessHours}</p>
                    </div>
                </li>
                <li class="li_list">
                    <div class="mall_real_map">
                        <img src="/img/detail/service.jpg"/>
                    </div>
                </li>
                <li class="li_list">
                    <div class="user_know">
                        <p class="title">微信下单：</p>
                        <p><img src="/img/detail/list_style.png"/>关注“社区快剪”公众号，点击 我要剪发，在线下单</p>
                        <p class="title">到店扫码下单：</p>
                        <p><img src="/img/detail/list_style.png"/>在社区快剪——订单——订单详情，可查看最新排队信息</p>
                        <p><img src="/img/detail/list_style.png"/>过号不作废，点击——订单详情——刷新，进行重新排号享受服务</p>
                        <p><img src="/img/detail/list_style.png"/>此页面下单仅限社区快剪望京soho店内消费使用，其他店不可使用</p>
                        <p><img src="/img/detail/list_style.png"/>建议选择特惠时段，避开高峰期以免等待时间过长。</p>
                        <p><img src="/img/detail/list_style.png"/>特惠时段仅限特惠时段使用，过号重排。</p>
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
var customerId = '${userId}';
var shopId = '${shop.id}';
var appointmentDay = '${order.appointmentDay}'; // 预约时段
var appointmentTime = '${order.appointmentTime}'; // 预约分钟
var hairstyleId = '${order.hairstyleId}';// 发型ID
var hairstyleName= '${order.hairstyleName}';
var hairdresserId='${order.hairdresserId}';
var hairdresserName='${order.hairdresserName}';
var time = '1555';
var get_token = '7eb3fbd5383bf37489b71a318c0e3f98';
var ticket_num = 1; // 小票数量
var f_selected_ticket_type = '1'; // 票据类型1全天票2限时票
</script>
<script type="text/javascript">

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
                'shopId'                :   shopId,
                'ticket_num'                :   ticket_num,
                'f_selected_ticket_type'    :   f_selected_ticket_type,
                'customerId'                 :   customerId,
                'time'                      :   time,
                'get_token'                 :   get_token,
                'hairdresserId':hairdresserId,
                'hairdresserName':hairdresserName,
                'appointmentDay'         :   appointmentDay,
                'appointmentTime'        :   appointmentTime
            };

            var url_prefix = '/shear/chose/hair';
            var url_subfix = $.param(url_params);
            var url = url_prefix + '?' + encodeURI(url_subfix);

            window.location.href = url;
        });

        //预约时间选择
        $("#appointment_div").click(function(){
            pop_up_loading();

            var url_params = {
                'shopId'                :   shopId,
                'f_selected_ticket_type'    :   f_selected_ticket_type,
                'customerId'                 :   customerId,
                'time'                      :   time,
                'get_token'                 :   get_token,
                'hairstyleId'            :   hairstyleId,
                'hairstyleName'            :   hairstyleName,
                'hairdresserId':hairdresserId,
                'hairdresserName':hairdresserName,
                'appointmentDay'         :   appointmentDay,
                'appointmentTime'        :   appointmentTime
            };

            var url_prefix = '/shear/chose/time';
            var url_subfix = $.param(url_params);
            var url = url_prefix + '?' + encodeURI(url_subfix)+"&businessHours=${shop.businessHours}";

            window.location.href = url;
        });
        
        $("#hairdresser_div").click(function(){
            pop_up_loading();

            var url_params = {
                'shopId'                :   shopId,
                'businessHours'                :   '${shop.businessHours}',
                'f_selected_ticket_type'    :   f_selected_ticket_type,
                'customerId'                 :   customerId,
                'time'                      :   time,
                'get_token'                 :   get_token,
                'hairstyleId'            :   hairstyleId,
                'hairstyleName'            :   hairstyleName,
                'appointmentDay'         :   appointmentDay,
                'appointmentTime'        :   appointmentTime
            };

            var url_prefix = '/shear/chose/dresser';
            var url_subfix = $.param(url_params);
            var url = url_prefix + '?' + encodeURI(url_subfix);;

            window.location.href = url;
        });
        

        //立即下单
        $("#payment").click(function(){

        	
        	
        	
                var url_params = {
                    'shopId'                :   shopId,
                    'customerId'                 :   customerId,
                    'time'                      :   time,
                    'get_token'                 :   get_token,
                    'hairstyleId'               :hairstyleId,
                    'appointmentDay'         :   appointmentDay,
                    'appointmentTime'        :   appointmentTime
                };
                var url_prefix = '/shear/order/prepay';
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
                latitude: '${shop.latitude}', // 纬度，浮点数，范围为90 ~ -90
                longitude: '${shop.longitude}', // 经度，浮点数，范围为180 ~ -180。
                name: '${shop.name}', // 位置名
                address: '${shop.address}', // 地址详情说明
                scale: 28, // 地图缩放级别,整形值,范围从1~28。默认为最大
                infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
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

