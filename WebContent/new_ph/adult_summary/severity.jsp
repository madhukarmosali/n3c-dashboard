<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_severity_viz" class="col-lg-7"></div>
<script>
	${param.block}_refreshHistograms();
	console.log("severity graph", "${param.block}_severity_viz", ${param.block}_severityArray)
//	localPieChart(${param.block}_severityArray, "#${param.block}_severity_viz");
//	localBarChart(${param.block}_severityArray, "#${param.block}_severity_viz");
</script>