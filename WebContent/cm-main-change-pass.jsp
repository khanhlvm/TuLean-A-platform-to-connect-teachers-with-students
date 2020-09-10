<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thay đổi mật khẩu |TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="icon" href="images/icon-tab. png">
    <link rel="stylesheet" href="assets/css/input-radio.css" />
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/validate.js"></script>
</head>
<!-- Add header bar -->
<c:if test="${u.roleID==1}"><%@ include file="/includes/ad-header-bar.jsp" %></c:if>
<c:if test="${u.roleID==2}"><%@ include file="/includes/tu-header-bar.jsp" %></c:if>
<c:if test="${u.roleID==3}"><%@ include file="/includes/st-header-bar.jsp" %></c:if>

<!-- Main -->
<div id="main">
<%@ include file="/includes/cm-notification-bar.jsp" %>   
	<article class="post">
	    <h1>Thay đổi mật khẩu</h1>
	    <hr>            
	    <!-- Form -->            
	   	<form action="change-password" method="POST">
	       <div class="row gtr-uniform">
				<div class="col-6">
				    <label>Mật khẩu hiện tại <span style="color: red"> *</span></label>
				    <input type="password" name="oldPass" placeholder="Nhập mật khẩu hiện tại"/>
				</div>
				<div class="col-6">
				    <label>Mật khẩu mới <span style="color: red">*</span></label>
			      	<input type="password" name="newPass" id="inputPassword" placeholder="Nhập mật khẩu mới"/>
			  		<span class="validPassword hidden general valid"><i class="fas fa-check-circle noti_icon"></i>
				   	Password is valid</span>
					<span class="invalidPassword hidden general invalid"><i class="fas fa-exclamation-circle noti_icon"></i>
					Password is invalid</span>
			  	</div>
		  		<div class="col-6">
		      		<label>Xác nhận mật khẩu mới <span style="color: red"> *</span></label>
		           	<input type="password" name="confirmPass" id="reInputPassword" placeholder="Nhập lại mật khẩu mới"/>
		           	<span class="validRePassword hidden general valid"><i class="fas fa-check-circle noti_icon"></i>
		        	Password is match</span>
		    		<span class="invalidRePassword hidden general invalid"><i class="fas fa-exclamation-circle noti_icon"></i>
		    		Password is not match</span>
		       </div>
		       <div class="col-12">
		           <hr>
		           <ul class="actions">
						<li><input type="reset" value="HỦY"></li>
		               	<li><input type="submit" value="CẬP NHẬT"/></li>
		           </ul>
		       </div>
	        </div>
	    </form>   
	    <!-- End form -->    
	</article>
</div>
<!-- End Main -->

<!-- Add side bar -->
<c:if test="${u.roleID==1}"><%@ include file="/includes/ad-side-bar.jsp" %></c:if>
<c:if test="${u.roleID==2}"><%@ include file="/includes/tu-side-bar.jsp" %></c:if>
<c:if test="${u.roleID==3}"><%@ include file="/includes/st-side-bar.jsp" %></c:if>