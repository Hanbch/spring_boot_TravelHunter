<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
<style>
.loginbox #findid{
	color: #fff;
	
}
.loginbox .findid{
	margin-top: 10px;
}

</style>


<section class="login">
	<c:forEach items="${member}" var="member">
  		  	
  		  	<li>${member.id} </li><br/>
  		
  		</c:forEach>
</section>

<%@include file ="../include/footer.jsp" %>

