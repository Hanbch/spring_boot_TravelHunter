<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@include file="../include/header.jsp"%>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/assets/js/ajax/booking.js"></script>
<script src="/assets/js/date-count.js"></script>
<style>
section.reservation {
	width: 1200px;
	margin: 0 auto;
}

section.reservation .contact-title {
	margin-bottom: 40px;
}

section.reservation .contact-info .media-body h3 {
	font-weight: 600;
	font-size: 20px;
}

section.reservation .contact-info.total_price h3 {
	border-top: 1px solid #ccc;
	font-weight: 600;
	font-size: 25px;
	padding: 20px 0;
}

section.reservation .contact-info.total_price p {
	font-weight: 600;
	font-size: 25px;
	color: #e61c51;
}

section.reservation .col-sm-6 {
	flex: 0 0 100%;
	max-width: 100%;
}

section.reservation .boxed-btn {
	width: 100%;
}

section.reservation .offset-lg-1 {
	background-color: #fbf9ff;
	padding: 50px 30px;
}

section.reservation thead th {
	font-weight:600;
}
</style>
<!-- ================ contact section start ================= -->
<section class="contact-section reservation">
	<div class="container">

		<div class="row">
			<div class="col-lg-8">
				<h2 class="contact-title">예약자 정보입력</h2>
				<form class="form-contact contact_form" id="complete" name="rsvInfo"
					action="/product/booking" method="POST">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<input type="hidden" name="place_num" id="place_num"value="${bookingInfo.place_num}" />
								<input type="hidden" name="room_num" id="room_num" value="${bookingInfo.room_num}" />
								<input type="hidden" name=startdate id="startdate" value="${startdate}" />
								<input type="hidden" name="enddate" id="enddate" value="${enddate}" />
								<sec:authorize access="isAuthenticated()">
									<input type="hidden" name="member_id" id="member_id" value=<sec:authentication property="principal.username"/> />
								</sec:authorize>
								<h3>예약자 이름</h3>
								<input class="form-control valid" name="cname" id="cname" type="text" placeholder="체크인시 필요한 정보입니다."> <br>
								<h3>예약자 전화번호</h3>
								<input class="form-control valid" name="cphone" id="cphone" type="text" placeholder="체크인시 필요한 정보입니다."> <br>
								<input type="hidden" id="price" value="${bookingInfo.price}" />
								<input type="hidden" name="totalprice" id="totalPrice" />
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 offset-lg-1">

				<div class="media contact-info">

					<div class="media-body">
						<h3>숙소이름</h3>
						<p>${bookingInfo.pname}</p>
					</div>
				</div>
				<div class="media contact-info">
					<div class="media-body">
						<h3>객실타입/기간</h3>
						<p>${bookingInfo.rname}호/<span id="days"></span>박
						</p>
					</div>
				</div>
				<div class="media contact-info">
					<div class="media-body">
						<h3>체크인</h3>
						<p>${startdate}14시</p>
					</div>
				</div>
				<div class="media contact-info">
					<div class="media-body">
						<h3>체크아웃</h3>
						<p>${enddate}11시</p>
					</div>
				</div>
				<div class="media contact-info total_price">
					<div class="media-body">
						<h3>총결제금액</h3>
						<p class="totalPrice"></p>
					</div>
				</div>
				<div class="payment">
					<button id="payment" class="button button-contactForm boxed-btn">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- ================ contact section end ================= -->

<%@include file="../include/footer.jsp"%>

<script>

	//숙박일수 구하기 & 가격구하기
	
	var days = dayCount.getDateDiff($("#enddate").val(),$("#startdate").val());
	var totalPrice = Number($("#price").val()) * days;
	
	function init(){
		$("#days").text(days);
		$(".totalPrice").text(totalPrice + "원");//화면에 총액표시
		$("#totalPrice").val(totalPrice);//DB로 넘길 총액 셋팅
	}
	
	init();

	$("#payment").on("click", function(){
		
		//정보 미입력시 안내문 출력
		if($("#cname").val() == ""){
			alert("이름을 입력해주세요");
			return
		}
		if($("#cphone").val() == ""){
			alert("전화번호를 입력해주세요");
			return
		}
		
		//결제모듈 & 예약정보 DB 업데이트
		
		//예약정보 DB전송
		
		var place_num = $("#place_num").val();
			var room_num = $("#room_num").val();
			var startdate = $("#startdate").val();
			var enddate = $("#enddate").val();
			var cname = $("#cname").val();
			var cphone = $("#cphone").val();
			var member_id = $("#member_id").val();
			var totalprice = $("#totalPrice").val();
			
			var form = {
				place_num : place_num,
				room_num : room_num,
				startdate : startdate,
				enddate : enddate,
				cname : cname,
				cphone : cphone,
				member_id : member_id,
				totalprice : totalprice
		}
			
        
		booking.pay();
		
	});
	
</script>

