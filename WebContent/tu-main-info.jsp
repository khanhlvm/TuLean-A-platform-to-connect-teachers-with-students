<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="listInfo" class="tulearn.dao.UserDAO" scope="session"/>
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
                    <form method="post" action="ListInfoUserServlet">
                       <c:forEach var = "tutor" items = "${listInfo}">
                        <div class="row gtr-uniform">
                            <div class=" col-6 form" >
                                <label for="" class="input" name="name">Họ và tên: </label>
                                <p>${tutor.name}</p>
                            </div>
                            <div class="col-6 form">
                                <label for="" class="input" name="gender">Giới tính: </label>
                                <p>${tutor.gName}</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input" name="phone">Số điện thoại: </label>
                                <p>${tutor.phone}</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input-cmnd" name="identityCard">CMND: </label>
                                <p>${tutor.indentityCard}</p>
                            </div>
                               <div class="col-6 form" >
                                <label for="" class="input-cmnd" name="studentCard">Mã Sinh Viên: </label>
                                <p>${tutor.studentCard}</p>
                            </div>
                            <div class=" col-6 form">
                                <label for="" class="input" name="email">Địa chỉ Email: </label>
                                <p>${tutor.email}</p>
                            </div>
                            <div class=" col-6 form" name="salary">
                                <label for="" class="input">Mức lương: </label>
                                <p>${tutor.salary}</p>
                            </div>
                             <div class=" col-6 form" name="salary">
                                <label for="" class="input" name="workAt">Nơi làm việc: </label>
                                <p>${tutor.workAt}</p>
                            </div>
                            <div class=" col-6 form">
                                <label for="" class="input" name="quality">Trình độ: </label>
                                <p>${tutor.qualificate}</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input" name="provine">Tỉnh/TP: </label>
                                <p>${tutor.provinceName}</p>
                            </div>
                            <div class="col-6 form">
                                <label for="" class="input" name="district">Quận/Huyện: </label>
                                <p>${tutor.districtName}</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input" name="commune">Phường/Xã: </label>
                                <p>${tutor.communeName}</p>
                            </div>
                            <div class="col-6 form" >
                                <label for="" class="input" name="street">Số nhà, Đường: </label>
                                <p>${tutor.street}</p>
                            </div>
                             </c:forEach>
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
