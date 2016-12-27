<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
   <%@ include file="common/meta.jsp"%>
    <title></title>
    <!-- Pixel Admin's stylesheets -->
    <link type="text/css" rel="stylesheet" href="/css/common.css" />
    <link href="/css/hairstyle.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/fastclick.js"></script>
    <script type="text/javascript" src="/js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="/js/zepto.min.js"></script>
    <script type="text/javascript" src="/js/TouchSlide.1.1.js"></script>
    <style type="text/css">
    .bottom_left{ float: left;width: 18%; }
	.bottom_left img{width: 3rem;padding-top: 0.2rem;display:block; margin:0 auto;}
	.cancel_button,.confirm_button{float: left;line-height: 50px;text-align: center;color: #ffffff;font-size: 1.2rem;letter-spacing: 3px;display:inline-block;color:#fff;}
	.cancel_button,.cancel_button:hover,.cancel_button:link,.cancel_button:visited,.confirm_button,.confirm_button:hover,.confirm_button:link,.confirm_button:visited{color:#fff;}
    .box-shadow-3{  
  -webkit-box-shadow:0 0 10px rgba(0, 204, 204, .5);  
  -moz-box-shadow:0 0 10px rgba(0, 204, 204, .5);  
  box-shadow:0 0 10px rgba(0, 204, 204, .5);  
} 
    </style>
</head>
<body>
<div class="container" style="position:relative;" id="hairstyle_list">

    <div class="tab_switch">
        <ul id="pagenavi" class="page fixed_top">
            <li><a href="javascript:;" class="active">发型师大全</a></li>
        </ul>
        <div id="slider" class="swipe">
            <ul class="tab_switch_list" style="margin-top:4rem">
          
                 <li class="li_list">
               	 <c:forEach items="${dresserList}" var="dress">
                	<div class="twolist" hair_id="${dress.id}" hair_name="${dress.name}">
                            <div class="hair_list_top">
                                <span class="hair_label">${dress.shopName}</span>
                            </div>
                            <div class="hair_pictures">
                              	<img src="${dress.photo}">
                            </div>
                            <p class="hair_name">${dress.name}</p>
                        </div>
              
               	 	</c:forEach>
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
 <div class="bottom_height"></div>
    <div class="fixed_menu">
        <a href="javascript:;" class="pink_btn cancel_button" id="cancel">取消</a>
        <a href="javascript:;" class="blue_btn confirm_button" id="confirm">选择</a>
    </div><!--底部固定End-->
</div>


<!-- Pixel Admin's javascripts -->
<!-- <script src="/js/bootstrap.min.js"></script> -->
<script src="/js/pixel-admin.min.js"></script>
<script src="/js/hammer.min.js"></script>
<script src="/js/jquery.hammer.js"></script>
<script src="/js/wechat_common.js"></script>
	<script type="text/javascript" src="/js/touch.js"></script>
	<script type="text/javascript" src="/js/touchSlide1.0.5.js"></script>
<script type="text/javascript">
var customerId = '${order.customerId}';
var time        = '1478159349';
var get_token   = '7eb3fbd5383bf37489b71a318c0e3f98';
var shopId   = '${order.shopId}';
var hairstyleId =  '${order.hairstyleId}';
var hairstyleName =  '${order.hairstyleName}';
var appointmentDay ='${order.appointmentDay}';
var appointmentTime = '${order.appointmentTime}';
var ticket_num =  '1';
var f_selected_ticket_type =  '1';
        //发型选择 取消
       /*  $("#hair_list_cancel").click(function(){
            $("#store_detail").show();
            $("#hairstyle_list").hide();
        });
        //发型选择 确定
        $("#confirm").click(function(){
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
        	$('.twolist').each(function(){
            	$(this).removeClass("option");
            });
        	$(".li_list").find('img[name*="selected"]').remove();
        	$(".li_list").find('p').removeClass('selected');
        	$(this).append('<img src="/img/selected.png" name="selected" style="position:absolute; bottom:13%; left:30%;width:30%">');
			$(this).next().addClass('selected');
			$(this).parent().addClass('option');
           
        });
      //发型选择 确定
        $("#confirm").click(function(){
        	var flag;
        	var name;
            $('.twolist').each(function(){
            	if($(this).hasClass("option")){
            		flag = true;
            		var dresser = $(this).attr("hair_id");
            		var name =$(this).attr("hair_name");
            		var url_params = {
                            'customerId':customerId,
                            'shopId':shopId,
                            'hairstyleId':hairstyleId,
                            'hairstyleName':hairstyleName,
                            'appointmentDay':appointmentDay,
                            'appointmentTime':appointmentTime,
                            'hairdresserId':dresser,
                            'hairdresserName':name
                        };

                        pop_up_loading();
                        var url_prefix = '/shear/detail/'+shopId;
                        var url_subfix = $.param(url_params);
                        var url = url_prefix + '?' + encodeURI(url_subfix);
                        location.href = url;
            	}
            });
            if(!flag){
            	alert('请选择发型师或单击左边【取消】选择');
            }
            
            
        }); 
        //取消
        $(".cancel_btn").click(function(){
            $("#store_detail").hide();
            $("#hairstyle_list").show();
            $("#hairstyle_detail").hide();
        });

</script>
</body>
</html>