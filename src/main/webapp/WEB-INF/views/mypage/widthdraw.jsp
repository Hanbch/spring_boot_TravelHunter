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
		<li class="tab-link" data-tab="tab-3"><a href="/mypage/activity">나의 활동기록</a></li>
		<li class="tab-link current" data-tab="tab-4"><a href="/mypage/widthdraw">회원탈퇴</a></li>
	</ul>
	
	<div id="tab-4" class="tab-content current">
		
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


<script>
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/";

		})

		$("#submit").on("click", function() {
			if ($("#delpw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#delpw").focus();
				return false;
			}
			$.ajax({
				url : "/delpwcheck",
				type : "post",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success : function(data) {

					if (data == 0) {
						alert("패스워드가 틀렸습니다.");

						return;
					} else {
						if (confirm("회원탈퇴하시겠습니까?")) {
							$("#delForm").submit();
						}

					}
				}
			})

		});

	})
</script>