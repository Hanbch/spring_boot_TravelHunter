<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="include/header.jsp"%>

<div class="row bg-title">
	<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
		<h4 class="page-title">Dashboard</h4>
	</div>

	<!-- /.col-lg-12 -->
</div>
<!-- row -->
<div class="row">
	<!--col -->
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		<div class="white-box">
			<div class="col-in row">
				<div class="col-md-6 col-sm-6 col-xs-6">
					<i data-icon="E" class="linea-icon linea-basic"></i>
					<h5 class="text-muted vb">MYNEW CLIENTS</h5>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<h3 class="counter text-right m-t-15 text-danger">23</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="progress">
						<div class="progress-bar progress-bar-danger" role="progressbar"
							aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
							style="width: 40%">
							<span class="sr-only">40% Complete (success)</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.col -->
	<!--col -->
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		<div class="white-box">
			<div class="col-in row">
				<div class="col-md-6 col-sm-6 col-xs-6">
					<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
					<h5 class="text-muted vb">NEW PROJECTS</h5>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<h3 class="counter text-right m-t-15 text-megna">169</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="progress">
						<div class="progress-bar progress-bar-megna" role="progressbar"
							aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
							style="width: 40%">
							<span class="sr-only">40% Complete (success)</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.col -->
	<!--col -->
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
		<div class="white-box">
			<div class="col-in row">
				<div class="col-md-6 col-sm-6 col-xs-6">
					<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
					<h5 class="text-muted vb">NEW INVOICES</h5>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<h3 class="counter text-right m-t-15 text-primary">157</h3>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="progress">
						<div class="progress-bar progress-bar-primary" role="progressbar"
							aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
							style="width: 40%">
							<span class="sr-only">40% Complete (success)</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<!--row -->
<div class="row">
	<div class="col-md-12">
		<div class="white-box">
			<h3 class="box-title">Sales Difference</h3>
			<ul class="list-inline text-right">
				<li>
					<h5>
						<i class="fa fa-circle m-r-5" style="color: #aec9cb"></i>월별매출
					</h5>
				</li>
			</ul>
			<div id="morris-area-chart2" style="height: 370px"></div>
		</div>
	</div>
</div>
<!--row -->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title">
				Recent sales
				<div class="col-md-2 col-sm-4 col-xs-12 pull-right">
					<select class="form-control pull-right row b-none">
						<option>March 2016</option>
						<option>April 2016</option>
						<option>May 2016</option>
						<option>June 2016</option>
						<option>July 2016</option>
					</select>
				</div>
			</h3>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>NAME</th>
							<th>STATUS</th>
							<th>DATE</th>
							<th>PRICE</th>
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

<div class="row">
	<div class="white-box">
		<!-- Styles -->
		<style>
		#chartdiv {
			width: 100%;
			height: 500px;
		}
		</style>
	
		<!-- Resources -->
		<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
		<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
		<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
	
		<!-- Chart code -->
		<script>
			am5.ready(function() {
			
			// Create root element
			// https://www.amcharts.com/docs/v5/getting-started/#Root_element
			var root = am5.Root.new("chartdiv");
			
			
			// Set themes
			// https://www.amcharts.com/docs/v5/concepts/themes/
			root.setThemes([
			  am5themes_Animated.new(root)
			]);
			
			
			// Create chart
			// https://www.amcharts.com/docs/v5/charts/xy-chart/
			var chart = root.container.children.push(am5xy.XYChart.new(root, {
			  panX: true,
			  panY: true,
			  wheelX: "",
			  wheelY: "",
			  pinchZoomX:false
			}));
			
			// Add cursor
			// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
			var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
			cursor.lineY.set("visible", false);
			
			
			// Create axes
			// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
			var xRenderer = am5xy.AxisRendererX.new(root, { minGridDistance: 30 });
			xRenderer.labels.template.setAll({
			  rotation: 0,
			  centerY: am5.p50,
			  centerX: am5.p150,
			  paddingRight: 15
			});
			
			var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
			  maxDeviation: 0.3,
			  categoryField: "month",
			  renderer: xRenderer,
			  tooltip: am5.Tooltip.new(root, {})
			}));
			
			var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
			  maxDeviation: 0.3,
			  renderer: am5xy.AxisRendererY.new(root, {})
			}));
			
			
			// Create series
			// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
			var series = chart.series.push(am5xy.ColumnSeries.new(root, {
			  name: "Series 1",
			  xAxis: xAxis,
			  yAxis: yAxis,
			  valueYField: "value",
			  sequencedInterpolation: true,
			  categoryXField: "month",
			  tooltip: am5.Tooltip.new(root, {
			    labelText:"{valueY}"
			  })
			}));
			
			series.columns.template.setAll({ cornerRadiusTL: 5, cornerRadiusTR: 5 });
			series.columns.template.adapters.add("fill", function(fill, target) {
			  return chart.get("colors").getIndex(series.columns.indexOf(target));
			});
			
			series.columns.template.adapters.add("stroke", function(stroke, target) {
			  return chart.get("colors").getIndex(series.columns.indexOf(target));
			});
			
			
			// Set data
			var data = [{
				month: "1월",
			  value: 2025
			}, {
				month: "2월",
			  value: 1882
			}, {
				month: "3월",
			  value: 1809
			}, {
				month: "4월",
			  value: 1322
			}, {
				month: "5월",
			  value: 1122
			}, {
				month: "6월",
			  value: 1114
			}, {
				month: "7월",
			  value: 984
			}, {
				month: "8월",
			  value: 711
			}, {
				month: "9월",
			  value: 665
			}, {
				month: "10월",
			  value: 443
			}, {
				month: "11월",
			  value: 441
			}, {
				month: "12월",
			  value: 443
			}];
			
			xAxis.data.setAll(data);
			series.data.setAll(data);
			
			
			// Make stuff animate on load
			// https://www.amcharts.com/docs/v5/concepts/animations/
			series.appear(1000);
			chart.appear(1000, 100);
			
			}); // end am5.ready()
			</script>
			
			<!-- HTML -->
			<div id="chartdiv"></div>
		</div>
	</div>





