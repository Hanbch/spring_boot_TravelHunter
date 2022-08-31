<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
    margin-bottom: 20px;
}

#write_btn{
	width: 100%;
	padding: 10px;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
	
}

</style>







<section style="padding: 200px 0; width:1200px; margin:0 auto;">
	리뷰작성${pnum}<br>
	
	<form action="/mypage/reviewinsert" class="mb-3" name="myform" id="myform" method="post">
	<fieldset>
		<input type="hidden" name="place_num" value="${pnum}">
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="bgrade" value="5" id="rate1">
		<label for="rate1">★</label>
		<input type="radio" name="bgrade" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="bgrade" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="bgrade" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="bgrade" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" id="reviewContents" name="bcontent"></textarea>
	</div>
	<input type="submit" id="write_btn" value="작성하기">
</form>
	
	
	
	
</section>
<%@include file="../include/footer.jsp"%>


