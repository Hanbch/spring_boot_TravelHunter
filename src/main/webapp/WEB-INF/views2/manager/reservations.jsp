<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="include/header.jsp"%>

<div class="row bg-title">
	
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title">
				예약목록
				<div class="col-md-2 col-sm-4 col-xs-12 pull-right">
					<select class="form-control pull-right row b-none">
						<option>이번달</option>
						<option>이번주</option>
						<option>오늘</option>
					</select>
				</div>
			</h3>
			<div class="table-responsive">
				<table class="table">
				
					<thead>
						<tr>
							<th>예약번호</th>
							<th>캠핑장</th>
							<th>객실</th>
							<th>예약자(ID)</th>
							<th>전화번호</th>
							<th>체크인/체크아웃</th>
							<th>결제가격</th>
						</tr>
					</thead>
					
					<c:forEach items="${rsvList}" var="rsvList">	
					<tbody>
						<tr>
							<td class="txt-oflo">${rsvList.num}</td>
							<td class="txt-oflo">${rsvList.pname}</td>
							<td>${rsvList.rname}호</td>
							<td>${rsvList.cname}(${rsvList.member_id})</td>
							<td>${rsvList.cphone}</td>
							<td class="txt-oflo">${rsvList.startdate} ~ ${rsvList.enddate}</td>
							<td><span class="text-success">${rsvList.totalprice}원</span></td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title">
				예약취소목록
				<div class="col-md-2 col-sm-4 col-xs-12 pull-right">
					<select class="form-control pull-right row b-none">
						<option>이번달</option>
						<option>이번주</option>
						<option>오늘</option>
					</select>
				</div>
			</h3>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>예약번호</th>
							<th>캠핑장</th>
							<th>객실</th>
							<th>예약자</th>
							<th>전화번호</th>
							<th>체크인/체크아웃</th>
							<th>결제가격</th>
						</tr>
					</thead>
					
					<c:forEach items="${delList}" var="delList">
					<tbody>
						<tr>
							<td class="txt-oflo">${delList.num}</td>
							<td class="txt-oflo">${delList.pname}</td>
							<td>${delList.rname}호</td>
							<td>${delList.cname}(${delList.member_id})</td>
							<td>${delList.cphone}</td>
							<td class="txt-oflo">${delList.startdate} ~ ${delList.enddate}</td>
							<td><span class="text-success">${delList.totalprice}원</span></td>
						</tr>
					</tbody>
					</c:forEach>
				
				</table>
			</div>
		</div>
	</div>
	
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title">
				지난예약목록
				<div class="col-md-2 col-sm-4 col-xs-12 pull-right">
					<select class="form-control pull-right row b-none">
						<option>이번달</option>
						<option>이번주</option>
						<option>오늘</option>
					</select>
				</div>
			</h3>
			<div class="table-responsive">
				<table class="table">
				
					<thead>
						<tr>
							<th>예약번호</th>
							<th>캠핑장</th>
							<th>객실</th>
							<th>예약자</th>
							<th>전화번호</th>
							<th>체크인/체크아웃</th>
							<th>결제가격</th>
						</tr>
					</thead>
					
					<c:forEach items="${rsvedList}" var="rsvedList">
					<tbody>
						<tr>
							<td class="txt-oflo">${rsvedList.num}</td>
							<td class="txt-oflo">${rsvedList.pname}</td>
							<td>${rsvedList.rname}호</td>
							<td>${rsvedList.cname}(${rsvedList.member_id})</td>
							<td>${rsvedList.cphone}</td>
							<td class="txt-oflo">${rsvedList.startdate} ~ ${rsvedList.enddate}</td>
							<td><span class="text-success">${rsvedList.totalprice}원</span></td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->
<%@include file="include/footer.jsp"%>