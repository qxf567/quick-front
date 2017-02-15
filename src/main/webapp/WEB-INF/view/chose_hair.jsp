<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
   <%@ include file="common/meta.jsp"%>
    <title>发型</title>
    <!-- Pixel Admin's stylesheets -->
    <link type="text/css" rel="stylesheet" href="/css/common.css" />
    <link href="/css/hairstyle.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/fastclick.js"></script>
    <script type="text/javascript" src="/js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="/js/zepto.min.js"></script>
    <script type="text/javascript" src="/js/TouchSlide.1.1.js"></script>
    <!--[if lt IE 9]>
    <script src="/img/detail/ie.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container" style="position:relative;" id="hairstyle_list">
    <div class="tab_switch">
        <ul id="pagenavi" class="page fixed_top">
            <li><a href="javascript:;" class="active">男 士</a></li>
            <li><a href="javascript:;">女 士</a></li>
        </ul>
        <div id="slider" class="swipe">
            <ul class="tab_switch_list" style="margin-top:4rem">
                <li class="li_list">
                
               	 <c:forEach items="${hairList}" var="hair">
               	  <c:if test="${hair.sex eq 0}">
                        <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">${hair.name}</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">250</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="4" hair_id="${hair.id}">
                                <img src="http://m.qiansishun.com:8180/hairstyle.img/${hair.mainImageUrl}">
                            </div>
                            <p class="hair_name">${hair.detail}</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                        </c:if>
                        </c:forEach>
                        <!--  <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">随性标配</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">221</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="9" hair_id="15">
                                <img src="http://cdn.xingkeduo.com/imgs/9/25.jpg">
                            </div>
                            <p class="hair_name">BAD BOY</p>
                            <p class="english_label">HOLIDAY</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">男士必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">217</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="12" hair_id="18">
                                <img src="http://cdn.xingkeduo.com/imgs/12/25.jpg">
                            </div>
                            <p class="hair_name">文创园胡子哥</p>
                            <p class="english_label">HOLIDAY</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">宅男必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">202</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="17" hair_id="23">
                                <img src="http://cdn.xingkeduo.com/imgs/17/25.jpg">
                            </div>
                            <p class="hair_name">海龟安全感</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">颜值担当</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">189</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="18" hair_id="24">
                                <img src="http://cdn.xingkeduo.com/imgs/18/25.jpg">
                            </div>
                            <p class="hair_name">BOY LONDON</p>
                            <p class="english_label">AUTUMN</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">颜值担当</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">214</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="19" hair_id="26">
                                <img src="http://cdn.xingkeduo.com/imgs/19/25.jpg">
                            </div>
                            <p class="hair_name">IT攻城狮</p>
                            <p class="english_label">BUSINESS</p>
                        </div> -->
                     <img src="/img/detail/the_end.png" class="the_end">
                </li>
                <li class="li_list">
                       
                       <c:forEach items="${hairList}" var="hair">
                       <c:if test="${hair.sex eq 1}">
                        <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">${hair.name}</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">241</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="4" hair_id="${hair.id}">
                                <img src="http://m.qiansishun.com:8180/hairstyle.img/${hair.mainImageUrl}">
                            </div>
                            <p class="hair_name">${hair.detail}</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                        </c:if>
                        </c:forEach>
                       
                       <!-- <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">职场必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">241</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="1" hair_id="7">
                                <img src="http://cdn.xingkeduo.com/imgs/1/25.jpg">
                            </div>
                            <p class="hair_name">高媛媛</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">居家必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">207</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="2" hair_id="8">
                                <img src="http://cdn.xingkeduo.com/imgs/2/25.jpg">
                            </div>
                            <p class="hair_name">清爽迷你菇</p>
                            <p class="english_label">AUTUMN</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">旅行必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">221</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="3" hair_id="9">
                                <img src="http://cdn.xingkeduo.com/imgs/3/25.jpg">
                            </div>
                            <p class="hair_name">可爱邻家</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">淑女必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">217</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="5" hair_id="11">
                                <img src="http://cdn.xingkeduo.com/imgs/5/25.jpg">
                            </div>
                            <p class="hair_name">恋秋</p>
                            <p class="english_label">AUTUMN</p>
                        </div>
                                             <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">简约必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">214</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="7" hair_id="13">
                                <img src="http://cdn.xingkeduo.com/imgs/7/25.jpg">
                            </div>
                            <p class="hair_name"> 可爱邻家</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">秋冬必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">188</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="10" hair_id="16">
                                <img src="http://cdn.xingkeduo.com/imgs/10/25.jpg">
                            </div>
                            <p class="hair_name">柳颜</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">熟女必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">210</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="11" hair_id="17">
                                <img src="http://cdn.xingkeduo.com/imgs/11/25.jpg">
                            </div>
                            <p class="hair_name">杏雨梨花</p>
                            <p class="english_label">AUTUMN</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">职场达人</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">192</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="13" hair_id="19">
                                <img src="http://cdn.xingkeduo.com/imgs/13/25.jpg">
                            </div>
                            <p class="hair_name">沈佳宜</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">秋冬必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">183</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="14" hair_id="20">
                                <img src="http://cdn.xingkeduo.com/imgs/14/25.jpg">
                            </div>
                            <p class="hair_name">漫步云端</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">都市丽人</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">184</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="15" hair_id="21">
                                <img src="http://cdn.xingkeduo.com/imgs/15/25.jpg">
                            </div>
                            <p class="hair_name">冬日恋歌</p>
                            <p class="english_label">HOLIDAY</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">简约出行</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">217</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="16" hair_id="22">
                                <img src="http://cdn.xingkeduo.com/imgs/16/25.jpg">
                            </div>
                            <p class="hair_name">穿PRADA的女王</p>
                            <p class="english_label">BUSINESS</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">秋冬必备</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">184</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="20" hair_id="27">
                                <img src="http://cdn.xingkeduo.com/imgs/20/25.jpg">
                            </div>
                            <p class="hair_name">微微一笑倾城</p>
                            <p class="english_label">HOLIDAY</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">可爱宝贝</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">4</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="21" hair_id="28">
                                <img src="http://cdn.xingkeduo.com/imgs/21/25.jpg">
                            </div>
                            <p class="hair_name">亲亲我的宝贝</p>
                            <p class="english_label">SWEETHONEY</p>
                        </div>
                                            <div class="onelist">
                            <div class="hair_list_top">
                                <span class="hair_label">可爱宝贝</span>
                                <div class="like">
                                    <div class="love_btn" rel="unlike">
                                        <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
                                    </div>
                                    <span class="like_num">3</span>
                                </div>
                            </div>
                            <div class="hair_pictures" folder="22" hair_id="29">
                                <img src="http://cdn.xingkeduo.com/imgs/22/25.jpg">
                            </div>
                            <p class="hair_name">别人家孩儿</p>
                            <p class="english_label">SWEETHONEY</p>
                        </div> -->
                     <img src="/img/detail/the_end.png" class="the_end">
                </li>
            </ul>
        </div>
    </div>