<!-- row -->
<div class="row">
	<div class="col-md-12 col-lg-6 col-sm-12">
		<div class="white-box">
			<h3 class="box-title">Recent Comments</h3>
			<div class="comment-center">
				<div class="comment-body">
					<div class="user-img">
						<img src="/assets/plugins/images/users/pawandeep.jpg" alt="user"
							class="img-circle" />
					</div>
					<div class="mail-contnet">
						<h5>Pavan kumar</h5>
						<span class="mail-desc">Donec ac
							condimentum massa. Etiam pellentesque pretium lacus. Phasellus
							ultricies dictum suscipit. Aenean commodo dui pellentesque
							molestie feugiat.</span><a href="javacript:void(0)" class="action"><i
							class="ti-close text-danger"></i></a> <a href="javacript:void(0)"
							class="action"><i
							class="ti-check text-success"></i></a><span class="time pull-right">April
							14, 2016</span>
					</div>
				</div>
				<div class="comment-body">
					<div class="user-img">
						<img src="/assets/plugins/images/users/sonu.jpg" alt="user"
							class="img-circle" />
					</div>
					<div class="mail-contnet">
						<h5>Sonu Nigam</h5>
						<span class="mail-desc">Donec ac
							condimentum massa. Etiam pellentesque pretium lacus. Phasellus
							ultricies dictum suscipit. Aenean commodo dui pellentesque
							molestie feugiat.</span><a href="javacript:void(0)" class="action"><i
							class="ti-close text-danger"></i></a> <a href="javacript:void(0)"
							class="action"><i
							class="ti-check text-success"></i></a><span class="time pull-right">April
							14, 2016</span>
					</div>
				</div>
				<div class="comment-body b-none">
					<div class="user-img">
						<img src="/assets/plugins/images/users/arijit.jpg" alt="user"
							class="img-circle" />
					</div>
					<div class="mail-contnet">
						<h5>Arijit Sinh</h5>
						<span class="mail-desc">Donec ac
							condimentum massa. Etiam pellentesque pretium lacus. Phasellus
							ultricies dictum suscipit. Aenean commodo dui pellentesque
							molestie feugiat. </span><a href="javacript:void(0)" class="action"><i
							class="ti-close text-danger"></i></a> <a href="javacript:void(0)"
							class="action"><i
							class="ti-check text-success"></i></a><span class="time pull-right">April
							14, 2016</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-md-12 col-sm-12">
		<div class="white-box">
			<h3 class="box-title">You have 5 new messages</h3>
			<div class="message-center">
				<a href="#">
					<div class="user-img">
						<img src="/assets/plugins/images/users/pawandeep.jpg" alt="user"
							class="img-circle" /> <span
							class="profile-status online pull-right"></span>
					</div>
					<div class="mail-contnet">
						<h5>Pavan kumar</h5>
						<span class="mail-desc">Just see the my admin!</span> <span
							class="time">9:30 AM</span>
					</div>
				</a> <a href="#">
					<div class="user-img">
						<img src="/assets/plugins/images/users/sonu.jpg" alt="user"
							class="img-circle" /> <span
							class="profile-status busy pull-right"></span>
					</div>
					<div class="mail-contnet">
						<h5>Sonu Nigam</h5>
						<span class="mail-desc">I've sung a song!
							See you at</span> <span class="time">9:10 AM</span>
					</div>
				</a> <a href="#">
					<div class="user-img">
						<img src="/assets/plugins/images/users/arijit.jpg" alt="user"
							class="img-circle" /> <span
							class="profile-status away pull-right"></span>
					</div>
					<div class="mail-contnet">
						<h5>Arijit Sinh</h5>
						<span class="mail-desc">I am a singer!</span> <span class="time">9:08
							AM</span>
					</div>
				</a> <a href="#">
					<div class="user-img">
						<img src="/assets/plugins/images/users/genu.jpg" alt="user"
							class="img-circle" /> <span
							class="profile-status online pull-right"></span>
					</div>
					<div class="mail-contnet">
						<h5>Genelia Deshmukh</h5>
						<span class="mail-desc">I love to do
							acting and dancing</span> <span class="time">9:08 AM</span>
					</div>
				</a> <a href="#" class="b-none">
					<div class="user-img">
						<img src="/assets/plugins/images/users/pawandeep.jpg" alt="user"
							class="img-circle" /> <span
							class="profile-status offline pull-right"></span>
					</div>
					<div class="mail-contnet">
						<h5>Pavan kumar</h5>
						<span class="mail-desc">Just see the my admin!</span> <span
							class="time">9:02 AM</span>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->
<%@include file="include/footer.jsp"%>