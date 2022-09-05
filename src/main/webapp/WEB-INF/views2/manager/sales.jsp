<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="include/header.jsp"%>

<div class="row">
	<div class="white-box">
		<!-- Styles -->
		<style>
		.chartdiv {
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
			
		</script>
			
			
			
			<!-- HTML -->
			<c:forEach items="${placeList}" var="place">
				<input type="hidden" class="place" value="${place.num}" name="${place.pname}"/>
			</c:forEach>
			
			<div class="chart_wrapper">
			<div>
			
		</div>
	</div>
</div>

<script>
	var place = document.getElementsByClassName("place");
	var place_num;
	
	for(var i = 0; i < place.length; i++){
		
		place_num = place[i].value;
		pname = place[i].name;
		console.log("id",i,pname);
		
			var chart = (function(i,place_num){
				
				$.ajax({
					type : "GET",
					url : "/json/sales/" + place_num,
					async: false,
					success : function(salesData) {
						
						console.log(i);
						htmls ="";
						
						htmls +='<h1>' + pname + '(' + place_num + ')</h1>';
						htmls +='<div id="chartdiv' + i + '" class="chartdiv"></div><br><br><br>';
							
						
						$(".chart_wrapper").append(htmls);
						
						am5.ready(function() {
							
							// Create root element
							// https://www.amcharts.com/docs/v5/getting-started/#Root_element
							
							var root = am5.Root.new("chartdiv" + i);
							
							
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
							  valueYField: "price",
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
							var data = salesData;
							
							xAxis.data.setAll(data);
							series.data.setAll(data);
							
							// Make stuff animate on load
							// https://www.amcharts.com/docs/v5/concepts/animations/
							series.appear(1000);
							chart.appear(1000, 100);
							
							}); // end am5.ready()
						
					},
					error : function(){
						console.log("error");
					}
				});
				
			})(i,place_num);
			
			
		
			
			
			
		
	}
	
</script>
<!-- /.row -->
<%@include file="include/footer.jsp"%>