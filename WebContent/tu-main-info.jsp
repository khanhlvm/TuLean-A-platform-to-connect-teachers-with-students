<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Trang thông tin cá nhân của GS - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">
    <link rel="stylesheet" href="assets/css/thu_css.css">
    <link rel="icon" href="images/icon-tab.png">
</head>
<!-- Add header bar -->
<%@ include file="/includes/tu-header-bar.jsp" %>

<!-- Main -->
<div id="main">
<%@ include file="/includes/cm-notification-bar.jsp" %>
    <!-- Tabbar -->
	<div class="tab">
	    <button class="tablinks" onclick="openCity(event, 'London')">Thông tin cá nhân</button>
	    <button class="tablinks" onclick="openCity(event, 'Berlin')">Lịch dạy</button>
		<button class="tablinks" onclick="openCity(event, 'Paris')">Chứng chỉ</button>
	</div>
	<script src="assets/js/tab-bar.js"></script>
	
	<div id="London" class="tabcontent">
	    <article class="post">
	        <form method="post" action="update-info">
	       		<div class="row gtr-uniform">
	           <div class=" col-6 form" >
	               <label for="" class="input">Họ và tên: </label>
	               <p>${u.name}</p>
	           </div>
	           <div class="col-6 form">
	               <label for="" class="input">Giới tính: </label>
	               <p>${u.gender.gName}</p>
	           </div>
	           <div class="col-6 form" >
	               <label for="" class="input">Số điện thoại: </label>
	               <p>${u.phone}</p>
	           </div>
	           <div class="col-6 form" >
	               <label for="" class="input-cmnd">CMND: </label>
	               <p>${u.identityCard}</p>
	           </div>
	              <div class="col-6 form" >
	               <label for="" class="input-cmnd">Mã Sinh Viên: </label>
	               <p>${u.studentCard}</p>
	           </div>
	           <div class=" col-6 form">
	               <label for="" class="input">Địa chỉ Email: </label>
	               <p>${u.email}</p>
	           </div>
	           <div class=" col-6 form">
	               <label for="" class="input">Mức lương: </label>
	               <p>${u.salary}</p>
	           </div>
	            <div class=" col-6 form">
	               <label for="" class="input">Nơi làm việc: </label>
	               <p>${u.workAt}</p>
	           </div>
	           <div class=" col-6 form">
	               <label for="" class="input">Trình độ: </label>
	               <p>${u.qualificate.qName}</p>
	           </div>
	           <div class="col-6 form" >
	               <label for="" class="input">Tỉnh/TP: </label>
	               <p>${u.address.provinceName}</p>
	           </div>
	           <div class="col-6 form">
	               <label for="" class="input">Quận/Huyện: </label>
	               <p>${u.address.districtName}</p>
	           </div>
	           <div class="col-6 form" >
	               <label for="" class="input">Phường/Xã: </label>
	               <p>${u.address.communeName}</p>
	           </div>
	           <div class="col-6 form" >
	               <label for="" class="input">Số nhà, Đường: </label>
	               <p>${u.street}</p>
	           </div>
	                <div class="col-12">
	                    <hr>
	                    <ul class="actions">
	                        <li><input type="reset" value="HỦY" /></li>
	                        <li><a href="tu-main-info-update.jsp" class="button">CẬP NHẬT</a></li>
	                    </ul>
	                </div>
	        
	            </div>
	        </form>
	    </article>
	</div>
	
	<div id="Berlin" class="tabcontent">
	    <article class="post">
	    <form method="post" action="add-schedule-tutor">
			<div class="row gtr-uniform">
			<div class="col-12">
						<label for="">LỊCH DẠY TRONG TUẦN</label>
					</div>
			<div class="col-12">
				<c:forEach items="${reqsch}" var="sch">
							<div class="row canh col-12 gioranh1">															
								<div class="row canh col-2 col-6-xsmall gio">
									<select class="" name="NgayRanh">
										<option value="${sch.dayTime}">Thứ ${sch.dayTime}</option>										
									</select>
								</div>
								<label class="phancachgio" for="">-</label>
								<div class="row canh col-2 col-6-xsmall gio">
									<select name="GioBatDau" id="demo-category">
										<option value="${sch.startTime}">${sch.startTime}</option>
									</select>
								</div>
								<label class="phancachgio" for="">-</label>
								<div class="row canh col-2 col-6-xsmall gio">
									<select name="GioKetThuc" id="demo-category">
										<option value="${sch.endTime}">${sch.endTime}</option>
									</select>
								</div>
								<label class="phancachgio" for="">-</label>
								<div class="row canh col-2 col-6-xsmall gio">
								<a onclick="XoaGio(this)" class="button" href="">Xóa</a>
								</div>
							</div>							
							</c:forEach>
							</div>
	        		<div class="col-12">
						<label for="">THÊM LỊCH DẠY TRONG TUẦN</label>
					</div>
					<div class="col-12">
						<div class="col-12" id="ngay1">
							<div class="row canh col-12 gioranh1" id="idGioRanh">
								<div class="row canh col-3 col-6-xsmall gio">
									<select class="" name="NgayRanh">
										<option value="">Chọn thứ</option>
										<c:set var="tokenising" value="Thứ hai,Thứ ba,Thứ tư,Thứ năm,Thứ sáu,Thứ bảy,Chủ Nhật" scope="page" />
										<c:forTokens items="${pageScope.tokenising}" delims="," var="day" varStatus="status">
											<option value="<c:out value="${status.count}"/>"><c:out value="${day}" /></option>
										</c:forTokens>
										
									</select>
								</div>
								<label class="phancachgio" for="">-</label>
								<div class="row canh col-3 col-6-xsmall gio">
									<select name="GioBatDau" id="demo-category">
										<option value="">Giờ Bắt Đầu</option>
										<c:forTokens
											items="7:00,7:30,8:00,8:30,9:00,,9:30,10:00,10:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30,18:00,18:30,19:00"
											delims="," var="st">
											<option value="${st}">${st}</option>
										</c:forTokens>
									</select>
								</div>
								<label class="phancachgio" for="">-</label>
								<div class="row canh col-3 col-6-xsmall gio">
									<select name="GioKetThuc" id="demo-category">
										<option value="">Giờ Kết Thúc</option>
										<c:forTokens
											items="8:00,8:30,9:00,,9:30,10:00,10:30,11:00,11:30,12:00,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30,18:00,18:30,19:00,19:30,20:00,20:30,21:00"
											delims="," var="et">
											<option value="${et}">${et}</option>
										</c:forTokens>
									</select>
								</div>
								<p onclick="XoaGio(this)" class="delete"><i class="delete-time fas fa-times-circle"></i></p>
							</div>
							<div class="col-12" id="add_more1"></div>											
							<input class="themgio" type="button" value="Thêm Giờ"
								onclick="ThemGio(this)">
						</div>
					</div>
					<div class="col-12">
						<hr>
						<ul class="btnArea">
							<li><input type="submit" value="Thêm lịch" /></li>
							<li><input type="reset" value="Reset" /></li>
						</ul>
					</div>
					</div>
			</form>
	    </article>         
	</div>
	
	<div id="Paris" class="tabcontent">
	    <article class="post">
	        <ul>
	            <li>Chứng chỉ 1: <a href="">url</a></li>
	            <li>Chứng chỉ 2: <a href="">url</a></li>
	            <li>Chứng chỉ 3: <a href="">url</a></li>
	        </ul>
	        <hr>
	        <div class="col-12">
                <ul class="actions">
                    <li><a href="tu-main-certificate-add.jsp" class="button">Thêm chứng chỉ</a></li>
                </ul>
	        </div>
	    </article>         
	</div>
	
</div>
<!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/tu-side-bar.jsp" %>