<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
   	<%@ include file="common/meta.jsp"%>
    <title>时间预约</title>
    <script src="/js/detail/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/detail/common.js"></script>
    <script type="text/javascript" src="/js/detail/fastclick.js"></script>
    <script type="text/javascript">
        //移动设备快速响应点击事件
        $(document).ready(function(){
            FastClick.attach(document.body);
        })
    </script>
    <script type="text/javascript" src="/js/detail/btn_active.js"></script>
    <link type="text/css" rel="stylesheet" href="/js/detail/common.css">
    <style type="text/css">
        .fixed_top{width:100%; max-width:640px;background: #fff; position:fixed;top: 0;padding: 1.5rem 0 0 0;text-align: center;font-size: 1.2rem;color: #45b5da;  border-bottom: 1px solid rgba(0,0,0,.1);}
        p.appointment_title{color: #333; margin-bottom: 1.5rem;}
        .checked_time{width: auto; text-align:center}
        .checked_time span{ padding: 0 2rem 1rem 2rem;border-bottom: 1px solid #45b5da;margin: 0 auto;text-align:center}
        span#txt{padding: 0;border: none}
        .checked_time img{width: 1.2rem;display:inline-block;margin-right: 1rem; margin-top: 0.25rem;}
        .checked_time_tips img{width: 0.3rem;display:inline-block;margin-right: 1rem; margin-bottom: 0.25rem;}
        p.checked_time_tips{font-size: 1.1rem;margin-top: 2rem; color: #999;}
        .checked_date{border-top: 1px solid rgba(0,0,0,.1);margin-top: 1.2rem}
        .one_day,.one_time_slot{float:left;width:20%;font-size: 1.1rem; padding: 0.5rem 0}
        .one_day p{color: #999;}
        p.date{color: #333;font-size: 1.2rem;}
        .checked_time_slot{ margin-top: 15.3rem;text-align: center;margin-bottom: 6rem}
        .one_time_slot{width:16%;padding: 2% 2% 5rem 2%}
        .one_time_slot span{border: 1px solid #45b5da; color: #45b5da; padding: 5px;display: inherit;margin: 0.5rem auto;border-radius: 5px;}
        span.not_checked{border: 1px solid #fff;color: #999;}
        span.time_checked{background:#45b5da;color: #fff;}
    </style>

</head>

<body>
<div class="container">
    <div class="fixed_top">
        <p class="appointment_title">选择预约时间</p>
        <div class="checked_time">
           <span><img src="/js/detail/appointment_title.png"><span class="current_date" style="padding:0;border: 0;">请选择时间</span><span id="checked_time" style="display: none"></span> </span>
        </div>
        <p class="checked_time_tips"><img src="/js/detail/list_style_solid.png">选好时段在此期间到店体验</p>
        <div class="checked_date">
            <li class="one_day">
                <p class="date"><fmt:formatDate value="${t1}" pattern="d"/></p>
                <p>今天</p>
            </li>
            <li class="one_day">
                <p class="date"><fmt:formatDate value="${t2}" pattern="d"/></p>
                <p>明天</p>
            </li>
            <li class="one_day">
                <p class="date"><fmt:formatDate value="${t3}" pattern="d"/></p>
                <p><fmt:formatDate value="${t3}" pattern="EEEE"/></p>
            </li>
            <li class="one_day">
                <p class="date"><fmt:formatDate value="${t4}" pattern="d"/></p>
                <p><fmt:formatDate value="${t4}" pattern="EEEE"/></p>
            </li>
            <li class="one_day">
                <p class="date"><fmt:formatDate value="${t5}" pattern="d"/></p>
                <p><fmt:formatDate value="${t5}" pattern="EEEE"/></p>
            </li>
        </div>
    </div>
    <div class="checked_time_slot">
        <input  value="" id="appointment_time" type="hidden"/>
        <input  value="" id="appointment_day" type="hidden"/>
        
        <c:forEach items="${avaiDate}" var="item">
        	<div class="one_time_slot" date="<fmt:formatDate value="${item.key}" pattern="M月d号"/>">
    			<c:forEach items="${item.value}" var="value">
                	<span <c:if test="${value lt t1}" >class="not_checked"</c:if> appointment_day="<fmt:formatDate value="${value}" pattern="yyyy-MM-dd"/>"><fmt:formatDate value="${value}" pattern="HH:mm" /></span>
             	</c:forEach>
            </div>
		</c:forEach>
    </div>
    <div class="bottom_height"></div>
    <div class="fixed_menu">
        <a href="javascript:;" class="pink_btn cancel_button" id="default">不预约</a>
        <a href="javascript:;" class="blue_btn confirm_button" id="submit">选择</a>
    </div><!--底部固定End-->
</div>
<script type="text/javascript">
    var customerId = '${order.customerId}';
    var time        = '1478159349';
    var get_token   = '7eb3fbd5383bf37489b71a318c0e3f98';
    var shopId   = '${order.shopId}';
    var hairstyleId =  '${order.hairstyleId}';

    var ticket_num =  '1';
    var f_selected_ticket_type =  '1';

    $(document).ready(function(){
        $(".one_time_slot span").click(function(){
            if($(this).hasClass("not_checked"))
            {
                alert("该时间段已经离我们远去了~");
                $(this).removeClass("time_checked");
            }
            else
            {
                $("#appointment_day").val($(this).attr("appointment_day"));
                $("#appointment_time").val($(this).html());
                $(".one_time_slot span").each(function(){
                    $(this).removeClass("time_checked");
                })
                $(this).addClass("time_checked");
                $(".current_date").html($(this).parent().attr("date"));
                $("#checked_time").html($(this).text());
                $("#checked_time").show();
            }

        })

        //取消预约
        $("#default").click(function(){

            var url_params = {
                'customerId'             :   customerId,
                'time'                  :   time,
                'get_token'             :   get_token,
                'shopId'            :   shopId,
                'hairstyleId'             :   hairstyleId,
                'f_appointment_day'     :   '',
                'f_appointment_time'    :   '',
                'f_selected_ticket_type' :  1,
            };

            pop_up_loading();

            var url_prefix = '/mobile3/store_detail';
            var url_subfix = $.param(url_params);

            var url = url_prefix + '?' + url_subfix;
            location.href = url;
        });

        //选定时间
        $("#submit").click(function(){
            var f_appointment_day = $("#appointment_day").val();
            var f_appointment_time = $("#appointment_time").val();
            f_selected_ticket_type = 3;
            if(f_appointment_day==null || f_appointment_day=='' || f_appointment_time==null || f_appointment_time=='')
            {
                alert("请选择预约时间");
                return false;
            }

            var url_params = {
                'customerId'             :   customerId,
                'time'                  :   time,
                'get_token'             :   get_token,
                'shopId'            :   shopId,
                'hairstyleId'             :   hairstyleId,
                'appointmentDay'     :   f_appointment_day,
                'appointmentTime'    :   f_appointment_time,
                'f_selected_ticket_type' :  f_selected_ticket_type,
            };

            pop_up_loading();

            var url_prefix = '/shear/detail/'+shopId;
            var url_subfix = $.param(url_params);

            var url = url_prefix + '?' + url_subfix;
            location.href = url;
            
        });

    });
</script>

</body>
</html>
