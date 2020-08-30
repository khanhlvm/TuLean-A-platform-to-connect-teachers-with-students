<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>
    <title>Trang quản lý của Admin | TuLearn</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/admin.css" />
    <link rel="icon" href="images/icon-tab.png">
</head>
<!-- Add header bar -->
<%@ include file="/includes/ad-header-bar.jsp" %>

<!-- Main -->
<div id="main">
         
	<!-- Tab Bar -->
	<div class="tab">
	    <button class="tablinks" onclick="openCity(event, 'London')">Q.Lý Gia sư</button>
	    <button class="tablinks" onclick="openCity(event, 'Paris')">Q.Lý Học viên</button>
	    <button class="tablinks" onclick="openCity(event, 'Tokyo')">Q.Lý Bài đăng</button>
	    <button class="tablinks" onclick="openCity(event, 'Seoul')">Q.Lý Kết nối</button>
	    <button class="tablinks" onclick="openCity(event, 'Hanoi')">Q.Lý Môn học</button>
	    <button class="tablinks" onclick="openCity(event, 'Berlin')">Tài khoản Admin</button>
	</div>
  
	<article class="post">
  
	  	<!-- Tutor Manager -->
	    <div id="London" class="tabcontent">
	    
	        <!-- Search Box -->    
		    <div class="row chi">
		        <form action="/action_page.php">		            
		        	<input type="text" placeholder="Tìm kiếm gia sư..." name="search">		            
		        </form>
		    </div>
		    
		    <!-- Table Info -->
            <div class="table-wrapper chi3">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên gia sư</th>
                            <th>Trạng thái</th>
                            <th>Điểm đánh giá</th>
                            <th>Yêu cầu đã nhận</th>
                            <th>Kết nối thành công</th>
                            <th>Kết nối thất bại</th>
                            <th>Đã thanh toán</th>
                            <th>Chưa thanh toán</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Franklin D. Roosevelt</td>
                            <td>Verified</td>
                            <td>4.3</td>
                            <td>8</td>
                            <td>6</td>
                            <td>2</td>
                            <td>6</td>
                            <td>2</td>
                            <td>
                               <ul class="actions">                                	
                                   <li><a href="#" class="button small">Chi tiết</a></li>
                                   <li><a href="#" class="button small">Cập nhật</a></li>
                                   <li><a href="#" class="bt1 button small">Chặn</a></li>
                               </ul>
                            </td>
                        </tr>                            
                    </tbody>
                    
                </table>
                
                <ul class="breadcrumb">
                   <li><a href="#">Trang trước</a></li>
                   <li><a href="#">6</a></li>
                   <li><a href="#">7</a></li>
                   <li><a href="#">8</a></li>
                   <li><a href="#">Trang sau</a></li>		
               	</ul>

            </div> <!-- End Table Info -->
        </div> <!-- End Tutor Manager -->

		<!-- Student Manager -->
        <div id="Paris" class="tabcontent">
            
            <!-- Search Box -->    
		    <div class="row chi">
		        <form action="/action_page.php">		            
		        	<input type="text" placeholder="Tìm kiếm học viên ..." name="search">		            
		        </form>
		    </div>
		    
		    <!-- Table Info -->
            <div class="table-wrapper chi3">
	            <table>
	                <thead>
	                    <tr>
	                        <th>ID</th>
	                        <th>Tên học viên</th>
	                        <th>Bài đã đăng</th>
	                        <th>Bài đăng bị báo cáo</th>
	                        <th>Yêu cầu đã nhận</th>
	                        <th>Kết nối thành công</th>
	                        <th>Kết nối thất bại</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>1</td>
	                        <td>Vladimir Putin</td>
	                        <td>3</td>
	                        <td>3</td>
	                        <td>1</td>
	                        <td>1</td>
	                        <td>2</td>
	                        <td>
                               <ul class="actions">                                	
                                   <li><a href="#" class="button small">Chi tiết</a></li>
                                   <li><a href="#" class="button small">Cập nhật</a></li>
                                   <li><a href="#" class="bt1 button small">Chặn</a></li>
                               </ul>
                            </td>
	                    </tr>
	                </tbody>
	            </table>
	            
                <ul class="breadcrumb">
                    <li><a href="#">Trang trước</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">Trang sau</a></li>
                </ul>
                
          	</div> <!-- End Table Info -->
        </div> <!-- End Student Manager -->
		
		<!-- Post Manager -->
        <div id="Tokyo" class="tabcontent">            

	   	    <!-- Search Box -->    
		    <div class="row chi">
		        <form action="/action_page.php">		            
		        	<input type="text" placeholder="Tìm kiếm bài đăng ..." name="search">		            
		        </form>
		    </div>
		    
		    <!-- Table Info -->    
            <div class="table-wrapper chi3">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu đề bài đăng</th>
                            <th>Số lượng report</th>
                            <th>Trạng thái bài đăng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>NVA tìm gia sư dạy Toán ...</td>
                            <td>0</td>
                            <td>Active</td>
							<td>
                               <ul class="actions">                               	   
                                   <li><a href="#" class="button small">Người đăng</a></li>
                                   <li><a href="#" class="button small">Bài đăng</a></li>
                                   <li><a href="#" class="button small">Cập nhật</a></li>
                                   <li><a href="#" class="bt1 button small">Ẩn bài đăng</a></li>
                               </ul>
                            </td>
                        </tr>                           
                    </tbody>
                </table>
                
                <ul class="breadcrumb">
                    <li><a href="#">Trang trước</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
                    <li><a href="#">Trang sau</a></li>
                </ul>
                
            </div> <!-- End Table Info -->
        </div> <!-- End Post Manager -->
        
		<!-- Connect Manager -->
        <div id="Seoul" class="tabcontent">     
                
			<!-- Select Box -->
            <div class="row chiSelect">
                <select name="demo-category" id="demo-category">
                	<option value="1">- Chưa Thanh Toán -</option>
                    <option value="1">- Đã Thanh Toán -</option>       
                    <option value="1">- Kết nối thất bại -</option>
                    <option value="1">- Tất cả -</option>          
                </select>
            </div>
            
            <!-- Table Info -->
             <div class="table-wrapper chi3">
                 <table>
                     <thead>
                         <tr>
                             <th>ID Gia sư</th>
                             <th>Tên gia sư</th>
                             <th>ID Học viên</th>
                             <th>Tên học viên</th>
                             <th>Trạng thái kết nối</th>
                         </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <td>1</td>
                             <td>Franklin D. Roosevelt</td>
                             <td>3</td>
                             <td>Vladimir Putin</td>
                             <td>Đang kết nối</td>
                             <td>
                                 <ul class="actions">
                                     <li><a href="#" class="button small">Gia sư</a></li>
                                     <li><a href="#" class="button small">Học viên</a></li>
                                     <li><a href="#" class="button small">Cập nhật</a></li>
                                 </ul>
                             </td>
                         </tr>                         
                     </tbody>
                 </table>
                 
                 <ul class="breadcrumb">
                     <li><a href="#">Trang trước</a></li>
                     <li><a href="#">6</a></li>
                     <li><a href="#">7</a></li>
                     <li><a href="#">8</a></li>
                     <li><a href="#">Trang sau</a></li>
                 </ul>
             
			</div> <!-- End Table Info -->
        </div> <!-- End Connect Manager -->
		
		<!-- Subject Manager -->
        <div id="Hanoi" class="tabcontent">        
	        <div class="row gtr-uniform">
	        
	        	<!-- Add subject area -->
	            <div class="col-6">
	                <h3>Thêm Môn Học </h3>
	                <hr>
	                <form action="">
	                    <label for="add-subject">Tên môn học: </label>
	                    <input type="text" name="add-subject" id="add-subject" value="" placeholder="Nhập tên môn học" />
	                    <br>
	                   	<ul class="actions">
	                       <li><input type="reset" value="Hủy" /></li>
	                       <li><input type="submit" value="Thêm môn học" /></li>
	                   	</ul>
	                </form>                           
	            </div>
	            
                <!-- Show subject area -->
                <div class="col-6">
	                <form action="/action_page.php">
	                    <h3>Danh sách môn học đã có</h3>
	                    <hr>
	                    <input type="text" placeholder="Lọc danh sách môn học đã có" name="search">
	                    
	                    <div class="list">
	                        <ul>
	                            <li>Toán</li>
	                            <li>Văn</li>
	                            <li>Tin học</li>
	                            <li>Anh văn</li>
	                            <li>Lịch sử</li>
	                            <li>Địa lý</li>
	                            <li>GDCD</li>
	                            <li>Vật lý</li>
	                            <li>Hóa học</li>
	                        </ul>
	                    </div>
	                </form>                   
                </div>
                
        	</div> <!-- End row gtr-uniform -->
        </div> <!-- End Subject Manager -->
        
        <!-- Admin Account -->
        <div id="Berlin" class="tabcontent">
            <section id="menu-bar">
                <ul class="alt">
                    <li>
                        <i class="far fa-address-card"></i>
                        <a href="">Xem trang cá nhân của bạn</a>
                    </li>
                    <li>
                        <i class="fas fa-unlock-alt"></i>
                        <a href="">Thay đổi mật khẩu</a>
                    </li>
                    <li>
                        <i class="fas fa-edit"></i>
                        <a href="">Cập nhật thông tin</a>
                    </li>
                    <li>
                        <i class="far fa-bell"></i>
                        <a href="">Quản lý thông báo</a>
                    </li>
                    <li>
                        <i class="fas fa-sign-out-alt"></i>
                        <a href="">Đăng xuất</a>
                    </li>
                </ul>
            </section>
        </div> <!-- End Admin Account -->
        
   	</article>
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