<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
<style>
#qna .tit{text-align:center; font-size:40px;font-weight:600;}
#qna .btn_wrpper{text-align: right;}
#qna .write_btn{display:inline-block;background-color:#AD9E87;margin:20px 0;border-radius:50px}
#qna .write_btn a{display:block;padding:0 50px; line-height:50px; border-radius:50px;color:#fff}
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
        <div class="tit"><h2>Q&A</h2></div>
        <div class="btn_wrpper">
         <div class="write_btn">
            <a href="/qna/write">문의하기</a>
         </div>
      </div>
          
           <form role="form" method="get">
        <div class="search">
           <select id="searchType" name="searchType">
               <option value="null"<c:out value="${scri.searchType == null ? 'selected' : ''}" />>-- 선택 --</option>
               <option value="btitle"<c:out value="${scri.searchType eq 'btitle' ? 'selected' : ''}"/>>제목</option>
               <option value="bcontent"<c:out value="${scri.searchType eq 'bcontent' ? 'selected' : ''}"/>>내용</option>
               <option value="member_id"<c:out value="${scri.searchType eq 'member_id' ? 'selected' : ''}"/>>작성자</option>
             </select>
          
           <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}">
          
          <button id="searchBtn" type="button">검색</button>
           <script>
               $(function(){
                 $('#searchBtn').click(function() {
                      self.location = "qna" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $(".search option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
                 });
            });
            
              
               
            </script>
           </div>
          
          
        
        
          
    <table border="1">
        <tr>
            <th width="70px">번호</th>
            <th>제목</th>
            <th width="100px">작성자</th>
            <th width="100px">진행상태</th>
            <th width="200px">작성일</th>
        </tr>
       
         <c:forEach var="data" items="${boardList}">
            <tr>
               <td>${data.realrow}</td>
               <td><a href="/qna/detail?id=${data.id}">${data.btitle}</a></td>
               <td>${data.member_id}</td>
               <td>
               	진행중
               </td>
               <td>${data.bdate}</td>
            </tr>
         </c:forEach>
    </table>
      </form>
    <c:if test="${pageMaker.prev}">
      <a href="qna${pageMaker.makeSearch(pageMaker.startPage - 1) }">«</a>
   </c:if>
    
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
      <a href="qna${pageMaker.makeSearch(idx)}">${idx}</a>
   </c:forEach>
      
   <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
      <a href="qna${pageMaker.makeSearch(pageMaker.endPage +1) }"> » </a>
   </c:if> <br>
    
    
    </div>
   </section>
<%@include file ="../include/footer.jsp" %>

<script>
   
</script>