(function (doc, win) {
// 分辨率Resolution适配
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            docEl.style.fontSize = 200 * (clientWidth / 1080) + 'px';
        };

// Abort if browser does not support addEventListener
    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);

// 一物理像素在不同屏幕的显示效果不一样。要根据devicePixelRatio来修改meta标签的scale,要注释上面的meta标签
    (function () {
        return;
        var dpr = scale = 1;
        var isIPhone = win.navigator.appVersion.match(/iphone/gi);
        var devicePixelRatio = win.devicePixelRatio;
        if (isIPhone) {
// iOS下，对于2和3的屏，用2倍的方案，其余的用1倍方案
            if (devicePixelRatio >= 3 && (!dpr || dpr >= 3)) {
                dpr = 3;
            } else if (devicePixelRatio >= 2 && (!dpr || dpr >= 2)) {
                dpr = 2;
            } else {
                dpr = 1;
            }
        } else {
// 其他设备下，仍旧使用1倍的方案
            dpr = 1;
        }
        scale = 1 / dpr;
        var metaEl = "";
        metaEl = doc.createElement('meta');
        metaEl.setAttribute('name', 'viewport');
        metaEl.setAttribute('content', 'initial-scale=' + scale + ', maximum-scale=' + scale + ', minimum-scale=' + scale + ', user-scalable=no');
        if (docEl.firstElementChild) {
            docEl.firstElementChild.appendChild(metaEl);
        } else {
            var wrap = doc.createElement('div');
            wrap.appendChild(metaEl);
            doc.write(wrap.innerHTML);
        }
    })();
})(document, window);

function tanSwitch(a, name) {
    $(a).addClass("active").siblings().removeClass("active");
    $(a).parent().next().find("." + name).show().siblings().hide();
}

/*
 * 获取url参数
 */
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

/*
 * 验证是否是有效手机号
 * 正则制作日期2015.4.30，
 * 注意该正则的实时使用性，添加新的号段
 * */
function isRealPhone(mobile) {
    var patten1 = /^1(3[456789]{1}|47|5[012789]{1}|78|8[23478]{1})\d{8}$/;   //移动
    var patten2 = /^1(3[012]{1}|45|5[56]{1}|76|8[56]{1})\d{8}$/;             //联通
    var patten3 = /^1(33|53|77|8[019]{1})\d{8}$/;                            //电信
    var patten4 = /^170\d{8}$/;                                              //虚拟运营商
	var patten5 = /^17\d{9}$/;                                              //虚拟运营商

    if (patten1.test(mobile)) {
        return 1;
    } else if (patten2.test(mobile)) {
        return 2;
    } else if (patten3.test(mobile)) {
        return 3;
    } else if (patten4.test(mobile)) {
        return 4;
    } else if (patten5.test(mobile)) {
        return 4;
    } else {
        return false;
    }
}
/*
 * 验证身份证
 * */
function is_identity(str) {
    var str = str.replace(/[ ]/g, "");
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    return reg.test(str);
}
/*
 * 验证银行卡号
 * */
function is_bankcard(str) {
    var cardNum = str.replace(/[ ]/g, "");
    var reg1 = /^[0-9]{15,19}$/;
    return reg1.test(cardNum);
}
/*
 * 验证是否姓名
 * */
function is_name(str) {
    var reg = /^[\u4e00-\u9fa5]{2,20}$/;
    return reg.test(str);
}
/*
 * 验证字符串是否是整数串
 * sText String
 * return Boolen
 * */
function isNumeric(sText) {
    var ValidChars = "0123456789";
    var IsNumber = true;
    var Char;
    if (isNaN(sText)) {
        IsNumber = false;
    } else {
        for (i = 0; i < sText.length && IsNumber == true; i++) {
            Char = sText.charAt(i);
            if (ValidChars.indexOf(Char) == -1) {
                IsNumber = false;
            }
        }
        if (String(parseInt(sText)).length < String(sText).length) {
            IsNumber = false;
        }
    }

    return IsNumber;
}

function isEmail(str) {
    var reg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    return reg.test(str);
}

function isYZM(str) {
    var reg = /^[a-zA-Z0-9_-]{4}$/;
    return reg.test(str);
}

/*
 * 判断某个值是否在数组中
 * @param String str
 * @param Array  arr
 * @return  true 是/ false 否或输入错误
 * */
function inArray(str, arr) {
    if ((arr instanceof Array)) {
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] == str) {
                return true;
            }
        }
    }
    return false;
}


