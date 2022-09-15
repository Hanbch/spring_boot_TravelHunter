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
	<div class="loginbox">
        <h2>비밀번호찾기</h2>
        <form action="/findpw" method="post">
                <label for="id">아이디를 입력하세요 : </label>
                <input type="text" id="id" name="id"><br>
                <label for="memail">이메일을 입력하세요 : </label>
                <input type="text" id="memail" name="memail"><br>
            	<button type="submit">비밀번호찾기</button>

        </form>	
    </div>
</section>

<%@include file ="../include/footer.jsp" %>

 <script type="text/javascript">



	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}


</script>

