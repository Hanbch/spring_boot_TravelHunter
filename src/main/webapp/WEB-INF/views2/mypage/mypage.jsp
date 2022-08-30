<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<section style="padding: 200px 0; width: 1200px; margin: 0 auto;">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1"><a href="/mypage">내정보</a></li>
		<li class="tab-link " data-tab="tab-2"><a
			href="/mypage/reservations">예약내역</a></li>
		<li class="tab-link" data-tab="tab-3"><a href="/mypage/activity">나의
				활동기록</a></li>
		<li class="tab-link" data-tab="tab-4"><a href="/mypage/widthdraw">회원탈퇴</a></li>
	</ul>
	<div id="tab-1" class="tab-content current">
		<h1>
			내정보 (
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" />
			</sec:authorize>
			)
		</h1>
		<form action="/memberUpdate" method="post">
			<label for="id">아이디</label> 
			<input type="text" id="id" name="id" value=<sec:authentication property="principal.username"/> readonly="readonly" /><br> 
			<label for="mpw">비밀번호</label> 
			<input type="password" id="mpw" name="mpw" /><br> 
			<label for="mname">이름</label>
			<input type="text" id="mname" name="mname" value="${member.mname}" /><br>
			<label for="nick_name">닉네임</label> 
			<input type="text" id="nick_name" name="nick_name" value="${member.nick_name }" /><br> 
			<label for="memail">이메일</label> 
			<input type="text" id="memail"name="memail" value="${member.memail }" /><br> 
			<label for="mphone">전화번호</label> 
			<input type="text" id="mphone"name="mphone" value="${member.mphone}" /><br>
			<button type="submit">회원정보수정</button>
			<a href="/memberDeleteView"><input type="button" value="회원탈퇴"></a>
		</form>

	</div>
	<div id="tab-2" class="tab-content">
		<ul class="product">
			<li class="product-link current" data-tab="product-1">예약완료</li>
			<li class="product-link" data-tab="product-2">취소내역</li>
			<li class="product-link" data-tab="product-3">이용완료</li>
		</ul>
		<div id="product-1" class="product-content current">예약완료내용</div>
		<div id="product-2" class="product-content">취소내역내용</div>
		<div id="product-3" class="product-content">이용완료내용</div>
	</div>
	<div id="tab-3" class="tab-content">
		<h1>내기록</h1>
		<p>${member.id }</p>

	</div>
	<div id="tab-4" class="tab-content">
		<h1>회원탈퇴</h1>
		<form action="/memberDelete" method="post" id="delForm">
			<label for="id">아이디</label> <input type="text" id="id" name="id"
				value="${member.id}" readonly="readonly" /><br> <label
				for="delpw">비밀번호</label> <input type="password" id="delpw"
				name="mpw" /><br> <label for="mname">이름</label> <input
				type="text" id="mname" name="mname" value="${member.mname}"
				readonly="readonly" /><br>
		</form>
		<button type="button" id="submit">회원탈퇴</button>
		<c:if test="${msg == false }"> 
			비밀번호가 맞지 않습니다.
		</c:if>
	</div>
</section>
<%@include file="../include/footer.jsp"%>
