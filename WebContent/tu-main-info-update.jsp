<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Trang cập nhật thông tin cá nhân của GS - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/input-radio.css" />
    <link rel="stylesheet" href="assets/css/common.css">
    <link rel="icon" href="images/icon-tab.png">
    <script src="assets/js/jquery-3.5.1.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/address.js"></script>
</head>
<!-- Add header bar -->
<%@ include file="/includes/tu-header-bar.jsp" %>

<!-- Main -->
        <div id="main">
            <article class="post">
                <h1>Cập nhật thông tin</h1>
                <form method="post" action="update-info">
                    <div class="row gtr-uniform">
                        <div class=" col-6"  >
                            <label for="">Họ và tên <span style="color: red">*</span></label>
                            <input type="text" name="formHovaTen" placeholder="Cập nhật thông tin" value="${u.name}">
                        </div>
                        <div class="col-6">
                            <label for=""> Giới tính </label>
                            <input type="radio" id="demo-priority-low" name="gender" value="1" ${u.gender.gID==1 ? "checked='checked'" : " "}>
                            <label for="demo-priority-low">Nam</label>

                            <input type="radio" id="demo-priority-normal" name="gender" value="2" ${u.gender.gID==2 ? "checked='checked'" : " "}>
                            <label for="demo-priority-normal">Nữ</label>

                            <input type="radio" id="demo-priority-high" name="gender" value="3" ${u.gender.gID==3 ? "checked='checked'" : " "}>
                            <label for="demo-priority-high">Khác</label>
                        </div>
                        <div class=" col-6"  >
                            <label for="">Mã sinh viên <span style="color: red">*</span></label>
                            <input type="text" name="formMSSV" placeholder="Cập nhật thông tin" value="${u.studentCard}">
                        </div>                    
                        <div class=" col-6">
                            <label for="">Địa chỉ Email <span style="color: red">*</span></label>
                            <input type="text" name="formEmail" placeholder="Cập nhật thông tin" value="${u.email}">
                        </div>

                        
                        <div class="col-6"  >
                            <label for="" >Số điện thoại <span style="color: red">*</span></label>
                            <input type="text" name= "formSDT" placeholder="Cập nhật thông tin" value="${u.phone}">
                        </div>

                        <div class="col-6"  >
                            <label for="" >CMND <span style="color: red">*</span></label>
                            <input type="text" name= "formCMND" placeholder="Cập nhật thông tin" value="${u.phone}">
                            <p id="invalidCMND"  class="invalid"></p>
                        </div>
                        <div class=" col-6"  >
                            <label for="">Mức lương</label>
                             <input type="text" name= "formLuong" placeholder="Cập nhật thông tin" value="${u.phone}">
                        </div>
                        <div class=" col-6">
                            <label for="">Nơi Làm việc</label>
                             <input type="text" name= "formNoiLamViec" placeholder="Cập nhật thông tin" value="${u.phone}">
                        </div>
                        <div class="col-6 col-12-xsmall">
						<label for="TrinhDoGiaSu">Trình Độ Gia Sư</label> 
						<select name="qualification" id="TrinhDoGiaSu">
							<c:if test="${u.qualificate.qName!=null}"><option value="${u.qualificate.qID}">${u.qualificate.qName}</option></c:if>
							<c:if test="${u.qualificate.qName==null}"><option value="">-- Trình Độ Gia Sư --</option></c:if>
							<c:forEach  items="${qualificates}" var="qua">
								<option value="${qua.qID}"><c:out value="${qua.qName}"></c:out></option>
							</c:forEach>
						</select>
						<p id="state3" class="error"></p>
					</div>                 
<div class="col-6" >
                            <label for="" >Tỉnh/TP</label>
                            <select name="province" id="province">
                                <c:if test="${u.address.provinceName!=null}"><option value="${u.address.provinceID}">${u.address.provinceName}</option></c:if>
                                <c:if test="${u.address.provinceName==null}"><option>-- Chọn Tỉnh/TP --</option></c:if>
                            </select>
                        </div>
                        <div class="col-6" >
                            <label for="" >Quận/Huyện</label>
                            <select name="district" id="district">
                                <c:if test="${u.address.districtName!=null}"><option value="${u.address.districtID}">${u.address.districtName}</option></c:if>
                                <c:if test="${u.address.districtName==null}"><option>-- Chọn Quận/Huyện --</option></c:if>
                              </select>
                        </div>
                        <div class="col-6" >
                            <label for="" >Phường/Xã</label>
                            <select name="commune" id="commune">                          
                                <c:if test="${u.address.communeName!=null}"><option value="${u.address.communeID}">${u.address.communeName}</option></c:if>
                                <c:if test="${u.address.communeName==null}"><option>-- Chọn Phường/Xã --</option></c:if>
                              </select>
                        </div>

                        <div class="col-6">
                            <label for="" >Số nhà, Đường <span style="color: red">*</span></label>
                            <input type="text" name="formSoNha" placeholder="Cập nhật thông tin" value="${u.street}">
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
        