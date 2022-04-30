<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_gender_viz" class="col-lg-7 dash_viz"></div>
<script>

function ${param.block}_gender_refresh() {
	console.log("gender graph", "${param.block}_gender_viz", ${param.block}_GenderArray)
	d3.select("#${param.block}_gender_viz").select("svg").remove();
    localHorizontalBarChart(${param.block}_GenderArray,"#${param.block}_gender_viz", 140);
}

${param.block}_gender_refresh();

</script>
