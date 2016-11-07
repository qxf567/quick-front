$(document).ready(function() {

    $(".payment_btn,.blue_btn,.register_btn,.tips_btn").click(function () {
        $(this).addClass("click_btn_blue");
    });

    $(".pink_btn").click(function () {
        $(this).addClass("click_pink_btn");
    })
});