
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="r" class="tulearn.dao.RequestDAO" scope="session"/>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang quản lý yêu cầu của HV - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/thu_css.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">
    <link rel="stylesheet" href="assets/css/req-manger.css">
    <link rel="icon" href="images/icon-tab.png">
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp" %>

<!-- Main -->
        <div id="main">
            <!-- Tabbar -->
           <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'London')">Yêu cầu tìm GS</button>
                <button class="tablinks" onclick="openCity(event, 'Paris')">Gửi lời mời dạy</button>
                <button class="tablinks" onclick="openCity(event, 'Tokyo')">GS gửi yêu cầu</button>
            </div>
            
            <div id="London" class="tabcontent">
                <!-- Post -->
                <article class="post">
                    <header>
                        <div class="title">
                            <h2><a href="single.html">ID-xxxxxxxx</a></h2>
                            <p class="status">Status: ---</p>
                            <a class="quanly" onclick="" href="#">Chỉnh Sửa</a>
                            <a class="quanly" onclick="" href="#">Hủy yêu cầu</a>
                        </div>
                        <div class="meta">
                            <time class="published" datetime="2015-11-01">November 1, 2015</time>
                            <a href="#" class="author"><span class="name"> - Jane Doe</span><img src="images/avatar.jpg" alt="" /></a>
                        </div>
                    </header>
                    <div class="row bai">
                        <div class="row col-6 col-12-xsmall">
                            <label class="infor" for="">Môn Học: </label>
                            <label class="infor" for="">Toán</label>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label class="infor" for="">Giới Tính Gia Sư: </label>
                            <label class="infor" for="">Cả Hai</label>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label class="infor" for="">Trình Độ Gia Sư: </label>
                            <label class="infor" for="">Sinh Viên</label>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label class="infor" for="">Học Phí Đề Xuất/Buổi: </label>
                            <label class="infor" for="">200.000 vnđ</label>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label class="infor" for="">Số Giờ Học/Buổi: </label>
                            <label class="infor" for="">1.5</label>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label class="infor" for="">Số Buổi Học/Ngày: </label>
                            <label class="infor" for="">3</label>
                        </div>
                        <div class="row col-12 more1">
                            <label class="infor" for="">Ngày Dự Kiến Bắt Đầu Học: </label>
                            <label class="infor" for="">22/09/2020</label>
                        </div>
                        <div class="row col-12 more1">
                            <label class="infor" for="">Mong Muốn, Yêu Cầu Khác Của Học Viên: </label>
                            <label class="infor" for="">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quam
                                quisquam quis, doloribus voluptatum libero consequuntur facilis quaerat laborum
                                excepturi debitis, molestias, totam quia culpa laudantium dolorum suscipit maiores eum
                                quasi!</label>
                        </div>
                        <div class="row col-6 more1">
                            <label class="infor" for="">Thời Gian Rảnh Trong Tuần: </label>
                            <label class="infor" for="">Thứ 2: 15:00-17:00</label>
                            <ul class="actions">
                            	<li><a class="button large" onclick="HienThi(1)">Ẩn bớt Thông Tin</a></li>
                        	</ul>
                        </div>
                        
                    </div>
                    <footer>
                        <ul class="actions">
                            <li><a class="button large" onclick="HienThi(1)">Xem Thêm Thông Tin</a></li>
                        </ul>
                        <ul class="stats">
                            <li><a href="#">General</a></li>
                            <li><a href="#" class="icon solid fa-heart">28</a></li>
                            <li><a href="#" class="icon solid fa-comment">128</a></li>
                        </ul>
                    </footer>
                </article>
            </div>

            <div id="Paris" class="tabcontent">
                <!-- Post -->
              <c:forEach items="${requestScope.LIST_REQ}" var="req"> 
         	      
                <article class="post" action="StHuyYeuCauController" method="POST">
                    <header class="header_post">
                        <div class="title">
                            <h3>bạn đã đăng kí học <span>${req.post.subject.sName}</span> với gia sư <span>${req.tutor.name}</span></h3>
                        </div>
                        <div class="meta meta_ci">
                            <div class="circle"></div>
                            <p>Đang chờ xác nhận từ gia sư</p>
                        </div>
                    </header>
                    <div class="body_tokyo">
                        <div class="body_first">
                            <div class="body_text">
                                <span>Môn:</span>
                                <p>${req.post.subject.sName}</p>
                            </div>
                        </div>
                        <div class="body_second">
                            <div class="body_text">
                                <span>Số buổi/Tuần:</span>
                                <p>${req.post.lessonLearn} buổi</p>
                            </div>
                            <div class="body_text">
                                <span>Thời gian/Buổi:</span>
                                <p>${req.post.timeLearn} giờ </p>
                            </div>
                        </div>
                    </div>
                    <footer>
								
								
                       <a href="StHuyYeuCauController"  class="button btn" name="txtHuyYeuCau" value="${req.post.postID}">Hủy yêu cầu</a> 
                    </footer>
                </article>
             </c:forEach>
            </div>

            <div id="Tokyo" class="tabcontent">
             <c:forEach items="${requestScope.LIST_REQGS}" var="reqe"> 
                <article class="post">
                    <header class="header_post">
                        <div class="title">

                            <h3>Gia Sư <span>${reqe.tutor.name}</span> đăng kí dạy môn <span>${reqe.post.subject.sName}</span> với bạn</h3>
                        </div>

                    </header>
                    <div class="body_img">
                        <img src="images/pic08.jpg" class="image img_body" alt="">
                        <h2>${reqe.tutor.name}</h2>
                    </div>
                    <div class="body_tokyo">
                        <div class="body_first">
                            <div class="body_text">
                                <span>Dạy môn:</span>
                                <p>${reqe.post.subject.sName}</p><br>
                            </div>
                            <div class="body_text">
                                <span>Trình độ:</span>
                                <p>${reqe.tutor.qualificate.qName}</p>
                            </div>
                           
                        </div>
                        <div class="body_second">
                            <div class="body_text">
                                <span>Học Phí:</span>
                                <p>${reqe.tutor.salary} đ/Buổi</p>
                            </div>
                            <div class="body_text">

                                <span>Địa chỉ:</span>
                                <p>${reqe.tutor.address.provinceName}</p>
                            </div>
                        </div>
                    </div>

                    <footer class="footer_jc">
                        <a href="#" class="button btnjc">Từ chối </a>
                        <a href="#" class="button btnjc">Chấp nhận</a>
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
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }
                    document.getElementById(cityName).style.display = "block";
                    evt.currentTarget.className += " active";
                }
            </script>
         
        </div> 
		<!-- End Main -->
		
<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>
