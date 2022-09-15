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
        <h2>아이디찾기</h2>
        <form action="/findid" method="post">
                <label for="memail">이메일을 입력하세요 : </label>
                <input type="text" id="memail" name="memail"><br>
                <ul>
                    <li><a href="/findpwview">비밀번호찾기</a></li>
                </ul>
                	 <button type="submit">아이디찾기</button>
                <div class="findid">
                <button type="button"><a id="findid" href="/login">로그인하러가기</a></button>   
                <br>
                </div>
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