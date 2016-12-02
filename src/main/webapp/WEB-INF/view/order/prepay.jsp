<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<%@ include file="../common/meta.jsp"%>
    <title>用户结算</title>
    <link type="text/css" rel="stylesheet" href="/css/common.css">
    <link type="text/css" rel="stylesheet" href="/css/new_pay_order.css" />
    <style type="text/css">
 .login-mobile{
	display: none;
}
.login-input{
	display: -webkit-box;
	margin-top: 0.35rem;
	height: 50px;
	padding: 0 0.245rem;
	border-top: 1px solid #CCC;
	border-bottom: 1px solid #CCC;
	background-color: #FFF;
}
.container .login-input:first-child{
	margin-top: 0;
}
.login-input input{
	display: block;
	width: 100%;
	height: 100%;
	font-size: 1.2rem;
	color: #45b5da;
	background-color: transparent;
	border: none;
	-webkit-box-flex: 1;
}
.dtm-img {
    width: 8rem;
    height: 100%;
    line-height: 0.82rem;
    margin-right: -0.245rem;
    font-size: 1.0rem;
}

.dtm-img a {
    display: block;
    width: 100%;
    height: 100%;
    line-height: 50px;
    text-align: center;
    background-color: #45B5DA;
    color: #FFF;
}

.dtm-img a.disabled {
    background-color: #DDD;
    color: #777;
}
    ::-moz-placeholder{color:#FF8037;}  
    :-ms-input-placeholder{color:#FF8037;} 
    ::-webkit-input-placeholder{color:#FF8037;}
    </style>
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/fastclick.js"></script>
    <script src="/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            //移动设备快速响应点击事件
            FastClick.attach(document.body);

            $('.balance').click(function(){
                $(".balance_right").fadeIn();
                $(".WeChat_right").fadeOut();
            });
            $('.WeChat').click(function(){
                $(".WeChat_right").fadeIn();
                $(".balance_right").fadeOut();
            });
            //选择支付方式 -- todo 这里会先注释掉
            $('#list_group_right').click(function(){
                if($(".list_group_hidden").css('display')=='none')
                {
                    $("#list_group_right img").attr("src","/img/detail/up.png");
                    $("#list_group_right span").hide();
                    $(".list_group_hidden").fadeIn();
                }else
                {
                    $("#list_group_right img").attr("src","/img/detail/left.png");
                    $("#list_group_right span").show();
                    $(".list_group_hidden").fadeOut();
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
		
    <p class="store_name_id">${shop.name}</p>
    <div class="order_info">
        <div class="store_img">
            <img src="/img/index/dianpu.png"/>
        </div>
        <div class="store_text">
            <p>预约时段：${order.appointmentDay}&nbsp;${order.appointmentTime} </p>
            <p>等待人数：${count}</p>
            <p>预计等待：${count+5}分钟</p>

<!--预约的话表现形式为： <p>预约时间：11:30（选择的时间）</p>-->
        </div>
    </div>
    <div class="gap"></div>
    <div class="info_list">
                <a href="javascript:;">
            <div class="info_one">
<!--                <hr style="background: #dadada;height: 1px;border: none"/>-->
                <span></span><img src="/img/detail/payment_method_icon.png"/>
                <span class="checked_title">支付方式</span>
                <div class="checked_info_main">
                    <span class="checked_info">微信支付</span>
                </div>
            </div>
        </a>
    </div><!--选择信息列表End-->
    <div class="gap"></div>
    
    <c:if test="${empty user}">
    	<div class="caption">
        <img src="/img/detail/input-icon.png"/>
        <span>请输入您的联系方式</span>
    	</div>
        <div class="login-input">
			<input type="tel" placeholder="请输入手机号" id="mobile" maxlength="11">
		</div>
		<div class="login-input input-yzm">
			<input type="text" placeholder="请输入动态码" id="dynamic_input">
			<div class="dtm-img">
				<a href="javascript:void(0);" id="getCode">获取动态码</a>
			</div>
		</div>
    </c:if>
    <c:if test="${user ne null}">
    <div class="caption">
        <img src="/img/detail/input-icon.png"/>
        <span>您的联系方式:${user.phoneNumber}</span>
    	</div>
    </c:if>
    <div class="gap"></div>
    <div class="caption">
        <img src="/img/detail/address_pink_icon.png"/>
        <span>门店地址</span>
    </div>
    <div class="store_info">
        <ul>
            <li>${shop.address}</li>
            <li>营业时间：${shop.businessHours}</li>
        </ul>
    </div>
    <div class="bottom_height"></div>
    <div class="fixed_menu">
        <div class="amount"><span class="all_price">合计 29.8元</span><span class="discount_label">已优惠0元</span></div>
        <div class="payment_btn pay_order pay_order_now">
            <a href="javascript:;">立即支付</a>
        </div>
    </div><!--底部固定End-->
</div>
<script type="text/javascript">
    var customerId = '${order.customerId}';//uerid

    var appointmentTime = '${order.appointmentTime}';//预约时间（时：分）
    var appointmentDay = '${order.appointmentDay}';//预约日期
    var hairstyleId = '${order.hairstyleId}';//发型ID
    var f_date      = '0';
	var time        = '1478760519';//时间
    var token   = '7928b2e7aa8b982a3315bd6935d129f7';//token
    var shopId   = '${order.shopId}';//店铺ID
    var f_selected_ticket_type   = '1';//票类型,1为全天票,2为限制时段票 3预约票
    var f_card_detail_id = '0';//会员卡ID
    var f_coupon_detail_id = '0';//优惠券ID
    var f_flag = '0';//优惠类型 1优惠券 2会员卡
    var f_coupon_price = '0';//优惠金额
    var ticket_num = '1';//票数
    var total_price = '29.8';//票价
    var is_check_coupon = '0';
    var is_check_card = '0';
    
    var url_getcode='/shear/order/sms/';
    var valide_code = '';
    
    //@TODO
    var param = {
        "customerId": '317926',
        "time": '1478760519',
        "token": '7928b2e7aa8b982a3315bd6935d129f7',
        "shopId": shopId,
        "f_selected_ticket_type": '1',
        "appointmentTime": '',
        "appointmentDay": '',
        "hairstyleId": '',
        "f_date": '0',
        "f_card_detail_id": '0',
        "f_coupon_detail_id": '0',
        "f_flag": '0',
        "total_price": '29.8',
        "ticket_num": '1',
        "is_check_coupon": '0',
        "is_check_card": '0',
    };



    //微信支付
    function onBridgeReady(jsApiParameters, out_trade_no)
    {
        WeixinJSBridge.invoke(
            'getBrandWCPayRequest',{
                "appId"     :   jsApiParameters.appId,      //公众号名称，由商户传入
                "timeStamp" :   jsApiParameters.timeStamp,      //时间戳，自1970年以来的秒数
                "nonceStr"  :   jsApiParameters.nonceStr,      //随机串
                "package"   :   jsApiParameters.packageValue,
                "signType"  :   jsApiParameters.signType,      //微信签名方式：
                "paySign"   :   jsApiParameters.sign       //微信签名
            },
            function(res){
                if(res.err_msg == "get_brand_wcpay_request:ok" )
                {
                    //微信支付成功，这边要主动查询订单
                    alert("支付成功！");

                    setTimeout(function(){
                        location.href = "/shear/order/list?out_trade_no=" + out_trade_no + '&customerId=' + customerId + '&time=' + time + '&token=' + token + '&shopId=' + shopId;
                    },1500);
                }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                else
                {
                    alert("支付失败！");
                    $(".pay_order").addClass("pay_order_now");
                    $(".pay_order").css("background", "#45b5da");
                }
            }
        );
    }

    function callpay(jsApiParameters, out_trade_no)
    {
        if (typeof(WeixinJSBridge) == "undefined"){
            if( document.addEventListener ){
                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
            }else if (document.attachEvent){
                document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
            }
        }
        else
        {
            onBridgeReady(jsApiParameters, out_trade_no);
        }
    }

    //支付宝支付
    function zfb_click(trade_no, out_trade_no)
    {
        AlipayJSBridge.call("tradePay",{
            tradeNO: trade_no
        }, function(result){
            //'9000':订单支付成功; '8000':正在处理中; '4000':订单支付失败; '6001':用户中途取消; '6002':网络连接出错 '99':用户点击忘记密码快捷界面退出(only  iOS since 9.5)
            if(result.resultCode == 9000)
            {
                alert("支付成功！");//callbackUrl

                setTimeout(function(){
                    location.href = "/mobile3/order_list?out_trade_no=" + out_trade_no + '&customerId=' + customerId + '&time=' + time + '&token=' + token + '&shopId=' + shopId;
                },1500);
            }
            else
            {
                alert("支付失败！");
                $(".pay_order").addClass("pay_order_now");
                $(".pay_order").css("background", "#45b5da");
            }

        })
    }

    $(document).ready(function(){
        $(".info_one").mouseover(function(){
            $(".info_one").removeClass("info_one_active");//移除所有.handle的active类
            $(this).addClass("info_one_active");//再将滑倒的这个添加上active类
        });

        $(".info_one").mouseout(function(){
            $(this).removeClass("info_one_active");
        });
        //            商品多选
        $(".product_group").click(function() {
            if ($(this).find(".option_default").hasClass("option"))
            {
                $(this).find(".option_default img").fadeOut();
                $(this).find(".option_default").removeClass("option");
            }
            else
            {
                $(this).find(".option_default img").fadeIn();
                $(this).find(".option_default").addClass("option");
            }

            //获取选取商品ID集合
            var product_ids = "";//商品ID
            var product_price_total = 0;//商品价格
            $(".option").each(function(){
                if(product_ids == "")
                {
                    product_ids = $(this).attr("product_id");
                }
                else
                {
                    product_ids = product_ids + "," + $(this).attr("product_id");
                }
                product_price_total = product_price_total + parseFloat($(this).attr("product_price"));
            });

            $("#f_product_price").val(product_price_total);
            var all_price = parseFloat(total_price) + product_price_total - parseFloat(f_coupon_price);
            $(".all_price").html("合计"+all_price.toFixed(2)+"元");
            $("#f_product_ids").val(product_ids);

        });

        //点击选取优惠券
        $("#coupon_detail").click(function(){
            if(f_coupon_detail_id>0)//判断是否有可用优惠券
            {
                var url_prefix = "/mobile3/use_coupon";
                var url_subfix = $.param(param);
                location.href = url_prefix+"?"+url_subfix;
            }
        });

        $("#getCode").click(function(){
        	var _this = $(this);
        	 var phone = $('#mobile').val();
        	 if(phone == ''){
        		 alert('请输入您的手机号');
        	 }else{
        			$.ajax({
        				type : "POST",
        		     	url: url_getcode,
        		     	data: "phone="+phone,
        		    	dataType: 'text',
        		    	beforeSend: function()
                        {
        		    		_this.addClass("disabled");
                        },
        		    	success : function(result){
        		    		pop_close();
        		    		valide_code=result;
        		    		time(_this);
        		    	}
        		    });
        		}
        		
        });

        var wait=60;
		function time(o) {
	        if (wait == 1) {
	        	o.removeAttr("disabled");
	        	o.removeClass("disabled");
	        	o.html("获取动态码");
	            wait = 60;
	        } else {
	        	o.addClass("disabled");
	    		o.attr("disabled", "true");
	        	o.html("重新发送短信(" + wait + ")");
	            wait--;
	            setTimeout(function() {
	                time(o)
	            },1000)
	        }
		}
        
        
        //支付请求
        $(".pay_order").click(function()
        {
            var _this = $(this);
            if(_this.hasClass("pay_order_now"))
            {
                var f_product_ids = $("#f_product_ids").val();
                var f_flag = 0;//注：这个flag为判断支付优惠方式为0无 1优惠券 2会员卡 和上面flag意义不同
                if(is_check_coupon == 1 && f_coupon_detail_id>0)
                {
                    f_flag = 1;
                }
                if(is_check_card == 1 && f_card_detail_id>0)
                {
                    f_flag = 2;
                }

                $.ajax({
                    url:"/shear/order/pay",
                    type:"POST",
                    dataType:"json",
                    data:{"customerId":customerId,
						"shopId":shopId,
						"appointmentTime":appointmentTime,
						"appointmentDay":appointmentDay,
						"hairstyleId":hairstyleId,
						
						
					},
                    beforeSend: function()
                    {
                        _this.removeClass("pay_order_now");
                        _this.css("background", "#ccc");
                    },
                    success: function(content)
                    {
                        /* if(content.error == 0)
                        {
                            //这里需要加层判断，如果全部抵扣，则已经创建完成订单和排队号，否则再去微信支付。
                            //1
                            if(content.reason == 1)
                            {
                                alert("支付成功！");
                                location.href = "/shear/order/list?out_trade_no=" + content.out_trade_no + '&customerId=' + customerId + '&time=' + time + '&token=' + token + '&shopId=' + shopId;
                            }
                            else if(content.reason == 2)    //todo 这里判断到底是调用微信支付还是支付宝支付
                            {
                                if(content.html.mobile_type == 1)
                                {
                                    callpay(content.html.jsApiParameters, content.html.out_trade_no);
                                }
                                else
                                {
                                    zfb_click(content.html.trade_no, content.html.out_trade_no);
                                }
                            }
                        }
                        else
                        {
                            alert(content.msg);
                            $(".pay_order").addClass("pay_order_now");
                            $(".pay_order").css("background", "#45b5da");
                        } */
                        
                        if(content.retCode == 0){
                        	if(parseInt(content.payInfo.agent)<5){  
                                alert("您的微信版本低于5.0无法使用微信支付");  
                                return;  
                            }  
                    	callpay(content.payInfo, content.html.out_trade_no);
                        }else{
                        	console.log('支付有问题了...');
                        	//@TODO
                        }
                        
                    }
                });
            }
        });

    });
</script>
</body>