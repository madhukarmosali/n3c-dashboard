<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_gender_viz" class="col-12 dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../hlh/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>
				
<div id="${param.block}_age_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severity_viz', '${param.block}_severity.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severity_viz', '${param.block}_severity.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severity_viz', '${param.block}_severity.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_gender_refresh() {
	console.log("gender graph", "${param.block}_gender_viz", ${param.block}_GenderAgeArray)
   	d3.select("#${param.block}_gender_viz").select("svg").remove();
	localHorizontalGroupedStackedBarChart2(${param.block}_GenderAgeArray,"${param.block}_gender_viz", 120, "Patient Count", age_legend_2, age_range, "Age");	
//	localHorizontalGroupedStackedBarChart(${param.block}_DiabetesArray,"${param.block}_diabetes_t2_viz", 120, age_legend, age_range);	
}

${param.block}_gender_refresh();
</script>
