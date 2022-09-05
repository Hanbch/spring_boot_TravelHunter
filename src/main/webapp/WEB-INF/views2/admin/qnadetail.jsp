<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="bootStrap.jsp" %>



<body>

<h2 class="text-dark text-center">유저세부정보 페이지입니다.</h2>

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
	 <table border="1" style="width:70%; margin:0 auto;">
			<tr>
				<td>번호</td>
				<td>${data.id}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${data.btitle}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${data.member_id}</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>${data.bdate}</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">내용:</td>
			</tr>
			<tr style="height:300px">
				<td colspan="2" style="padding:20px">
					${data.bcontent}<br><br><br>					
						<form action="/admin/reply?board_id=${data.id}" method="post">
							<input type="text" id="reply" name="reply" style="width:100%; height:100px">
							<button type="submit" style="width:100%; height:50px; border:none; margin-top:3px;">답변하기</button>
						</form>
				
				</td>
			</tr>
		</table>
  
  
  

</body> 
<%@include file ="../include/footer.jsp" %>