/*
	/product/reservation 결제모듈 & 예약정보 DB 업데이트	
*/

	var booking = (function() {
		
		function pay(){
			
			var place_num = $("#place_num").val();
			var room_num = $("#room_num").val();
			var startdate = $("#startdate").val();
			var enddate = $("#enddate").val();
			var cname = $("#cname").val();
			var cphone = $("#cphone").val();
			var member_id = $("#member_id").val();
			var totalprice = $("#totalPrice").val();
			
			var form = {
				place_num : place_num,
				room_num : room_num,
				startdate : startdate,
				enddate : enddate,
				cname : cname,
				cphone : cphone,
				member_id : member_id,
				totalprice : totalprice
			}
			
			$(function(){
			
			    var IMP = window.IMP; // 생략가능
			    IMP.init('imp03012354'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			    var msg;
			    
			    IMP.request_pay({
			        pg : 'kakaopay',
			        pay_method : 'card',
			        merchant_uid : 'merchant_' + new Date().getTime(),
			        name : 'TravelHunter',
			        amount :  totalPrice,
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
			                    
			                    result="success";
			                    
			                    alert(msg);
			                } else {
			                    //[3] 아직 제대로 결제가 되지 않았습니다.
			                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			                }
			            });
			            
			          	//예약정보 DB전송
			            $.ajax({
			    			type : "POST",
			    			url : "/product/booking",
			    			cashe: false,
			    		    contentType:'application/json;charset=utf-8',
			    			data : JSON.stringify(form),
			    			success : function(data){
			    				alert("예약완료");
			    			}, 
			    			error : function(){
			    				alert("예약실패");
			    			}
			    			
			    		});
			          	
			            //성공시 이동할 페이지
			            location.href="/product";
			            
			            
			        } else {
			            msg = '결제에 실패하였습니다.';
			            msg += '에러내용 : ' + rsp.error_msg;
			            //실패시 이동할 페이지
			            location.href= "/product/";
			            alert(msg);
			        }
			    
		    	});
			
			});
			
		}
		
		return {pay : pay}
		
	})();	