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

    <div class="col-md-10 my-5">
      <div class="row">
      	<div class="col-md-2">
      	${member.id} 의 세부정보
      	</div>
      	<div class=col-md-8>
      	<form method="post" action="updateMem" onsubmit="return confirm('정말로 수정하시겠습니까?');">
      	  <table class="table">
	  		<tr>
             <th class="table-dark col-md-3">ID</th><td>${member.id}</td> 
            </tr>
            <tr>
             <th class="table-dark">이름</th> <td>${member.mname}</td> 
            </tr>
            <tr>
             <th class="table-dark">닉네임</th><td><input type="text" name="nick" value="${member.nick_name}"></td>
            </tr>
            <Tr>
             <th class="table-dark">이메일</th><td>${member.memail}</td>
            </tr>
            <tr>
             <th class="table-dark">전화번호</th><td>${member.mphone}</td> 
            </tr>
            <tr>
             <th class="table-dark">생일</th><td>${member.mbirth}</td>
            </tr>
            <tr>
             <th class="table-dark">권한</th><td><input type="text" name="auth_num" value="${member.auth_num}"></td>
            </tr>    
      	  </table>
      	    <input type="hidden" name="id" value="${member.id}">
      	    <input class ="mb-5" type="submit" value="수정">
      	  </form>
      	  <h3>작성글목록</h3>
      	   <form method="post" action="deleteMem" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
      	     <input type="hidden" name="id" value="${member.id}">
      	     <input class ="float-right m-2" type="submit" value="삭제">
      	  </form>
      	</div>      
      </div>
    </div>
  </div>
</div>
</body> 
<%@include file ="../include/footer.jsp" %>