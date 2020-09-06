<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>

<head>
<title>Trang quản lý yêu cầu của HV - TuLearn</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/thu_css.css">
<link rel="stylesheet" href="assets/css/input-radio.css">
<link rel="icon" href="images/icon-tab.png">
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp"%>

<!-- Main -->
<div id="main">
	<article class="post">
		<!-- Post -->
		<section>
			<h2>Chỉnh Sửa Yêu Cầu Tìm Gia Sư</h2>
			<form method="post" action="CreatePostController">
				<div class="row gtr-uniform">

					<div class="col-6 col-12-xsmall">
						<label for="MonHoc">Môn Học</label> <select name="MonHoc"
							id="MonHoc">
							<option value="<c:out value="${oldPost.subject.sID}"/>"><c:out value="${oldPost.subject.sName}"/></option>	
							<option disabled="disabled">—————————————</option>		
							<option value="1">Hóa</option>
							<option value="2">Toán</option>
							<option value="3">Ngữ Văn</option>
						</select>
						<p id="state1" class="error"></p>
					</div>
					<div class="col-6 col-12-xsmall">
						<label for="GioiTinhGiaSu">Giới Tính Gia Sư</label> <select
							name="GioiTinhGiaSu" id="GioiTinhGiaSu">
							<option value="<c:out value="${oldPost.gender.gID}"/>"><c:out value="${oldPost.gender.gName}"/></option>
							<option disabled="disabled">—————————————</option>
							<option value="1">Nam</option>
							<option value="2">Nữ</option>
							<option value="3">Cả Hai</option>
						</select>
						<p id="state2" class="error"></p>
					</div>
					<div class="col-6 col-12-xsmall">
						<label for="TrinhDoGiaSu">Trình Độ Gia Sư</label> <select
							name="TrinhDoGiaSu" id="TrinhDoGiaSu">
							<option value="<c:out value="${oldPost.qualificate.qID}"/>"><c:out value="${oldPost.qualificate.qName}"/></option>
							<option disabled="disabled">—————————————</option>
							<c:forEach items="${qualificates}" var="qua">
								<option value="${qua.qID}"><c:out value="${qua.qName}"></c:out></option>
							</c:forEach>
						</select>
						<p id="state3" class="error"></p>
					</div>
					<div class="col-6 col-12-xsmall">
						<label for="">Học Phí Đề Xuất</label> <input type="text"
							name="HocPhiDeXuat" id="HocPhiDeXuat" value="${oldPost.fee}"
							placeholder="0 vnđ/buổi" />
						<p id="state4" class="error"></p>
					</div>

					<div class="col-6 col-12-xsmall">
						<label for="SoGioMotBuoi">Số Giờ/Buổi</label> 
						<select name="SoGioMotBuoi" id="SoGioMotBuoi">
							<option value="<c:out value="${oldPost.timeLearn}"/>"><c:out value="${oldPost.timeLearn}"/></option>
							<option disabled="disabled">—————————————</option>
							<option value="1">1</option>
							<option value="1.5">1.5</option>
							<option value="2">2</option>
							<option value="2.5">2.5</option>
							<option value="3">3</option>
							<option value="3.5">3.5</option>
						</select>
					</div>

					<div class="col-6 col-12-xsmall">
						<label for="SoBuoiMotTuan">Số Buổi/Tuần</label> <select
							name="SoBuoiMotTuan" id="SoBuoiMotTuan">
							<option value="<c:out value="${oldPost.lessonLearn}"/>"><c:out value="${oldPost.lessonLearn}"/></option>
							<option disabled="disabled">—————————————</option>
							<c:forTokens items="1,2,3,4,5,6,7" delims="," var="buoi">
								<option value="<c:out value="${buoi}"/>"><c:out
										value="${buoi}" /></option>
							</c:forTokens>
						</select>
					</div>
					<div class="col-12">
						<label for="">Ngày Dự Kiến Bắt Đầu Học</label> <input type="date"
							name="Date" id="datepicker" value="${oldPost.startDay}"/>
					</div>
					<p id="state5" class="error"></p>

					<div class="col-12">
						<label for="">Yêu cầu, mong muốn khác của học viên</label>
						<textarea name="MongMuon" id="MongMuon"
							placeholder="Enter your message" rows="6">${oldPost.postDes}</textarea>
					</div>
					<!-- Ngày Rảnh -->
					<div class="col-12">
						<label for="">Ngày Rảnh Trong Tuần</label>
					</div>
					<div class="col-12">
						<div class="col-12" id="ngay1">
						<c:forEach items="${oldSche}" var="sche">
							<div class="row canh col-12 gioranh1" id="idGioRanh">
								<div class="row canh col-3 col-6-xsmall gio">
									<select class="" name="NgayRanh">
										<option value="${sche.dayTime}">${sche.dayTime}</option>
										<option disabled="disabled">—————————————</option>
										<c:set var="tokenising"
											value="Thứ hai,Thứ ba,Thứ tư,Thứ năm,Thứ sáu,Thứ bảy,Chủ Nhật"
											scope="page" />
										<c:forTokens items="${pageScope.tokenising}" delims=","
											var="day" varStatus="status">
											<option value="<c:out value="${status.count}"/>"><c:out
													value="${day}" /></option>
										</c:forTokens>
									</select>
								</div>
								<label class="phancachgio" for="">-</label>
								<div class="row canh col-3 col-6-xsmall gio">
									<select name="GioBatDau" id="demo-category">
										<option value="${sche.startTime}">${sche.startTime}</option>
										<option disabled="disabled">—————————————</option>
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
										<option value="${sche.endTime}">${sche.endTime}</option>
										<option disabled="disabled">—————————————</option>
										<c:forTokens
											items="8:00,8:30,9:00,,9:30,10:00,10:30,11:00,11:30,12:00,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30,18:00,18:30,19:00,19:30,20:00,20:30,21:00"
											delims="," var="et">
											<option value="${et}">${et}</option>
										</c:forTokens>
									</select>
								</div>
							</div>
						
						</c:forEach>

							<div class="col-12" id="add_more1"></div>
							<input class="themgio" type="button" value="Thêm Giờ"
								onclick="ThemGio(this)">
						</div>
					</div>
					<div class="col-12 ">
						<hr>
						<ul class="btnArea">
							<li><input id="btnCapNhap" type="submit" value="Cập Nhập" /></li>
						</ul>


					</div>
				</div>
			</form>

		</section>
	</article>
</div>
<!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp"%>