<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="include/header.jsp"%>

<div class="row bg-title">
	
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title">
				Recent reservation
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
							<th>캠핑장</th>
							<th>객실</th>
							<th>체크인</th>
							<th>체크아웃</th>
							<th>결제가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="txt-oflo">Pixel admin</td>
							<td>SALE</td>
							<td class="txt-oflo">April 18</td>
							<td><span class="text-success">$24</span></td>
						</tr>
						<tr>
							<td class="txt-oflo">Real Homes</td>
							<td>EXTENDED</td>
							<td class="txt-oflo">April 19</td>
							<td><span class="text-info">$1250</span></td>
						</tr>
						<tr>
							<td class="txt-oflo">Medical Pro</td>
							<td>TAX</td>
							<td class="txt-oflo">April 20</td>
							<td><span class="text-danger">-$24</span></td>
						</tr>
						<tr>
							<td class="txt-oflo">Hosting press</td>
							<td>SALE</td>
							<td class="txt-oflo">April 21</td>
							<td><span class="text-success">$24</span></td>
						</tr>
						<tr>
							<td class="txt-oflo">Helping Hands</td>
							<td>MEMBER</td>
							<td class="txt-oflo">April 22</td>
							<td><span class="text-success">$24</span></td>
						</tr>
						<tr>
							<td class="txt-oflo">Digital Agency</td>
							<td>SALE</td>
							<td class="txt-oflo">April 23</td>
							<td><span class="text-danger">-$14</span></td>
						</tr>
						<tr>
							<td class="txt-oflo">Helping Hands</td>
							<td>MEMBER</td>
							<td class="txt-oflo">April 22</td>
							<td><span class="text-success">$64</span></td>
						</tr>
					</tbody>
				</table>
				<a href="#">Check all the sales</a>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->
<%@include file="include/footer.jsp"%>