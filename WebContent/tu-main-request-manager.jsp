<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="r" class="tulearn.dao.RequestDAO" scope="session" />

<!DOCTYPE HTML>
<html>

<head>
<title>Trang quản lý yêu cầu của GS - TuLearn</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="icon" href="images/icon-tab.png">
<link rel="stylesheet" href="assets/css/req-manger.css">
</head>
<!-- Add header bar -->
<%@ include file="/includes/tu-header-bar.jsp"%>

<!-- Main -->
<div id="main">

	<!-- Tabbar -->
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'London')">Đăng
			ký dạy</button>
		<button class="tablinks" onclick="openCity(event, 'Paris')">Lời
			mời dạy từ học viên</button>
	</div>

	<div id="London" class="tabcontent">
		<!-- Post -->
		<c:forEach items="${requestScope.LIST_REQ}" var="req">
			<article class="post">
				<header class="header_post">
					<div class="title">

						<h3>
							bạn đã đăng kí dạy học viên <span>${req.post.learner.name}</span>
						</h3>
					</div>
					<div class="meta">
						<div class="circle"></div>
						<p>Đang chờ xác nhận từ học viên</p>
					</div>
				</header>

				<div class="body_tokyo">
					<div class="body_first">
						<div class="body_text">
							<span>Học Phí:</span>
							<p>${req.post.fee}đồng</p>
						</div>
						<div class="body_text">
							<span>Môn:</span>
							<p>${req.post.subject.sName}</p>

						</div>

					</div>
					<div class="body_second">

						<div class="body_text">
							<span>Số buổi/Tuần:</span>
							<p>${req.post.lessonLearn}</p>
						</div>
						<div class="body_text">
							<span>Thời gian/Buổi:</span>
							<p>${req.post.timeLearn}</p>
						</div>
					</div>
				</div>
				<footer>
					<a href="#" class="button btn">Hủy yêu cầu</a>
				</footer>
			</article>
		</c:forEach>
	</div>

	<div id="Paris" class="tabcontent">
		<!-- Post -->
		<c:forEach items="${requestScope.LIST_REQGS}" var="reqe">
			<article class="post">
				<header class="header_post">
					<div class="title">

						<h3>
							Học Viên <span>${reqe.post.learner.name}</span> đăng kí học với bạn
						</h3>
					</div>

				</header>

				<div class="row">


					<div class="col-6 col-12-medium">
						<div class="body_text">
							<span>Địa chỉ:</span>
							<p>${reqe.post.address.provinceName}</p>
							<br>

						</div>
						<div class="body_text">
							<span>Môn:</span>
							<p>${reqe.post.subject.sName}</p>
						</div>

					</div>
					<div class="col-6 col-12-medium">
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
					<div class="col-12-medium">
						<span class="span_">Yêu cầu và mục tiêu của học viên:</span>
						<p>${reqe.post.postDes}</p>
						<br>
					</div>
				</div>

				<footer class="footer_jc">
					<a href="#" class="button btnjc">Từ chối </a> <a href="#"
						class="button btnjc">Chấp nhận</a>
				</footer>
			</article>
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
<%@ include file="/includes/tu-side-bar.jsp"%>