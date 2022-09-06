<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="booking-area" style="margin:100px 0; padding:0">
     <div class="container">
        <div class="row ">
         <div class="col-12">
       <form class="filter" action="/product" method="GET">
            <div class="booking-wrap d-flex justify-content-between align-items-center">
             
                <!-- select in date -->
                <div class="single-select-box mb-30">
                    <!-- select out date -->
                    <div class="boking-tittle">
                        <span> Check In Date:</span>
                    </div>
                    <div class="boking-datepicker">
                        <input id="datepicker1" name="startdate" placeholder="${startdate}" value="${startdate}" />
                    </div>
               </div>
                <!-- Single Select Box -->
                <div class="single-select-box mb-30">
                    <!-- select out date -->
                    <div class="boking-tittle">
                        <span>Check OutDate:</span>
                    </div>
                    <div class="boking-datepicker">
                        <input id="datepicker2" name="enddate" placeholder="${enddate}" value="${enddate}" />
                    </div>
               </div>
                <!-- Single Select Box -->
                <div class="single-select-box mb-30">
                    <div class="boking-tittle">
                        <span>숙박인원</span>
                    </div>
                    <div class="select-this">
                        
                         <div class="select-itms">
                             <select name="capacity" id="select1">
                             	<option value="0" selected>선택</option>
                                 <option value="1">1</option>
                                 <option value="2">2</option>
                                 <option value="3">3</option>
                                 <option value="4">4</option>
                                 <option value="8">8</option>
                                 <option value="20">20</option>
                             </select>
                         </div>
                        
                    </div>
               </div>
                <!-- Single Select Box -->
                <div class="single-select-box mb-30">
                    <div class="boking-tittle">
                        <span>장소,지역</span>
                    </div>
                    <div class="select-this">
                       
                      	<!--  
                          <div class="select-itms">
                              <select name="select" id="select2">
                                  <option value="">서울</option>
                                  <option value="">부산</option>
                                  <option value="">경기도</option>
                                  <option value="">강원도</option>
                                  <option value="">충청도</option>
                                  <option value="">경상도</option>
                                  <option value="">전라도</option>
                              </select>
                          </div>
                         	-->
                          <input class="text" name="location" placeholder="장소입력" />
                        
                    </div>
               </div>
                <!-- Single Select Box -->
                <div class="single-select-box mb-30">
                    <div class="boking-tittle">
                        <span>타입 선택</span>
                    </div>
                    <div class="select-this">
                       
                         <div class="select-itms">
                             <select name="place_type_group_num" id="select3">
                             	<option selected>선택하세요</option>
                                 <option value="0">노지캠핑</option>
                                 <option value="1">오토캠핑</option>
                                 <option value="2">글램핑</option>
                                 <option value="3">차박</option>
                             </select>
                         </div>
                        
                    </div>
               </div>
                <!-- Single Select Box -->
                <div class="single-select-box pt-45 mb-30">
                    <a href="#" onclick="submit()" class="btn select-btn">Book Now</a>
               </div>
            </div>
        </form>
        <script>
        	function submit(){
        		$(".filter").submit();
        	}
        </script>
         </div>
        </div>
     </div>
 </div>