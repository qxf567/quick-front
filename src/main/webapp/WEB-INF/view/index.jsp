<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/meta.jsp"%>
<title>快剪首页</title>
<link rel="stylesheet" type="text/css" href="/css/index.css"/>
</head>
<body>
	<div id="loading">
		<span></span><span></span><span></span>
	</div>
	<div id="warp" class="warp">
		<div class="city-login cl">
			<a class="logo" href="http://m.quickshear.com"><span>社区快剪</span></a> <span
				class="tips">快剪，2小时上门。</span>
			<div class="login-warp">
				<a class="login" href="/index/ucenter/"
					onclick="_czc.push(['_trackEvent', '首页', '个人中心未登录', '','','']);"><i></i></a>
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
		<!-- <div class="fault-list fault-list-line">
			<a href="/repair/malfunctions/productTypeId/8"
				onclick="_czc.push(['_trackEvent', '首页', '台式机', '','','']);"> <img
				src="http://d1.lashouimg.com/xiuhaole/x_wap/common/images/index/icon-nav-pc_8dad938.png" />
				<span>台式机</span>
			</a> <a href="/repair/index" data-brand='5'
				onclick="_czc.push(['_trackEvent', '首页', '智能设备', '','','']);"> <img
				src="http://d4.lashouimg.com/xiuhaole/x_wap/common/images/index/icon-nav-device_a82184e.png" />
				<span>智能设备</span>
			</a> <a href="/clean"
				onclick="_czc.push(['_trackEvent', '首页', '安调保养', '','','']);"> <img
				src="http://d3.lashouimg.com/xiuhaole/x_wap/common/images/index/icon-nav-protect_aa0f94c.png" />
				<span>安调保养</span>
			</a>
		</div> -->
		<a href="/index/serveCard"
			onclick="_czc.push(['_trackEvent', '服务卡', '会员特权，终生服务', '','','']);"><img
			style="width: 100%;"
			src="/img/head/life.png" /></a>
		<section class="box hpro-title">
			<span class="box-flex name">精品快剪</span> <a href="/repair/index"
				class="more">更多</a>
		</section>
		<div class="hpro-list">
			<!-- <div class="list_store row">
				<a class="" href="/shear/detail/11">
					<img src="/img/index/yingyezhong.png" class="status">
					<img src="/img/index/dianpu.png" alt="250M" class="shop-img"/>
					<span style="background: none repeat scroll 0 0;color: #fff;letter-spacing:0.5px;;text-align: center;position:absolute;top:35%;margin-left:10px;color:#45b5da" ><b>马上预约</b></span>
				</a>
				
					<p class="shop-title">罗斯福店<span class="shop-text">250M</span></p> 
					<p class="shop-text">营业时间：10:00-21:30</p>
					<p class="shop-text">地址：北京市通州区翠景北里京通罗斯福地下1层</p>
			</div>
			<div class="list_store row">
				<a class="" href="/shear/detail/12">
					<img src="/img/index/yingyezhong.png" class="status">
					<img src="/img/index/dianpu.png" alt="" class="shop-img"/>
				</a>
				<button id="btn">位置</button>
					<p class="shop-title">金源店</p> 
					<p class="shop-text">营业时间：10:00-21:30</p>
					<p class="shop-text">地址：北京市通州区翠景北里1层</p>
				
			</div> -->
		</div>
		<div class="hcustom">
			<a href="tel:400-900-6688"><i></i><span>400-900-6688</span></a>
			<span style="font-size:12px">全国客服热线:09:30－21:00</span>
		</div>
		<div class="hservice">
			<section class="title">
				<span class="name">社区快剪品质保证</span>
			</section>
			<ul class="box">
				<li class="box-flex"><img
					src="http://d1.lashouimg.com/xiuhaole/x_wap/common/images/index/icon-serve1_9a0c17e.png" />
					<span>521G服务</span></li>
				<li class="box-flex"><img
					src="http://d1.lashouimg.com/xiuhaole/x_wap/common/images/index/icon-serve2_e597dc3.png" />
					<span>免费上门服务</span></li>
				<li class="box-flex"><img
					src="http://d4.lashouimg.com/xiuhaole/x_wap/common/images/index/icon-serve4_28c9b73.png" />
					<span>不满意全额退款</span></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/js/zepto.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/touch.js"></script>
	<script type="text/javascript" src="/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="/js/TouchSlide.1.1.js"></script>
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
	    	    type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
	    	    success: function (res) {
	    	    	alert(res);
	    	        var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
	    	        var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
	    	        var speed = res.speed; // 速度，以米/每秒计
	    	        var accuracy = res.accuracy; // 位置精度
	    	        
	    	        //调用 接口获取相关的店铺数据;
	    	        $.post({
	    	        	  url: url,
	    	        	  data: {"latitude":latitude,
	    	        		  	"longitude":longitude},
	    	        	  success: success,
	    	        	  dataType: 'json'
	    	        	}).done(function(data) {
	    	        	    alert( "second success" +data);
	    	        	  })
	    	        	  .fail(function() {
	    	        	    alert( "error" );
	    	        	  })
	    	        	  .always(function() {
	    	        	    alert( "finished" );
	    	        	  });
	    	        
	    	    },
	            cancel: function (res) {
	                alert('用户拒绝授权获取地理位置');
	            },
	            error: function (res) {
	            	alert("定位失败！"); 
	            }
	    	});
	    	
	    }); 
	   
	    
	    
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
		
		
		alert('enter window onload');
		$.ajax({
			type : "POST",
	     	url: url,
	     	data: {"latitude":"39.22",
	      		  	"longitude":"116.33"},
	    	dataType: 'json',
	    	success : function(result){
	      	    alert( "second success" +result);
	      	  	$.each(result,function(n,value) {
		      		var html = '<div class="list_store row">'+
					'<a href="/shear/detail/'+value.id+'">'+
					'<img src="/img/index/yingyezhong.png" class="status">'+
					'<img src="/img/index/dianpu.png" alt="" class="shop-img"/>'+
					'<span style="background: none repeat scroll 0 0;color: #fff;letter-spacing:0.5px;;text-align: center;position:absolute;top:35%;margin-left:10px;color:#45b5da" ><b>马上预约</b></span>'+
					'</a>'+
					'<p class="shop-title">'+value.name+'</p> '+
					'<p class="shop-text">营业时间：'+value.businessHours+'</p>'+
					'<p class="shop-text">地址：'+value.address+'</p>'+
					'</div>';
		      		$('.hpro-list').append(html);
	      	  	});
	    	}
		});
	    
	

	window.onload = function() {
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
		    })};
	});
</script>
</body>
</html>