<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<%@ include file="../common/meta.jsp"%>
<title>订单列表</title>
<link type="text/css" rel="stylesheet" href="/css/common.css">
<link type="text/css" rel="stylesheet" href="/css/order_list.css">
<script src="/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/fastclick.js"></script>
<script type="text/javascript">
	//移动设备快速响应点击事件
	$(document).ready(function() {
		FastClick.attach(document.body);
	})
</script>
<script type="text/javascript" src="/js/zepto.min.js"></script>
<script type="text/javascript" src="/js/TouchSlide.1.1.js"></script>

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
									<c:if test="${empty orderList}">
									<div class="max_box">
										<div class="info_box">
											<img src="/img/my-icon08.png">
											<p>您还没有相关的订单～</p>
										</div>
											</div>
									</c:if>
									<c:if test="${not empty orderList}">
									<div class="total_main">
										<c:forEach items="${orderList}" var="order">
											<c:if test="${order.orderStatus == 1}">
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">订单号:${order.orderId}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">手机号:${order.customerNumber}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">验票码:${order.serviceCode}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">预约时间:${order.appointmentTime}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">门店地址:${order.shopAddress}</p>
												<img src="http://m.qiansishun.com/open/getcode?data_url=5555" style="margin-top:12px;width: 220px;height:220px;"/>
												<p style="font-size: 18px;color: #45b5da;line-height: 30px;">服务时请向发型设计师出示此二维码</p>
												<div class="gap"></div>
										 	</c:if>
										</c:forEach>
										</div>
									</c:if>
						</div>
					</li>

					<!--  等待中  -->
					<li class="li_list">
						<div class="gap"></div>
						<div class="one_order hide_order_li">
						
						<c:if test="${empty orderList}">
									<div class="max_box">
										<div class="info_box">
											<img src="/img/my-icon08.png">
											<p>您还没有相关的订单～</p>
										</div>
											</div>
									</c:if>
									<c:if test="${not empty orderList}">
									<div class="total_main">
										<c:forEach items="${orderList}" var="order">
											<c:if test="${order.orderStatus == 100}">
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">订单号:${order.orderId}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">手机号:${order.customerNumber}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">验票码:${order.serviceCode}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">预约时间:${order.appointmentTime}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">门店:${order.shopName}</p>
												<div class="gap"></div>
										 	</c:if>
										</c:forEach>
										</div>
									</c:if>
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
							<c:if test="${empty orderList}">
									<div class="max_box">
										<div class="info_box">
											<img src="/img/my-icon08.png">
											<p>您还没有相关的订单～</p>
										</div>
											</div>
									</c:if>
									<c:if test="${not empty orderList}">
									<div class="total_main">
										<c:forEach items="${orderList}" var="order">
											<c:if test="${order.orderStatus == 100}">
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">订单号:${order.orderId}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">手机号:${order.customerNumber}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">验票码:${order.serviceCode}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">预约时间:${order.appointmentTime}</p>
												<p style="font-size: 14px;line-height: 23px;padding: 0 15px;">门店:${order.shopName}</p>
												<div class="gap"></div>
										 	</c:if>
										</c:forEach>
										</div>
									</c:if>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="fix_height"></div>


		<!--蒙板-->
		<div id="all_opcation"></div>

		<!--弹窗-->
		<div class="pop_alert">
			<div
				style="font-size: 18px; height: 60px; line-height: 60px; text-align: center"></div>
			<div
				style="font-size: 14px; width: 94%; margin-left: 5%; color: #999999; height: 60px"></div>
			<div
				style="height: 44px; line-height: 44px; text-align: center; font-size: 16px; color: #ff5f08; border-top: 1px solid #dadada;"
				id="pop_alert_close">知道了</div>
		</div>

		<!--高峰时段弹窗-->
		<div class="pop_rush_time">
			<div id="close_rush_time_button" class="rush_time_button">
				<img src="/img/detail/close_1.png" />
			</div>
			<div style="clear: both"></div>
			<div id="opcation" class="rush_time_con" align="center">
				<div
					style="font-size: 18px; height: 26px; line-height: 26px; text-align: center; color: #000">高峰时段</div>
				<div
					style="font-size: 14px; width: 78%; margin-left: 5%; color: #999999; margin-top: 10px; line-height: 23px"
					align="left">现在正处于高峰时段，您可以选择特惠时段下单，享受优惠。</div>
				<a href="javascript:;" class="submit"
					style="width: 252px; border-radius: 4px; margin-top: 70px; height: 42px; line-height: 42px">我要优惠</a>
				<a href="javascript:;" class="defalt" id="close_rush_time">不要优惠，高峰下单</a>
			</div>
		</div>
		<!--  弹窗结束  -->

		<!--navbar start-->
		<!--底部导航栏-->
		<div class="fixed_menu" id="bottom_menu">
			<a
				href="/shear/index"
				class="haircut"> <!--menu_cut_on--> <span
				class="menu_bg menu_cut">剪发</span>
			</a> <a href="javascript:;" class="order_checked"> <span
				class="menu_bg menu_order">订单</span>
			</a> <a
				href="/shear/about"
				class="more"> <span class="menu_bg menu_more">更多</span>
			</a>
		</div>

		<!--底部固定切换状态的js-->
		<script type="text/javascript">
			$(document)
					.ready(
							function() {

								$("#bottom_menu a")
										.click(
												function() {

													var _this = $(this);

													//寻找亮起节点,改为不亮的
													$('#bottom_menu a')
															.each(
																	function() {
																		if ($(
																				this)
																				.hasClass(
																						"haircut_checked")) {
																			$(
																					this)
																					.addClass(
																							"haircut")
																					.removeClass(
																							"haircut_checked");
																		} else if ($(
																				this)
																				.hasClass(
																						"order_checked")) {
																			$(
																					this)
																					.addClass(
																							"order")
																					.removeClass(
																							"order_checked");
																		} else if ($(
																				this)
																				.hasClass(
																						"personal_checked")) {
																			$(
																					this)
																					.addClass(
																							"personal")
																					.removeClass(
																							"personal_checked");
																		} else if ($(
																				this)
																				.hasClass(
																						"more_checked")) {
																			$(
																					this)
																					.addClass(
																							"more")
																					.removeClass(
																							"more_checked");
																		}
																	})

													//自己亮起
													if (_this
															.hasClass("haircut")) {
														_this
																.addClass(
																		"haircut_checked")
																.removeClass(
																		"haircut");
													} else if (_this
															.hasClass("order")) {
														_this
																.addClass(
																		"order_checked")
																.removeClass(
																		"order");
													} else if (_this
															.hasClass("personal")) {
														_this
																.addClass(
																		"personal_checked")
																.removeClass(
																		"personal");
													} else if (_this
															.hasClass("more")) {
														_this.addClass(
																"more_checked")
																.removeClass(
																		"more");
													}
												})
							});
		</script>
		<!--navbar end-->
	</div>
	<!--tab切换部分js-->

	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery
				|| document.write('<script src="/js/jquery-1.8.3.min.js">'
						+ "<" + "/script>");
	</script>
	<!-- <![endif]-->
	<!--[if lte IE 9]>
