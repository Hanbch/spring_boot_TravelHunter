<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@include file="include/header.jsp"%>
<section>
	<form action="/manager/registRoom" method="POST"
		enctype="multipart/form-data">

		업장 번호: ${placeVO.num}<input type="hidden" name="place_num"
			value="${placeVO.num}" /><br>
		<br> 가격: <input type="number" name="price" /><br>
		<br> 기준인원:<input type="number" name="capacity" /><br>
		<br> 호수/객실명:<input type="text" name="rname" /><br>
		<br> 객실정보:
		<textarea name="rinfo"></textarea>
		이미지등록:<input type="file" name="files" multiple required /><br>
		<br> 객실타입<br> <select name="place_type_group_num">
			<option selected>타입 선택</option>
			<option value="0">노지캠핑장</option>
			<option value="1">오토캠핑장</option>
			<option value="2">글랩핑장</option>
			<option value="3">차박장소</option>
			</selecet>


			<input type="submit" value="등록" />
	</form>
</section>
<%@include file="include/footer.jsp"%>

