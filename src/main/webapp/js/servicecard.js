$(function () {
    //提交
    $(document).on('click', 'input:submit', function () {
        if (!$.trim($('#name').val())) {
            alert('尊敬的用户，您的姓名未填写，请将信息填写完整以便我们和您取得联系');
            $('#name').focus();
            return false;
        }
        if (!/[0-9a-zA-Z\u4e00-\u9fa5]/.test($('#name').val())) {
            alert('尊敬的用户，您的姓名填写有误，请将信息填写正确以便我们和您取得联系');
            $('#name').focus();
            return false;
        }
        if (!$.trim($('#mobile').val())) {
            alert('尊敬的用户，您的手机号未填写，请将信息填写完整以便我们和您取得联系');
            $('#mobile').focus();
            return false;
        }
        if (!/1(3|4|5|7|8)\d{9}/.test($('#mobile').val())) {
            alert('尊敬的用户，您的手机号填写有误，请将信息填写正确以便我们和您取得联系');
            $('#mobile').focus();
            return false;
        }
        if (!$.trim($('#address').val())) {
            alert('尊敬的用户，您的地址未填写，请将信息填写完整以便我们和您取得联系');
            $('#address').focus();
            return false;
        }
        $.ajax({
            url: '/index/actadd',
            type: 'post',
            dataType: 'json',
            data: {
                "name": $('#name').val(),
                "phoneNumber": $('#mobile').val(),
                "address": $('#address').val()
            },
            success: function (result) {
                if (result.code == 200) {
                    location.href = "/index";
                } else {
                    alert(result.msg);
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    });
});
