
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:useBean id="r" class="tulearn.dao.RequestDAO" scope="session"/>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang quản lý yêu cầu của HV - TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/thu_css.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/input-radio.css">
    <link rel="stylesheet" href="assets/css/req-manger.css">
    <link rel="icon" href="images/icon-tab.png">
</head>
<!-- Add header bar -->
<%@ include file="/includes/st-header-bar.jsp" %>

<!-- Main -->
        <div id="main">
        <%@ include file="/includes/cm-notification-bar.jsp" %>
            <!-- Tabbar -->
           <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'London')">Yêu cầu tìm GS</button>
                <button class="tablinks" onclick="openCity(event, 'Paris')">Gửi lời mời dạy</button>
                <button class="tablinks" onclick="openCity(event, 'Tokyo')">GS gửi yêu cầu</button>
            </div>
            
            <div id="London" class="tabcontent">
                <!-- Post -->
                  <c:forEach items="${requestScope.LIST_REQPOST}" var="re"> 
                  
                <article class="post">
                    <header>
                        <div class="title">
                            <h2><a href="single.html">Bạn đã đăng yêu cầu tìm gia sư</a></h2>                          
                            <a class="quanly" onclick="" href="update-post?id=${re.postID}">Chỉnh sửa</a>
                            <a class="quanly" onclick="" href="delete-post?btnPostID=${re.postID}">Hủy yêu cầu</a>                       
                        </div>
                        
                    </header>
                    <div class="row bai">
                        <div class="row col-6 col-12-xsmall">
                            <label for="">Môn Học: </label>
                            <p>${re.subject.sName}</p>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label for="">Giới Tính Gia Sư: </label>
                            <p>${re.gender.gName}</p>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label for="">Trình Độ Gia Sư: </label>
                            <p>${re.qualificate.qName}</p>
                        </div>                         
                        <div class="row col-6 col-12-xsmall">
                            <label for="">Học Phí Đề Xuất/Buổi: </label>
                            <p>${re.fee}</p>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label for="">Số Giờ Học/Buổi: </label>
                            <p>${re.lessonLearn}</p>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label for="">Số Buổi Học/Ngày: </label>
                            <p>${re.timeLearn}</p>
                        </div>
                        <div class="row col-6 col-12-xsmall">
                            <label for="">Ngày Dự Kiến Bắt Đầu Học: </label>
                            <p>${re.startDay}</p>
                        </div>
                        <div class="row col-12 more1">
                            <label for="">Mong Muốn, Yêu Cầu Khác Của Học Viên: </label>
                            <p>${re.postDes}</p>
                        </div>
                        <div class="row col-6 more1">
                            <label for="">Thời Gian Rảnh Trong Tuần: </label>
                            <p>Thứ 2: 15:00-17:00</p>
                        </div>
                        <div class="row col-6 more1">
							<input type="hidden" name="btnPostID" value="${re.postID}">	
                         </div>
                        
                    </div>
                    <footer>
                        <ul class="actions">
                            <li><a class="button large" onclick="HienThi(1)">Thêm / ẩn Thông Tin</a></li>
                        </ul>
                       
                    </footer>
                </article>
                 </c:forEach>
            </div>

            <div id="Paris" class="tabcontent">
                <!-- Post -->
              <c:forEach items="${requestScope.LIST_REQ}" var="req"> 
         	       <form action="StHuyYeuCauController" method="GET">
                <article class="post" >
                  
                    <header class="header_post">
                        <div class="title">
                            <h3>bạn đã đăng kí học <span>${req.post.subject.sName}</span> với gia sư <span>${req.tutor.name}</span></h3>
                        </div>
                        <div class="meta meta_ci">
                            <div class="circle"></div>
                            <p>Đang chờ xác nhận từ gia sư</p>
                        </div>
                    </header>
                    <div class="body_tokyo">
                        <div class="body_first">
                            <div class="body_text">
                                <span>Môn:</span>
                                <p>${req.post.subject.sName}</p>
                            </div>
                            <div class="body_text">
                                 <input type="hidden" name="btnTutorID" value="${req.tutor.userID}">
					             <input type="hidden" name="btnPostID" value="${req.post.postID}">	
                            </div>
                           
                        </div>
                        <div class="body_second">
                            <div class="body_text">
                                <span>Số buổi/Tuần:</span>
                                <p>${req.post.lessonLearn} buổi</p>
                            </div>
                            <div class="body_text">
                                <span>Thời gian/Buổi:</span>
                                <p>${req.post.timeLearn} giờ </p>
                            </div>
                        </div>
                    </div>
                    
                    <footer>
								
					   
                       <input type="submit" class="button btn"  value="Hủy yêu cầu">
                    </footer>
                    
                </article>
                </form>
             </c:forEach>
            </div>

            <div id="Tokyo" class="tabcontent">
             <c:forEach items="${requestScope.LIST_REQGS}" var="reqe">
              <form action="StTuChoiController" method="GET"> 
                <article class="post">
                    <header class="header_post">
                        <div class="title">

                            <h3>Gia Sư <span>${reqe.tutor.name}</span> đăng kí dạy môn <span>${reqe.post.subject.sName}</span> với bạn</h3>
                        </div>

                    </header>
                    <div class="body_img">
                        <img src="images/pic08.jpg" class="image img_body" alt="">
                        <h2>${reqe.tutor.name}</h2>
                    </div>
                    <div class="body_tokyo">
                        <div class="body_first">
                            <div class="body_text">
                                <span>Dạy môn:</span>
                                <p>${reqe.post.subject.sName}</p><br>
                            </div>
                            <div class="body_text">
                                <span>Trình độ:</span>
                                <p>${reqe.tutor.qualificate.qName}</p>
                            </div>
                           
                        </div>
                        <div class="body_second">
                            <div class="body_text">
                                <span>Học Phí:</span>
                                <p>${reqe.tutor.salary} đ/Buổi</p>
                            </div>
                            <div class="body_text">

                                <span>Địa chỉ:</span>
                                <p>${reqe.tutor.address.provinceName}</p>
                            </div>
                             <div class="body_text">
                                  
                             
                                 <input type="hidden" name="btnTutorID" value="${reqe.tutor.userID}">
					             <input type="hidden" name="btnPostID" value="${reqe.post.postID}">	
                            </div>
                        </div>
                    </div>

                    <footer class="footer_jc">
                    <input type="submit" class="button btn"  value="Từ Chối">
                    <input type="submit" class="button btn" formaction="StChapNhanController"  value="Chấp Nhận">
                      
                    </footer>
                </article>
                </form>
                  </c:forEach>
            </div>
            
            <script>
                function openCity(evt, cityName) {
                    var i, tabcontent, tablinks;
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }
                    document.getElementById(cityName).style.display = "block";
                    evt.currentTarget.className += " active";
                }
            </script>
         
        </div> 
		<!-- End Main -->
		
<!-- Add side bar -->
<%@ include file="/includes/st-side-bar.jsp" %>
