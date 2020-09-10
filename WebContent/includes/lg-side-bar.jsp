<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<!-- Main Above -->
<!-- Sidebar -->
<section id="sidebar">

	<!-- Tabbar -->
	<div class="tab">
	    <button class="tablinks"><i class="fas fa-user-graduate"></i></button>
	    <button class="tablinks" onclick="openCity(event, 'Login')">Đăng nhập</button>
	    <button class="tablinks" onclick="openCity(event, 'Register')">Đăng ký</button>
	</div>
	<script src="assets/js/tab-bar.js"></script>
	
	<!-- LoginTab -->
    <div id="Login" class="tabcontent">
        <section id="login-area">
            <form action="login" method="POST">
                <div class="row gtr-uniform">
                    <div class="col-12">
                        <label for="inputEmail">Địa chỉ Email <span style="color:red">*</span> </label>                                
                        <input type="email" name="email" id="inputEmail" placeholder="Nhập địa chỉ email" required="required"/>
                        <span class="validEmail hidden general valid"><i class="fas fa-check-circle noti_icon"></i>
                        Email is valid</span>
                    	<span class="invalidEmail hidden general invalid"><i class="fas fa-exclamation-circle noti_icon"></i>
                    	Email is invalid</span>                              
                    </div>
                    <div class="col-6">
                       	<label for="typing-password">Mật khẩu <span style="color:red">*</span> </label>
                       	</div>
                       	<div class="col-6">
                       	<label for="" style="text-align: right;"><a href="#">Quên mật khẩu?</a> </label>
                    </div>
                    <div class="col-12">                                               
                        <input type="password" name="password" id="loginPassword" placeholder="Nhập mật khẩu" required="required"/>                                 
                    </div>           
                    <div class="col-12">
                    	<hr>
               			<input type="submit" class="button fit"  value="ĐĂNG NHẬP">                                                  	
                    </div>         
                </div>
            </form>
        </section>
    </div>
    			                           
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

</section><!-- End side bar -->

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>