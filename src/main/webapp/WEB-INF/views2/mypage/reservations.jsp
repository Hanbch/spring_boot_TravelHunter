<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<section style="padding: 200px 0; width: 1200px; margin: 0 auto;">
	<ul class="tabs">
		<li class="tab-link" data-tab="tab-1"><a href="/mypage">내정보</a></li>
		<li class="tab-link current" data-tab="tab-2"><a
			href="/mypage/reservations">예약내역</a></li>
		<li class="tab-link" data-tab="tab-3"><a href="/mypage/activity">나의
				활동기록</a></li>
		<li class="tab-link" data-tab="tab-4"><a href="/mypage/widthdraw">회원탈퇴</a></li>
	</ul>

	<div id="tab-2" class="tab-content current">
		<ul class="product">
			<li class="product-link current" data-tab="product-1">예약완료</li>
			<li class="product-link" data-tab="product-2">취소내역</li>
			<li class="product-link" data-tab="product-3">이용완료</li>
		</ul>
		<div id="product-1" class="product-content current">
			<h1>예약완료내용</h1>
			<ul>
				<c:forEach items="${rsvList}" var="rsvList">
					<li style="background-color: #fff; margin-bottom: 20px;">
						 <form id="cancelPay" action="/mypage/rsvdelete?num=${rsvList.num}&place_num=${rsvList.place_num}&startdate=${rsvList.startdate}&enddate=${rsvList.enddate}
                  			&cname=${rsvList.cname}&cphone=${rsvList.cphone}&member_id=${rsvList.member_id}&pname=${rsvList.pname}" method="POST">
							예약번호:${rsvList.num}<br> 
							<input type="hidden" name="num" id="num" value="${rsvList.num}" /> 예약자 이름:${rsvList.cname}<br>
							예약자 전화번호:${rsvList.cphone}<br>
							예약장소:${rsvList.pname}(${rsvList.place_num})<br>
							방:${rsvList.rname}(${rsvList.room_num})<br>
							가격:${rsvList.price}원<br> 체크인:${rsvList.startdate}<br>
							체크아웃:${rsvList.enddate}<br>
							<a href="#" onclick="cancelPay()">환불하기</a>
						</form>
						
						<input type="submit" onclick="cancelPay()" value="환불하기"/>
						
					</li>
				</c:forEach>

			</ul>
		</div>
		<div id="product-2" class="product-content">
			<h1>취소내역</h1>
				<ul>
					<c:forEach items="${delList}" var="delList">
						<li style="background-color: #fff; margin-bottom: 20px;">
							 
								예약번호 : ${delList.num}<br> 
								예약장소 : ${delList.pname}<br>
								예약자 이름 : ${delList.cname}<br>
								예약자 전화번호 : 0${delList.cphone}<br>
								체크인 : ${delList.startdate}<br>
								체크아웃 : ${delList.enddate}<br>
						</li>
					</c:forEach>
	
				</ul>
		
		
		</div>
		<div id="product-3" class="product-content">
			<h1>이용완료내용</h1>
			<ul>
				<c:forEach items="${rsvedList}" var="rsvedList">
					<li style="background-color: #fff; margin-bottom: 20px;">
						 <form action="/mypage/rsvdelete?num=${rsvedList.num}&place_num=${rsvedList.place_num}&startdate=${rsvedList.startdate}&enddate=${rsvedList.enddate}
                  			&cname=${rsvedList.cname}&cphone=${rsvedList.cphone}&member_id=${rsvedList.member_id}&pname=${rsvedList.pname}" method="POST">
							예약번호:${rsvedList.num}<br> 
							<input type="hidden" name="num" id="num" value="${rsvedList.num}" /> 예약자 이름:${rsvedList.cname}<br>
							예약자 전화번호:${rsvedList.cphone}<br>
							예약장소:${rsvedList.pname}(${rsvedList.place_num})<br>
							방:${rsvedList.rname}(${rsvedList.room_num})<br>
							가격:${rsvedList.price}원<br> 체크인:${rsvedList.startdate}<br>
							체크아웃:${rsvedList.enddate}<br>
							
							
						</form>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</section>
<%@include file="../include/footer.jsp"%>
<script>
	//var check = confirm("예약취소하시겠습니까?");
	//console.log(check);
	
	function cancelPay(){
		
		var check = confirm("예약취소하시겠습니까?");
		console.log(check);
		
		if(check){
			$("#cancelPay").submit();
		}
		
		
	}
	//예약탭
	$(document).ready(function() {

		$('ul.product li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.product li').removeClass('current');
			$('.product-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	});
</script>
