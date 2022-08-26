<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
<%
    String name = (String)request.getAttribute("mname");
    String email = (String)request.getAttribute("memail");

%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	section.reservation {width:1200px; margin: 0 auto;}
	section.reservation .contact-title{margin-bottom:40px;}
	section.reservation .contact-info .media-body h3{font-weight:600; font-size:20px;}
	section.reservation .contact-info.total_price h3{border-top:1px solid #ccc;font-weight:600; font-size:25px;padding:20px 0;}
	section.reservation .contact-info.total_price p{font-weight:600; font-size:25px;color:#e61c51;}
	section.reservation .col-sm-6{flex: 0 0 100%;max-width: 100%;}
	section.reservation .boxed-btn{width:100%;}
	section.reservation .offset-lg-1{background-color:#fbf9ff; padding:50px 30px;}
</style>
<!-- ================ contact section start ================= -->
    <section class="contact-section reservation">
            <div class="container">
               
    
    
                <div class="row">
                    <div class="col-lg-8">
                    	<h2 class="contact-title">예약자 정보입력</h2>
                        <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                    	<h3>예약자 이름</h3>
                                        <input class="form-control valid" name="cname" id="cname" type="text" placeholder="체크인시 필요한 정보입니다.">
                                        <br>
                                        <h3>예약자 전화번호</h3>
                                    	<input class="form-control valid" name="cphone" id="cphone" type="text" placeholder="체크인시 필요한 정보입니다.">
                                    	<br>
                                    </div>
                                </div>
                             </div>
                        </form>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                    
                        <div class="media contact-info">
                            
                            <div class="media-body">
                                <h3>숙소이름</h3>
                                <p>서울 캠핑장</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <div class="media-body">
                                <h3>객실타입/기간</h3>
                                <p>101호/1박</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <div class="media-body">
                                <h3>체크인</h3>
                                <p>2022-08-31 14시</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <div class="media-body">
                                <h3>체크아웃</h3>
                                <p>2022-09-01 11시</p>
                            </div>
                        </div>
                        <div class="media contact-info total_price">
                            <div class="media-body">
                                <h3>총결제금액</h3>
                                <p>10000원</p>
                            </div>
                        </div>
                        <div class="payment">
                            <button type="submit" id="payment" class="button button-contactForm boxed-btn">결제하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <!-- ================ contact section end ================= -->

<%@include file ="../include/footer.jsp" %>

<script>
	$("#payment").on("click", function(){		
		console.log($("#cname").val());
		if($("#cname").val() == ""){
			alert("이름을 입력해주세요");
			return
		}
		
		if($("#cphone").val() == ""){
			alert("전화번호를 입력해주세요");
			return
		}
		
		
		$(function(){
		    var IMP = window.IMP; // 생략가능
		    IMP.init('imp03012354'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		    var msg;
		    
		    IMP.request_pay({
		        pg : 'html5_inicis',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : 'TravelHunter',
		        amount : "1000",
		        buyer_name : $("#cname").val(),
		        buyer_tel : $("#cphone").val(),
		    }, function(rsp) {
		        if ( rsp.success ) {
		            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		            jQuery.ajax({
		                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
		                type: 'POST',
		                dataType: 'json',
		                data: {
		                    imp_uid : rsp.imp_uid
		                    //기타 필요한 데이터가 있으면 추가 전달
		                }
		            }).done(function(data) {
		                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                if ( everythings_fine ) {
		                    msg = '결제가 완료되었습니다.';
		                    msg += '\n고유ID : ' + rsp.imp_uid;
		                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                    msg += '\결제 금액 : ' + rsp.paid_amount;
		                    msg += '카드 승인번호 : ' + rsp.apply_num;
		                    
		                    alert(msg);
		                } else {
		                    //[3] 아직 제대로 결제가 되지 않았습니다.
		                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		                }
		            });
		            //성공시 이동할 페이지
		            location.href= "/product/detail?num=";
		            
		        } else {
		            msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
		            //실패시 이동할 페이지
		            location.href="/product";
		            alert(msg);
		        }
		    
	    	});
		
		});
		
	})
	
</script>

