<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="r" class="tulearn.dao.RequestDAO" scope="session" />

<!DOCTYPE HTML>
<html>

<head>
<title>Trang quản lý lớp học của HV - TuLearn</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="icon" href="images/icon-tab.png">
<link rel="stylesheet" href="assets/css/req-manger.css">
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp"%>

<!-- Main -->
<div id="main">

	<!-- Tabbar -->
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'Tokyo')">Lớp
			đang chờ duyệt</button>
		<button class="tablinks" onclick="openCity(event, 'Paris')">Lớp
			đang học</button>
		<button class="tablinks" onclick="openCity(event, 'London')">Lớp
			đã học</button>
	</div>

	<div id="Tokyo" class="tabcontent">
		<!-- Post -->
		<c:forEach items="${requestScope.LIST_REQ}" var="req">
			<article class="post">
				<header class="header_post">
					<div class="title">
						<h1>Thông tin lớp học</h1>
					</div>
				</header>

				<div class="row">
					<div class="col-6 col-12-medium">
						<h3>Thông tin gia sư</h3>
						<div class="body_text">
							<span>Họ và Tên:</span>
							<p>${req.tutor.name}</p>
							<br>
						</div>
						<div class="body_text">
							<span>Địa chỉ:</span>
							<p>${req.tutor.address.provinceName}</p>
						</div>
						<div class="body_text">
							<span>SĐT:</span>
							<p>${req.tutor.salary}</p>
						</div>
					</div>
					<div class="col-6 col-12-medium">
						<h3>Thông tin yêu cầu</h3>

						<div class="body_text">
							<span>Môn học:</span>
							<p>${req.post.subject.sName}</p>
							<br>
						</div>
						<div class="body_text">
							<span>Số buổi/Tuần:</span>
							<p>${req.post.lessonLearn}</p>
							<br>
						</div>
						<div class="body_text">
							<span>Thời gian/Buổi</span>
							<p>${req.post.timeLearn}</p>
						</div>

					</div>
					<div class="col-12 col-12-status">
						<p>Trạng thái yêu cầu:</p>
						<span class="col-12-status_span"> Chưa xác nhận</span>
					</div>
				</div>
			</article>
		</c:forEach>
	</div>

	<div id="Paris" class="tabcontent">
		<!-- Post -->
		<c:forEach items="${requestScope.LIST_REQGS}" var="reqe">
			<article class="post">
				<div class="row">

					<div class="col-6 col-12-medium">
						<h3>Thông tin lớp học</h3>

						<div class="body_text">

							<span>Môn học:</span>
							<p>${reqe.post.subject.sName}</p>
							<br>
						</div>
						<div class="body_text">

							<span>Số buổi/Tuần:</span>
							<p>${reqe.post.lessonLearn}</p>
							<br>
						</div>
						<div class="body_text">

							<span>Thời gian/Buổi</span>
							<p>${reqe.post.timeLearn}</p>
						</div>

					</div>
					<div class="col-6 col-12-medium">
						<h3>Thông tin gia sư</h3>
						<div class="body_text">
							<span>Họ và Tên:</span>
							<p>${reqe.tutor.name}</p>

						</div>
						<div class="body_text">
							<span>Địa chỉ:</span>
							<p>${reqe.tutor.address.provinceName}</p>

						</div>
						<div class="body_text">
							<span>SĐT:</span>
							<p>${reqe.tutor.salary}</p>
						</div>
					</div>
				</div>
				<footer>
					<a href="#" class="button btn">Feedback</a>
				</footer>
			</article>
		</c:forEach>
	</div>

	<div id="London" class="tabcontent">
		<c:forEach items="${requestScope.LIST_REQDH}" var="re">
		  <form action="stXoaLopHoccontroller" method="GET">
			<article class="post">
				<div class="row">
					<div class="col-6 col-12-medium">
						<h3>Thông tin lớp học</h3>

						<div class="body_text">

							<span>Môn học:</span>
							<p>${re.post.subject.sName}</p>
							<br>
						</div>
						<div class="body_text">

							<span>Số buổi/Tuần:</span>
							<p>${re.post.lessonLearn}</p>
							<br>
						</div>
						<div class="body_text">

							<span>Thời gian/Buổi</span>
							<p>${re.post.timeLearn}</p>
						</div>


					</div>
					<div class="col-6 col-12-medium">
						<h3>Thông tin gia sư</h3>
						<div class="body_text">
							<span>Họ và Tên:</span>
							<p>${re.tutor.name}</p>

						</div>
						<div class="body_text">
							<span>Địa chỉ:</span>
							<p>${re.tutor.address.provinceName}</p>

						</div>
						<div class="body_text">
							<span>SĐT:</span>
							<p>${re.tutor.salary}</p>
						</div>
						<div class="body_text">
							<input type="hidden" name="btnTutorID"
								value="${re.tutor.userID}"> <input type="hidden"
								name="btnPostID" value="${re.post.postID}">
						</div>
					</div>
				</div>
				<footer>
				 <input type="submit" class="button btn"  value="Xóa lớp học">
					
				</footer>
			</article>
			</form>
		</c:forEach>
	</div>

	<script>
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script>
</div>
<!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp"%>