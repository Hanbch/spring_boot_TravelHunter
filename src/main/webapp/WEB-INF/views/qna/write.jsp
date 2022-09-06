<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
	<section>
		<!-- slider Area Start-->
        <div class="slider-area">
            <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="/assets/img/hero/roomspage_hero.jpg" >
                <div class="container">
                    <div class="row ">
                        <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                            <div class="hero-caption">
                                <span>Camping Spot</span>
                                <h2>Reservation</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        
		<form action="/qna/complete" method="POST">
			<input type="hidden" name="board_type_num" value="2"/>
			작성자: <input type="text" name="member_id"/><br>
			제 목: <input type="text"  name="btitle"/><br>
			내용<br>
			<textarea style="width:200px;height:200px" name="bcontent"></textarea><br>
			<input type="submit" value="작성"/>
			<a href="/qna"><input type="button" value="목록보기"></a>
		</form>
	</section>
<%@include file ="../include/footer.jsp" %>

<script>
	
</script>