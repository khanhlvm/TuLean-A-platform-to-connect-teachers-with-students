<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Thay đổi mật khẩu |TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/input-radio.css" />
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/common.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/validation.js"></script>
</head>
<!-- Add header bar -->
<!-- include file="/includes/st-header-bar.jsp"  -->
<!-- include file="/includes/tu-header-bar.jsp"  -->
<%@ include file="/includes/ad-header-bar.jsp" %>

<!-- Main -->
	<div id="main">
        <article class="post">
            <h1>Thay đổi mật khẩu</h1>
            <hr>
            
            <!-- Form -->
            
            <form method="post" action="#">
                <div class="row gtr-uniform">
                    <div class="col-6">
                        <label>Mật khẩu hiện tại</label>
                        <input type="password" name="demo-name" id="formPass" value="" placeholder="Nhập mật khẩu hiện tại"/>
                    </div>
                    <div class="col-6">
                        <label>Mật khẩu mới</label>
                        <input type="password" name="demo-name" id="formPassNew" value="" placeholder="Nhập mật khẩu mới"/>
                        <p id="invalidNewPass"  class="invalid"></p>
                    </div>
                    <div class="col-6">
                        <label>Xác nhận mật khẩu mới</label>
                        <input type="password" name="demo-name" id="formXNPassNew" value="" placeholder="Nhập lại mật khẩu mới"/>
                        <p id="invalidXNPass"  class="invalid"></p>
                    </div>
                    <div class="col-12">
                        <hr>
                        <ul class="actions">
                            <li><input type="reset" value="HỦY" /></li>
                            <li><input type="submit" value="CẬP NHẬT" id="btn-changePass" /></li>
                        </ul>
                    </div>
                </div>
            </form>
            
            <!-- End form -->
            
        </article>
    </div>
<!-- End Main -->

<!-- Add side bar -->
<!-- include file="/includes/st-side-bar.jsp" -->
<!-- include file="/includes/tu-side-bar.jsp" -->
<%@ include file="/includes/ad-side-bar.jsp" %>

