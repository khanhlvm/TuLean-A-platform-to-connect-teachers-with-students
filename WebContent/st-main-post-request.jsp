<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>
    <title>Đăng kí học với Gia Sư của HV - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/req-manger.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/validation.js"></script>
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/thu_css.css">
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp" %>

<!-- Main -->
<div id="main">
<%@ include file="/includes/cm-notification-bar.jsp" %>


            <!-- Post -->
            <article class="post">
                <div class="post_header">
                    <div class="body_img">
                        <img src="images/pic08.jpg" class="image img_body" alt="">
                    </div>
                    <div class="post_header_text">
                        <p class="name_tutor">${reqtt.name}</p>
                        <p>${reqtt.workAt}</p>
                        <p>Học phí dạy đề xuất: <span>${reqtt.salary} đ/buổi</span></p>
                    </div>
                </div>
                <section>

           	<form method="post" action="CreatePostController">
				<div class="row gtr-uniform">

					<div class="col-6 col-12-xsmall">
						<label for="MonHoc">Môn Học</label> <select name="MonHoc"
							id="MonHoc">
							<option value="">- Môn Học -</option>
							<option value="1">Hóa</option>
							<option value="1">Toán</option>
							<option value="1">Ngữ Văn</option>
						</select>
						<p id="state1" class="error"></p>
					</div>
					<div class="col-6 col-12-xsmall">
						<label for="">Học Phí Đề Xuất</label> <input type="text"
							name="HocPhiDeXuat" id="HocPhiDeXuat" value=""
							placeholder="0 vnđ/buổi" />
						<p id="state4" class="error"></p>
					</div>

					<div class="col-6 col-12-xsmall">
						<label for="SoGioMotBuoi">Số Giờ/Buổi</label> <select
							name="SoGioMotBuoi" id="SoGioMotBuoi">
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
							<c:forTokens items="1,2,3,4,5,6,7" delims="," var="buoi">
								<option value="<c:out value="${buoi}"/>"><c:out value="${buoi}" /></option>
							</c:forTokens>
						</select>
					</div>
					<div class="col-12">
						<label for="">Ngày Dự Kiến Bắt Đầu Học</label> <input type="date"
							name="Date" id="datepicker" />
					</div>
					<p id="state5" class="error"></p>
					<div class="col-12">
						<label for="">Yêu cầu, mong muốn khác của học viên</label>
						<textarea name="MongMuon" id="MongMuon"
							placeholder="Enter your message" rows="6"></textarea>
					</div>
                     <div class="col-12">
                         <label for="">Lịch học</label>
                         <span>(chọn thời gian rảnh bạn có thể học)</span>
                     </div>                                          
					<div class="col-12">								
						<div class="col-12" id="ngay1">
							<c:forEach items="${reqsch}" var="sch">
							<div class="row canh col-12 gioranh1" id="idGioRanh">															
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
									<label for="t2"></label>
	                         		<input type="checkbox" id="ThuHai" name="ThuHai" checked="checked">
	                         		<label for="ThuHai"></label>
	                     		</div>
							</div>							
							</c:forEach>
						</div>
					</div>
					<div class="col-12">
						<hr>
						<ul class="btnArea">					
							<li>
								<input type="submit" value="Đăng bài">
							</li>
							<li>
								<input type="reset" value="Reset" />
							</li>
						</ul>
					</div>
				</div>
			</form>
                </section>
            </article>
        </div>
        <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>
        