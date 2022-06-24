<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_before_after_viz" class="col-12 dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../long_covid/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_before_after_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_before_after_viz', '${param.block}_before_after.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_before_after_viz', '${param.block}_before_after.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_before_after_viz', '${param.block}_before_after.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_before_refresh() {
	console.log("before/after graph", "${param.block}_before_after_viz", ${param.block}_BeforeAfterArray)
   	d3.select("#${param.block}_before_after_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_BeforeAfterArray,"${param.block}_before_after_viz", 160, before_after_legend, categorical, "Symptom Occurrence", 200, 1, 1);	
}

${param.block}_before_refresh();
</script>
