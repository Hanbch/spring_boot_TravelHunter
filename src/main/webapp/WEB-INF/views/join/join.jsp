<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
*{ padding: 0; margin: 0;}
li{list-style: none;}
a{text-decoration: none;}
button{cursor: pointer;}

body{ background-color:  #e0e0e0;}

.join{
    width: 780px; height: 1200px;
    margin: 0 auto;
}
.join h2{
    width: 100%;
    
    text-align: center; font-size: 20px;
    font-weight: normal;
}
.join form{
    width: 100%; height: 100%;
    background-color: #fff;
    padding: 60px; box-sizing: border-box;
}
.join legend{
    position: absolute; left: -999em;
}
.join label{
    display: block;
    font-size: 12px; color: #333;
    margin-bottom: 10px;
}
.join input{
    display: block;
    width: 100%; height: 50px;
    margin-bottom: 25px;
    border: none; background-color: #e0e0e0;
    padding: 0 20px;
    box-sizing: border-box; 
}
.join button.joinbutton{
    display: block;
    border: none;
    width: 220px; height: 50px;
    background-color: #AD9E87;
    color: #fff; font-size: 14px; font-weight: bold;
    margin: 0 auto;
}
.join button.idchk{
    border: none;
    background-color: #fff;
    position: relative;
    left: 600px;
    font-size: 14px;
    
}
.pwchk{
    position: relative;
    top: -30px;
}

</style>
	
	
	
	
	
	<section style="padding:200px 0 0 100px">
		<div class="join">
		<form action="/create" method="post">
			<h2>회원가입</h2>
			<label for="id">아이디 : </label>
			<input type="text" id="id" name="username" />
			<button class="idchk" type="button" id="idcheck" onclick="fn_idcheck();" value="N">중복확인</button>	<br>
        	<label for="mpw">비밀번호 : </label>
			<input type="password" name="password" id="mpw" required="required" /><br>
       		<label for="mpw1">비밀번호확인 : </label>
			<input type="password" name="testpw" id="mpw1"><br>
       		<div class="pwchk" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="pwchk" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
        	<label for="mname"> 이름 : </label>
        	<input type="text" name="mname" id="mname" /><br>
        	<label for="nick_name"> 닉네임 : </label>
        	<input type="text" name="nick_name" id="nick_name" /><br>
        	<label for="memail">이메일 : </label>
        	<input type="text" name="memail" id="memail" /><br>
        	<label for="mphone">핸드폰번호 : </label>
        	<input type="text" name="mphone" id="mphone" /><br>
        	<label for="mbirth">생년월일 : </label>
        	<input type="text" name="mbirth" id="mbirth"><br>
		
			<button class="joinbutton" type="submit" id="submit">회원가입</button>

		</form>
		</div>
	</section>

<%@include file ="../include/footer.jsp" %>

<script type="text/javascript">
	$(function(){
	    $("#alert-success").hide();
	    $("#alert-danger").hide();
	    $("input").keyup(function(){
	    	
	        var pwd1=$("#mpw").val();
	        var pwd2=$("#mpw1").val();
	        if(pwd1 != "" || pwd2 != ""){
	            if(pwd1 == pwd2){
	                $("#alert-success").show();
	                $("#alert-danger").hide();
	                $("#submit").removeAttr("disabled");
	            }else{
	                $("#alert-success").hide();
	                $("#alert-danger").show();
	                $("#submit").attr("disabled", "disabled");
	            }    
	        }
	    });
	});

		
		
		
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/login";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if($("#mpw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#mpw").focus();
				return false;
			}
			if($("#mname").val()==""){
				alert("성명을 입력해주세요.");
				$("#mname").focus();
				return false;
			}
			if($("#nick_name").val()==""){
				alert("닉네임을 입력해주세요.");
				$("#nick_name").focus();
				return false;
			}
			
			if($("#memail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#memail").focus();
				return false;
			}
			if($("#mphone").val()==""){
				alert("전화번호를 입력해주세요.");
				$("#mphone").focus();
				return false;
			}
			var idChkVal = $("#idcheck").val();
			if(idChkVal == "N"){
				alert("중복확인 버튼을 눌러주세요.");
				return false;
			}else if(idChkVal == "Y"){
				$("#regForm").submit();
			}
			
		});
		
		
		
	})
	function fn_idcheck(){
		$.ajax({
			url : "/idcheck",
			type : "post",
			dataType : "json",
			data : {"id" : $("#id").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idcheck").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
		
		
		
</script>