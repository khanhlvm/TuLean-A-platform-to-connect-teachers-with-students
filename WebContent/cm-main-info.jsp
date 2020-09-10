<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Trang thông tin cá nhân của HV - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/input-radio.css" />
</head>
<!-- Add header bar -->
<c:if test="${u.roleID==1}"><%@ include file="/includes/ad-header-bar.jsp" %></c:if>
<c:if test="${u.roleID==2}"><%@ include file="/includes/tu-header-bar.jsp" %></c:if>
<c:if test="${u.roleID==3}"><%@ include file="/includes/st-header-bar.jsp" %></c:if>

<!-- Main -->
        <div id="main">
            <article class="post">
                <h1>Thông tin cá nhân</h1>
                <hr>
                <form method="post" action="">
                    <div class="row gtr-uniform">
                        <div class=" col-6 form" >
                            <label for="" class="input">Họ và tên: </label>
                            <p>${u.name}</p>
                        </div>
                        <div class="col-6 form">
                            <label for="" class="input">Giới tính: </label>
                            <p>${u.gender.gName}</p>
                        </div>
                    <div class="col-6 form">
                        <label for="" class="input">Số điện thoại: </label>
                        <p>${u.phone}</p>
                    </div>             
                    <div class=" col-6 form">
                        <label for="" class="input">Địa chỉ Email: </label>
                        <p>${u.email}</p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input">Tỉnh/TP: </label>
                        <p>${u.address.provinceName}</p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input">Quận/Huyện: </label>
                        <p>${u.address.districtName}</p>
                    </div>
                    <div class="col-6 form" >
                        <label for="" class="input">Phường/Xã: </label>
                        <p>${u.address.communeName}</p>
                    </div>
                    <div class="col-6 form"  >
                        <label for="" class="input">Số nhà, Đường: </label>
                        <p>${u.street}</p>
                    </div>
	               
	           </div>
                    <div class="col-12">
                        <hr>
                        <ul class="actions">
                            <li><input type="reset" value="HỦY" /></li>
                            <li><a href="cm-main-info-update.jsp" class="button">CẬP NHẬT</a></li>
                        </ul>
                    </div>
            </form>

            </article>
        </div>
        
        <!-- End Main -->

<!-- Add side bar -->
<c:if test="${u.roleID==1}"><%@ include file="/includes/ad-side-bar.jsp" %></c:if>
<c:if test="${u.roleID==2}"><%@ include file="/includes/tu-side-bar.jsp" %></c:if>
<c:if test="${u.roleID==3}"><%@ include file="/includes/st-side-bar.jsp" %></c:if>