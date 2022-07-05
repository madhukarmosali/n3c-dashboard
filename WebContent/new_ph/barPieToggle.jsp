<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}-${param.dimension}-mode" class="panel-heading">
	Display: <i id="${param.block}-${param.dimension}-mode-pie" class="fas fa-chart-pie fa-lg"></i> <i id="${param.block}-${param.dimension}-mode-bar" class="fas fa-chart-bar fa-lg text-success"></i>
</div>
<script>

$('#${param.block}-${param.dimension}-mode-bar').on('click', function(element) {
	console.log("${param.block} toggle bar");
	if (!document.getElementById("${param.block}-${param.dimension}-mode-bar").classList.contains("text-success")) {
		document.getElementById("${param.block}-${param.dimension}-mode-bar").classList.add("text-success");
	}
	document.getElementById("${param.block}-${param.dimension}-mode-pie").classList.remove("text-success");
	d3.select("#${param.block}_${param.dimension}_viz").select("svg").remove();
	localPercentageBarChart(${param.block}_${param.dimension_name}Array,"#${param.block}_${param.dimension}_viz", 120, ${param.dimension_range}, 0, "${param.dimension_name}", ${param.dimension_legend});
});

$('#${param.block}-${param.dimension}-mode-pie').on('click', function(element) {
	console.log("${param.block} toggle pie");
	if (!document.getElementById("${param.block}-${param.dimension}-mode-pie").classList.contains("text-success")) {
		document.getElementById("${param.block}-${param.dimension}-mode-pie").classList.add("text-success");
	}
	document.getElementById("${param.block}-${param.dimension}-mode-bar").classList.remove("text-success");
	d3.select("#${param.block}_${param.dimension}_viz").select("svg").remove();
	localPieChart(${param.block}_${param.dimension_name}Array,"#${param.block}_${param.dimension}_viz", ${param.dimension_legend}, ${param.dimension_range}, 0.5);
});

</script>
