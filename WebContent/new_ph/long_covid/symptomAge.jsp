<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_age_viz" class="col-lg-10 dash_viz"></div>
<script>

function ${param.block}_age_refresh() {
	console.log("age graph", "${param.block}_age_viz", ${param.block}_SymptomAgeArray)
   	d3.select("#${param.block}_age_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_SymptomAgeArray,"${param.block}_age_viz", 150, age_legend_4, age_range);	
}

${param.block}_age_refresh();
</script>
