$(document).ready(function (){
	$.ajax({
		url: "GetAddressServlet",
		method: "GET",
		data: {parameter: 'province'},
		success: function (data, textStatus, jqXHR){
			console.log(data);
			let obj = $.parseJSON(data);
			let pid = $('#provinceChecked').val();
			$.each(obj, function (key, value){
				$('#province').append('<option value="' + value.addressID + '">' + value.addressName + '</option>');
			});
			$('select').formSelect();
		},
		error: function (jqXHR, textStatus, errorThrown){
			$('#district').append('<option>Province/City Unavailable</option>');
		},
		cache: false
	});
	
	$('#province').change(function(){
		$('#district').find('option').remove();
		$('#district').append('<option>-- Chọn Quận/Huyện --</option>');
		$('#commune').find('option').remove();
		$('#commune').append('<option>-- Chọn Phường/Xã --</option>');
		
		let pid = $('#province').val();
		console.log(pid)
		let data = {
			parameter: 'district',
			id: pid
		};
		$.ajax({
		url: "GetAddressServlet",
		method: "GET",
		data: data,
		success: function (data, textStatus, jqXHR){
			console.log(data);
			let obj = $.parseJSON(data);
			$.each(obj, function (key, value){
				$('#district').append('<option value="' + value.addressID + '">' + value.addressName + '</option>');
			});
			$('select').formSelect();
		},
		error: function (jqXHR, textStatus, errorThrown){
			$('#commune').append('<option>District Unavailable</option>');
		},
		cache: false
		});
	});
	
	$('#district').change(function(){
		$('#commune').find('option').remove();
		$('#commune').append('<option>-- Chọn Phường/Xã --</option>');
		
		let did = $('#district').val();
		console.log(did)
		let data = {
			parameter: 'commune',
			id: did
		};
		$.ajax({
		url: "GetAddressServlet",
		method: "GET",
		data: data,
		success: function (data, textStatus, jqXHR){
			console.log(data);
			let obj = $.parseJSON(data);
			$.each(obj, function (key, value){
				$('#commune').append('<option value="' + value.addressID + '">' + value.addressName + '</option>');
			});
			$('select').formSelect();
		},
		error: function (jqXHR, textStatus, errorThrown){
			$('#commune').append('<option>District Unavailable</option>');
		},
		cache: false
		});
	});
	
});