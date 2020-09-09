<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>
    <title>Đăng kí học với Gia Sư của HV - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/req-manger.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/validation.js"></script>
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp" %>

<!-- Main -->
        <div id="main">
            <!-- Post -->
            <article class="post">
                <h1>Thông tin liên hệ người học</h1>
                <section>

                    <form method="post" action="#">
                        <div class="row gtr-uniform">
                            <div class="col-6 col-12-xsmall">
                                <label for="">Họ và Tên <span style="color:red">*</span></label>
                                <input type="text" name="name" id="name" value="" placeholder="Nhập Họ và Tên" />
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Số điện thoại <span style="color:red">*</span></label>
                                <input type="text" name="SĐT" id="SĐT" value="" placeholder="Nhập Số điện thoại" />
                                <p id="phone" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Tỉnh/Thành phố <span style="color:red">*</span></label>
                                <select name="Tinh_category" id="Tinh_category">
                                    <option value="">- Tỉnh/Thành phố -</option>
                                    <option value="1">Quảng Ngãi</option>
                                    <option value="1">Đà Nẵng</option>
                                    
                                </select>
                            </div>

                            <div class="col-6 col-12-xsmall">
                                <label for="">Quận huyện <span style="color:red">*</span></label>
                                <select name="Quan_category" id="Quan_category">
                                <option value="">- Quận/Huyện -</option>
                                <option value="1">lí sơn</option>
                                <option value="1">Tư nghĩa</option>
                                
                            </select>
                            </div>
                            <div class="col-12">
                                <label for="">Địa chỉ chi tiết</label>
                                <input type="text" name="DiaChi" id="DiaChi" value="" placeholder="Địa chỉ chi tiết" />
                            </div>

                            <div class="col-12">
                                <label for="">Mô tả học lực học sinh và mong muốn của phụ huynh/học sinh</label>
                                <textarea name="MoTa" id="MoTa" placeholder="Nhập tình hình học tập của học sinh" rows="4"></textarea>
                            </div>

                        </div>
                        <div class="btn_xh">
                            <a href="#" class="button btn">Quay lại </a>
                            <a href="#" id="btndangki" class="button btn">Đăng kí học</a>
                        </div>
                    </form>
                </section>
            </article>
        </div>
                <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>