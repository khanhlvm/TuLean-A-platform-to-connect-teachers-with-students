$(document).ready(function() {


    $('#btndangki').on('click', function(e) {
        e.preventDefault();
        var inputSDT = $('#SĐT').val();
        var checkPhone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        if (!checkPhone.test(inputSDT)) {
            $('#phone').text("Không đúng định dạng SĐT xin hãy nhập lại");
            $("#phone").show().delay(3000).fadeOut(1000);
        }



    })
    $('#btnTiepTuc').on('click', function(e) {
        e.preventDefault();
        var inputState = $('#class_category').val();
        var inputState1 = $('#subject_category').val();
        var inputState2 = $('#num_category').val();
        var inputState3 = $('#hour_category').val();
        if (inputState == "") {
            $('#state').text("Không chọn item đầu tiên");
            $("#state").show().delay(3000).fadeOut(1000);
        }
        if (inputState1 == "") {
            $('#state1').text("Không chọn item đầu tiên");
            $("#state1").show().delay(3000).fadeOut(1000);
        }
        if (inputState2 == "") {
            $('#state2').text("Không chọn item đầu tiên");
            $("#state2").show().delay(3000).fadeOut(1000);
        }
        if (inputState3 == "") {
            $('#state3').text("Không chọn item đầu tiên");
            $("#state3").show().delay(3000).fadeOut(1000);
        }



    })
    $('#btncapNhat').on('click', function(e) {
        e.preventDefault();


        var inputState4 = $('#tt_category').val();
        if (inputState4 == "") {
            $('#state4').text("Không chọn item đầu tiên");
            $("#state4").show().delay(3000).fadeOut(1000);
        }



    })
    btncapNhat
})