<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_ethnicity_viz" class="col-lg-7 dash_viz"></div>
<script>

function ${param.block}_ethnicity_refresh() {
	console.log("ethnicity graph", "${param.block}_ethnicity_viz", ${param.block}_EthnicityArray)
	d3.select("#${param.block}_ethnicity_viz").select("svg").remove();
	localHorizontalBarChart(${param.block}_EthnicityArray,"#${param.block}_ethnicity_viz", 140);
}

${param.block}_ethnicity_refresh();

</script>
