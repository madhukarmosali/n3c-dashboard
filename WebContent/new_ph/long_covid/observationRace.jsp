<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_race_viz" class="col-lg-10 dash_viz"></div>
<script>

function ${param.block}_race_refresh() {
	console.log("race graph", "${param.block}_race_viz", ${param.block}_ObservationRaceArray)
   	d3.select("#${param.block}_race_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_ObservationRaceArray,"${param.block}_race_viz", 150);	
}

${param.block}_race_refresh();
</script>
