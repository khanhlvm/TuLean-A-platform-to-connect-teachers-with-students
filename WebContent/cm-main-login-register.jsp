<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Đăng ký, đăng nhập | TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">
    <script src="assets/js/jquery-3.5.1.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/validate.js"></script>
</head>
<!-- Add header bar -->
<%@ include file="/includes/lg-header-bar.jsp" %>

<!-- Main -->
<div id="main">
<%@ include file="/includes/cm-notification-bar.jsp" %>   
  
	<div id="Register" class="tabcontent">        
	    <section id="login-area">
	        <form method="post" action="VerifyEmailController" name="register">
	        
	            <div class="row gtr-uniform">
	                <div class="col-8">                            
	                    <label for="typing-em">Địa chỉ Email <span style="color:red">*</span> </label>                                                              
	                    <input type="email" name="email" id="inputEmailRegister" placeholder="Nhập địa chỉ Email" required="required"/>                                                          	                        	
	                </div>	                
	                <div class="col-4">                                                     
	                    <label for="e">Bạn là ai? <span style="color:red">*</span> </label>
	                    <input type="radio" id="check-student" name="role" value="3" checked>
	                    <label for="check-student">Học viên </label>
	                    <input type="radio" id="check-tutor" name="role" value="2">
	                    <label for="check-tutor">Gia sư </label>
	                </div>
	                
	                <div class="col-8"> 
	                	<span class="validEmailRegister hidden general valid"><i class="fas fa-check-circle noti_icon"></i>
	                    Email is valid</span>
	                	<span class="invalidEmailRegister hidden general invalid"><i class="fas fa-exclamation-circle noti_icon"></i>
	                	Email is invalid !</span> 
	                	<span class="existEmailRegister hidden general invalid"><i class="fas fa-exclamation-circle noti_icon"></i>
	                	Email is already existed !</span> 
	               	</div>  
	               	                         
	                <div class="col-6">
	                    <label for="typing-pw">Mật khẩu <span style="color:red">*</span> </label>
	                    <input type="password" name="password" id="inputPassword" placeholder="Đặt mật khẩu" required="required"/>
	                    <span class="validPassword hidden general valid"><i class="fas fa-check-circle noti_icon"></i>
	                    Password is valid</span>
	                	<span class="invalidPassword hidden general invalid"><i class="fas fa-exclamation-circle noti_icon"></i>
	                	Password is invalid</span>
	                </div>	                
	                <div class="col-6">
	                    <label for="reInputPassword">Nhập lại mật khẩu <span style="color:red">*</span> </label>
	                    <input type="password" name="re-password" id="reInputPassword" value="" placeholder="Nhập lại mật khẩu" required="required"/>
	                	<span class="validRePassword hidden general valid"><i class="fas fa-check-circle noti_icon"></i>
	                    Password is match</span>
	                	<span class="invalidRePassword hidden general invalid"><i class="fas fa-exclamation-circle noti_icon"></i>
	                	Password is not match</span>
	                </div>
	                
	                <div class="col-12"><hr></div>
	                <div class="col-2">                                                       	
	           			<input type="reset" class="button fit"  value="Nhập lại"> 
	                </div>
	                <div class="col-4">                                                       	
	           			<input type="submit" class="button fit"  value="ĐĂNG KÝ"> 
	                </div>                            	                
	                <div class="col-6">      
	                	<input type="checkbox" id="checkbox" name="checkbox" required="required">                                             
	                    <label for="checkbox">Đồng ý <a href="#"> Điều khoản sử dụng </a> và <a href="#"> Chính sách bảo mật </a> của TuLearn <span style="color:red"> * </span></label>                            	                           	
	                </div>	                                          
	            </div>
	            
	        </form>
	    </section>
	</div>      
	           
    <article class="post">
	    <section>
	        <h2>Tu learn</h2>
	        <p>Nền tảng kết nối gia sư và học viên một cách dễ dàng và nhanh chóng</p>
	            <div class="box alt">
	                <div class="row gtr-uniform">
	                    <div class="col-12"><span class="image fit"><img src="images/pic02.jpg" alt="" /></span></div>
	                    <div class="col-4"><span class="image fit"><img src="images/pic04.jpg" alt="" /></span></div>
	                    <div class="col-4"><span class="image fit"><img src="images/pic05.jpg" alt="" /></span></div>
	                    <div class="col-4"><span class="image fit"><img src="images/pic06.jpg" alt="" /></span></div>
	                </div>
	            </div>
	            <h4>Left &amp; Right</h4>
	            <p><span class="image left"><img src="images/pic07.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit
	                adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing
	                eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
	                Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing
	                eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis
	                sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
	            <p><span class="image right"><img src="images/pic04.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit
	                adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing
	                eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum.
	                Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing
	                eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis
	                sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
	    </section>
  	</article>
</div>
<!-- End Main -->
 
<!-- Add side bar -->
<%@ include file="/includes/lg-side-bar.jsp" %>