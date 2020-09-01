<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang quản lý yêu cầu của HV - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/thu_css.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">
    <link rel="icon" href="images/icon-tab.png">
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp" %>

<!-- Main -->
        <div id="main">
            <article class="post">
                <!-- Post -->
                <section>
                    <h2>Tạo yêu cầu tìm gia sư</h2>

                    <form method="post" action="#">
                        <div class="row gtr-uniform">

                            <div class="col-6 col-12-xsmall">
                                <label for="MonHoc">Môn Học <span class="phainhap">*</span></label>
                                <select name="MonHoc" id="MonHoc">
                                    <option value="">- Môn Học -</option>
                                    <option value="1">Hóa</option>
                                    <option value="1">Toán</option>
                                    <option value="1">Ngữ Văn</option>
                                </select>
                                <p id="state1" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="GioiTinhGiaSu">Giới Tính Gia Sư <span class="phainhap">*</span></label>
                                <select name="GioiTinhGiaSu" id="GioiTinhGiaSu">
                                    <option value="">- Giới Tính Gia Sư -</option>
                                    <option value="1">Nam</option>
                                    <option value="2">Nữ</option>
                                    <option value="3">Cả Hai</option>
                                </select>
                                <p id="state2" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="TrinhDoGiaSu">Trình Độ Gia Sư <span class="phainhap">*</span></label>
                                <select name="TrinhDoGiaSu" id="TrinhDoGiaSu">
                                    <option value="">- Trình Độ Gia Sư -</option>
                                    <option value="1">Sinh Viên</option>
                                    <option value="2">Giáo Viên</option>
                                    <option value="3">Toàn Bộ</option>
                                </select>
                                <p id="state3" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Học Phí Đề Xuất <span class="phainhap">*</span></label>
                                <input type="text" name="HocPhiDeXuat" id="HocPhiDeXuat" value=""
                                    placeholder="0 vnđ/buổi" />
                                <p id="state4" class="error"></p>
                            </div>

                            <div class="col-6 col-12-xsmall">
                                <label for="SoGioMotBuoi">Số Giờ/Buổi <span class="phainhap">*</span></label>
                                <select name="SoGioMotBuoi" id="SoGioMotBuoi">
                                    <option value="1">1</option>
                                    <option value="1.5">1.5</option>
                                    <option value="2">2</option>
                                    <option value="2.5">2.5</option>
                                </select>
                            </div>

                            <div class="col-6 col-12-xsmall">
                                <label for="SoBuoiMotTuan">Số Buổi/Tuần <span class="phainhap">*</span></label>
                                <select name="SoBuoiMotTuan" id="SoBuoiMotTuan">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <label for="">Ngày Dự Kiến Bắt Đầu Học <span class="phainhap">*</span></label>
                                <input type="date" name="Date" id="datepicker" />
                            </div>
                            <p id="state5" class="error"></p>

                            <div class="col-12">
                                <label for="">Yêu cầu, mong muốn khác của học viên</label>
                                <textarea name="demo-message" id="demo-message" placeholder="Enter your message"
                                    rows="6"></textarea>
                            </div>
                            <!-- Ngày Rảnh -->
                            <div class="col-12">
                                <label for="">Ngày Rảnh Trong Tuần</label>
                            </div>
                            <div class="col-12">
                                <div class="row canh ngay" id="ngay1">
                                    <label for="">Thứ Hai</label>
                                    <div class="row canh col-12 gioranh1 original" id="idGioRanh">
                                        <div class="row canh col-3 col-6-xsmall gio">
                                            <select name="GioBatDau" id="demo-category">
                                                <option value="">Giờ Bắt Đầu</option>
                                                <option value="1">1.5</option>
                                                <option value="1">2</option>
                                                <option value="1">2.5</option>
                                            </select>
                                        </div>
                                        <label class="phancachgio" for="">-</label>
                                        <div class="row canh col-3 col-6-xsmall gio">
                                            <select name="GioBatDau" id="demo-category">
                                                <option value="">Giờ Kết Thúc</option>
                                                <option value="1">1.5</option>
                                                <option value="1">2</option>
                                                <option value="1">2.5</option>
                                            </select>
                                        </div>
                                        <a class="gio XoaGio" onclick="XoaGio(this)"><i
                                                class="fas fa-times-circle"></i></a>
                                    </div>
                                    <div class="col-12" id="add_more1"> </div>
                                    <input class="themgio" type="button" value="Thêm Giờ" onclick="ThemGio(this)">

                                </div>
                                <div class="row canh ngay" id="ngay2">
                                    <label for="">Thứ Ba</label>
                                    <div class="col-12" id="add_more2"> </div>
                                    <input class="themgio" type="button" value="Thêm Giờ" onclick="ThemGio(this)">

                                </div>
                                <div class="row canh ngay" id="ngay3">
                                    <label for="">Thứ Tư</label>
                                    <div class="col-12" id="add_more3"> </div>
                                    <input class="themgio" type="button" value="Thêm Giờ" onclick="ThemGio(this)">

                                </div>
                                <div class="row canh ngay" id="ngay4">
                                    <label for="">Thứ Năm</label>
                                    <div class="col-12" id="add_more4"> </div>
                                    <input class="themgio" type="button" value="Thêm Giờ" onclick="ThemGio(this)">

                                </div>
                                <div class="row canh ngay" id="ngay5">
                                    <label for="">Thứ Sáu</label>                                   
                                    <div class="col-12" id="add_more5"> </div>
                                    <input class="themgio" type="button" value="Thêm Giờ" onclick="ThemGio(this)">

                                </div>
                                <div class="row canh ngay" id="ngay6">
                                    <label for="">Thứ Bảy</label>
                                    <div class="col-12" id="add_more6"> </div>
                                    <input class="themgio" type="button" value="Thêm Giờ" onclick="ThemGio(this)">
                                </div>
                                <div class="row canh ngay" id="ngay7">
                                    <label for="">Chủ Nhật</label>
                                    <div class="col-12" id="add_more7"> </div>
                                    <input class="themgio" type="button" value="Thêm Giờ" onclick="ThemGio(this)">

                                </div>
                            </div>
                            <div class="col-12">
                                <hr>
                                <ul class="btnArea" >                                   
                                    <li><input id="btnDangBai" type="submit" value="Đăng Bài" /></li>
                                    <li><input id="btnReset" type="reset" value="Reset" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </section>
            </article>
        </div>
        <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>
