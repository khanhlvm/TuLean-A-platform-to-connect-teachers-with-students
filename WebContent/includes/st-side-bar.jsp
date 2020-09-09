<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Main Above -->

		<!-- Sidebar -->
		<section id="sidebar">

			<!-- Intro -->
			<section id="intro">
				<a href="#" class="logo"><img src="images/logo.jpg" alt="" /></a>
				<header>					
					<c:if test="${u.name==null}"><h2>Tên học viên</h2></c:if>
					<c:if test="${u.name!=null}"><h2>${u.name}</h2></c:if>
					<p><i class="fas fa-user-tag"></i> Học viên </p>
					<p><i class="fas fa-user-check"></i> Trạng thái: normal </p>
				</header>
			</section>
			<section id="menu-bar">
				<ul class="alt">
					<li><i class="far fa-address-card"></i> <a href="ListInfoUserServlet">Xem
							trang cá nhân của bạn</a></li>
					<li><i class="fas fa-unlock-alt"></i> <a href="cm-main-change-pass.jsp">Thay đổi
							mật khẩu</a></li>
					<li><i class="fas fa-edit"></i> <a href="cm-main-info-update.jsp">Cập nhật thông
							tin</a></li>
					<li><i class="far fa-bell"></i> <a href="">Quản lý thông
							báo</a></li>
					<li><i class="fas fa-sign-out-alt"></i> <a href="LogoutController">Đăng
							xuất</a></li>
				</ul>
				<h2>
					Gia sư gần bạn <i class="fas fa-hand-point-down"></i>
				</h2>

			</section>

			<!-- Posts List -->
			<section>
				<ul class="posts">
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Tên Gia sư</a>
								</h3>
								<p class="published">
									Hải Châu, Đà Nẵng - Rate 4.5 <i class="fas fa-star"></i>
								</p>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic08.jpg" alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Tên Gia sư</a>
								</h3>
								<p class="published">
									Hải Châu, Đà Nẵng - Rate 4.5 <i class="fas fa-star"></i>
								</p>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic09.jpg" alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Tên Gia sư</a>
								</h3>
								<p class="published">
									Thanh Khê, Đà Nẵng - Rate 3.5 <i class="fas fa-star"></i>
								</p>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic10.jpg" alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Tên Gia sư</a>
								</h3>
								<p class="published">
									Liên Chiểu, Đà Nẵng - Rate 5 <i class="fas fa-star"></i>
								</p>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic11.jpg" alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Tên Gia sư</a>
								</h3>
								<p class="published">
									Sơn Trà, Đà Nẵng - Rate 4.8 <i class="fas fa-star"></i>
								</p>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic12.jpg" alt="" /></a>
						</article>
					</li>
				</ul>
			</section>

			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
					nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus
					porttitor magna enim, ac accumsan tortor cursus at phasellus sed
					ultricies.</p>
				<ul class="actions">
					<li><a href="#" class="button">Learn More</a></li>
				</ul>
			</section>

			<!-- Footer -->
			<section id="footer">
				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-facebook-f"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon solid fa-rss"><span
							class="label">RSS</span></a></li>
					<li><a href="#" class="icon solid fa-envelope"><span
							class="label">Email</span></a></li>
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