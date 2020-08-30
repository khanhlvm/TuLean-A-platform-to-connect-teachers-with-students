<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang quản lý yêu cầu của GS - TuLearn</title>
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
                <button class="tablinks" onclick="openCity(event, 'London')">Đăng ký dạy</button>
                <button class="tablinks" onclick="openCity(event, 'Paris')">Lời mời dạy từ học viên</button>
            </div>

            <div id="London" class="tabcontent">
                <!-- Post -->
                <article class="post">
                    <header class="header_post">
                        <div class="title">

                            <h3>bạn đã đăng kí dạy học viên <span>Lê Văn Hòa</span></h3>
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
                                <p>1.000.000 đồng</p>
                            </div>
                            <div class="body_text">
                                <span>Môn:</span>
                                <p>Toán</p>

                            </div>
                            <div class="body_text">
                                <span>Lớp:</span>
                                <p>lớp 12</p>
                            </div>
                        </div>
                        <div class="body_second">

                            <div class="body_text">
                                <span>Số buổi/Tuần:</span>
                                <p>3 buổi</p>
                            </div>
                            <div class="body_text">
                                <span>Thời gian/Buổi:</span>
                                <p>2 giờ</p>
                            </div>
                        </div>
                    </div>
                    <footer>
                        <a href="#" class="button btn">Hủy yêu cầu</a>
                    </footer>
                </article>
            </div>

            <div id="Paris" class="tabcontent">
                <!-- Post -->

                <article class="post">
                    <header class="header_post">
                        <div class="title">

                            <h3>Học Viên <span>Võ Đại Nghĩa</span> đăng kí học với bạn</h3>
                        </div>

                    </header>

                    <div class="row">


                        <div class="col-6 col-12-medium">
                            <div class="body_text">
                                <span>Địa chỉ:</span>
                                <p>Đà Nẵng</p><br>

                            </div>
                            <div class="body_text">
                                <span>Lớp:</span>
                                <p>lớp 10</p>

                            </div>
                            <div class="body_text">
                                <span>Môn:</span>
                                <p>Văn</p>
                            </div>

                        </div>
                        <div class="col-6 col-12-medium">
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
                        <div class="col-12-medium">
                            <span class="span_">Yêu cầu và mục tiêu của học viên:</span>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit molestiae ab qui repellat cum, quis sint soluta eveniet voluptate aliquam animi corrupti rem porro magni minima maxime id ullam sapiente!</p><br>
                        </div>
                    </div>

                    <footer class="footer_jc">
                        <a href="#" class="button btnjc">Từ chối </a>
                        <a href="#" class="button btnjc">Chấp nhận</a>
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