<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
	<section style="padding:300px 0 100px; 0">
		
		
		<form action="/pheed/complete" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="board_type_num" value="0">
    	<table border="1">
    		<tr>
    			<td>이름</td>
    			<td><input type="text" name="member_id" value="" size="50"></td>
    		</tr>
    		<tr>
    			<td>제목</td>
    			<td><input type="text" name="btitle" value="" size="50"></td>
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td>
    				<textarea rows="10" cols="50" name="bcontent"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2">
    			&nbsp;&nbsp;<button type="submit">작성</button>&nbsp;&nbsp;
    			<a href="/pheed"><input type="button" value="목록보기"></a>&nbsp;&nbsp;
    			<input type="file" name="files" multiple required />
    			</td>
    			
    		</tr>
    	</table>
    
    </form>
		
		
		
	</section>
<%@include file ="../include/footer.jsp" %>


