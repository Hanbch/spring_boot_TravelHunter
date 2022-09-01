<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@include file="../include/header.jsp"%>
<script src="/assets/js/ajax/pheed.js"></script>

<section class="pheed" style="padding: 0 0 100px 0">
	<!-- slider Area Start-->
	<div class="slider-area">
		<div
			class="single-slider hero-overly slider-height2 d-flex align-items-center"
			data-background="/assets/img/hero/roomspage_hero.jpg">
			<div class="container">
				<div class="row ">
					<div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
						<div class="hero-caption">
							<span>Board</span>
							<h2>Pheed</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider Area End-->

	<div class="pheed_wrapper">
		<div class="btn_wrpper">
			<div class="write_btn">
				<a href="/pheed/write">피드작성</a>
			</div>
		</div>
		<div class="pheed_list">
			<ul>
				<c:forEach var="data" items="${boardList}">
					<li>
						<a href="#" class="view_detail" id="${data.id}">
							<div class="photo">
								<ul>
									<c:forEach var="boardImg" items="${boardImg}">
										<c:if test="${boardImg.board_id == data.id}">
											<li class="img_list"><img
												src="/assets/img/boards/${boardImg.iname}"></li>
										</c:if>
									</c:forEach>
								</ul>

								<div class="prev">
									<div class="button_box">
										<div class="prev_button">prev</div>
									</div>
								</div>
								<div class="next">
									<div class="button_box">
										<div class="next_button">next</div>
									</div>
								</div>
							</div>
							<div class="pheed">
								<div class="profile">
									<div class=p_img>
										<img src="/images/profile_img.png">
									</div>
									<div class="user_info">
										<div class="p_id">${data.member_id}</div>
										<div class="date">${data.bdate}</div>
										<input type="hidden" class="board_id" name="board_id"
											value="${data.id }" />
									</div>
								</div>
								<div class="context">
									<div class="title">${data.btitle}</div>
									<div class="content">${data.bcontent}</div>
								</div>

								<div class="show_area">
									<ul>
										<li><span class="bview_${data.id}">${data.bview}</span>views</li>
										<li><span class="reply_count_${data.id}">${data.reply}</span>comments
										</li>
										<li><span class="likes_count">${data.likecount}</span>likes</li>
									</ul>


									<c:if test="${data.active == 0}">
										<div class="like" value="${data.id}"></div>
									</c:if>
									<c:if test="${data.active != 0}">
										<div class="like active" value="${data.id}"></div>
									</c:if>

									<sec:authorize access="isAuthenticated()">
										<input type="hidden" id="member_id" name="member_id"
											value=<sec:authentication property="principal.username"/> />
									</sec:authorize>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<!-- 페이지네이션 -->
	<div class="pagination">
		<div class="inner">
			<c:if test="${pageMaker.prev}">
				<a href="pheed${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
				<a href="pheed${pageMaker.makeQuery(idx)}">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="pheed${pageMaker.makeQuery(pageMaker.endPage +1) }"> »
				</a>
			</c:if>
		</div>
	</div>

	<!-- 상세보기시 뒷배경 dim처리 -->
	<div class="dim">
		<div class="cancle">
			<img src="/assets/img/icon/ico_tab_close.png">
		</div>
	</div>

	<!-- 글 상세페이지 -->
	<div id=detail class="detail_view clearfix">
		<div class="left">
			<div class="img_view">
				<div class="detail-photo">
					<ul>
						<li class="detail_img_list"></li>
					</ul>

					<div class="detail-prev">
						<div class="button_box">
							<div class="prev_button">prev</div>
						</div>
					</div>
					<div class="detail-next">
						<div class="button_box">
							<div class="next_button">next</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="top clearfix">
				<div class=p_img>
					<img src="/images/profile_img.png">
				</div>
				<div class="user_id"></div>
			</div>
			<div class="context_detail">
				<div class="tit"></div>
				<div class="content_detail"></div>
				<div class="content_date"></div>
				<div class="reply_zone">
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<div class="white-box">
								<h3 class="box-title">댓글</h3>
								<div class="comment-center">
									
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="reply_box">

				<input id="id" type="hidden" name="id" /> <input id="step"
					type="hidden" name="step" value="0" /> <input id="indent"
					type="hidden" name="indent" value="0" />
				<sec:authorize access="isAuthenticated()">
							댓글: <input id="reply" type="text" name="reply" />
					<button id="write_btn">게시</button>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<p>
						<a href="<c:url value="/login" />">로그인</a>
					</p>
				</sec:authorize>
			</div>
		</div>
	</div>