/*
 * 输入框过滤html代码
 */
function removeHTMLTag(str) {
    str = str.replace(/<\/?[^>]*>/g, ''); //去除HTML tag
    str = str.replace(/[ | ]*\n/g, '\n'); //去除行尾空白
    str = str.replace(/&#x20;/ig, ''); //去掉&#x20;
    return str;
}

/*
 @param String name  cookie名  （必须）
 @param String value cookie值  （必须）
 @param term         cookie存活时间(必须)  时间秒数/年数
 * */
function setCookie(name, value, term) {

    var param1 = name + '=' + escape(value) + ';';

    expires = new Date();
    if (!term) {
        term = 1;
    }
    expires.setTime(expires.getTime() + (1000 * 86400 * 30) * term);
    var param2 = 'expires=' + expires.toUTCString() + ';';
    document.cookie = param1 + param2 + ';path=/';
}

function getCookie(name) {
    var cookie_name = name + '=';
    var cookie_length = document.cookie.length;
    var cookie_begin = 0;
    while (cookie_begin < cookie_length) {
        var value_begin = cookie_begin + cookie_name.length;
        if (document.cookie.substring(cookie_begin, value_begin) == cookie_name) {
            var value_end = document.cookie.indexOf(';', value_begin);
            if (value_end == -1) {
                value_end = cookie_length;
            }
            return unescape(document.cookie.substring(value_begin, value_end))
        }
        cookie_begin = document.cookie.indexOf(' ', cookie_begin) + 1;
        if (cookie_begin == 0) {
            break;
        }
    }
    return null;
}

function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) {
        document.cookie = name + '=' + cval + ';path=/;expires=' + exp.toUTCString();
    }
}

/**
 *
 * @param {Object} msg
 * @param {Object} class_name
 * @param {Object} scroll_status
 * @param {Object} animate_status
 * @param {Object} toast 是否为吐司提示 1、0
 */
function msg_tit_common(msg, class_name, scroll_status, animate_status, toast) {

    if (!toast) {
        if (msg) {
            $("." + class_name).html(msg);
            $("." + class_name).show();
            if (animate_status) {
                error_msg_ani(class_name);
            }
            if (scroll_status) {
                $('body,html').animate({scrollTop: 0}, 500);
            }
        } else {
            $("." + class_name).html('');
            $("." + class_name).hide();
        }
    } else {

        if (msg) {
            var html = '<div class="tips-prompt">\
			<span class="name"></span>\
			<span class="bg"></span>\
		</div>';

            if ($('div.tips-prompt').length == 0) {
                $('body').append(html);
            }

            var $tipsPrompt = $('div.tips-prompt');
            $tipsPrompt.find('span.name').text(msg);
            // 追加页面吐司部分
            $(".tips-prompt").fadeIn();
            setTimeout(function () {
                $(".tips-prompt").fadeOut();
            }, 6000);
        }
    }
}
/**
 * 弹窗提示，有确认按钮
 * bottomText 确定按钮文字，默认是“确定”
 * callback 点击确定按钮回调函数
 */
function msg_alert(msg, bottomText, callback) {
    var body = $(document.body), pop_wrap = $('div.pop-warp');
    if (pop_wrap.length) {
        pop_wrap.find('.pop-content p').text(msg).end().show().find('.pop-bottom a').text(bottomText || '确定');
    } else {
        body.append(
            $('<div class="pop-warp">').append(
                $('<div class="pop">').append(
                    $('<div class="pop-content">').append(
                        $('<p>').text(msg)
                    ),
                    $('<div class="pop-bottom">').append(
                        $('<a href="#"></a>').text(bottomText || '确定').click(function (e) {
                            e.preventDefault();
                            $(this).parents('div.pop-warp').remove();
                            callback && typeof callback === 'function' && callback();
                        })
                    )
                )
            )
        );
    }
}
/**
 * 弹窗确认
 * @param msg
 * @param bottomText 确定按钮文字，默认“确定”
 * @param confirmCallback 确认回调
 * @param cancelCallback  取消回调
 */
function msg_confirm(msg, bottomText, confirmCallback, cancelCallback) {
    msg_alert(msg, bottomText, confirmCallback);
    $('div.pop-warp .pop-bottom').append(
        $('<a href="#"></a>').text('取消').click(function (e) {
            e.preventDefault();
            $(this).parents('div.pop-warp').remove();
            cancelCallback && typeof cancelCallback === 'function' && cancelCallback();
        })
    );
}
