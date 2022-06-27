<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_raceseverity_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../pediatrics/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_raceseverity_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_raceseverity_viz', '${param.block}_raceseverity.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_raceseverity_viz', '${param.block}_raceseverity.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_raceseverity_viz', '${param.block}_raceseverity.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_raceseverity_refresh() {
	d3.select("#${param.block}_raceseverity_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_raceSeverityArray,"${param.block}_raceseverity_viz", 280, severity_legend, severity_range, "Severity");
}

${param.block}_raceseverity_refresh();

</script>
