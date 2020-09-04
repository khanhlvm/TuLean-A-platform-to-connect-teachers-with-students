<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang cập nhật thông tin cá nhân của GS - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/input-radio.css" />
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="icon" href="images/icon-tab.png">
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
                <h1>Cập nhật thông tin</h1>
                <form method="post" action="#">
                    <div class="row gtr-uniform">
                        <div class=" col-6"  >
                            <label for="">Họ và tên </label>
                            <input type="text" id="formHovaTen" placeholder="Nhập họ và tên">
                            <p id="invalidHovaTen"  class="invalid"></p>
                        </div>

                        <div class="col-6">
                            <label for=""> Giới tính </label>
                            <input type="radio" id="demo-priority-low" name="demo-priority" checked>
                            <label for="demo-priority-low">Nam</label>

                            <input type="radio" id="demo-priority-normal" name="demo-priority">
                            <label for="demo-priority-normal">Nữ</label>

                            <input type="radio" id="demo-priority-high" name="demo-priority">
                            <label for="demo-priority-high">Khác</label>
                        </div>

                        <div class=" col-6">
                            <label for="">Địa chỉ Email </label>
                            <input type="text" id="formEmail" placeholder="Nhập địa chỉ email">
                            <p id="invalidEmail"  class="invalid"></p>
                        </div>

                        
                        <div class="col-6"  >
                            <label for="" >Số điện thoại </label>
                            <input type="text" id= "formSDT" placeholder="Nhập số điện thoại">
                            <p id="invalidSDT"  class="invalid"></p>
                        </div>

                        <div class="col-6"  >
                            <label for="" >CMND </label>
                            <input type="text" id="formCMND" placeholder="Nhập số CMND">
                            <p id="invalidCMND"  class="invalid"></p>
                        </div>
                        <div class=" col-6"  >
                            <label for="">Mức lương </label>
                            <input type="text" id="formHovaTen" placeholder="Nhập mức lương">
                            <p id="invalidHovaTen"  class="invalid"></p>
                        </div>
                        <div class=" col-12">
                            <label for="">Nơi Làm việc </label>
                            <input type="text" id="formEmail" placeholder="Nhập nơi làm việc">
                            <p id="invalidEmail"  class="invalid"></p>
                        </div>
                        <div class=" col-6">
                            <label for="">Trình độ chuyên môn </label>
                            <input type="text" id="formEmail" placeholder="Nhập trình độ chuyên môn">
                            <p id="invalidEmail"  class="invalid"></p>
                        </div>                  
            
                        <div class="col-6" >
                            <label for="" >Tỉnh/TP </label>
                            <select name="cars" id="cars">
                                <option value="">Đà Nẵng</option>
                                <option value="">Hà Nội</option>
                                <option value="o">Hồ Chí Minh</option>
                              </select>
                        </div>
                        <div class="col-6" >
                            <label for="" >Quận/Huyện </label>
                            <select name="cars" id="cars">
                                <option value="">Hải Châu</option>
                                <option value="">Hòa Vang</option>
                                <option value="">Sơn Trà</option>
                              </select>
                        </div>
                        <div class="col-6" >
                            <label for="" >Phường/Xã </label>
                            <select name="cars" id="cars">
                                <option value="">...</option>
                                <option value="">...</option>
                                <option value="o">...</option>
                              </select>
                        </div>
                        <div class="col-12">
                            <label for="" >Số nhà, Đường</label>
                            <input type="text" id = "formSoNha" placeholder="Nhập số nhà, đường">
                            <p id="invalidSoNha"  class="invalid"></p>
                        </div>
                        <div class="col-12">
                            <hr>
                            <ul class="actions">
                                <li><input type="reset" value="HỦY" /></li>
                                <li><input type="submit" value="CẬP NHẬT" id="btn-CapNhat" /></li>
                            </ul>
                        </div>
                  
                    </div>
                </form>
            </article>
        </div>
        <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/tu-side-bar.jsp" %>        
        