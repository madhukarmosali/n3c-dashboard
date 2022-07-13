<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="${param.block}_severitycomorbidity_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../medication_snapshot/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_severitycomorbidity_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severitycomorbidity_viz', '${param.block}_severitycomorbidity.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severitycomorbidity_viz', '${param.block}_severitycomorbidity.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severitycomorbidity_viz', '${param.block}_severitycomorbidity.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_severitycomorbidity_refresh() {
	d3.select("#${param.block}_severitycomorbidity_viz").select("svg").remove();
	localHorizontalStackedBarChart(${param.block}_comorbiditySeverityArray,"${param.block}_severitycomorbidity_viz", 120, comorbidity_number_legend, comorbidity_number_range, "Number of Comorbidities");
}

${param.block}_severitycomorbidity_refresh();
</script>
