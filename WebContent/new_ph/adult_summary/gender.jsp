<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_gender_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../adult_summary/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_gender_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_gender_viz', '${param.block}_gender.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_gender_refresh() {
	//console.log("gender graph", "${param.block}_gender_viz", ${param.block}_GenderArray)
	d3.select("#${param.block}_gender_viz").select("svg").remove();
    localHorizontalBarChart(${param.block}_GenderArray,"#${param.block}_gender_viz", 140);
}

${param.block}_gender_refresh();

</script>
