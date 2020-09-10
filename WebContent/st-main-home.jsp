<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="sbj" class="tulearn.dao.UserDAO" scope="session"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>Trang chủ | TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">
    <link rel="stylesheet" href="assets/css/req-manger.css">
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp" %>

<!-- Main -->
<div id="main">
<%@ include file="/includes/cm-notification-bar.jsp" %>
<c:forEach items="${uhm}" var="tu">

    	<form action="learn-register-student" method="GET">                  
        	<article class="post">
				<header class="header_post">
	                <div class="title">
	                	<div class="row">
	                		<div class="col-2">
			                	<img src="images/tu-avatar.jpg" class="image img_body" alt="">
		                    </div>
		                    <div class="col-10">
		                    	<h3>Gia sư <span>${tu.key.name} </span> đang là <span>${tu.key.qualificate.qName}</span> </h3>
		                    	<h3>Đánh giá: <span><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i></span></h3>
	                		</div>
	                	</div>
	                </div>
				</header>
	            <div class="row bai">
	            	<div class="row col-12 col-12-xsmall">
	                	<i class="fas fa-map-marker-alt"></i>
	                    <label class="infor" for="">Hoạt động gia sư tại: </label>
	                    <h4> ${tu.key.address.districtName} - ${tu.key.address.provinceName}</h4>
	                </div>
	                <div class="row col-8 col-12-xsmall">
	                	<i class="fas fa-briefcase"></i>
	                    <label class="infor" for="">Đang công tác tại: </label>
	                    <p>${tu.key.workAt}</p>
	                </div>
	                <div class="row col-4 col-12-xsmall">
	                	<input type="hidden" name="tutorID" value="${tu.key.userID}">
	                </div>
	                <div class="row col-6 col-12-xsmall">
	                	<i class="fas fa-hand-holding-usd"></i>
	                    <label class="infor" for="">Học phí dạy đề xuất: </label>
	                    <p>${tu.key.salary} đ/buổi</p>
	                </div>	            	                 
	                <div class="row col-6 col-12-xsmall">
	                	<i class="fas fa-transgender-alt"></i>
	                    <label class="infor" for="">Giới tính: </label>
	                    <p>${tu.key.gender.gName}</p>
	                </div>	
	                <div class="row col-12">
	                	<i class="fas fa-book"></i>
	                    <label class="infor" for="">Dạy môn: </label>
	                    <c:forEach items="${sbj.getSubjectByTutorID(tu.key.userID)}" var="sj">
	                    	<p>${sj.sName}, </p>
	                    </c:forEach>
	                </div>               	               	                
	                <div class="row col-12">
	                	<i class="fas fa-calendar-week"></i>
	                    <label class="infor" for="">Lịch dạy trong tuần: </label>  
	                    <br>  
		                    <c:forEach items="${tu.value}" var="sc">
		                    	<p>Thứ ${sc.dayTime} : ${sc.startTime} - ${sc.endTime},</p>
		                    </c:forEach>         
	                </div>	                                
	                <div class="row col-4">	                         
	          			<input type="hidden" name="btnPostID" value="">	
	                 </div>
	            </div>
	            <hr>
	            <footer>
	             
	                <ul class="actions">
	                    <li><input type="submit"value="Học với gia sư này"></li>
	                </ul>	               
	            </footer>
        	</article>
    	</form>
    	
</c:forEach>     
</div> 
<!-- End Main -->
		
<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>
