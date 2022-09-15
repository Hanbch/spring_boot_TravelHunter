<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>

<section class="login">
	<div class="loginbox">
        <h2>로그인</h2>
        <form action="/login" method="POST">
                <legend>로그인 구역</legend>
                <label for="id">아이디 : </label>
                <input type="text" id="id" name="username"><br>
                <label for="mpw">비밀번호 : </label>
                <input type="password" id="mpw" name="password"><br>
                <ul>
                    <li><a href="/findidview">아이디/비밀번호찾기</a></li>
                    <li><a href="/join">회원가입</a></li>
                </ul>
                <button type="submit">로그인</button>    
                <br>
                <div class="sociallogin">
                	<a href="/oauth2/authorization/google"><img src="/assets/img/loginbutton/googlelogin.png"></a> <br>
                </div>
                <div class="sociallogin">
                	<a href="/oauth2/authorization/facebook"><img src="/assets/img/loginbutton/facebooklogin.png"></a> <br>
                </div>
                <div class="sociallogin">
                	<a href="/oauth2/authorization/naver"><img src="/assets/img/loginbutton/naverlogin.png"></a> <br>
                </div>
                <div class="sociallogin">
                	<a href="/oauth2/authorization/kakao"><img src="/assets/img/loginbutton/kakaologin.png"></a> <br>
                </div>
        </form>	
    </div>
</section>

<%@include file ="../include/footer.jsp" %>