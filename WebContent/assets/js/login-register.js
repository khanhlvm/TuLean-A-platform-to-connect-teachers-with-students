
$(document).ready(function (){ 
	$('#inputEmailRegister').on('keypress keydown keyup', function() {       						
		let eID = $('#inputEmailRegister').val();
		console.log(eID);      						
		$.ajax({
			url: "ExistEmailController",
			method: "GET",
			data: {parameter: 'emailCheck'},
			success: function(data, textStatus, jqXHR){
				console.log(data);
				let obj = $.parseJSON(data);
				$.each(obj, function (key, value){
					if(value==eID){
						$('.existEmailRegister').removeClass('hidden');
			            $('.validEmailRegister').addClass('hidden');
			            $('.existEmailRegister').show().delay(1000).fadeOut(1000);
					}
				});
			},
			error: function (jqXHR, textStatus, errorThrown){
										
			},
		});
	});        				     		      					
});

$(document).ready(function () {
    $('#verifyCode').on('keypress keydown keyup', function() {
		var svCode = $('#vCode').val();
		console.log(svCode);
        var verCode = $('#verifyCode').val();
		console.log(verCode);      
        if (verCode != svCode) {
            $('.invalidVerifyCode').removeClass('hidden');
            $('.validVerifyCode').addClass('hidden');
            $('.invalidVerifyCode').show();
        }else{
            $('.validVerifyCode').removeClass('hidden');
            $('.invalidVerifyCode').addClass('hidden');
            $('.validVerifyCode').show();
        }
    });	            	   
});

$(document).ready(function () {
    $('#reInputPassword').on('keypress keydown keyup', function() {
        var rePass = $('#reInputPassword').val();
		console.log(rePass);
        var pass = $('#inputPassword').val();
		console.log(pass);
        if (rePass != pass) {
            $('.invalidRePassword').removeClass('hidden');
            $('.validRePassword').addClass('hidden');
            $('.invalidRePassword').show();
        }else {
            $('.validRePassword').removeClass('hidden');
            $('.invalidRePassword').addClass('hidden');
            $('.validRePassword').show();
        }
    });	            	   
});



