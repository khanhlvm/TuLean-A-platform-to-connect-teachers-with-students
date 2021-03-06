<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body class="is-preload">

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Header -->
        <header id="header">
            <h1><a href="tu-main-home.jsp"><i class="fas fa-user-graduate"></i> TuLearn</a></h1>
            <nav class="links">
                <ul>
                    <li><a href="class-manager-tutor"><i class="fas fa-users"></i> Quản lý lớp dạy</a></li>
                    <li><a href="request-manager-tutor"><i class="fas fa-tasks"></i> Quản lý yêu cầu</a></li>
                    <li><a href="#"><i class="fas fa-search"></i> Tìm yêu cầu</a></li>
                    <li><a href="#"><i class="fas fa-bell"></i> Thông báo</a></li>
                </ul>
            </nav>
            <nav class="main">
                <ul>
                    <li class="search">
                        <a class="fa-search" href="#search">Search</a>
                        <form id="search" method="get" action="#">
                            <input type="text" name="query" placeholder="Search" />
                        </form>
                    </li>
                    <li class="menu">
                        <a class="fa-bars" href="#menu">Menu</a>
                    </li>
                </ul>
            </nav>
        </header>

        <!-- Menu -->
        <section id="menu">

            <!-- Search -->
            <section>
                <form class="search" method="get" action="#">
                    <input type="text" name="query" placeholder="Search" />
                </form>
            </section>

            <!-- Links -->
            <section>
                <ul class="links">
                    <li>
                        <a href="#">
                            <h3><i class="fas fa-users"></i> Quản lý lớp dạy</h3>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <h3><i class="fas fa-tasks"></i> Quản lý yêu cầu</h3>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h3><i class="fas fa-search"></i> Tìm yêu cầu</h3>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <h3><i class="fas fa-bell"></i> Thông báo</h3>
                        </a>
                    </li>
                </ul>
            </section>

            <!-- Actions -->
            <section>
                <h1><a href="index.html"><i class="fas fa-user-graduate"></i> TuLearn</a></h1>
            </section>

        </section>

        <!-- Main Below -->
        