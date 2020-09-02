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

            <div id="Login" class="tabcontent">
                <section id="login-area">
                    <form method="post" action="#">
                        <div class="row gtr-uniform">

                            <div class="col-12">
                                <label for="Email">Địa chỉ Email <span style="color.red">*</span> </label>
                                <input type="text" name="demo-name" id="demo-name" value="" placeholder="Nhập địa chỉ email" />
                            </div>
                            <div class="col-6">
                                <label for="MK">Mật khẩu <span style="color.red">*</span> </label>
                            </div>
                            <div class="col-6">
                                <div style="text-align: right;">
                                    <a href="#">Quên mật khẩu?</a>
                                </div>
                            </div>
                            <div class="col-12">
                                <input type="email" name="demo-email" id="demo-email" value="" placeholder="Nhập mật khẩu" />
                            </div>
                            <div class="col-12">
                                <hr>
                                <a href="#">
                                    <div class="dn">
                                        <p id="dnp"><i class="fas fa-sign-in-alt"></i> Đăng nhập</p>
                                    </div>
                                </a>
                            </div>         

                        </div>
                    </form>
                </section>
            </div>

            <div id="Register" class="tabcontent">
                <section id="login-area">
                    <form method="post" action="#">
                        <div class="row gtr-uniform">
                            <div class="col-12">
                                <label for="e">Bạn là ai? <span style="color.red">*</span> </label>
                            </div>
                            <div class="col-6 col-12-small">
                                <input type="radio" id="demo-priority-low" name="demo-priority" checked>
                                <label for="demo-priority-low">Học viên </label>
                            </div>
                            <div class="col-6 col-12-small">
                                <input type="radio" id="demo-priority-normal" name="demo-priority">
                                <label for="demo-priority-normal">Gia sư </label>
                            </div>
                            <div class="col-12">
                                <label for="Email">Địa chỉ Email <span style="color.red">*</span> </label>
                                <input type="email" name="demo-email" id="demo-email" value="" placeholder="Nhập địa chỉ Email" />
                            </div>
                            <div class="col-12">
                                <label for="MK">Mật khẩu <span style="color.red">*</span> </label>
                                <input type="text" name="demo-name" id="demo-name" value="" placeholder="Đặt mật khẩu" />
                            </div>
                            <div class="col-12">
                                <label for="MK">Nhập lại mật khẩu <span style="color.red">*</span> </label>
                                <input type="text" name="demo-name" id="demo-name" value="" placeholder="Nhập lại mật khẩu" />
                            </div>
                            <div class="col-12">
                                <hr>
                                <input type="checkbox" id="checkbox" name="checkbox" value="checkbox">
                                <label for="checkbox"><a href="#">Chấp nhận Điều khoản sử dụng và Chính sách bảo mật</a></label>
                            </div>
                            <div class="col-12">
                                <a href="#">
                                    <div class="dn">
                                        <p id="dnp"><i class="fas fa-sign-in-alt"></i> Đăng ký</p>
                                    </div>
                                </a>
                            </div>

                        </div>
                    </form>
                </section>
            </div>
    <!-- NhanNTT13 - End Insert Code -->

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

    <!-- About -->
    <section class="blurb">
        <h2>About</h2>
        <p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at phasellus sed ultricies.</p>
        <ul class="actions">
            <li><a href="#" class="button">Learn More</a></li>
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
        <p class="copyright">&copy; TutorLearn Design Team</p>
    </section>

    </section>

    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>