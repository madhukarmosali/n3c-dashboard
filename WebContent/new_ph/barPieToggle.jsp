<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<style>
.viz-mode .fas{
	cursor: pointer;
	color: #b6d9ff;
}

.viz-mode .fas:hover{
	color: #007bff;
}
</style>
<div id="${param.block}-${param.dimension}-mode" class="panel-heading viz-mode">
	Choose Display:&nbsp; <i id="${param.block}-${param.dimension}-mode-bar-percent" data-toggle="tooltip" data-placement="top" title="Percentage Bar Chart" class="fas fa-percent  text-primary">&nbsp;</i> <i id="${param.block}-${param.dimension}-mode-bar" data-toggle="tooltip" data-placement="top" title="Bar Chart" class="fas fa-hashtag ">&nbsp;</i> <i id="${param.block}-${param.dimension}-mode-pie" data-toggle="tooltip" data-placement="top" title="Pie Chart" class="fas fa-chart-pie ">&nbsp;</i>
</div>
<script>

$('#${param.block}-${param.dimension}-mode-bar-percent').tooltip();
$('#${param.block}-${param.dimension}-mode-bar').tooltip();
$('#${param.block}-${param.dimension}-mode-pie').tooltip();

$('#${param.block}-${param.dimension}-mode-bar-percent').on('click', function(element) {
	console.log("${param.block} toggle bar-percent");
	if (!document.getElementById("${param.block}-${param.dimension}-mode-bar-percent").classList.contains("text-primary")) {
		document.getElementById("${param.block}-${param.dimension}-mode-bar-percent").classList.add("text-primary");
	}
	document.getElementById("${param.block}-${param.dimension}-mode-pie").classList.remove("text-primary");
	document.getElementById("${param.block}-${param.dimension}-mode-bar").classList.remove("text-primary");
	d3.select("#${param.block}_${param.dimension}_viz").select("svg").remove();
	localPercentageBarChart(${param.block}_${param.dimension_name}Array,"#${param.block}_${param.dimension}_viz", 120, ${param.dimension_range}, 0, "${param.dimension_name}", ${param.dimension_legend});
});

$('#${param.block}-${param.dimension}-mode-bar').on('click', function(element) {
	console.log("${param.block} toggle bar");
	if (!document.getElementById("${param.block}-${param.dimension}-mode-bar").classList.contains("text-primary")) {
		document.getElementById("${param.block}-${param.dimension}-mode-bar").classList.add("text-primary");
	}
	document.getElementById("${param.block}-${param.dimension}-mode-pie").classList.remove("text-primary");
	document.getElementById("${param.block}-${param.dimension}-mode-bar-percent").classList.remove("text-primary");
	d3.select("#${param.block}_${param.dimension}_viz").select("svg").remove();
	localHorizontalBarChart_legend(${param.block}_${param.dimension_name}Array,"#${param.block}_${param.dimension}_viz", 120, ${param.dimension_minheight}, 0, ${param.dimension_range}, "${param.dimension_name}", ${param.dimension_legend});
});

$('#${param.block}-${param.dimension}-mode-pie').on('click', function(element) {
	console.log("${param.block} toggle pie");
	if (!document.getElementById("${param.block}-${param.dimension}-mode-pie").classList.contains("text-primary")) {
		document.getElementById("${param.block}-${param.dimension}-mode-pie").classList.add("text-primary");
	}
	document.getElementById("${param.block}-${param.dimension}-mode-bar-percent").classList.remove("text-primary");
	document.getElementById("${param.block}-${param.dimension}-mode-bar").classList.remove("text-primary");
	d3.select("#${param.block}_${param.dimension}_viz").select("svg").remove();
	localPieChart(${param.block}_${param.dimension_name}Array,"#${param.block}_${param.dimension}_viz", ${param.dimension_legend}, ${param.dimension_range}, 0.5);
});

</script>
