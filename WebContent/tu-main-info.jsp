<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang thông tin cá nhân của GS - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">
    <link rel="icon" href="images/icon-tab.png">
</head>
<!-- Add header bar -->
<%@ include file="/includes/tu-header-bar.jsp" %>

<!-- Main -->
        <div id="main">

            <!-- Tabbar -->
            <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'London')">Thông tin cá nhân</button>
                <button class="tablinks" onclick="openCity(event, 'Paris')">Chứng chỉ</button>
            </div>
            <div id="London" class="tabcontent">
                <article class="post">
                    <form method="post" action="#">
                        <div class="row gtr-uniform">
                            <div class=" col-6 form" >
                                <label for="" class="input">Họ và tên: </label>
                                <p>Trần Thị Minh Trang</p>
                            </div>
                            <div class="col-6 form">
                                <label for="" class="input">Giới tính: </label>
                                <p>Nữ</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input">Số điện thoại: </label>
                                <p>0796250638</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input-cmnd">CMND: </label>
                                <p>201766667</p>
                            </div>
                            
                            <div class=" col-12 form">
                                <label for="" class="input">Địa chỉ Email: </label>
                                <p>trangttmde130021@fpt.edu.vn</p>
                            </div>
                            <div class=" col-6 form" >
                                <label for="" class="input">Mức lương: </label>
                                <p>4.000.000</p>
                            </div>
                            <div class=" col-6 form">
                                <label for="" class="input">Trình độ: </label>
                                <p>Đại học</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input">Tỉnh/TP: </label>
                                <p>Đà Nẵng</p>
                            </div>
                            <div class="col-6 form">
                                <label for="" class="input">Quận/Huyện: </label>
                                <p>Hòa Vang</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input">Phường/Xã: </label>
                                <p>Hòa Phước</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input">Số nhà, Đường: </label>
                                <p>QL1A</p>
                            </div>
                            <div class="col-12">
                                <hr>
                                <ul class="actions">
                                    <li><input type="reset" value="HỦY" /></li>
                                    <li><input type="submit" value="CẬP NHẬT" /></li>
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
                                <li><input type="submit" value="Thêm chứng chỉ" id="btn-CapNhat" /></li>
                            </ul>
                    </div>
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
