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

$(document).ready(function() {
	var $regexEmail	= /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var $regexPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,100}$/;
    
    $('#inputEmailRegister').on('keypress keydown keyup', function() {
        if (!$(this).val().match($regexEmail)) {
            // there is a mismatch, hence show the error message
            $('.invalidEmailRegister').removeClass('hidden');
            $('.validEmailRegister').addClass('hidden');
            $('.invalidEmailRegister').show();
        } else {
            // else, do not display message
            $('.validEmailRegister').removeClass('hidden');
            $('.invalidEmailRegister').addClass('hidden');
            $('.validEmailRegister').show();
        }
    });

    $('#inputEmail').on('keypress keydown keyup', function() {
        if (!$(this).val().match($regexEmail)) {
            // there is a mismatch, hence show the error message
            $('.invalidEmail').removeClass('hidden');
            $('.validEmail').addClass('hidden');
            $('.invalidEmail').show();
        } else {
            // else, do not display message
            $('.validEmail').removeClass('hidden');
            $('.invalidEmail').addClass('hidden');
            $('.validEmail').show();
        }
    });

	$('#inputPassword').on('keypress keydown keyup', function() {
        if (!$(this).val().match($regexPassword)) {
            // there is a mismatch, hence show the error message
            $('.invalidPassword').removeClass('hidden');
            $('.validPassword').addClass('hidden');
            $('.invalidPassword').show();
        } else {
            // else, do not display message
            $('.validPassword').removeClass('hidden');
            $('.invalidPassword').addClass('hidden');
            $('.validPassword').show();
        }
    });

});