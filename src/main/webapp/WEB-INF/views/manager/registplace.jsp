<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<%@include file ="include/header.jsp" %>
	<section>
        <h1>업장 등록</h1>
        작성자:
        
        <sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.username"/><br>
		</sec:authorize>
		
		<br><br>
		<form action="/manager/registPlace" method="POST" enctype="multipart/form-data">
			<sec:authorize access="isAuthenticated()">
				<input type="hidden"  name="member_id" value="<sec:authentication property="principal.username"/>"/>
			</sec:authorize>
			
			사업장명: <input type="text"  name="pname"/><br><br>
			주소:<br>
			<select name="location">
				<option selected>위치선택</option>
				<option value="서울">서울</option>
				<option value="경기도">경기도</option>
				<option value="부산">부산</option>
				<option value="강원도">강원도</option>
				<option value="제주도">제주도</option>
			</select>
			<br><br><br>
			연락처:<input type="number"  name="pphone"/><br>
			대표이미지등록:<input type="file" name="file" required /><br>
			<input type="submit" value="등록"/>
		</form>
	</section>
<%@include file ="include/footer.jsp" %>

<script>
	
</script>