<script
    type="text/javascript"> window.jQuery || document.write('<script src="assets/javascripts/jquery-1.8.3.min.js">' + "<" + "/script>"); </script>
<![endif]-->

	<!--  页面是否可以分享 f_can_share 0否1是  -->
	<script src="/js/jweixin-1.0.0.js"></script>
	<script>
		var debug = ${debug};
		  //微信jssdk调取地理位置的方法
		    wx.config({
		       debug: debug, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		       appId:'${appid}', // 必填，公众号的唯一标识
		       timestamp:'${timestamp}' , // 必填，生成签名的时间戳
		       nonceStr:'${nonceStr}', // 必填，生成签名的随机串
		       signature:'${sign}',// 必填，签名，见附录1
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
		function is_can_share() {
			if (typeof WeixinJSBridge === 'undefined') {
				if (document.addEventListener) {
					document.addEventListener('WeixinJSBridgeReady',
							onWeixinBridgeReady, false);
				} else if (document.attachEvent) {
					document.attachEvent('WeixinJSBridgeReady',
							onWeixinBridgeReady);
					document.attachEvent('onWeixinJSBridgeReady',
							onWeixinBridgeReady);
				}
			} else {
				onWeixinBridgeReady();
			}
		}

		wx.ready(function() {
			//是否可以分享
			if (f_can_share == 1)
				is_can_share();
		});
	</script>
	<!--  页面是否可以分享  -->

	<script type="text/javascript">
		var page = 'pagenavi';
		var mslide = 'slider';
		//    var mtitle='emtitle';
		arrdiv = 'arrdiv';

		var as = document.getElementById(page).getElementsByTagName('a');

		var tt = new TouchSlider({
			id : mslide,
			'auto' : '-1',
			fx : 'ease-out',
			direction : 'left',
			speed : 300,
			timeout : 5000,
			'before' : function(index) {
				var as = document.getElementById(this.page)
						.getElementsByTagName('a');
				as[this.p].className = '';
				as[index].className = 'active';
				this.p = index;
				var txt = as[index].innerText;
				//        $("#"+this.page).parent().find('.emtitle').text(txt);
				var txturl = as[index].getAttribute('href');
				var turl = txturl.split('#');
				//        $("#"+this.page).parent().find('.go_btn').attr('href',turl[1]);
			}
		});

		tt.page = page;
		tt.p = 0;
		//console.dir(tt); console.dir(tt.__proto__);
		for (var i = 0; i < as.length; i++) {
			(function() {
				var j = i;
				as[j].tt = tt;
				as[j].onclick = function() {
					this.tt.slide(j);
					return false;
				}
			})();
		}
	</script>

	<script type="text/javascript">
		var len = '${fn:length(orderList)}';
		
		var screen_height = $(window).height() + (len-1) *300
				- $("#pagenavi li").height();
		$(".li_list").css({
			"min-height" : screen_height + "px",
			"line-height" : screen_height + "px",
			"text-algin" : "center"
		});

		//调出知道了浮层
		function pop_alert(title, content) {
			$("#all_opcation,.pop_alert").show();

			$(".pop_alert").find("div:eq(0)").html(title);
			$(".pop_alert").find("div:eq(1)").html(content);
		}

		//关闭浮层
		function close_pop_alert() {
			$("#all_opcation,.pop_alert").hide();
		}

	</script>
</body>
</html>