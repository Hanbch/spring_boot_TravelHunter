<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 날짜 -->
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>TH</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

		<!-- CSS here -->
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/assets/css/gijgo.css">
        <link rel="stylesheet" href="/assets/css/slicknav.css">
        <link rel="stylesheet" href="/assets/css/animate.min.css">
        <link rel="stylesheet" href="/assets/css/magnific-popup.css">
        <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="/assets/css/themify-icons.css">
        <link rel="stylesheet" href="/assets/css/slick.css">
        <link rel="stylesheet" href="/assets/css/nice-select.css">
        <link rel="stylesheet" href="/assets/css/responsive.css">
        <link rel="stylesheet" href="/assets/css/mypage.css">
        <link rel="stylesheet" href="/assets/css/pheed.css">
        <link rel="stylesheet" href="/assets/css/product/detail.css">
        <link rel="stylesheet" href="/assets/css/sub.css" rel="stylesheet" />
        <link rel="stylesheet" href="/assets/css/style.css">
   </head>

   <body>
       
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <strong>TH</b>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

    <header id="header">
        <!-- Header Start -->
       <div class="header-area header-sticky">
       		<div class="top">
				
				<div class="top_right">
					<div class="utils">
						<ul>
							<sec:authorize access="isAuthenticated()">
                            	<li>
                            		<a href="/mypage">
	                            		<sec:authentication property="principal.username"/>
	                            		<sec:authorize access="hasRole('ROLE_USER')">
		                       				회원님 환영합니다!
		                       			</sec:authorize>
	                            		<sec:authorize access="hasRole('ROLE_MANAGER')">
		                       				매니저님 환영합니다!
		                       			</sec:authorize>
		                       			<sec:authorize access="hasRole('ROLE_ADMIN')">
		                       				관리자님 환영합니다!
		                       			</sec:authorize>
                            		</a>
                            	</li>
                            </sec:authorize>
							<li><a href="/mypage">마이페이지</a></li>
							<sec:authorize access="hasRole('ROLE_MANAGER')">
                       			<li><a href="/manager" target='_blank'">매니저페이지</a></li>
                       		</sec:authorize>
                       		<sec:authorize access="hasRole('ROLE_ADMIN')">
                       			<li><a href="/admin" target='_blank'">관리자페이지</a></li>
                       		</sec:authorize>
							
							<sec:authorize access="isAnonymous()">
							<li>
                            	<a href="/join">회원가입</a>
                            </li>
                            </sec:authorize>
							
							<li>
								<sec:authorize access="isAnonymous()">
                                	<a href="login">로그인</a>
                                </sec:authorize>
                                <sec:authorize access="isAuthenticated()">
                                	<a href="/logout">로그아웃</a>
                                </sec:authorize>
							</li>
						</ul>
					</div>
					
				</div>
			</div><!-- top end -->
            <div class="main-header ">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- logo -->
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo">
                               <a href="/">Travel Hunter</a>
                            </div>
                        </div>
                    <div class="col-xl-8 col-lg-8">
                            <!-- main-menu -->
                            <div class="main-menu d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">                                                                                                                                     
                                        <li><a href="/product">예약하기</a></li>
                                        <li>
                                        	<a href="/place">Camping Spot</a>
                                        	<ul class="submenu">
                                        		<li><a href="/place">장소 소개</a></li>
                                                <li><a href="/place/monthspot">이달의 장소</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/pheed">피드</a></li>
                                        <li><a href="/qna">Q&A</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <!-- Header End -->
    </header>