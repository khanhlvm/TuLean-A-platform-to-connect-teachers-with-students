<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="listInfo" class="tulearn.dao.UserDAO" scope="session"/>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang thông tin cá nhân của HV - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/input-radio.css" />
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp" %>
<!--  include file="/includes/ad-header-bar.jsp"  -->

<!-- Main -->
        <div id="main">
            <article class="post">
                <h1>Thông tin cá nhân</h1>
                <hr>
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
                    <div class="col-6 form">
                        <label for=""class="input" name="phone">Số điện thoại: </label>
                        <p>${tutor.phone}</p>
                    </div>             
                    <div class=" col-6 form">
                        <label for="" class="input" name="email">Địa chỉ Email: </label>
                        <p>${tutor.email}</p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input" name="province">Tỉnh/TP: </label>
                        <p>${tutor.provinceName}</p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input" name="district">Quận/Huyện: </label>
                        <p>${tutor.districtName}</p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input" name="commune">Phường/Xã: </label>
                        <p>${tutor.communeName}</p>
                    </div>
                    <div class="col-6 form"  >
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
        
        <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>
<!-- include file="/includes/ad-side-bar.jsp" -->

