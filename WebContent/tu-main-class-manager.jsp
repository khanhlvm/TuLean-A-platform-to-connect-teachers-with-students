<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="r" class="tulearn.dao.RequestDAO" scope="session"/>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang quản lớp học của GS - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/req-manger.css">
</head>
<!-- Add header bar -->
<%@ include file="/includes/tu-header-bar.jsp" %>

<!-- Main -->
        <div id="main">

            <!-- Tabbar -->
            <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'London')">Lớp đang chờ duyệt</button>
                <button class="tablinks" onclick="openCity(event, 'Paris')">Lớp đang dạy</button>
                <button class="tablinks" onclick="openCity(event, 'XH')">Lớp đã dạy</button>
            </div>

            <div id="London" class="tabcontent">
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
                            <h3>Thông tin học viên</h3>
                            <div class="body_text">
                                <span>Họ và Tên:</span>
                                <p>${req.post.learner.name}</p><br>

                            </div>
                            <div class="body_text">
                                <span>Địa chỉ:</span>
                                <p>${req.post.learner.street},${req.post.address.communeName},${req.post.address.districtName},${req.post.address.provinceName}</p>

                            </div>
                            <div class="body_text">
                                <span>SĐT:</span>
                                <p>${req.post.learner.phone}</p>
                            </div>

                        </div>
                        <div class="col-6 col-12-medium">
                            <h3>Thông tin yêu cầu</h3>
                          
                            <div class="body_text">

                                <span>Môn học:</span>
                                <p>${req.post.subject.sName}</p><br>
                            </div>
                            <div class="body_text">

                                <span>Số buổi/Tuần:</span>
                                <p>${req.post.lessonLearn}</p><br>
                            </div>
                            <div class="body_text">

                                <span>Thời gian/Buổi</span>
                                <p>${req.post.timeLearn}</p>
                            </div>
                            
                            <div class="body_text_tu">

                                <span>Yêu cầu của học viên:</span>
                                <p>${req.post.postDes}</p><br>
                            </div>

                        </div>
                        <div class="col-12 col-12-status">
                            <p>Trạng Thái yêu cầu: </p><span class="col-12-status_span"> Chưa xác nhận</span>
                        </div>
                    </div>
                    <footer>
                     <a href="#" class="button btn">Cập nhật</a>
                    </footer>
                </article>
                 </c:forEach>
            </div>

            <div id="Paris" class="tabcontent">
                <!-- Post -->
                  <c:forEach items="${requestScope.LIST_REQ}" var="req"> 
                <article class="post">
                    <div class="row">
                        <div class="col-6 col-12-medium">
                            <h3>Thông tin lớp học</h3>
                        
                            <div class="body_text">

                                <span>Môn học:</span>
                                <p>${req.post.subject.sName}</p><br>
                            </div>
                            <div class="body_text">

                                <span>Số buổi/Tuần:</span>
                                <p>${req.post.timeLearn}</p><br>
                            </div>
                            <div class="body_text">

                                <span>Thời gian/Buổi</span>
                                <p>${req.post.timeLearn}</p>
                            </div>
                          


                        </div>
                        <div class="col-6 col-12-medium">
                            <h3>Thông tin học viên</h3>
                            <div class="body_text">
                                <span>Họ và Tên:</span>
                                <p>${req.post.learner.name}</p><br>

                            </div>
                            <div class="body_text">
                                <span>Địa chỉ:</span>
                               <p>${req.post.learner.street},${req.post.address.communeName},${req.post.address.districtName},${req.post.address.provinceName}</p>


                            </div>
                            <div class="body_text">
                                <span>SĐT:</span>
                               <p>${req.post.learner.phone}</p>
                            </div>
                        </div>

                    </div>
                    <div class="col-12 col-12-status">
                        <p>Trạng thái thanh toán: </p><span class="col-12-status_span"> Chưa thanh toán</span>
                    </div>
                    <footer>
                        <a href="#" class="button btn">Kết thúc lớp học</a>
                    </footer>
                </article>
                 </c:forEach>

            </div>

            <div id="XH" class="tabcontent">
                <!-- Post -->
                <article class="post">
                    <div class="row">

                        <div class="col-6 col-12-medium">
                            <h3>Thông tin lớp học</h3>
                            <div class="body_text">

                                <span>Lớp học:</span>
                                <p>lớp 10</p>
                            </div>
                            <div class="body_text">

                                <span>Môn học:</span>
                                <p>Toán</p><br>
                            </div>
                            <div class="body_text">

                                <span>Số buổi/Tuần:</span>
                                <p>2 buổi</p><br>
                            </div>
                            <div class="body_text">

                                <span>Thời gian/Buổi</span>
                                <p>2 giờ</p>
                            </div>
                            <div class="body_text">

                                <span>Lịch học:</span>
                                <p>Thứ 2, thứ 4</p><br>
                            </div>
                        </div>
                        <div class="col-6 col-12-medium">
                            <h3>Thông tin học viên</h3>
                            <div class="body_text">
                                <span>Họ và Tên:</span>
                                <p>Nguyễn Thị Thu Thảo</p><br>

                            </div>
                            <div class="body_text">
                                <span>Địa chỉ:</span>
                                <p>123 Nguyễn Văn Linh,Đà Nẵng</p>

                            </div>
                            <div class="body_text">
                                <span>SĐT:</span>
                                <p>038299274</p>
                            </div>
                        </div>
                    </div>
                    <footer>
                        <a href="#" class="button btn">Xóa lớp học</a>
                    </footer>
                </article>
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
<%@ include file="/includes/tu-side-bar.jsp" %>        
        