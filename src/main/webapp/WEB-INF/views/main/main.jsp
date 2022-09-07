<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>

    <main>
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active dot-style">
                <div class="single-slider  hero-overly slider-height d-flex align-items-center" data-background="/images/main_slider5.png" >
                    <div class="container">
                        <div class="row justify-content-center text-center">
                            <div class="col-xl-9">
                                <div class="h1-slider-caption">
                                    <h1 data-animation="fadeInUp" data-delay=".4s">Travel Hunter</h1>
                                    <h3 data-animation="fadeInDown" data-delay=".4s">Camping</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single-slider  hero-overly slider-height d-flex align-items-center" data-background="/images/main_slider1.png" >
                    <div class="container">
                        <div class="row justify-content-center text-center">
                            <div class="col-xl-9">
                                <div class="h1-slider-caption">
                                    <h1 data-animation="fadeInUp" data-delay=".4s">Travel Hunter</h1>
                                    <h3 data-animation="fadeInDown" data-delay=".4s">Camping</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single-slider  hero-overly slider-height d-flex align-items-center" data-background="/images/main_slider3.png" >
                    <div class="container">
                        <div class="row justify-content-center text-center">
                            <div class="col-xl-9">
                                <div class="h1-slider-caption">
                                    <h1 data-animation="fadeInUp" data-delay=".4s">Travel Hunter</h1>
                                    <h3 data-animation="fadeInDown" data-delay=".4s">Camping</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

       	<!-- Booking filter start-->
       	<%@include file ="../include/filtering_box.jsp" %>
       	<!-- Booking filter End-->

        <!-- Room Start -->
        <section class="room-area" style="padding: 0 0 150px 0">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8">
                        <!--font-back-tittle  -->
                        <div class="font-back-tittle mb-45">
                            <div class="archivment-front">
                                <h3>Best Spot</h3>
                            </div>
                            <h3 class="archivment-back">Best Spot</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<c:forEach items="${hotPlace}" var="place" begin="0" end="5">
	                    <div class="col-xl-4 col-lg-6 col-md-6">
	                        <!-- Single Room -->
	                        <div class="single-room mb-50">
	                            <div class="room-img">
	                               <a href="/product/detail?num=${place.num}&startdate=&enddate="><img src="/assets/img/place/${place.mainimg}" alt=""></a>
	                            </div>
	                            <div class="room-caption">
	                                <h3><a href="/product/detail?num=${place.num}&startdate=&enddate=">${place.pname}</a></h3>
	                                <div class="per-night">
	                                    <span><u>평점 : </u>${place.placeAvgGrade}</span>
	                                </div>
	                                <div class="per-night">
	                                    <a href="/product/detail?num=${place.num}&startdate=&enddate=">자세히 보러가기</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
            		</c:forEach>
                </div>
                <div class="row justify-content-center">
                    <div class="room-btn pt-70">
                        <a href="/product" class="btn view-btn1">View more  <i class="ti-angle-right"></i> </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Room End -->
    </main>
<%@include file ="../include/footer.jsp" %>
   