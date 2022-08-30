<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<section style="padding: 200px 0; width:1200px; margin:0 auto;">
	<ul class="tabs">
		<li class="tab-link" data-tab="tab-1"><a href="/mypage">내정보</a></li>
		<li class="tab-link " data-tab="tab-2"><a href="/mypage/reservations">예약내역</a></li>
		<li class="tab-link current" data-tab="tab-3"><a href="/mypage/activity">나의 활동기록</a></li>
		<li class="tab-link" data-tab="tab-4"><a href="/mypage/widthdraw">회원탈퇴</a></li>
	</ul>
	
	<div id="tab-3" class="tab-content current">
		<h1>나의 활동기록</h1>
		<p>${member.id }</p>

	</div>

</section>
<%@include file="../include/footer.jsp"%>


