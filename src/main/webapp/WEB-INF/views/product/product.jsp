<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
    <main>
        <!-- slider Area Start-->
        <div class="slider-area">
            <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="/assets/img/hero/roomspage_hero.jpg" >
                <div class="container">
                    <div class="row ">
                        <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                            <div class="hero-caption">
                                <span>Camping Spot</span>
                                <h2>Reservation</h2>
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
        <section class="room-area" style="padding:0 0 100px 0">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8">
                        <!--font-back-tittle  -->
                        <div class="font-back-tittle mb-45">
                            <div class="archivment-front">
                                <h3>Camping Spot</h3>
                            </div>
                            <h3 class="archivment-back">Camping</h3>
                        </div>
                    </div>
                </div>
                
                <div class="row">
               
               
                <c:forEach var="placeData" items="${getPlaceData}">
                	<c:forEach var="filtering" items="${filtering}">
			        	<c:if test="${placeData.num == filtering.num}">
		                	<div class="col-xl-4 col-lg-6 col-md-6">
		                        <!-- Single Room -->
								
		                        <a href="/product/detail?num=${placeData.num}&startdate=${startdate}&enddate=${enddate}">
			                        <div class="single-room mb-50">
			                            <div class="room-img">
			                               <img src="/assets/img/place/${placeData.mainimg}" alt="">
			                            </div>
			                            <div class="room-caption">
			                                <h3 class="pname">${placeData.pname}</h3><span class="grade">평점:${placeData.placeAvgGrade}</span>
			                                <div class="per-night">
			                                    <span>가격: ${filtering.price}원</span>
			                                </div>
			                                <div class="per-night">
			                                    <span>${placeData.location}</span>
			                                </div>
			                            </div>
			                        </div>
			                      </a>
		                    </div>
		            	</c:if>  
		        	</c:forEach>
                </c:forEach>
                
        </section>
        <!-- Room End -->

        <!-- Gallery img Start-->
        <div class="gallery-area fix">
            <div class="container-fluid p-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="gallery-active owl-carousel">
                            <div class="gallery-img">
                                <a href="#"><img src="assets/img/gallery/gallery1.jpg" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="assets/img/gallery/gallery2.jpg" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="assets/img/gallery/gallery3.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Gallery img End-->
    </main>
    
<%@include file ="../include/footer.jsp" %>
   