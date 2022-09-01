<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file ="include/header.jsp" %>
    <style>
    section h1{padding:20px; font-weight:600}
    section h1.tit{background-color:#85b4d0; margin:0; color:#fff; border-radius:20px 20px 0 0;}
    section h2{font-weight:600}
	.rsv_wrapper .place_list{width:100%;}
	.rsv_wrapper .place_list .place_list_card{width:100%;}
	.rsv_wrapper .place_list .place_list_card > ul > li{width:100%;overflow:hidden; margin-bottom:150px;background-color:#fff;border-radius: 20px 20px 0 0;}
	.rsv_wrapper .place_list .place_list_card li .place_image {width:500px; height:500px; float:left;background:url("/images/place.jpg")no-repeat 0 0; background-size:cover}
	.rsv_wrapper .place_list .place_list_card li .place_image img{width:100%;}
	.rsv_wrapper .place_list .place_list_card li .right_wrapp{float:left; width:calc(100% - 500px);height:500px;padding:30px}
	.rsv_wrapper .place_list .place_list_card li .place_info {float:left;width:100%; height:400px;font-size:20px;}
	.rsv_wrapper .place_list .place_list_card li .place_info p{float:left;width:50%;;margin:20px 0}
	.rsv_wrapper .place_list .place_list_card li .place_info p span{font-size:20px;font-weight:600;margin-right:20px;}
	.rsv_wrapper .place_list .place_list_card li .review {float:left;width:calc(100% - 370px);margin-left:20px;height:360px;}
	.rsv_wrapper .place_list .place_list_card li .review_list {overflow-y:scroll;padding-right: 20px;height:70vh;}
	.rsv_wrapper .place_list .place_list_card li .review_list p{display:block;width:100%;word-break:break-all}
	
	
	.review_area{float:left;width:100%;}
	
	
	.tab_list .select_tab{border-bottom:2px solid #eaeaea;}
	.tab_list .select_tab li{float:left; padding:20px; color:#00000061}
	.tab_list .select_tab li.active{color:#f1b233;}
	.gj-datepicker-md [role="right-icon"]{font-size:18px}
	.datepicker_wrapp{overflow:hidden}
	.startdate {margin:20px 20px 20px 0; float:left}
	.enddate {margin:20px 20px 20px 0; float:left}
	.tab_contents .room_list > ul > form > li{border:1px solid #eaeaea;overflow:hidden;margin-bottom:20px;}
	.tab_contents .room_list li .room_img{float:left}
	.tab_contents .room_list li .room_desc{float:left;margin-left:20px;padding:20px 0}
	
	.tab_contents{display:none}
	.tab_contents.active{display:block}
	
	.tab_contents .room_info h3{margin:32px 0;}
	.tab_contents .room_info .info_box{padding:40px;background:#eaeaea;color:#0000008f}
	
	.tab_contents .review_top{padding:40px 0;border-bottom: 2px solid #eaeaea;text-align:center}
	.tab_contents .review_top .grade{font-size:30px; font-weight:600;}
	.tab_contents .review_list > ul > li {padding:20px;overflow:hidden;border-bottom: 1px solid #eaeaea;}
	.tab_contents .review_list li .pic{float:left;width:100px; height:100px; border-radius:100%;overflow:hidden}
	.tab_contents .review_list li .pic img{width:100%}
	.tab_contents .review_list li .r_list_head{margin-left:30px;padding: 10px 0;float:left;height:100px}
	.tab_contents .review_list li .r_list_contents{float:left;width:100%;margin:20px 0 0 120px}
	.tab_contents .review_list li .r_list_contents .reply_date{padding:20px 0;}
	.tab_contents .review_list li .r_list_contents .img_zone{width:300px}
	.tab_contents .review_list li .r_list_contents .img_zone img{width:100%}
	
	.room_img img{width:360px; height:246px}
	.review_list li li{width:300px;float:left;}
	.rsv_info{font-size:15px; font-weight:300; color:#ccc;}
	.reply_date{font-size:14px; color:#ccc}
	
	.grade_img{width:100px; height:20px;display: inline-block;margin-right:20px;vertical-align: middle; background:url(/assets/img/boards/bg_score.png);background-size:cover;}
 	.grade_img.score_50{background-position:0 0}
 	.grade_img.score_45{background-position:0 -20px}
 	.grade_img.score_40{background-position:0 -40px}
 	.grade_img.score_35{background-position:0 -60px}
 	.grade_img.score_30{background-position:0 -80px}
 	.grade_img.score_25{background-position:0 -100px}
 	.grade_img.score_20{background-position:0 -120px}
 	.grade_img.score_15{background-position:0 -140px}
 	.grade_img.score_10{background-position:0 -160px}
 	.grade_img.score_5{background-position:0 -180px}
 	.grade_img.score_0{background-position:0 -200px}
	
	.edit_btn{display:inline-block;width:100%;color:#fff; font-weight:600;font-size:25px;text-align:center; padding: 10px 20px; background-color:#85b4d0; border-radius:30px;}
	.regist_btn{display:inline-block;width:200px;color:#fff; font-weight:600;font-size:18px;text-align:center; padding: 10px 20px; background-color:#85b4d0; border-radius:25px;}
	.top{height:108px;}
	.top h1{display:inline-block; float:left}
	.top .btn_wrapper{display:inline-block; float:right;height:108px; padding:30px;}
	.review_list::-webkit-scrollbar {
	    width: 10px;  /* 스크롤바의 너비 */
	}
	
	.review_list::-webkit-scrollbar-thumb {
	    height: 10%; /* 스크롤바의 길이 */
	    background: #85b4d0; /* 스크롤바의 색상 */
	    
	    border-radius: 10px;
	}
	
	.review_list::-webkit-scrollbar-track {
	    background: rgba(33, 122, 244, .1);  /*스크롤바 뒷 배경 색상*/
	}
	
	</style>
	
	<section>
		<div class="rsv_wrapper">
			<div class="top">
				<h1>업장관리</h1>
				<div class=btn_wrapper>
					<a href="/manager/registplace" class="regist_btn">새로운업장등록</a>
				</div>
			</div>
			
			<div class="place_list">
				<div class="place_list_card">
					<ul>	
						<c:forEach items="${placeData}" var="placeData">
							<li class="place_num${placeData.num}">
								<h1 class="tit">${placeData.num}. ${placeData.pname}</h1>
							     <!-- /.row -->
							     <!-- .row -->
							     <div class="row">
							       <div class="col-md-4 col-xs-12">
							         <div class="white-box">
							           <div class="user-bg">
							             <img
							               width="100%"
							               alt="user"
							               src="/images/place.jpg"
							             />
							             
							           </div>
							           <div class="user-btm-box">
							             <div class="col-md-4 col-sm-4 text-center">
							               <p class="text-purple"><i class="ti-facebook"></i></p>
							               <h1>258</h1>
							             </div>
							             <div class="col-md-4 col-sm-4 text-center">
							               <p class="text-blue"><i class="ti-twitter"></i></p>
							               <h1>125</h1>
							             </div>
							             <div class="col-md-4 col-sm-4 text-center">
							               <p class="text-danger"><i class="ti-dribbble"></i></p>
							               <h1>556</h1>
							             </div>
							           </div>
							         </div>
							       </div>
							       <div class="col-md-8 col-xs-12">
							         <div class="white-box">
							           <form action="updatePlace" method="POST" class="form-horizontal form-material">
							           
							             <div class="form-group">
							               <label class="col-md-12">업장명</label>
							               <div class="col-md-12">
							                 <input
							                   type="text"
							                   name="pname"
							                   value="${placeData.pname}"
							                   class="form-control form-control-line"
							                 />
							               </div>
							             </div>
							             <div class="form-group">
							               <label class="col-md-12">관리자</label>
							               <div class="col-md-12">
							                   <p style="border-bottom:1px solid #e4e7ea;line-height:38px;">${placeData.member_id}</p>
							               </div>
							             </div>
							             <div class="form-group">
							               <label for="example-email" class="col-md-12">주소</label>
							               <div class="col-md-12">
							                 <input
							                   type="text"
							                   name="location"
							                   value="${placeData.location}"
							                   class="form-control form-control-line"
							                   name="location"
							                   id="example-email"
							                 />
							               </div>
							             </div>
							            
							             <div class="form-group">
							               <label class="col-md-12">Phone No</label>
							               <div class="col-md-12">
							                 <input
							                   type="text"
							                   name="pphone"
							                   value="${placeData.pphone}"
							                   class="form-control form-control-line"
							                 />
							                 <input type="hidden" name="num" value="${placeData.num}"/>
							               </div>
							             </div>
							             <div class="form-group">
							               <div class="col-sm-12">
							                 <button class="btn btn-success">수정하기</button>
							               </div>
							             </div>
							           </form>
							         </div>
							       </div>
							     </div>
								
								<div class="review_area">
									<div class="tab_list">
										<div class="select_tab clearfix">
											<ul class="tab">
												<li class="tab_roominfo active">객실관리</li>
												<li class="tab_review" value="${placeData.num}">리뷰/평점</li>
											</ul>
										</div>
									</div>
									
									
									<div class="content_wrap">
										<!-- s.객실정보 -->
										<div class="tab_contents active">
											<div class="room_list">
												<div class="top">
													<h1>객실관리</h1>
													<div class=btn_wrapper>
														<a href="/manager/registroom?num=${placeData.num}" class="regist_btn">객실등록</a>
													</div>
												</div>
												
												<ul class="place_num${placeData.num}">
												
												</ul>
											</div>
										</div>
										
										<!-- e.객실정보 -->
										
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
												<div class="grade grade${placeData.num}"></div>
												<p class="review_count${placeData.num}"></p>
											</div>
											<div class="review_list">
												<ul>
													
												</ul>
											</div>
										</div>
										<!-- e.리뷰 -->
									</div>
								</div>
							</li>
							<script>
								$.ajax({
									type : "GET",
									url : "/json/room/" + ${placeData.num},
									success : function(room) {
						
										$(room).each(function(){
											
											var htmls="";
											htmls += "<form action='updateRoom' method='POST'>";
											htmls += "<input type='hidden' name='num' value='" + this.num + "'/>";
											htmls += "<input type='hidden' name='place_num' value='" + this.place_num + "'/>";
											htmls += "<li class='room_num"　+ this.num　+ "'>";
											htmls += "<div class='room_img'>";
											htmls += "<ul class='imgList'>";	
											htmls += "</ul>";
											htmls += "</div>";
											htmls += "<div class='room_desc'>";
											htmls += "<h2><input type='text'name='rname' value='" + this.rname + ")'/> 호(" + this.num + ")</h2>";
											htmls += "<div class='cpacity'>기준<input type='text' name='capacity' value='" + this.capacity + "'/> 명/최대" + ((this.capacity)+2) + "명</div>";
											htmls += "<div class=check_in'>체크인  15:00</div>";
											htmls += "<div class='check_out'>체크아웃 11:00</div>";
											htmls += "<div class='price'><input type='text' name='price' value='" + this.price + "'/> 원</div>";
											htmls += "<div class='notice'>공지사항: <input type='text' name='rinfo' value='" + this.rinfo + "'/></div>";
											htmls += "<input type='submit' value='수정하기'/>";
											htmls += "</div>";
											htmls += "</li>";
											htmls += "</form>";
											$(".room_list .place_num" + this.place_num ).append(htmls);
											
											$.ajax({
												type : "GET",
												url : "/json/roomImg/" + this.num,
												success : function(roomImg) {
													
													$(roomImg).each(function(){
														
														$(".room_num" + this.room_num + " ul").append("<li><img src='/assets/img/rooms/" + this.iname + "'></li>"); 
														
													});
													
												},
												error : function(){
													console.log("error");
												}
											});
											
										});
									},
									error : function(){
										console.log("error");
									}
								});
								
							</script>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<script>
    	//tab메뉴 클릭시 컨텐츠변경
    	var tab = document.getElementsByClassName("tab");
    	var content_wrap = document.getElementsByClassName("content_wrap");
    	var tab_contents = document.getElementsByClassName("tab_contents");
    	
    	for(var i=0; i<tab.length; i++){
    		for(var k=0; k<tab[i].children.length; k++){
	    		tab[i].idx = i;
	    		tab[i].children[k].idx = k;
	    		tab[i].children[k].addEventListener("click",function(e){
	    			var n= e.currentTarget.parentNode.idx;
	    			var p= e.currentTarget.idx;
	    			
	    			//console.log(n,p);
	    			
	    			for(var j=0; j<tab.length; j++){
	    				for(var t=0; t<tab[j].children.length; t++){
		    				if(n == j){
		    					if(t == p){
		    						content_wrap[j].children[t].classList.add("active");
		    						tab[j].children[t].classList.add("active");
		    						if(t == 1){
		    							var place_num = $(this).val();
		    							$.ajax({
											type : "GET",
											url : "/json/reviewInfo/" + place_num,
											success : function(data) {
												
												
												$(".grade" + data.num).text(data.grade + "점");
												$(".review_count" + data.num).text("전체리뷰 " + data.review + "개");
												
											},
											error : function(){
												console.log("error");
											}
										});
		    							
		    							$.ajax({
											type : "GET",
											url : "/json/review/" + place_num,
											success : function(review) {
												
												//console.log(review);
												if(review.length == 0){
													console.log("empty");
												}
												$(review).each(function(idx,review){
													
													console.log(idx,review);
													
													var htmls="";
													
													htmls += "<li>";
													htmls += "<div class='pic'><img src='/images/profile_img.png'></div>";
													htmls += "<div class='r_list_head'>";
													htmls += "<div class='review_title'><h2>" + review.btitle + "</h2></div>";
													htmls += "<div class='grade'><span>평점: " + review.bgrade + "</span></div>";
													htmls += "<div class='rsv_info'>" + review.place_num + "/ 작성자:" +  review.member_id + "</div>";
													htmls += "</div>";	
													htmls += "<div class='r_list_contents'>";
													htmls += "<div class='exp'>" + review.bcontent + "</div>";	
													htmls += "<div class='img_zone clearfix'>";	
													htmls += "<ul class='" + review.id + "'></ul>";	
													htmls += "</div>";	
													htmls += "<div class='reply_date'>" + review.bdate + "</div>";	
													htmls += "</div>";	
													htmls += "</li>";	
														
													$("li.place_num" + review.place_num + " .review_list > ul").append(htmls);
												
													
													$.ajax({
														type : "GET",
														url : "/json/reviewImg/" + place_num,
														success : function(data) {
												
															$(data).each(function(idx,data){
																if(review.id == data.id){
																	$(".img_zone ." + review.id).append("<li><img src='" + data.ipath + "'></li>");
																}
																
															});
															
															
														},
														error : function(){
															console.log("error");
														}
													});
													
												
												});
												
												
											},
											error : function(){
												console.log("error");
											}
										});
		    						}
		    					}else{
		    						tab[j].children[t].classList.remove("active");
		    						content_wrap[j].children[t].classList.remove("active");
		    					}
		    				}
		    			}
	    			}
	    			
	    		});
    		}
    	}
    	
    </script>
<%@include file ="include/footer.jsp" %>        