<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Trang chủ | TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">    
    <link rel="stylesheet" href="assets/css/req-manger.css">
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<!-- Add header bar -->
<%@ include file="/includes/tu-header-bar.jsp" %>

<!-- Main -->
<div id="main">
<%@ include file="/includes/cm-notification-bar.jsp" %>
<c:forEach items="${hm}" var="ps">

    	<form action="teach-register" method="GET">                  
        	<article class="post">
				<header class="header_post">
	                <div class="title">
	                	<div class="row">
	                		<div class="col-2">
			                	<img src="images/st-avatar.jpg" class="image img_body" alt="">
		                    </div>
		                    <div class="col-10">
		                    	<h3><span>${ps.key.learner.name} </span> tìm gia sư dạy <span>${ps.key.subject.sName}</span> </h3>
		                    	<h4><span><i class="fas fa-history"></i> 10 ngày trước</span> - <a href="tu-main-post-report.jsp">Báo cáo bài đăng</a></h4>
		                    	
	                		</div>
	                	</div>
	                </div>
				</header>
	            <div class="row bai">
	            	<div class="row col-12 col-12-xsmall">
	                	<i class="fas fa-map-marker-alt"></i>
	                    <label class="infor" for="">Địa điểm học: </label>
	                    <h4> ${ps.key.address.districtName} - ${ps.key.address.provinceName}</h4>
	                </div>
	                <div class="row col-6 col-12-xsmall">
	                	<i class="fas fa-hand-holding-usd"></i>
	                    <label class="infor" for="">Học phí đề xuất: </label>
	                    <p>${ps.key.fee} đ/buổi</p>
	                </div>	            	                 
	                <div class="row col-6 col-12-xsmall">
	                	<i class="fas fa-transgender-alt"></i>
	                    <label class="infor" for="">Giới tính gia sư: </label>
	                    <p>${ps.key.gender.gName}</p>
	                </div>
	                <div class="row col-6 col-12-xsmall">
	                	<i class="fas fa-user-graduate"></i>
	                    <label class="infor" for="">Trình độ gia sư: </label>
	                    <p>${ps.key.qualificate.qName}</p>
	                </div>
	                <div class="row col-6 col-12-xsmall">
	                	<i class="far fa-calendar-check"></i>
	                    <label class="infor" for="">Ngày dự kiến bắt đầu học: </label>
	                    <p>${ps.key.startDay}</p>
	                </div>
	                <div class="row col-6 more1">
	                	<i class="far fa-clock"></i>
	                    <label class="infor" for="">Số giờ học/buổi: </label>
	                    <p>${ps.key.lessonLearn}</p>
	                </div>
	                <div class="row col-6 more1">
	                	<i class="fas fa-calendar-alt"></i>
	                    <label class="infor" for="">Số buổi học/ngày: </label>
	                    <p>${ps.key.timeLearn}</p>
	                </div>	               	                
	                <div class="row col-12 more1">
	                	<i class="fas fa-calendar-week"></i>
	                    <label class="infor" for="">Thời gian rảnh trong tuần: </label>  
	                    <br>  
		                    <c:forEach items="${ps.value}" var="sc">
		                    	<p>Thứ ${sc.dayTime} : ${sc.startTime} - ${sc.endTime},</p>
		                    </c:forEach>         
	                </div>
	                <div class="row col-12 more1">
	                	<i class="fas fa-sign-language"></i>
	                    <label class="infor" for="">Mong Muốn, Yêu Cầu Khác Của Học Viên: </label>
	                    <p>${ps.key.postDes}</p>
	                </div>                
	                	<div class="row col-4 more1">	                         
	          			<input type="hidden" name="postID" value="${ps.key.postID}">	
	                 </div>
	            </div>
	            <hr>
	            <footer>
	             
	                <ul class="actions">	                
	                    <li><a class="button" onclick="HienThi(1)">Thêm / ẩn Thông Tin</a></li>
	                    <li><input type="submit"value="Đăng ký dạy"></li>
	                </ul>	               
	            </footer>
        	</article>
    	</form>
    	
</c:forEach>
</div> 
<!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/tu-side-bar.jsp" %>
