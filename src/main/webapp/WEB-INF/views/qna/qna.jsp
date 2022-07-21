<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
<style>
div#qna{
        margin-left: 156px;
        margin-right: 156px;

       }
       h1{
        text-align: center;
       }
       table{
        width: 100%;
       }
       p{
        position: relative;
        left: 1350px;
       }
</style>
	<section style="padding:200px 0 0 0">
		 <div id="qna">
        <h1>Q&A</h1>
          <select>
            <option value='' selected>-- 선택 --</option>
            <option>제목</option>
            <option>내용</option>
            <option>작성자</option>
          </select>
    검색 : <input type="text">
    <input type='submit' value="검색">
    <table border="1">
        <tr>
            <th width="70px">번호</th>
            <th>제목</th>
            <th width="100px">작성자</th>
            <th width="100px">진행상태</th>
            <th width="200px">작성일</th>
        </tr>
        <tr>
            <th>1</th>
            <th>테스트1</th>
            <th>재하</th>
            <th>완료</th>
            <th>2022-07-21</th>
        </tr>
      	<c:forEach var="board" items="${list}">
      		<tr>
      			<td>${board.bid}</td>
      			<td>${ }
      			<td>${board.bname}</td>
      			
      			
      		</tr>
      	
      	</c:forEach>
      	
    </table>
    <br/>
    <p>
        <input id="psot" type='button' value="글쓰기">
    </p>
    
    </div>
	</section>
<%@include file ="../include/footer.jsp" %>

<script>
	
</script>