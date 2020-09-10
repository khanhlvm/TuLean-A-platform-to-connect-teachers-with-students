<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang báo cáo bài đăng của GS - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="icon" href="images/icon-tab.png">
</head>
<!-- Add header bar -->
<%@ include file="/includes/tu-header-bar.jsp" %>

<!-- Main -->
        <div id="main">
            <article class="post">
                <h1>Báo cáo bài đăng - <a href="#">Le Van D, tìm giáo viên dạy Toán</a></h1>
                <form method="post" action="#">
                    <div class="col-12">
                        <textarea name="demo-message" id="demo-message" placeholder="Nội dung báo cáo" rows="6"></textarea>
                    </div>
                    <br>
                    <div class="col-12">
                        <hr>
                        <ul class="actions">
                            <li><input type="reset" value="HỦY" /></li>
                            <li><input type="submit" value="XONG" class="btn-Xong"/></li>
                        </ul>
                    </div>
                </form>
            </article>
        </div>
        <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/tu-side-bar.jsp" %>
