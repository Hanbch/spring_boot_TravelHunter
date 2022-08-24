/*
	Pheed상세 화면 & 댓글 등록	
*/
	//상세페이지 클릭시
	var pheedDetail = (function(){
	
		//조회수 증가 DB 업데이트
		function increaseView(id){ 
			
			$.ajax({ 
		        type: "PUT", 
		        url : "/json/" + id, 
		        cashe: false,
		        contentType:'application/json;charset=utf-8',
		        success : function(result) { 
		    	},
		    	error : function(){
					console.log("error");
				}
			});
		}
		
		//상세페이지 글정보 가져오기
		function getBoard(id){
			$.ajax({
				type : "GET",
				url : "/json/boards/" + id,
				success : function(data) {
					//view 화면 데이터 입력
					$(".user_id").text(data.member_id);
					$(".tit").text(data.btitle);
					$(".content_detail").text(data.bcontent);
					$(".content_date").text("작성일 " + data.bdate);
					$("#id").val(data.id);
					$(".bview_" + data.id).text(data.bview);// 조회수 증가 view 최신화
				},
				error : function(){
					console.log("error");
				}
			});
		}
		
		//댓글 불러오기
		function getReply(id){
			$.ajax({
				type : "GET",
				url : "/json/reply/" + id,
				success : function(data) {
					//view화면에 댓글 입력
					var htmls="";
					$(data).each(function(){
						   htmls += '<table>';
		                   htmls += '<tr>';
		                   for(var i=0; i<(this.indent - 1); i++){
		                   		htmls += "<td>[re]</td>";
		                   }
		                   htmls += '<td>'+ this.member_id + '</td>';
		                   htmls += '<td>'+ this.reply + '</td>';
		                   htmls += '<td>'+ this.repdate + '</td>';
		                   htmls += '<td><a href="#" class="re_reply">댓글달기</a></td>';
		                   htmls += '</tr>';
		                   htmls += "<tr class='reply_form'><td colspan='3'>";
		                   htmls += "<input type='text' class='reply'/>";
		                   htmls += "<input type='hidden' class='step' value='" + this.step + "'/>";
		                   htmls += "<input type='hidden' class='indent' value='" + this.indent + "'/>";
		                   htmls += "</td><td class='reply_btn'>작성</td></tr>";   
		                   htmls += '</table>';
		            });
					$(".reply_zone").html(htmls);
				},
				error : function(){
					console.log("error");
				}
			});
		}
		
		return { 
	      increaseView : increaseView,
	      getBoard : getBoard,
	      getReply : getReply
	   };
		
	})();
	
	var registReply = (function(){
		
		//DB에 댓글 데이터 추가
		function register(){
			
			let member_id = $("#member_id").val();
			let reply = $("#reply").val();
			let board_id = $("#id").val();
			let step = $("#step").val();
			let indent = $("#indent").val();
			
			let form = {
				member_id : member_id,
				reply : reply,
				board_id : board_id,
				step : step,
				indent : indent
			};
			
			$.ajax({ 
		        type: "PUT", 
		        url : "/json/replyWrite", 
		        cashe: false,
		        contentType:'application/json;charset=utf-8',
		        data: JSON.stringify(form), 
		        success : function(result) { 
		        	
		        	var count = $(".reply_count_" + board_id).text();
		        	$(".reply_count_" + board_id).text(Number(count) + 1);
		    		console.log(result);
		        
		    	}, 
		    	error : function(){
					console.log("error");
				}
			});
			
		}
		
		// 게시버튼 클릭시(mouseup) 댓글정보 불러와 화면 최신화 
		function getBoard(){
		
			let board_id = $("#id").val();
			
			$.ajax({
				type : "GET",
				url : "/json/reply/" + board_id,
				success : function(data) {
					
					var htmls="";
					$(data).each(function(){
						   htmls += '<table>';
		                   htmls += '<tr>';
		                   for(var i=0; i<(this.indent - 1); i++){
		                   		htmls += "<td>[re]</td>";
		                   }
		                   htmls += '<td>'+ this.member_id + '</td>';
		                   htmls += '<td>'+ this.reply + '</td>';
		                   htmls += '<td>'+ this.repdate + '</td>';
		                   htmls += '<td><a href="#" class="re_reply">댓글달기</a></td>';
		                   htmls += '</tr>';
		                   htmls += "<tr class='reply_form'><td colspan='3'>";
		                   htmls += "<input type='text' class='reply'/>";
		                   htmls += "<input type='hidden' class='step' value='" + this.step + "'/>";
		                   htmls += "<input type='hidden' class='indent' value='" + this.indent + "'/>";
		                   htmls += "</td><td class='reply_btn'>작성</td></tr>";   
		                   htmls += '</table>';
	                });
					$(".reply_zone").html(htmls);
				},
				error : function(){
					console.log("error");
				}
			});
		}
		
		return {
				register : register,
				getBoard : getBoard
			
			};
		
	})();

