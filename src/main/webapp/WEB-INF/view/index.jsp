<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/meta.jsp"%>
<title>仟丝顺美容美发</title>
<link rel="stylesheet" type="text/css" href="/css/index.css"/>
</head>
<body>
	<div id="loading">
		<span></span><span></span><span></span>
	</div>
	<div id="warp" class="warp">
		<div class="city-login cl">
			<a class="logo" href="http://m.quickshear.com"><span>社区快剪</span></a> <span
				class="tips">${nickname}，仟丝顺欢迎您。</span>
			<div class="login-warp">
				
				<a class="login" href="">
				<c:if test="${not empty headimgurl }">
					<i style="display: block;width: 0.3rem;height: 0.3rem;background: url(${headimgurl}) no-repeat center;background-size: .28rem auto;"></i>
				</c:if>
				<c:if test="${empty headimgurl}">
					<i style="display: block;width: 0.3rem;height: 0.3rem;background: url('/img/icon-login.png') no-repeat center;background-size: .28rem auto;"></i>
				</c:if>
				
				
				</a>
			</div>
		</div>
		<div id="focus" class="focus">
			<div class="hd">
				<ul>
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</div>
			<div class="bd">
				<ul>
					<li><a href="#">
							<img _src="/img/head/01.jpg" />
					</a></li>
					 <li><a href="#">
							<img _src="/img/head/02.jpg" />
					</a></li>
					<li><a href="#">
							<img _src="/img/head/03.jpg" />
					</a></li>
				</ul>
			</div>
		</div>
		<div class="fault-list">
			 <!-- 百度地图容器 -->
		</div>
		<div style="margin-top: 0.2rem;">
			<a href="about"><img style="width: 100%;" src="/img/head/life.png" /></a>
			<section class="box hpro-title">
				<span class="box-flex name">精品快剪</span> <a href="/repair/index" class="more">更多</a>
			</section>
		</div>
		<div class="hpro-list">
			<img src='/img/loading.gif' />
			<!-- 店铺 -->
		</div>
		<div class="hcustom">
			<a href="tel:400-900-6688"><i></i><span>400-900-6</span></a>
			<span style="font-size:12px">全国客服热线:09:30－21:00</span>
		</div>
		<div class="hservice">
			<section class="title">
				<span class="name">仟丝顺品质保证Copyright © 2017 qiansishun.com </span>
			</section>
			<ul class="box">
				<li class="box-flex"></li>
				<li class="box-flex"></li>
				<li class="box-flex"></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/js/zepto.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/touch.js"></script>
	<script type="text/javascript" src="/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="/js/touchSlide1.0.5.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		var url ='shop/list';
		var debug = ${debug};
		//微信jssdk调取地理位置的方法
	     wx.config({
	        debug: debug, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	        appId:'${appid}', // 必填，公众号的唯一标识
	        timestamp:'${timestamp}' , // 必填，生成签名的时间戳
	        nonceStr:'${nonceStr}', // 必填，生成签名的随机串
	        signature:'${sign}',// 必填，签名，见附录1
	        jsApiList: ['getLocation','openLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	    });

	     wx.ready(function () {
		    	wx.getLocation({
		    	    type: 'gcj02', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
		    	    success: function (res) {
		    	        var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
		    	        var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
		    	        var speed = res.speed; // 速度，以米/每秒计
		    	        var accuracy = res.accuracy; // 位置精度
		    	        //调用 接口获取相关的店铺数据;
		    	       
		    	        callShop(latitude,longitude);
		    	    },
		            cancel: function (res) {
		                alert('用户拒绝授权获取地理位置');
		                callShop("","");
		            },
		            error: function (res) {
		            	alert("定位失败！"); 
		            	callShop("","");
		            }
		    	});
		    	
		    }); 
		   
	    function callShop(latitude,longitude){
	    	 $.ajax({
 				type : "POST",
 		     	url: url,
 		     	data: {"latitude":latitude,
 		      		  	"longitude":longitude},
 		    	dataType: 'json',
 		    	beforeSend:function(XMLHttpRequest){
 		              //alert('远程调用开始...');
 		         },
 		    	success : function(result){
 		    		$('.hpro-list').html('');
 		      	  	$.each(result,function(n,value) {
 		      	  		var distance = Math.round(getDistance(value.latitude,value.longitude,"39.22","116.33"));
 		      	  		if(distance>1000){
 		      	  			distance = distance / 1000 +"KM";
 		      	  		}else{
 		      	  			distance = distance +"M";
 		      	  		}
 		      	  		
 		      	  		var startHours = value.businessHours.split('-')[0];
 		      	  		var endHours = value.businessHours.split('-')[1];
 		      	  		var cur = new Date();
 		      	  		var myHours = cur.getHours();
 		      	  		var myMinutes =cur.getMinutes();
 		      	  		var sHour = startHours.split(':')[0];
 		      	  		var sMinutes = startHours.split(':')[1];
 		      	  		var eHour = endHours.split(':')[0];
 		      	  		var eMinutes = endHours.split(':')[1];
 		      	  		var imgHtml;
 		      	  		if(myHours<sHour || myHours>eHour){
 		      	  			imgHtml='<img src="/img/index/zanting.png" alt="" class="status"/>';
 		      	  		}else if((myHours == sHour && myMinutes < sMinutes)||(myHours == eHour && myMinutes > eMinutes)){
 		      	  			imgHtml='<img src="/img/index/zanting.png" alt="" class="status"/>';
 		      	  		}else{
 		      	  			imgHtml='<img src="/img/index/yingyezhong.png" alt="" class="status"/>';
 		      	  		}
 		      	  		
 			      		var html = '<div class="list_store row">'+
 						'<a href="/shear/detail/'+value.id+'">'+
 						imgHtml +
 						'<img src="http://m.qiansishun.com:8180/shop.img/'+value.mainImageUrl+'" class="shop-img"/>'+
 						'<span style="background: none repeat scroll 0 0;color: #fff;letter-spacing:0.5px;;text-align: center;position:absolute;top:35%;margin-left:10px;color:#45b5da" ><b>马上预约</b></span>'+
 						'</a>'+
 						'<p class="shop-title">'+value.name+'<span class="shop-text">&nbsp;&nbsp;'+distance+'</span>'+'</p> '+
 						'<p class="shop-text">营业时间：'+value.businessHours+'</p>'+
 						'<p class="shop-text">地址：'+value.address+'</p>'+
 						'</div>';
 			      		$('.hpro-list').append(html);
 		      	  	});
 		    	}
 			});
	    }
	    
		if (isWeiXin() || isIndex()) {
			var backArea = document.getElementsByClassName('backArea')[0];
		//	backArea.style.display = 'none';
		}
		//判断是否是微信浏览器
		function isWeiXin() {
			var ua = window.navigator.userAgent.toLowerCase();
			if (ua.match(/MicroMessenger/i) == 'micromessenger') {
				return true;
			} else {
				return false;
			}
		}
		function isIndex() {
			var nowPage = window.location.pathname;
			if (nowPage == '/') {
				return true;
			} else {
				return false;
			}
		}
		
				
	    
		$("#loading").remove();
		$("#warp").css("display", "block"); 
		
	 	TouchSlide({
		        slideCell: "#focus",
		        titCell: ".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
		        mainCell: ".bd ul",
		        effect: "leftLoop",
		        autoPlay: true, //自动播放
		        autoPage: true, //自动分页
		        switchLoad: "_src" //切换加载，真实图片路径为"_src"
		    }); 

	});
</script>
</body>
</html>