$(function () {
    /*    window.setTimeout(function(){
     $("#loading").remove();
     $("#warp").css("display", "block");
     },300);*/
//    $("#loading").remove();
//    $("#warp").css("display", "block");

//    localStorage.removeItem('faultItems');//清除故障记录
//    localStorage.removeItem('repairInfoSave');//清提交联系方式页信息
//    delCookie('repair_s1');//选择设备型号页面
//
//    var $dataFaults = $('a[data-fault]');
//    var $dataBrand = $('a[data-brand]');
//
//    $dataFaults.click(function () {
//        var faultId = $(this).attr('data-fault');
//        var brandId = $($('a[data-brand]')[0]).attr('data-brand');
//        //----------start localstorage-----------------------//
//        localStorage.setItem('faultItems', faultId);//故障
//        localStorage.setItem('brandId', brandId);//机型
//        //----------end localstorage-----------------------//
//    });
//    $dataBrand.click(function () {
//        var brandId = $(this).attr('data-brand');
//        //console.log(brandId);
//        //----------start localstorage-----------------------//
//        localStorage.setItem('brandId', brandId);
//        //----------end localstorage-----------------------//
//    });

      var pauseTime = 5000;//间隔5秒轮播一次
     var bannerTimeout, bannerIndex = 0;
     var bannerCount = $('.slider-page span').length;
     
     $("#banner span").bind('slide click touchstart', function (e) {
     bannerIndex = $(this).attr('data-index') - 0;
     $('#banner .slider-ul li').filter(':visible').fadeOut(500).end().eq(bannerIndex).fadeIn(1000);
     $(this).addClass('active').siblings().removeClass('active');
     return false;
     });
     
     $('#banner').bind('mouseenter', function () {
     if (bannerTimeout) {
     clearInterval(bannerTimeout);
     bannerTimeout = null;
     }
     }).bind('mouseleave2', slideBanner).trigger('mouseleave2');
     
     $(document).bind('tapCancel', slideBanner);
     
     function slideBanner(e) {
     if (!bannerTimeout && bannerCount > 1) {
     bannerTimeout = setInterval(slideList, pauseTime);
     }
     if (e.type == 'swipeLeft' && bannerIndex > 0) {
     slideList(bannerIndex - 1);
     } else if (e.type == 'swipeRight' && bannerIndex < bannerCount - 1) {
     slideList(bannerIndex + 1);
     }
     }
     
     function slideList(index) {
     if (typeof index === 'number') {
     index = Math.max(0, Math.min(bannerCount - 1, index));
     } else {
     index = bannerIndex >= (bannerCount - 1) ? 0 : (bannerIndex + 1);
     }
     $('.slider-page span[data-index="' + index + '"]').trigger('slide');
     }
     

    //定位start
//    
//     function location(){
//     var ak = 'HAPR0UdtF5C85lfVbRmUgAzP';    //百度应用密钥
//     var post_reverse = 'http://api.map.baidu.com/geocoder/v2/?ak=' + ak + '&callback=renderReverse';
//     
//     if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function (position) {
//     var coords = position.coords;
//     var script = document.createElement('script');
//     script.type = 'text/javascript';
//     script.src = post_reverse + '&location=' + coords.latitude + ',' + coords.longitude + '&output=json&pois=0';
//     document.body.appendChild(script);
//     }, function (error) {
//     //            alert(error);
//     var city = "南京";
//     city = encodeURI(city);
//     var province = "江苏";
//     province = encodeURI(province);
//     var district = "六合";
//     district = encodeURI(district);
//     
//     var preCity = getCookie("currCity");
//     
//     if (preCity != city) {
//     setCookie('currCity', city, 1);
//     setCookie('currProvince', province, 1);
//     setCookie('currDistrict', district, 1);
//     //console.log("currCity2 = " + city);
//     }
//     switch (error.code) {
//     case error.PERMISSION_DENIED: //拒绝位置服务
//     break;
//     case error.POSITION_UNAVAILABLE: //位置信息获取失败
//     break;
//     case error.TIMEOUT: //获取位置信息超时
//     break;
//     default :
//     break;
//     }
//     });
//     }
//	 }
//     
     
     //定位end
     

    //城市确认
//    $.ajax({
//        type: 'get',
//        url: '/common/getlocation',
//        dataType: 'json',
//        data: '',
//        success: function (data) {
//            if (data.code == 200) {
//                var openCityArr = data.businessObj.citys;
//                if (data.businessObj.preCity == '') {
//                    var preCity = '南京';
//                } else {
//                    var preCity = data.businessObj.preCity;
//                }
//                console.log("preCity" + preCity);
//                var currCity = encodeURI(preCity);
//                setCookie('currCity', currCity, 2);
//            }
//        }
//    });
});

function renderReverse(response) {
    if (response.status) {
        //无正确的返回结果
        return;
    }
    var result = response.result;
    if (result && result.addressComponent && result.addressComponent.city && result.addressComponent.province && result.addressComponent.district) {
        //$('.city').text(result.addressComponent.city.replace(/市/, ''));
        //$('.province').text(result.addressComponent.province.replace(/省/, ''));
        //$('.district').text(result.addressComponent.district.replace(/区/, ''));

//        if (!getCookie('showCitys')) {
//            var currCity = result.addressComponent.city;
//            setCookie('showCitys', currCity, 1);
//        }


        var city = result.addressComponent.city.replace(/市/, '');
        city = encodeURI(city);
        //console.log(city);
        var province = result.addressComponent.province.replace(/省/, '');
        province = encodeURI(province);
        var district = result.addressComponent.district.replace(/区/, '');
        district = encodeURI(district);
        var preCity = getCookie("currCity");

        // console.log("preCity = " + preCity);
        //console.log("currCity = " + city);

        if (preCity != city) {
            setCookie('currCity', city, 1);
            setCookie('currProvince', province, 1);
            setCookie('currDistrict', district, 1);
            //console.log("currCity2 = " + city);
        }
    }
}