<!--     <div class="sex">
        <div class="gender man sex_select">
            <p>男 士</p>
        </div>
        <div class="gender woman ">
            <p>女 士</p>
        </div>
    </div> -->



</div>


<!-- Get jQuery from Google CDN -->
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
        <img src="/img/detail/close_1.png"/>
    </div>
    <div style="clear: both"></div>
    <div id="opcation" class="rush_time_con" align="center">
        <div style="font-size: 18px;height: 26px;line-height: 26px;text-align: center;color:#000">高峰时段</div>
        <div style="font-size: 14px;width:78%;margin-left: 5%;color:#999999;margin-top: 10px;line-height: 23px" align="left">现在正处于高峰时段，您可以选择特惠时段下单，享受优惠。</div>
        <a href="javascript:;" class="submit" style="width: 252px;border-radius:4px;margin-top: 70px;height: 42px;line-height: 42px">我要优惠</a>
        <a href="javascript:;" class="defalt" id="close_rush_time">不要优惠，高峰下单</a>
    </div>
</div><!--[if !IE]> -->
<script
    type="text/javascript"> window.jQuery || document.write('<script src="/js/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>
<!-- <![endif]-->
<!--[if lte IE 9]>
<script
    type="text/javascript"> window.jQuery || document.write('<script src="assets/javascripts/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>
<![endif]-->

<!-- Pixel Admin's javascripts -->
<script src="/js/bootstrap.min.js"></script>
<script src="/js/pixel-admin.min.js"></script>
<script src="/js/hammer.min.js"></script>
<script src="/js/jquery.hammer.js"></script>
<script src="/js/wechat_common.js"></script>

<script type="text/javascript">

var shopId   = '${order.shopId}';
//var hairstyleId = '${order.hairstyleId}';
var hairstyleName = '${order.hairstyleName}';
var select_hair_id =  '';
var customerId = '${order.customerId}';
var ticket_num =  '1';
var f_selected_ticket_type =  '1';
var f_date =  '';
var appointmentDay =  '${order.appointmentDay}';
var appointmentTime =  '${order.appointmentTime}';
var hairdresserId = '${order.hairdresserId}';
var hairdresserName = '${order.hairdresserName}';
    var first_load = 1;
    var init = [];
    init.push(function () {
        //发型选择 取消
       /*  $("#hair_list_cancel").click(function(){
            $("#store_detail").show();
            $("#hairstyle_list").hide();
        });
        //发型选择 确定
        $("#hair_list_confirm").click(function(){
            $('.pitchon').each(function(){
                if($(this).hasClass("option"))
                {
                    var hair_id = $(this).attr("hair_id");
                    var hair_name = $(this).parent().parent().find(".hair_name").html();
                    $("#hairstyle_div .check_hair").html(hair_name);
                    $("#hairstyle_div .check_hair").attr("hair_id",hair_id);
                    $("#store_detail").show();
                    $("#hairstyle_list").hide();
                }
            });
        }); 
        $('.pitchon').click(function(){
            $('.pitchon').each(function(){
                $(this).find("img").fadeOut();
                $(this).removeClass("option").addClass("option_default");
            });
            $(this).find("img").fadeIn();
            $(this).removeClass("option").removeClass("option").addClass("option");
        });
       
        $(".man").click(function(){
            $(".manlist").show();
            $(".woman").removeClass("sex_select");
            $(".man").addClass("sex_select");
            $(".womanlist").hide();
            $("img").lazyload();
            first_load = 0;
        });
        $(".woman").click(function(){
            $(".womanlist").show();
            $(".man").removeClass("sex_select");
            $(".woman").addClass("sex_select");
            $(".manlist").hide();
            $("img").lazyload();
            first_load = 0;
        });
        */
        //点击发型列表的图片事件
        $(".hair_pictures").click(function(){

            pop_up_loading();

            var f_user_id = '317926';
            var time = '1478750626';
            var token = 'a8cd1d69998db3af557bfd96e6763863';

            var shopId = '${order.shopId}';
            var f_hairstyle_id = $(this).attr("hair_id");
            var select_hair_id = '';

            var ticket_num = '1';
            var f_selected_ticket_type = '1';
            var f_date = '';
            var appointmentDay = '${order.appointmentDay}';

            var appointmentTime = '${order.appointmentTime}';
            var url_params = {
                    'customerId':customerId,
                    'shopId':shopId,
                    'hairstyleId':f_hairstyle_id,
                    'hairstyleName':hairstyleName,
                    'appointmentDay':appointmentDay,
                    'appointmentTime':appointmentTime,
                    'hairdresserId':hairdresserId,
                    'hairdresserName':hairdresserName
                };
            pop_up_loading();
            var url_prefix = '/shear/chose/hair/detail';
            var url_subfix = $.param(url_params);
            var url = url_prefix + '?' + encodeURI(url_subfix);
            location.href = url;
        });

        //取消
        $(".cancel_btn").click(function(){
            $("#store_detail").hide();
            $("#hairstyle_list").show();
            $("#hairstyle_detail").hide();
        });
        //确定
        $(".determine_btn").click(function(){
            $('.pitchon').each(function(){
                $(this).removeClass("option").addClass("option_default");
                $(this).find("img").fadeOut();
            });
            var hair_id = $("#select_hair_id").val();
            $(".pitchon[hair_id='"+hair_id+"']").removeClass("option").removeClass("option").addClass("option");
            $(".pitchon[hair_id='"+hair_id+"']").find("img").fadeIn();
            $("#store_detail").hide();
            $("#hairstyle_list").show();
            $("#hairstyle_detail").hide();
        });

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

    })
    window.PixelAdmin.start(init);
    $(document).ready(function(){
        FastClick.attach(document.body);

//        $("img").lazyload({
//            threshold:200
//        });
    });
</script>
</body>
</html>