</section>
<%@include file="../include/footer.jsp"%>



<script>
	var d_idx = 0;

	//상세페이지 정보 가져오기
	$(".view_detail").click(function(e) {
		e.preventDefault();
		var id = $(this).attr('id');
		var offsetTop = $(window).scrollTop();
		
		$("#detail,.dim").addClass("active");
		$("#detail,.dim").css({
			top : offsetTop
		});
		$("body").addClass("fixed");

		pheedDetail.increaseView(id);//조회수 증가 DB 업데이트
		pheedDetail.getBoard(id);//상세페이지 글정보 가져오기,view 조회수 업데이트 
		pheedDetail.getReply(id);//댓글 불러오기	
		pheedDetail.getPheedImg(id);//이미지 불러오기
		
		
	});//e.comment,content click

	// 게시버튼 클릭시(mousedown) 
	$("#write_btn").mousedown(function() {
		//DB에 댓글 데이터 추가
		registReply.register();
	});

	// 게시버튼 클릭시(mouseup)
	$("#write_btn").mouseup(function() {
		//댓글정보 불러와 화면 최신화 
		registReply.getBoard();
		$("#reply").val("");
	});

	//대댓글 게시버튼 클릭시(mousedown) 
	$(document).on("mousedown",".reply_btn",function() {
		//DB에 댓글 데이터 추가
		$("#reply").val($(this).parent().find(".reply").val());
		$("#step").val($(this).parent().find(".step").val());
		$("#indent").val($(this).parent().find(".indent").val());
		registReply.register();
	});

	//대댓글 게시버튼 클릭시(mouseup)
	$(document).on("mouseup", ".reply_btn", function() {
		//댓글정보 불러와 화면 최신화 
		registReply.getBoard();
		$("#reply").val("");
	});

	//상세페이지 닫기
	$(".dim").click(function(e) {
		e.preventDefault();

		$("#detail,.dim").removeClass("active");
		$("body").removeClass("fixed");
		$("#reply").val("");
		d_idx = 0;
		detail_prev[0].style.display = "none";
	});

	//답글달기 클릭시 데이터셋팅
	$(document).on("click",".re_reply",function(e) {
		e.preventDefault();
		if ($(this).hasClass("active") == false) {
			$(this).addClass("active");
			$(this).next().addClass("active");

		} else {
			$(this).removeClass("active");
			$(this).next().removeClass("active");
		}

	});

	//좋아요
	function likes(board_id) {
		
		$.ajax({
			type : "post",
			url : "/json/likecreate",
			data : {
				"board_id" : board_id,
				"member_id" : $("#member_id").val()
			},
			success : function(data) {
				alert("좋아요");
				$("#" + board_id + " .likes_count").text(
						Number($("#" + board_id + " .likes_count")
								.text()) + 1);// like_count view 최신화
			},
			error : function() {
				alert("로그인 후 사용가능");
				location.replace("/login");
			}

		});
	}
	function off(board_id) {
		
		$.ajax({
			type : "post",
			url : "/json/likedelete",
			data : {
				"board_id" : board_id,
				"member_id" : $("#member_id").val()
			},
			success : function(data) {
				alert("좋아요취소");
				$("#" + board_id + " .likes_count").text(
						Number($("#" + board_id + " .likes_count")
								.text()) - 1);// like_count view 최신화
			},
			error : function() {
				alert("로그인 후 사용가능");
				location.replace("/login");
			}

		});
	}

	//좋아요 아이콘
	var like = document.getElementsByClassName("like");

	for (var i = 0; i < like.length; i++) {
		like[i].idx = i;
		like[i].addEventListener("click", function(e) {
			e.preventDefault();
			e.stopPropagation();//상위 이벤트 차단

			var board_id = e.target.getAttribute("value");
			console.log(board_id, "likesBtn");

			var n = e.currentTarget.idx;
			for (var j = 0; j < like.length; j++) {
				if (n == j) {
					if (like[j].classList.contains("active") == false) {
						like[j].classList.add("active");
						likes(board_id);
					} else {
						like[j].classList.remove("active");
						off(board_id);
					}

				}
			}

		});
	}

	//게시글 이미지 
	var photo = document.getElementsByClassName("photo");
	var prev = document.getElementsByClassName("prev");
	var next = document.getElementsByClassName("next");
	var currentPheed;

	//초기 설정
	for (var i = 0; i < photo.length; i++) {
		photo[i].children[0].children[0].classList.add("active");//초기 idx 0번 이미지 활성화
		if (photo[i].children[0].children.length == 1) {
			next[i].style.display = "none";// 사진이 하나일때 next버튼 비활성화 
		}
	}

	//prev버튼 클릭시 이전이미지
	for (var i = 0; i < prev.length; i++) {
		prev[i].idx = i;
		prev[i].addEventListener("click", function(e) {
			e.preventDefault();
			e.stopPropagation();//상위 이벤트 차단
			currentPheed = e.currentTarget.idx;
			var imgLi = e.currentTarget.parentNode.firstElementChild.children;
			var currentImg = $(this).parent().find(".img_list");
			var idx = 0;

			//해당 버튼이 속한 글 idx번호 구하기
			for (var j = 0; j < currentImg.length; j++) {
				if (currentImg[j].classList.contains("active") == true) {
					idx = j;
				}

			}
			//console.log(idx);
			idx -= 1;

			//idx가 0 일때
			if (idx == 0) {
				next[currentPheed].style.display = "block";// next버튼 활성화
				prev[currentPheed].style.display = "none";//prev버튼 비활성화
			}

			imgLi[idx].classList.add("active");//idx값에 맞는 이미지 활성화
			imgLi[idx + 1].classList.remove("active");//idx값에 이외 이미지 비활성화

		});
	}

	//next버튼 클릭시 이전이미지
	for (var i = 0; i < next.length; i++) {
		next[i].idx = i;
		next[i].addEventListener("click", function(e) {
			e.preventDefault();
			e.stopPropagation();//상위 이벤트 차단
			currentPheed = e.currentTarget.idx;
			var imgLi = e.currentTarget.parentNode.firstElementChild.children;
			var currentImg = $(this).parent().find(".img_list");
			var idx = 0;

			//해당 버튼이 속한 글 idx번호 구하기
			for (var j = 0; j < currentImg.length; j++) {
				if (currentImg[j].classList.contains("active") == true) {
					idx = j;
				}
			}
			//console.log(idx);
			idx += 1;

			//마지막 사진일때 
			if ((idx + 1) == currentImg.length) {
				this.style.display = "none";//next버튼 비활성화
			}

			//사진 idx가 1이상일떄 
			if (idx >= 1) {
				prev[currentPheed].style.display = "block";//prev버튼 활성화
			}

			imgLi[idx].classList.add("active");//idx값에 맞는 이미지 활성화
			imgLi[idx - 1].classList.remove("active");//idx값에 이외 이미지 비활성화

		});
	}
	
	var detail_photo = document.getElementsByClassName("detail-photo");
	var detail_img_list = document.getElementsByClassName("detail_img_list");
	var detail_prev = document.getElementsByClassName("detail-prev");
	var detail_next = document.getElementsByClassName("detail-next");
	var d_currentPheed;
	
	detail_next[0].addEventListener("click",function(){
		
		if(d_idx < detail_img_list.length - 1){
			d_idx += 1;
			$(".detail_img_list").eq(d_idx).addClass("active");
			$(".detail_img_list").eq(d_idx - 1).removeClass("active");
		}
		
		if(d_idx == detail_img_list.length - 1){
			this.style.display = "none";
		}
		
		if(d_idx > 0){
			detail_prev[0].style.display = "block";
		}
		
		
	});
	
	detail_prev[0].addEventListener("click",function(){
		
		if(d_idx > 0){
			d_idx -= 1;
			$(".detail_img_list").eq(d_idx).addClass("active");
			$(".detail_img_list").eq(d_idx + 1).removeClass("active");
		}
		
		if(d_idx == 0){
			detail_prev[0].style.display = "none";
		}
		
		if(d_idx < detail_img_list.length - 1){
			detail_next[0].style.display = "block";
		}
	
	});

</script>

