<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_before_after_viz" class="col-lg-10 dash_viz"></div>
<p>Sample text.</p>
<script>

function ${param.block}_before_refresh() {
	console.log("before/after graph", "${param.block}_before_after_viz", ${param.block}_BeforeAfterArray)
   	d3.select("#${param.block}_before_after_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_BeforeAfterArray,"${param.block}_before_after_viz", 120, before_after_legend);	
}

${param.block}_before_refresh();
</script>
