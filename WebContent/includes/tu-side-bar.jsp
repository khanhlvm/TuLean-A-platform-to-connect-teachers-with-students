<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Main Above -->
    <!-- Sidebar -->
        <section id="sidebar">

            <!-- Intro -->
            <section id="intro">
                <a href="#" class="logo"><img src="images/tu-avatar.jpg" alt="" /></a>
				<header>					
					<c:if test="${u.name==null}"><h2>Tên gia sư</h2></c:if>
					<c:if test="${u.name!=null}"><h2>${u.name}</h2></c:if>
					<p><i class="fas fa-user-tag"></i> Gia sư </p>
					<p><i class="fas fa-user-check"></i> Trạng thái: normal </p>
				</header>
            </section>
            <section id="menu-bar">
                <ul class="alt">
                    <li>
                        <i class="far fa-address-card"></i>
                        <a href="ListInfoUserServlet">Xem hồ sơ của bạn</a>
                    </li>
                    <li>
                        <i class="fas fa-unlock-alt"></i>
                        <a href="cm-main-change-pass.jsp">Thay đổi mật khẩu</a>
                    </li>
                    <li>
                        <i class="fas fa-edit"></i>
                        <a href="tu-main-info-update.jsp">Cập nhật hồ sơ</a>
                    </li>
                    <li>
                        <i class="far fa-bell"></i>
                        <a href="">Quản lý thông báo</a>
                    </li>
                    <li>
                        <i class="fas fa-sign-out-alt"></i>
                        <a href="LogoutController">Đăng xuất</a>
                    </li>
                </ul>
                <h2>Yêu cầu phù hợp với bạn <i class="fas fa-hand-point-down"></i></h2>
            </section>

            <!-- Mini Posts -->
            <section>
                <div class="mini-posts">
				<c:forEach items="${hm}" var="ps">
                    <!-- Mini Post -->
                    <article class="mini-post">
                        <header>
                            <h3><a href="single.html">Tìm gia sư dạy ${ps.key.subject.sName}</a></h3>
                            <p class="published">${ps.key.address.districtName} - ${ps.key.address.provinceName}</p>
                            <p class="published">Học phí: ${ps.key.fee} đ/buổi</p>
                            <p class="published">Thời gian: 
							<c:forEach items="${ps.value}" var="sc">
		                    		Thứ ${sc.dayTime} : ${sc.startTime} - ${sc.endTime},
		                    </c:forEach>
							</p>
                            <a href="#" class="author"><img src="images/post-avatar.jpg" alt="" /></a>
                        </header>
                        <a href="single.html" class="image"><img src="images/pic98.jpg" alt="" /></a>
                    </article>
				</c:forEach>
                </div>
            </section>

            <!-- About -->
	<section class="blurb">
	    <h2>Về chúng tôi</h2>
	    <p>Hiện nay, nhiều người có nhu cầu tìm kiếm gia sư rất lớn và phổ biến. Để đáp ứng nhu cầu này, hàng loạt các trung tâm gia sư được thành lập để ...</p>
	    <div class="box alt">
            <div class="row gtr-uniform">
                <div class="col-4"><span class="image fit"><img src="images/pic98.jpg" alt="" /></span></div>
                <div class="col-4"><span class="image fit"><img src="images/pic97.jpg" alt="" /></span></div>
                <div class="col-4"><span class="image fit"><img src="images/pic96.jpg" alt="" /></span></div>
            </div>
        </div>
	    <ul class="actions">
	        <li><a href="#" class="button">Xem thêm</a></li>
	    </ul>
	</section>

            <!-- Footer -->
            <section id="footer">
                <ul class="icons">
                    <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                    <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
                    <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
                </ul>
                <p class="copyright">&copy; TuLearn Design Team</p>
            </section>

        </section>

    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
	<script src="assets/js/thu_js.js"></script>
	
</body>

</html>