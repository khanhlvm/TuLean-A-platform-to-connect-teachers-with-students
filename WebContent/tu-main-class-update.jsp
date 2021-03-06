<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="r" class="tulearn.dao.RequestDAO" scope="session"/>

<!DOCTYPE HTML>
<html>

<head>
    <title>Cập nhật trạng thái lớp học của GS - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="icon" href="images/icon-tab.png">
    <link rel="stylesheet" href="assets/css/req-manger.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/validation.js"></script>
</head>
<!-- Add header bar -->
<%@ include file="/includes/tu-header-bar.jsp" %>

<!-- Main -->
        <div id="main">
            <!-- Post --> 
            <article class="post">
                <header class="header_post">
                    <div class="title">
                        <h3 style="text-align: center;">Cập nhật trạng thái lớp học</h3>
                    </div>
                </header>
                <section>
                    <form method="post" action="#">
                        <div class="row gtr-uniform">
                            <div class="col-4">
                                <label for="">Trạng thái cập nhật:</label>
                            </div>                            
                            <div class="col-6">                           
                                <select name="tt_category" id="tt_category">
                                    <option value="">- Chọn trạng thái -</option>
                                    <option value="10">Chưa xác nhận</option>
                                    <option value="11">Đồng ý</option>
                                    <option value="12">Từ chối</option>                             
                                </select>
                                <div class="body_text">

                        <c:forEach items="${requestScope.LIST_REQ}" var="req"> 
								<input type="hidden" name="btnTutorID" value="${req.tutor.userID}">
								 <input type="hidden" name="btnPostID" value="${req.post.postID}">
						</c:forEach>		 	
							</div>
                            </div>
                            <p id="state4" class="error"></p>
                        </div>
                        <hr>
                        <div class="btn_xh">
                            
                            <input style="margin-left: 15em" type="button" value="Hủy" onclick="javascript:history.go(-1);"/>
                            <input type="submit" class="button btn" value="Cập Nhật"> 
                        </div>
                    </form>
                </section>
            </article>
            
        </div>
        <!-- End Main -->

<!-- Add side bar -->
<%@ include file="/includes/tu-side-bar.jsp" %>   
