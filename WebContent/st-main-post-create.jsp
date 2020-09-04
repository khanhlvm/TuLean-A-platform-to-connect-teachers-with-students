<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Trang quản lý yêu cầu của HV - TuLearn</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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

                    <form method="post" action="CreatePostController">
                        <div class="row gtr-uniform">

                            <div class="col-6 col-12-xsmall">
                                <label for="MonHoc">Môn Học</label>
                                <select name="MonHoc" id="MonHoc">
                                    <option value="">- Môn Học -</option>
                                    <option value="1">Hóa</option>
                                    <option value="1">Toán</option>
                                    <option value="1">Ngữ Văn</option>
                                </select>
                                <p id="state1" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="GioiTinhGiaSu">Giới Tính Gia Sư</label>
                                <select name="GioiTinhGiaSu" id="GioiTinhGiaSu">
                                    <option value="">- Giới Tính Gia Sư -</option>
                                    <option value="1">Nam</option>
                                    <option value="2">Nữ</option>
                                    <option value="3">Cả Hai</option>
                                </select>
                                <p id="state2" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="TrinhDoGiaSu">Trình Độ Gia Sư</label>
                                <select name="TrinhDoGiaSu" id="TrinhDoGiaSu">
                                    <option value="">- Trình Độ Gia Sư -</option>
                                    <option value="1">Sinh Viên</option>
                                    <option value="2">Giáo Viên</option>
                                    <option value="3">Toàn Bộ</option>
                                </select>
                                <p id="state3" class="error"></p>
                            </div>
                            <div class="col-6 col-12-xsmall">
                                <label for="">Học Phí Đề Xuất</label>
                                <input type="text" name="HocPhiDeXuat" id="HocPhiDeXuat" value=""
                                    placeholder="0 vnđ/buổi" />
                                <p id="state4" class="error"></p>
                            </div>

                            <div class="col-6 col-12-xsmall">
                                <label for="SoGioMotBuoi">Số Giờ/Buổi</label>
                                <select name="SoGioMotBuoi" id="SoGioMotBuoi">
                                    <option value="1">1</option>
                                    <option value="1.5">1.5</option>
                                    <option value="2">2</option>
                                    <option value="2.5">2.5</option>
                                </select>
                            </div>

                            <div class="col-6 col-12-xsmall">
                                <label for="SoBuoiMotTuan">Số Buổi/Tuần</label>
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
                                <label for="">Ngày Dự Kiến Bắt Đầu Học</label>
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
                                 <div class="col-12" id="ngay1">                       
				                    <div class="row canh col-12 gioranh1" id="idGioRanh">
				                        <div class="row canh col-3 col-6-xsmall gio">
				                            <select class="" name="NgayRanh">
				                            	<option value="">Chọn thứ</option>
					                            <c:forTokens items="Thứ 2, Thứ 3, Thứ 4, Thứ5, Thứ6, Thứ 7, CN" delims="," var="day">												  																                                
					                                <option value="<c:out value="${day}"/>"><c:out value="${day}"/></option>
					                            </c:forTokens>
				                            </select>
				                        </div>
				                        <label class="phancachgio" for="">-</label>
				                        <div class="row canh col-3 col-6-xsmall gio">
				                            <select name="GioBatDau" id="demo-category">
				                                <option value="">Giờ Bắt Đầu</option>
				                                <c:forTokens items="7:00,7:30,8:00,8:30,9:00,,9:30,10:00,10:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30,18:00,18:30,19:00" delims="," var="st">
					                                <option value="${st}">${st}</option>
					                            </c:forTokens>
				                            </select>
				                        </div>
				                        <label class="phancachgio" for="">-</label>
				                        <div class="row canh col-3 col-6-xsmall gio">
				                            <select name="GioKetThuc" id="demo-category">
				                                <option value="">Giờ Kết Thúc</option>
				                                <c:forTokens items="8:00,8:30,9:00,,9:30,10:00,10:30,11:00,11:30,12:00,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30,18:00,18:30,19:00,19:30,20:00,20:30,21:00" delims="," var="et">
					                                <option value="${et}">${et}</option>
					                            </c:forTokens>
				                            </select>
				                        </div>
				                    </div>
				                    <div class="col-12" id="add_more1"> </div>
				                <input class="themgio" type="button" value="Thêm Giờ" onclick="ThemGio(this)">
				            </div>  
                            </div>
                            <div class="col-12">
                                <hr>
                                <ul class="btnArea" >                                   
                                    <li><input type="submit" value="Đăng Bài" /></li>
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
