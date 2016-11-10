/*
 * Plugin Name: 3dEye | Version: 1.0.0
 * Author: www.voidcanvas.com | Paul Shan
 * Maintained By: voidcanvas.com
 * License: MIT
 */

(function(e) {
    e.fn.extend({
        vc3dEye: function(t) {
            new e.vc3dEye(this, t);
            return
        }
    });
    e.vc3dEye = function(t, n) {
        function h(e, t) {
            u = e;
            a = t.imagePath;
            i = t.totalImages;
            c = t.imageExtension
        }
        function p() {
            e(f).mousedown(function() {
                s = true;
            });
            e(document).mouseup(function() {
                s = false;
            });
            e(f).mousemove(function(e) {
                if (s == true) d(e.pageX - this.offsetLeft);
                else o = e.pageX - this.offsetLeft
            });
            e(f).bind("touchstart", function() {
                s = true;
                $("#prompt").fadeOut();
            });
            e(document).bind("touchend", function() {
                s = false;
                $("#prompt").fadeIn();
            });
            e(f).bind("touchmove", function(e) {
                e.preventDefault();
                var t = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0];
                if (s == true) d(t.pageX - this.offsetLeft);
                else o = t.pageX - this.offsetLeft;
                $("#prompt").fadeOut();
            })
        }
        function d(t) {
            if (o - t > 25) {
                o = t;
                r = --r < 1 ? i : r;
                e(u).css({
                    "background" : "url(" + a + r + "." + c + ") no-repeat",
                    "background-size" : "100% 100%",
                    "text-align"    :   "center"
                })
            } else if (o - t < -25) {
                o = t;
                r = ++r > i ? 1 : r;
                e(u).css({
                    "background" : "url(" + a + r + "." + c + ") no-repeat",
                    "background-size" : "100% 100%",
                    "text-align"    :   "center"
                })
            }
        }
        function v() {
            var t = a + "1." + c;
            e(u).css({
                "background" : "url(" + t + ") no-repeat",
                "background-size" : "100% 100%",
                "text-align"    :   "center"
            });
            e("<img/>").attr("src", t).load(function() {
                var img_width = $(".hair_main").width();
                //img_width = img_width * 0.8;
                var img_height = img_width * (640/647);
                e(u).height(img_height).width(img_width)
                //e(u).height(this.height).width(this.width)
            });
            for (var n = 2; n <= i; n++) {
                t = a + n + "." + c;
                var img_width = $(".hair_main").width();
                //img_width = img_width * 0.8;
                var img_height = img_width * (640/647);

                e(u).append("<img width='"+img_width+"' height='"+img_height+"' src='" + t + "' style='display:none;'>");
                e("<img/>").attr("src", t).css("display", "none").load(function() {
                    l++;
                    if (l >= i) {
                        e(f).removeClass("onLoadingDiv");
                        e(f).text("")
                    }
                })
            }
        }
        function m() {
            e("html").append("<style type='text/css'>.onLoadingDiv{background:#fff;opacity:0.5;text-align:center;width: 100%; height: 100%;}</style>")
        }
        var r = 1,
            i = 0,
            s = false,
            o = 0,
            u, a, f = "#VCc",
            l = 1,
            c = "png";
        h(t, n);
        m();
        e(u).html("<div id='VCc' style='height:100%;width:100%;' class='onLoadingDiv'><img src='/static/image/loading.gif'/></div>");
        v();
        p()
    }
})(jQuery)/**
 * Created by zz on 2016/9/18.
 */
