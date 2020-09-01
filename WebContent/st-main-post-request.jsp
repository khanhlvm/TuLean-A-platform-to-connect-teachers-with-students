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

            <!-- Tabbar -->
            <div class="noti">
                <i class="fas fa-exclamation-circle noti_icon"></i>
                <p>Vui lòng điền đầy đủ thông tin bên dưới để tiếp tục</p>
            </div>


            <!-- Post -->
            <article class="post">
                <div class="post_header">
                    <div class="body_img">
                        <img src="images/pic08.jpg" class="image img_body" alt="">
                    </div>
                    <div class="post_header_text">
                        <p class="name_tutor">Ngô Văn Đạt</p>
                        <p>Giáo viên trường Sư Phạm TPHCM</p>
                        <p>Học Phí: <span>100.000 đồng/Buổi</span></p>
                    </div>
                </div>
                <section>

                    <form method="post" action="#">
                        <div class="row gtr-uniform">
                            <div class="col-6 col-12-xsmall">
                                <label for="">Lớp học <span class="phainhap">*</span> </label>
                                <select name="class_category" id="class_category">
                                    <option value="">- Lớp Học -</option>
                                    <option value="1">Lớp 10</option>
                                    <option value="1">Lớp 11</option>
                                  
                                </select>
                                <p id="state" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Môn học <span class="phainhap">*</span></label>
                                <select name="subject_category" id="subject_category">
                                    <option value="">- Môn Học -</option>
                                    <option value="1">Toán</option>
                                    <option value="1">Lí</option>
                                  
                                </select>
                                <p id="state1" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Số buổi/Tuần <span class="phainhap">*</span></label>
                                <select name="num_category" id="num_category">
                                    <option value="">- Chọn số buổi dạy -</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                  
                                </select>
                                <p id="state2" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Số giờ học/Buổi <span class="phainhap">*</span></label>
                                <select name="num_category" id="hour_category">
                                    <option value="">- Số giờ học -</option>
                                    <option value="1">1</option>
                                    <option value="2">1.5</option>
                                    <option value="3">2</option>
                                    <option value="4">2.5</option>
                                    <option value="5">3</option>
                                   
                                  
                                </select>
                                <p id="state3" class="error"></p>
                            </div>
                            <div class="col-12">
                                <label for="">Lịch học</label>
                                <span>(chọn thời gian rảnh bạn có thể học)</span>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Thứ Hai:</label>
                                <input type="checkbox" id="ThuHai" name="ThuHai">
                                <label for="ThuHai">15:00-17:00</label>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Thứ Ba:</label>
                                <input type="checkbox" id="ThuBa" name="ThuBa">
                                <label for="ThuBa">15:00-17:00</label>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Thứ Tư:</label>
                                <input type="checkbox" id="ThuTu" name="ThuTu">
                                <label for="ThuTu">15:00-17:00</label>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Thứ Năm:</label>
                                <input type="checkbox" id="ThuNam" name="ThuNam">
                                <label for="ThuNam">15:00-17:00</label>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Thứ Sáu:</label>
                                <input type="checkbox" id="ThuSau" name="ThuSau">
                                <label for="ThuSau">15:00-17:00</label>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Thứ Bảy:</label>
                                <input type="checkbox" id="ThuBay" name="ThuBay">
                                <label for="ThuBay">15:00-17:00</label>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Chủ Nhật:</label>
                                <input type="checkbox" id="ChuNhat" name="ChuNhat">
                                <label for="ChuNhat">15:00-17:00</label>
                            </div>


                        </div>
                        <div class="btn_xh">
                            <a href="#" id="btnTiepTuc" class="button large btn">Tiếp Tục</a>
                        </div>
                    </form>
                </section>
            </article>
        </div>
        <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>
        