<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_severity_viz" class="col-lg-7 dash_viz"></div>
<p>Sample text.</p>
<script>

function ${param.block}_severity_refresh() {
	//console.log("severity graph", "${param.block}_severity_viz", ${param.block}_SeverityArray)
	d3.select("#${param.block}_severity_viz").select("svg").remove();
    localPieChart(${param.block}_SeverityArray,"#${param.block}_severity_viz", severity_legend, severity_range);
}

</script>
