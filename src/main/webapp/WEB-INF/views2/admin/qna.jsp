<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="bootStrap.jsp" %>



<body>
	<h2 class="text-dark text-center">QnA</h2>
		<div class="container-fluid">
  <div class="row">

    <div class="col-md-2">
<!-- 사이드 바 메뉴-->
  <!-- 패널 타이틀1 -->
    <div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">목록</h3>
      </div> 
    <!-- 사이드바 메뉴목록1 -->
       <ul class="list-group">
          <li class="list-group-item list-group-item-action"><a href="/admin">메인화면</a></li>
          <li class="list-group-item list-group-item-action"><a href="/admin/memlist">유저관리</a></li>
          <li class="list-group-item list-group-item-action"><a href="/admin/placelist">캠핑장관리</a></li>
          <li class="list-group-item list-group-item-action"><a href="/admin/qna">qna</a></li>
          <li class="list-group-item list-group-item-action"><a href="#">Null</a></li>
        </ul>
        </div>     
      
      </div>
       

   
     
      <table class="table">
        <tr class="table-dark">
            <th>글제목</th>
            <th>ID</th>
            <th>진행상태</th>
            <th>자세히</th>
        </tr>
		  <c:forEach items="${boardList}" var="data">
		  <tr>			
	 		<td>${data.btitle}</td>
			<td>${data.member_id}</td> 
			<td>
			<c:if test="${data.reply ==  0}">진행중</c:if>
			<c:if test="${data.reply ==  1}">답변완료</c:if>
			</td>
			<td><button type="button" onclick="location.href='qnadetail?id=${data.id}'">답변하기</button></td>
		  </tr>
		 </c:forEach> 
      </table>
    </div>
  </div>

    


</body> 
<%@include file ="../include/footer.jsp" %>