<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<jsp:include page="../barPieToggle.jsp">
	<jsp:param name="block" value="${param.block}" />
	<jsp:param name="dimension" value="severity" />
	<jsp:param name="dimension_name" value="Severity" />
	<jsp:param name="dimension_range" value="severity_range" />
	<jsp:param name="dimension_legend" value="severity_legend" />
	<jsp:param name="dimension_minheight" value="300" />
</jsp:include>

<div id="${param.block}_severity_viz" class="dash_viz"></div>

<c:if test="${not empty param.topic_description}">
	<div id="viz_caption">
		<jsp:include page="../pediatrics/secondary_text/${param.topic_description}.jsp"/>
	</div>
</c:if>

<div id="${param.block}_severity_save_viz"> 
	<button id='svgButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severity_viz', '${param.block}_severity.svg');">Save as SVG</button>
	<button id='pngButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severity_viz', '${param.block}_severity.png');">Save as PNG</button>
	<button id='jpegButton' class="btn btn-light btn-sm" onclick="saveVisualization('${param.block}_severity_viz', '${param.block}_severity.jpg');">Save as JPEG</button>
</div>

<script>

function ${param.block}_severity_refresh() {
	//console.log("severity graph", "${param.block}_severity_viz", ${param.block}_SeverityArray)
	d3.select("#${param.block}_severity_viz").select("svg").remove();
	localPercentageBarChart(${param.block}_SeverityArray,"#${param.block}_severity_viz", 120, severity_range, 0, "Severity", severity_legend);
}

${param.block}_severity_refresh();

</script>
