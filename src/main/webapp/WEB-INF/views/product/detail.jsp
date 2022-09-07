<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>

    <main>
    	<!-- s.contents_wrapper -->
		<div class="contents_wrapper">
			<div class="top_contents clearfix">
				<div class="place_photo">
					<div id="main_photo"><img scr=""></div>
					<div class="banner_wrapper">
						<div class="photo_banner clearfix">
							<ul>
								<li  class="room_list"><img class="room_img" src="/assets/img/place/${placeDetail.mainimg}"></li>
								<c:forEach items="${placeDetail.getInameList()}" var="iname">
									<li  class="room_list"><img class="room_img" src="/assets/img/rooms/${iname}"></li>
								</c:forEach>
							</ul>			
							<div class="arrow clearfix">
								<div class="left"></div>
								<div class="right"></div>
							</div>
						</div>
					</div>
				</div>
				<script>
					//대표사진 설정			
					var imgNum = 0;
					var main_photo = document.getElementById("main_photo").firstElementChild;
					var room_img = document.getElementsByClassName("room_img");
					var room_list = document.getElementsByClassName("room_list");
					var ipath = room_img[imgNum].getAttribute("src");
					var arrow = document.getElementsByClassName("arrow");
					
					
					main_photo.setAttribute("src",ipath);
					room_list[0].classList.add("active");
									
					for(var i=0; i<room_list.length; i++){
						room_list[i].idx = i;
						room_list[i].addEventListener("click",function(e){
							var n = e.currentTarget.idx;
						
							for(var j=0; j<room_list.length; j++){
								if(n == j){
									room_list[j].classList.add("active");
									imgNum = j
									ipath = room_img[imgNum].getAttribute("src");
									main_photo.setAttribute("src",ipath);
								}else{
									room_list[j].classList.remove("active");
								}
							}
						});
					}
					//console.log(room_list);
				</script>
				
				<div class="place_desc">
					<h1>${placeDetail.pname}</h1>
					<div class="place_grade">평점<span class="grade">${placeDetail.grade}</span></div>
					<span class="review">리뷰 ${placeDetail.review}개</span>
					<div class="place_address">${placeDetail.location}</div>
					<div class="notice clearfix">
						<div class="tit">공지사항</div>
						<div class="text">
							- 체크인 : 15:00 | 체크아웃 : 11:00<br>
							- 22시 이후 체크인 시 호텔 프론트 문의<br>
							- 무료 Wi-Fi<br>
							- 전 객실 금연<br>
						</div>
					</div>
					
				</div>
	     	</div>
	     	
	     	<div class="tab_list">
	     		<div class="select_tab clearfix">
	     			<ul id="tab">
	     				<li class="active">객실예약</li>
	     				<li>위치정보</li>
	     				<li>리뷰</li>
	     			</ul>
	     		</div>
	     	</div>
	     	
	     	<!-- s.객실예약 -->
	     	<div class="tab_contents active">
	     		
     			<form action="/product/detail" method="GET">
	     			<div class="datepicker_wrapp">
		     			<div class="startdate">
			     			<input id="datepicker1" name="startdate" placeholder="${bookingVO.startdate}" value="${bookingVO.startdate}"/>
			     		</div>	
			     		<div class="enddate">
			     			<input id="datepicker2" name="enddate" placeholder="${bookingVO.enddate}" value="${bookingVO.enddate}"/>
			     		</div>
			     		<div class="single-select-box mt-20">
	                        <a href="#" class="btn select-btn">선택</a>
	                   </div>
	                   <input type="hidden" name="num" value="${placeDetail.num}"/>
			     		<div class="submit_btn">
			     			<input type="submit" value="선택" />
			     		</div>
		     		</div>
	     		</form>
	     		
	     		<div class="room_list">
	     			<ul>
		     			<c:forEach items="${room}" var="room">
		     				
				     		<li>
	     						<div class="room_img">
		     						<ul>
			     						<c:forEach items="${imgList}" var="img">
				     						<c:if test="${img.room_num == room.num}">
				     							<li>
				     								<img src="/assets/img/rooms/${img.iname}">
				     							</li>
				     						</c:if>
			     						</c:forEach>
		     						</ul>
	     						</div>
		     					
		     					<div class="room_desc">
		     						<h2>${room.rname}호</h2>
		     						<div class="cpacity">기준${room.capacity}명/최대${(room.capacity)+2}명</div>
		     						<div class="check_in">체크인  15:00</div>
		     						<div class="check_out">체크아웃 11:00</div>
		     						<div class="price">${room.price}원</div>
		     						<a href="/product/reservation?place_num=${room.place_num}&room_num=${room.num}&rname=${room.rname}&startdate=${bookingVO.startdate}&enddate=${bookingVO.enddate}"><button>예약하기</button></a>
		     					</div>
		     				</li>
		     			</c:forEach>
	     			</ul>
	     		</div>
	     	</div>
	     	<!-- e.객실예약 -->
	     	
	     	<!-- s.위치정보 -->
	     	<div class="tab_contents">
	     		<div class="room_info">
	     			<h3>위치정보</h3>
	     			<div id="map" style="width:100%; height:350px;"></div>
	     		</div>
	     	</div>
	     	<!-- e.위치정보 -->
	     	
	     	<!-- s.리뷰 -->
			<div class="tab_contents">
				<div class="review_top">
					<h1>평균 평점</h1>
					<c:if test="${placeDetail.grade == 0}"><div class="grade_img score_0" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade > 0 && placeDetail.grade < 1}"><div class="grade_img score_5" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade == 1}"><div class="grade_img score_10" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade > 1 && placeDetail.grade < 2}"><div class="grade_img score_15" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade == 2}"><div class="grade_img score_20" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade > 2 && placeDetail.grade < 3}"><div class="grade_img score_25" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade == 3}"><div class="grade_img score_30" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade > 3 && placeDetail.grade < 4}"><div class="grade_img score_35" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade == 4}"><div class="grade_img score_40" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade > 4 && placeDetail.grade < 5}"><div class="grade_img score_45" style="margin:0 auto"></div></c:if>
					<c:if test="${placeDetail.grade == 5}"><div class="grade_img score_50" style="margin:0 auto"></div></c:if>
					<div class="grade">${placeDetail.grade}</div>
					<p>전체리뷰 ${placeDetail.review}개</p>
				</div>
				<div class="review_list">
					<c:if test="${reviewList.size() > 0}">
						<c:forEach items="${reviewList}" var="review">
							<ul>
								<li>
									<div class="pic">
										<img src="/images/profile_img.png">
									</div>
									<div class="r_list_head">
										<div class="review_title"><h2>${review.btitle}</h2></div>
										<div class="grade">
											<c:if test="${review.bgrade == 0}"><div class="grade_img score_0"></div></c:if>
											<c:if test="${review.bgrade > 0 && review.bgrade < 1}"><div class="grade_img score_5"></div></c:if>
											<c:if test="${review.bgrade == 1}"><div class="grade_img score_10"></div></c:if>
											<c:if test="${review.bgrade > 1 && review.bgrade < 2}"><div class="grade_img score_15"></div></c:if>
											<c:if test="${review.bgrade == 2}"><div class="grade_img score_20"></div></c:if>
											<c:if test="${review.bgrade > 2 && review.bgrade < 3}"><div class="grade_img score_25"></div></c:if>
											<c:if test="${review.bgrade == 3}"><div class="grade_img score_30"></div></c:if>
											<c:if test="${review.bgrade > 3 && review.bgrade < 4}"><div class="grade_img score_35"></div></c:if>
											<c:if test="${review.bgrade == 4}"><div class="grade_img score_40"></div></c:if>
											<c:if test="${review.bgrade > 4 && review.bgrade < 5}"><div class="grade_img score_45"></div></c:if>
											<c:if test="${review.bgrade == 5}"><div class="grade_img score_50"></div></c:if>
											<span>평점: ${review.bgrade}</span>
										</div>
										<div class="rsv_info">${review.place_num} / 작성자:  ${review.member_id}</div>
									</div>
									<div class="r_list_contents">
										<div class="exp">${review.bcontent}</div>
										<div class="img_zone clearfix">
											<ul>
												<c:forEach items="${reviewImgList}" var="data">
													<c:if test="${data.id == review.id}">
														<li><img src="/assets/img/boards/${data.iname}"></li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
										<div class="reply_date">${review.bdate}</div>
									</div>
								</li>
							</ul>
						</c:forEach>
					</c:if>
					<c:if test="${reviewList.size() == 0 }">
						<div class=non_review style="padding:50px; text-align:center;">등록된 리뷰가 없습니다.</div>
					</c:if>
				</div>
			</div>
			<!-- e.객실정보 -->
		
		</div>
		<!-- e.contents_wrapper -->
    </main>
    
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	18c8af2570d2edc8abdb783708aa6e7b&libraries=services"></script>
    <script>
    	//tab메뉴 클릭시 컨텐츠변경
    	var tab = document.getElementById("tab");
    	var tabLi = tab.children;
    	var tab_contents = document.getElementsByClassName("tab_contents");
    	
    	for(var i=0; i<tabLi.length; i++){
    		
    		tabLi[i].idx = i;
    		tabLi[i].addEventListener("click",function(e){
    			var n= e.currentTarget.idx;
    			
    			for(var j=0; tabLi.length; j++){
    				if(n == j){
    					tabLi[j].classList.add("active");
    					tab_contents[j].classList.add("active");
    					map.relayout();
    				}else{
    					tabLi[j].classList.remove("active");
    					tab_contents[j].classList.remove("active");
    				}
    			}
    		});
    	}
    	
    	//위치정보 지도API
    	var address = document.getElementsByClassName("place_address")[0].innerHTML;
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 10 // 지도의 확대 레벨
		    };  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        console.log(coords);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:100%;height:350px;text-align:center;padding:6px 0;">' + address + '</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
		    } 
		 
		}); 
	</script>
	    
    
<%@include file ="../include/footer.jsp" %>
   