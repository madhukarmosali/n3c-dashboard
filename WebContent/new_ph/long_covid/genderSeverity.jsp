<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_gender_viz" class="col-12 dash_viz"></div>
<p>Sample text.</p>
<script>

function ${param.block}_gender_refresh() {
	console.log("gender graph", "${param.block}_gender_viz", ${param.block}_GenderSeverityArray)
   	d3.select("#${param.block}_gender_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_GenderSeverityArray,"${param.block}_gender_viz", 120, severity_legend, severity_range);	
}

${param.block}_gender_refresh();
</script>
