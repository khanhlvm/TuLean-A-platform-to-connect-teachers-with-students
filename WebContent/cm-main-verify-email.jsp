<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE HTML>
<html>
<head>
    <title>Xác nhận email | TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="icon" href="images/icon-tab.png"> 
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">       
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery-3.5.1.min.js"></script>
    <script src="assets/js/login-register.js"></script>    
</head>
<!-- Add header bar -->
<%@ include file="/includes/lg-header-bar.jsp" %>

<!-- Main -->
<div id="main">

	<section id="login-area">
 		<form action="RegisterController" method="GET">
 		
     		<div class="row gtr-uniform">
     			<div class="col-12">
     				<h3 style="text-align:center">Xác nhận email</h3>
  					<hr>
  					<span style="color:green">* Nhập mã xác nhận đã được gửi đến email đăng ký của bạn</span>
  				</div>
      			<div class="col-6">
          			<label for="typing-ver-email">Mã xác nhận <span style="color:red">*</span> </label>
          			<input type="text" name="verifyEmail" id="verifyCode" placeholder="Nhập mã xác nhận" />           
            		<span class="validVerifyCode hidden general valid"><i class="fas fa-check-circle noti_icon"></i>
            		Code is valid</span>
            		<span class="invalidVerifyCode hidden general invalid"><i class="fas fa-exclamation-circle noti_icon"></i>
            		Code is invalid !</span>
      			</div>
      			<div class="col-6">
         			<input type="hidden" value="${vCode}" id="vCode"/>
                </div>                                     
               	<div class="col-12">
               		<hr>
          			<input type="submit" class="large button" value="Xác nhận">                                                  	
               </div>         
           </div>
           
       </form>
	</section>  
	         
</div>           
<!-- End Main -->
 
<!-- Add side bar -->
<%@ include file="/includes/lg-side-bar.jsp" %>