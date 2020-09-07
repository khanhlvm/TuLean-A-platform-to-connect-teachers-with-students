
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