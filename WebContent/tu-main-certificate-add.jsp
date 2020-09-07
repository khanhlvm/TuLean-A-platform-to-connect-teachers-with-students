<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Thêm chứng chỉ | TuLearn</title>
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
<%@ include file="/includes/tu-header-bar.jsp" %>

<!-- Main -->
<div id="main">
    <article class="post">
        <h1>Thêm Chứng Chỉ</h1>
        <hr>       
        <form method="post" action="#">
        
            <div class="row gtr-uniform">
                <div class="col-12">
                    <label>Tên Chứng Chỉ <span style="color:red">*</span> </label>
                    <input type="password" name="demo-name" id="formPass" value="" placeholder="Nhập tên chứng chỉ" />
                </div>
                
                <div class="col-12">
                    <label>Link Chứng Chỉ <span style="color:red">*</span> </label>
                    <input type="password" name="demo-name" id="formPassNew" value="" placeholder="Dán link chứng chỉ" />
                    <p id="invalidNewPass" class="invalid"></p>
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
    </article>
</div>
<!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/tu-side-bar.jsp" %>
</html>