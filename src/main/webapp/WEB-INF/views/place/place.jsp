<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="../include/header.jsp" %>
    
    <main>

        

       <div id="page1">
			<div id="page1_bg"></div>
			<div class="inner">
				<div class="logo">
					<ul>
						<li>
							<a href=""class="brand">노지캠핑</a>
							<div class="copy">
								<ul>
									<li>
										<strong>노지캠핑이란?</strong>
									</li>
									<li>
										<p>캠핑장말고 경치 좋은 곳에 텐트 치고 분위기를 내고 싶거나, 무료인 곳을 이용하고 싶은 생각에 '노지캠핑'이라는 것을 많이 합니다. 노지캠핑 뜻은 노지 + 캠핑이 합해진 말로, '노지'는 말 그대로 지붕이 없는 땅을 말합니다. 예를 들어서 하천 옆에 텐트를 치거나, 공원, 해수욕장 등등 모두 노지캠핑에 속하는 것이죠.</p>
									</li>
									<li><a href="/product"><span>예약하러가기</span></a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href=""class="brand">오토캠핑</a>
							<div class="copy">
								<ul>
									<li>
										<strong>오토캠핑이란 어떤 캠핑입니까?</strong>
									</li>
									<li>
										<p>
											‘오토캠핑’이란 모터 홈, 캠핑 트레일러, 밴 컨버전, 트럭캠퍼 등 자동차 안에서 취사와 숙박이 가능한 차량을 이용, 각각의 캠핑 사이트에 차를 주차시켜 놓고 즐기는 캠핑을 말합니다. 다시 말하면 이동수단만이 아닌, 캠핑을 위한 주거공간 활용이 가능한 캠핑을 오토캠핑이라 합니다. 하지만 우리나라에서는 아직까지 텐트캠핑, 어닝캠핑(Awning Camping, 차양을 갖춘 레저차량으로 즐기는 캠핑) 등도 오토캠핑이라 부르곤 합니다.
										</p>
									</li>
									<li><a href="/product"><span>예약하러가기</span></a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="" class="brand">글램핑</a>
							<div class="copy">
								<ul>
									<li>
										<strong>글램핑이란?</strong>
									</li>
									<li>
										<p>
											'화려하다.'는 뜻인 영단어 '글래머러스(glamorous)'와 '캠핑(camping)'을 혼합하여 만든 신조어. 음식, 가구, 조리기구, 텐트 등을 따로 준비하지 않고 미리 준비된 상황에서 즐기는 캠핑을 의미한다. 쉽게 말하면 야영의 펜션화라고 보면 된다. 서양권에서는 글램핑 외에 부티크 캠핑, 럭셔리 캠핑, 포쉬 캠핑, 컴피 캠핑 등으로 불리기도 한다.
										</p>
									</li>
									<li><a href="/product"><span>예약하러가기</span></a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href=""class="brand">차박</a>
							<div class="copy">
								<ul>
									<li><strong>차박이란?</strong>
									</li>
									<li>
										<p>
											차박(車泊)이란 자동차로 여행을 떠나 별도의 숙박 시설(모텔, 텐트 등)을 사용하지 않고 
											차량 내에서 모든 걸 해결하는 신조어를 의미합니다.
											텐트 치거나 숙소를 찾아야 하는 번거로움이 줄어들고 차를 주차해 놓을 수 있는 장소와
											간단한 차량 개조 혹은 물품만 있으면 여행을 하기 편리하기에 최근 트렌드가 되고
											있는 여행방법입니다.
										</p>
									</li>
									<li><a href="/product"><span>예약하러가기</span></a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
       
    </main>
    <script src="/assets/js/jquery.min.js"></script>
    
    <script>
  	//page1 마우스효과
		var bgn=0;
		
		motionBackground(bgn);
		
		$("#page1 .logo > ul > li").mouseenter(function(e){
			e.preventDefault();
			bgn=$(this).index();
			motionBackground(bgn);
		});
		
		function motionBackground(n){
			$("#page1_bg").addClass("active");
			$("#page1_bg").attr("class","case"+n)
		
			$("#page1_bg").fadeIn(500, function(){
				$("#page1").attr("class", "case"+n);
				$("#page1").addClass("active");
				$(this).hide();
				$(this).removeClass("active");
			});
			$("#page1 .logo > ul > li").each(function(i){
				if(i == bgn){
					$(this).addClass("active");
				}
				else{
					$(this).removeClass("active");
				}
			});
		}
    </script>
    
<%@include file ="../include/footer.jsp" %>
   