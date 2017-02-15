<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<%@ include file="common/meta.jsp"%>
    <title>精选发型360°旋转看发型效果</title>
    <link type="text/css" rel="stylesheet" href="/css/common.css" />
    <link type="text/css" rel="stylesheet" href="/css/hairstyle_detail.css" />
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/fastclick.js"></script>
    <script type="text/javascript" src="/js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="/js/new_3deye.js"></script>
    <script type="text/javascript" src="/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/js/wechat_common.js"></script>
    <script type="text/javascript">
        var f_user_id = '317926';
        var time        = '1478501251';
        var token   = '95cad45280b7b8a9287213c83ab4bad7';
        var shopId   = '${order.shopId}';
        var hairstyleId = '${order.hairstyleId}';
        var hairstyleName = '${order.hairstyleName}';
        var customerId = '${order.customerId}';
        var ticket_num =  '1';
        var f_selected_ticket_type =  '1';
        var f_date =  '';
        var appointmentDay =  '${order.appointmentDay}';
        var appointmentTime =  '${order.appointmentTime}';
        var hairdresserId = '${order.hairdresserId}';
        var hairdresserName = '${order.hairdresserName}';
        $(document).ready(function(){
        	var imgs = '${hair.multiImageUrls}'.split(",");
            FastClick.attach(document.body);
           /*  $("#hair_style_show").vc3dEye({
                imagePath:"http://m.qiansishun.com:8180/hairstyle.img/${hair.mainImageUrl}",
                totalImages:1,
                imageExtension:""
            }); */

            $(".p_left").click(function(){
                $("#hair_style_show").vc3dEye.d();
            })

            $(".p_right").click(function(){

            })

            $(".cancel_button").click(function(){
                pop_up_loading();
                
                var url_params = {
                        'customerId':customerId,
                        'shopId':shopId,
                       // 'hairstyleId':hairstyleId,
                       // 'hairstyleName':hairstyleName,
                        'appointmentDay':appointmentDay,
                        'appointmentTime':appointmentTime,
                        'hairdresserId':hairdresserId,
                        'hairdresserName':hairdresserName
                    };

                    pop_up_loading();
                    var url_prefix = '/shear/detail/'+shopId;
                    var url_subfix = $.param(url_params);
                    var url = url_prefix + '?' + encodeURI(url_subfix);
                    location.href = url;
            });

            $(".confirm_button").click(function(){
            	pop_up_loading();
                var url_params = {
                        'customerId':customerId,
                        'shopId':shopId,
                        'hairstyleId':hairstyleId,
                        'hairstyleName':hairstyleName,
                        'appointmentDay':appointmentDay,
                        'appointmentTime':appointmentTime,
                        'hairdresserId':hairdresserId,
                        'hairdresserName':hairdresserName
                    };

                    pop_up_loading();
                    var url_prefix = '/shear/detail/'+shopId;
                    var url_subfix = $.param(url_params);
                    var url = url_prefix + '?' + encodeURI(url_subfix);
                    location.href = url;

            });
            $("img").lazyload({
                threshold:350
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="hair_list_top">
        <span class="hair_label">${hair.name}必备</span>
       <!--  <div class="like">
            <div class="love_btn" rel="unlike">
                <a href="#"><img src="/img/detail/default-heart-shape.png"></a>
            </div>
            <span class="like_num" hair-id="10">249</span>
        </div> -->
    </div>
    <div class="hair_main">
        <div id="hair_style_show">
        <!-- <div class="operation_tips">可左右滑动</div>
        <div class="prompt" id="prompt">
            <div class="p_center" id="p_center"><img class="img_hand" src="/img/detail/hand.png"></div>
        </div> -->
        <img src="http://m.qiansishun.com:8180/hairstyle.img/${hair.mainImageUrl}">
        </div>
    </div>
    <div class="hair_list_bottom">
        <p class="hair_name">${hair.name}</p>
        <span>BUSINESS</span>
        <ul class="face">
            <li class="title">合适</li>
                            <li>圆脸</li>
                            <li>国字脸</li>
                            <li>鹅蛋脸</li>
                    </ul>
        <p class="hair_describe"></p>
    </div>
    <div class="split_line"><img src="/img/detail/split_line.jpg"></div>
     <div class="hair_details">
     
     <c:if test="${not empty hair.multiImageUrls}">
     	 <c:set value="${fn:split(hair.multiImageUrls,',')}" var="imgs" />
	       <c:forEach items="${imgs}" var="img" >
		<img src="http://m.qiansishun.com:8180/hairstyle.img/${img}">
		</c:forEach>
     </c:if>
    </div>

           
    
        
    <div style="height: 3.4rem;width: 100%"></div>
    <div class="fixed_bottom">
        <a href="javascript:;" class="pink_btn cancel_button ">取消</a>
        <a href="javascript:;" class="blue_btn confirm_button " id="confirm_button">选择</a>
    </div>
</div>
<script type="text/javascript">
    wx.ready(function () {
        //分享到朋友圈
        wx.onMenuShareTimeline({
            title: '精选发型360°旋转看发型效果',// 分享标题
            link: 'http://e.xingkeduo.com/wechat/oauth/state/12/product_id/10/shop_number/67',
            imgUrl: 'http://m.xingkeduo.com/static/imgs/10/1.jpg',// 分享图标
            trigger:function(res){
            },
            success:function(res){
                alert("转发成功");
            },
            cancel:function(res){

            },
            fail:function(res){
                alert(JSON.stringify(res));
            },
        });

        //分享发送给好友
        wx.onMenuShareAppMessage({
            title: '精选发型360°旋转看发型效果',
            desc: '精选发型360°旋转看发型效果',
            link: 'http://e.xingkeduo.com/wechat/oauth/state/12/product_id/10/shop_number/67',
            imgUrl: 'http://cdn.xingkeduo.com/imgs/10/1.jpg',
            trigger:function(res){

            },
            success:function(res){
                alert("转发成功");
            },
            cancel:function(res){

            },
            fail:function(res){
                alert(JSON.stringify(res));
            },
        });
    });
</script>
<script type="text/javascript">
    (function ($) {
        $.extend({
            tipsBox: function (options) {
                options = $.extend({
                    obj: null, //jq对象，要在那个html标签上显示
                    str: "+1", //字符串，要显示的内容;也可以传一段html，如: "<b style='font-family:Microsoft YaHei;'>+1</b>"
                    startSize: "12px", //动画开始的文字大小
                    endSize: "30px",  //动画结束的文字大小
                    interval: 600, //动画时间间隔
                    color: "#FCDDD6",  //文字颜色
                    callback: function () { }  //回调函数
                }, options);
                $("body").append("<span class='num'>" + options.str + "</span>");
                var box = $(".num");
                var left = options.obj.offset().left + options.obj.width() / 2;
                var top = options.obj.offset().top - options.obj.height();
                box.css({
                    "position": "absolute",
                    "left": left + "px",
                    "top": top + "px",
                    "z-index": 9999,
                    "font-size": options.startSize,
                    "line-height": options.endSize,
                    "color": options.color
                });
                box.animate({
                    "font-size": options.endSize,
                    "opacity": "0",
                    "top": top - parseInt(options.endSize) + "px"
                }, options.interval, function () {
                    box.remove();
                    options.callback();
                });
            }
        });
    })(jQuery);
    //     爱心点赞
    //    var span1 = parseInt($("#like2").html());

    $(".hair_list_top .like").click(function(){
        var _this = $(this).find(".love_btn");
        var rel = _this.attr("rel");
        var span = parseInt(_this.parent().find(".like_num").html());
        var hair_id = _this.parent().find(".like_num").attr("hair-id");
        if(rel === "unlike")
        {
            _this.parent().find(".like_num").html(span+1);
            _this.find("img").attr("src","/img/heart-shape.png");
            _this.attr("rel","like");
            $.tipsBox({
                obj: _this,
                str: "+1",
                callback: function () {
                }
            });

            $.ajax({
                "url"		:	"/mobile3/like_hair",
                "type"		:	"post",
                "data"		:	{f_user_id:f_user_id,time:time,token:token,hair_id:hair_id,type:1},
                "dataType"	:	"json",
                "success"	:	function(res)
                {

                }
            });
        }
        else
        {
            _this.parent().find(".like_num").html(span-1);
            _this.find("img").attr("src","http://cdn.xingkeduo.com/image/mobile/default-heart-shape.png");
            _this.attr("rel","unlike");
            $.tipsBox({
                obj: _this,
                str: "-1",
                callback: function () {
                }
            });
            $.ajax({
                "url"		:	"/mobile3/like_hair",
                "type"		:	"post",
                "data"		:	{f_user_id:f_user_id,time:time,token:token,hair_id:hair_id,type:2},
                "dataType"	:	"json",
                "success"	:	function(res)
                {

                }
            });
        }
    });
</script>
</body>
</html>
