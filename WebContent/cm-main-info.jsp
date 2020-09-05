<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                <form method="post" action="#">
                    <div class="row gtr-uniform">
                        <div class=" col-6 form" >
                            <label for="" class="input">Họ và tên: </label>
                            <p></p>
                        </div>
                        <div class="col-6 form">
                            <label for="" class="input">Giới tính: </label>
                            <p></p>
                        </div>
                    <div class="col-6 form">
                        <label for=""class="input">Số điện thoại: </label>
                        <p></p>
                    </div>
                    <div class="col-6 form">
                        <label for="" class="input">CMND: </label>
                        <p></p>
                    </div>                  
                    <div class=" col-6 form">
                        <label for="" class="input">Địa chỉ Email: </label>
                        <p></p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input">Tỉnh/TP: </label>
                        <p></p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input">Quận/Huyện: </label>
                        <p></p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input">Phường/Xã: </label>
                        <p></p>
                    </div>
                    <div class="col-6 form"  >
                        <label for="" class="input">Số nhà, Đường: </label>
                        <p></p>
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
        
        <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>
<!-- include file="/includes/ad-side-bar.jsp" -->

